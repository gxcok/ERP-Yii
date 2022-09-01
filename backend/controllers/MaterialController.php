<?php

namespace backend\controllers;

use backend\models\DtoaCart;
use backend\models\DtoaCategory;
use backend\models\DtoaItems;
use backend\models\DtoaMaterial;
use backend\models\DtoaProject;
use jinxing\admin\helpers\Helper;
use jinxing\admin\helpers\Tree;
use jinxing\admin\models\Admin;
use jinxing\admin\models\Menu;
use Yii;
use yii\helpers\ArrayHelper;
use yii\helpers\Json;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;

/**
 * Class MaterialController 材料库 执行操作控制器
 * @package backend\controllers
 */
class MaterialController extends Controller
{
    protected $pk = 'c_id';

    protected $sort = 'c_id';

    /**
     * 处理查询条件
     *
     * @return array
     */
    public function where()
    {
        return [
            // 其他查询字段信息
            [['c_name'], 'like'],
            [['cate_name'], 'like'],
            [['size'], 'like'],
            [['cid'], '='],
            [['cate_no'], '='],
        ];
    }
    
    /**
     * @var string 定义使用的model
     */
    public $modelClass = 'backend\models\DtoaMaterial';

    public function actionIndex()
    {
        $access = $this->get_access(2);
        return $this->render('index',[
            'access' => $access,
        ]);
    }



    public function actionView()
    {
        $id=Yii::$app->request->get('id');
        $type=Yii::$app->request->post('type');
        if(empty($type)){
            $type=Yii::$app->request->get('type');
        }
        if(empty($type)){
            $access = $this->get_access(2);
        }
        $search_c_name=Yii::$app->request->post('search_c_name');
        $search_size=Yii::$app->request->post('search_size');
        if(!empty($type)){
            if(empty($id)){
                $material_model = new DtoaMaterial();
                $query=DtoaMaterial::find()->select(array_keys($material_model->attributeLabels()));
                if(!empty($search_c_name)){
                    $query=$query->andWhere(['like', 'c_name', $search_c_name]);
                }
                if(!empty($search_size)){
                    $query=$query->andWhere(['like', 'size', $search_size]);
                }
                $data=$query->asArray()->all();
                return json_encode($data);
            }else{
                $child=$this->get_child($id);
                $material_model = new DtoaMaterial();
                $data=DtoaMaterial::find()->select(array_keys($material_model->attributeLabels()))->andWhere(['in', 'cid', $child])->asArray()->all();
                return json_encode($data);
            }
        }
        return $this->render('view', [
            'model' => $this->findModel($id),
            'access' => $access,
        ]);
    }

    public function actionSelect()
    {
        //$this->layout= false;
        return $this->render('select');
    }

    public function actionDelete()
    {
        $access = $this->get_access(2);
        if($access!=1){
            return json_encode(['error'=>true,'msg'=>'您没有执行此操作的权限!']);
        }
        $post=Yii::$app->request->post();
        if(empty($post['id_arr'])){ //删除单个
            $model=$this->findModel($post[$this->pk]);
            //如果材料被使用
            $material=DtoaCart::find()->andWhere(['c_id'=>$model->c_id])->asArray()->one();
            if(empty($material)){
                if (!$model->delete()) {
                    return $this->error(1004, Helper::arrayToString($model->getErrors()));
                }
                return $this->success($model);
            }else{
                return $this->error(1004, '材料已被计划、合同采购,不能删除！');
            }
        }else{
            $id_arr=explode(",", $post['id_arr']);
            $msg="";
            $used_id_arr=[];
            foreach ($id_arr as $k => $id) {
                //如果材料被使用
                $material=DtoaCart::find()->andWhere(['c_id'=>$id])->asArray()->one();
                if(!empty($material)){
                    unset($id_arr[$k]);
                    $used_id_arr[]=$id;
                }
            }
            if(!empty($used_id_arr)){
                $msg=$msg."材料[id=".implode(',',$used_id_arr)."]已被计划、合同采购,不能删除！";
            }
            if(empty($id_arr)){
                return json_encode(['error'=>true,'msg'=>$msg]);
            }else{
                $model = $this->modelClass;
                if (!$model::deleteAll([$this->pk => $id_arr])) {
                    return json_encode(['error'=>true,'msg'=>$msg." \n".Helper::arrayToString($model->getErrors())]);
                }else{
                    return json_encode(['error'=>false,'msg'=>$msg." \n材料[id=".implode(',',$id_arr)."]删除成功!"]);
                }
            }
        }
    }

    public function actionExport()
    {
        $model = new DtoaMaterial();
        $arrFields = $model->attributeLabels();
        $cid=Yii::$app->request->post('cid');
        $is_search=Yii::$app->request->post('is_search');
        $m_id_arr=Yii::$app->request->post('m_id_arr');
        if($is_search==0 && !empty($cid)){
            //获取分类下所有材料
            $child=$this->get_child($cid);
            $data=DtoaMaterial::find()->andWhere(['in', 'cid', $child])->asArray();
        } elseif($is_search==1 && !empty($m_id_arr)){
            //获取搜索所有材料
            $data=DtoaMaterial::find()->andWhere(['in', 'c_id', explode(",", $m_id_arr)])->asArray();
        }else{
            $data=DtoaMaterial::find()->asArray();
        }
        return Helper::excel(
            '材料导出',
            $arrFields,
            $data
        );
    }

    protected function findModel($id)
    {
        if (($model = DtoaMaterial::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('请求页面不存在.');
    }

    protected function get_child($id)
    {
        $child_arr=[];
        $child = DtoaCategory::find()->select(['cid'])->andWhere(['pid'=>$id])->asArray()->all();
        if(empty($child)){
            $child_arr[]=$id;
        }else{
            foreach ($child as $c) {
                $child_arr=array_merge($child_arr,$this->get_child($c['cid']));
            }
        }
        return $child_arr;
    }

    protected function get_access($item_id,$g_id=0){
        if(Yii::$app->user->identity->id==Admin::SUPER_ADMIN_ID){
            return 1;
        }
        if($g_id==0){
            $item_name=DtoaProject::SYSTEM_ITEMS[$item_id];
        }else{
            $item_name=DtoaProject::PROJECT_ITEMS[$item_id];
        }
        $item_arr=DtoaItems::find()->andWhere(['g_id'=>$g_id])->andWhere(['uid'=>Yii::$app->user->identity->id])->asArray()->one();
        if(empty($item_arr)){
            throw new ForbiddenHttpException('您没有['.$item_name.']-[查看/编辑]权限');
        }else{
            $item_arr=json_decode($item_arr['item_arr'],true);
            $has_access = false ;
            $access = 0;  //权限 0:查看 1：修改
            if(!empty($item_arr[0])){
                if(in_array($item_id,$item_arr[0])){
                    $has_access=true;
                }
            }
            if(!empty($item_arr[1])){
                if(in_array($item_id,$item_arr[1])){
                    $has_access=true;
                    $access=1;
                }
            }
            if(!$has_access){
                throw new ForbiddenHttpException('您没有['.$item_name.']-[查看/编辑]权限');
            }
            return $access;
        }
    }
}
