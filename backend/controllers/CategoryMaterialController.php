<?php

namespace backend\controllers;
use backend\models\DtoaCategory;
use backend\models\DtoaItems;
use backend\models\DtoaProject;
use jinxing\admin\models\Admin;
use Yii;
use yii\helpers\ArrayHelper;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;

/**
 * Class CategoryController 材料分类 执行操作控制器
 * @package backend\controllers
 */
class CategoryMaterialController extends Controller
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
            [['pid'], '='],
        ];
    }

    public function actionIndex()
    {
        $access = $this->get_access(2);
        return $this->render('index',[
            'cid' => Yii::$app->request->get('cid'),
            'access' => $access,
        ]);
    }

    protected function findModel($id)
    {
        if (($model = DtoaCategory::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('请求页面不存在.');
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
