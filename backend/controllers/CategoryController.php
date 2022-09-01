<?php

namespace backend\controllers;
use backend\models\DtoaCategory;
use backend\models\DtoaItems;
use backend\models\DtoaMaterial;
use backend\models\DtoaProject;
use jinxing\admin\helpers\Helper;
use jinxing\admin\models\Admin;
use Yii;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;

/**
 * Class CategoryController 材料分类 执行操作控制器
 * @package backend\controllers
 */
class CategoryController extends Controller
{
    protected $pk = 'cid';

    protected $sort = 'cid';
    
    /**
     * @var string 定义使用的model
     */
    public $modelClass = 'backend\models\DtoaCategory';

    /**
     * 处理查询条件
     *
     * @return array
     */
    public function where()
    {
        return [
            // 其他查询字段信息
            [['cname'], 'like'],
            [['cate_no'], 'like'],
            [['pid'], '='],
            [['cate_type'], '='],
        ];
    }

    public function actionIndex()
    {
        $access = $this->get_access(2);
        return $this->render('index',[
            'access' => $access,
        ]);
    }

    public function actionStorageselect()
    {
        //$this->layout= false;
        return $this->render('storageselect');
    }

    public function actionCreate()
    {
        $access = $this->get_access(2);
        if($access!=1){
            throw new ForbiddenHttpException('您没有执行此操作的权限');
        }
        $model = new DtoaCategory();
        if(Yii::$app->request->post()){
            $post=Yii::$app->request->post();
            //var_dump($post);
            if(empty($post['cate-cname'])){
                $cname=$post['cname'];
            }else{
                $cname=$post['cate-cname'];
            }
            if(!empty($post['cate-id'])){   //更新分类
                $model=DtoaCategory::findOne($post['cate-id']);
                //更新分类下的材料分类名
                DtoaMaterial::updateAll(['cate_name'=>$cname],['cid'=>$post['cate-id']]);
            }else{  //添加分类
                if(empty($post['cate-pid'])){
                    if(empty($post['pid'])){
                        $pid=0;
                    }else{
                        $pid=$post['pid'];
                    }
                }else{
                    $pid=$post['cate-pid'];
                }
                $model->pid=$pid;
                $model->cate_no=DtoaCategory::getno($pid);
                //var_dump($model->cate_no);
            }
            if($post['cate_type']!=='0'){
                $model->cate_type=$post['cate_type'];
            }else{
                $model->cate_type=$post['other_cate_type'];
            }
            $model->cname=$cname;
            if(!$model->save()){
                //var_dump($model->getErrors());
            }
            return $this->redirect(['/category-material/index?cid='.$model->cid]);
        }
    }

    public function actionDelete()
    {
        $access = $this->get_access(2);
        if($access!=1){
            throw new ForbiddenHttpException('您没有执行此操作的权限');
        }
        $post=Yii::$app->request->post();
        $model=$this->findModel($post[$this->pk]);
        $cate=DtoaCategory::find()->andWhere(['pid'=>$post[$this->pk]])->asArray()->one();
        if(empty($cate)){
            $material=DtoaMaterial::find()->andWhere(['cid'=>$post[$this->pk]])->asArray()->one();
            if(empty($material)){
                if (!$model->delete()) {
                    return $this->error(1004, Helper::arrayToString($model->getErrors()));
                }
            }else{
                return $this->error(1004, '此分类下还有材料，无法删除！');
            }
        }else{
            return $this->error(1004, '此分类下还有子分类，无法删除！');
        }
        return $this->success($model);
    }

    protected function findModel($id)
    {
        if (($model = DtoaCategory::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('请求页面不存在.');
    }

    public function actionExport()
    {
        $model = new DtoaCategory();
        $arrFields = $model->attributeLabels();
        $cid=Yii::$app->request->post('cid');
        if(empty($cid)){
            $data=DtoaCategory::find()->asArray();
        }else{
            //获取分类下所有子分类
            $child=$this->get_child($cid);
            array_unshift($child,$cid);
            $data=DtoaCategory::find()->andWhere(['in', 'cid', $child])->asArray();
        }

        return Helper::excel(
            '材料分类导出',
            $arrFields,
            $data
        );
    }

    protected function get_child($id)
    {
        $child_arr=[];
        $child = DtoaCategory::find()->select(['cid'])->andWhere(['pid'=>$id])->asArray()->all();
        if(empty($child)){
            $child_arr[]=$id;
        }else{
            $child_arr[]=$id;
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
