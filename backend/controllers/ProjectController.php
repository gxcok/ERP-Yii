<?php

namespace backend\controllers;

use backend\models\DtoaItems;
use backend\models\DtoaApprovalGroup;
use backend\models\DtoaProject;
use jinxing\admin\helpers\Helper;
use jinxing\admin\models\Admin;
use Yii;
use yii\helpers\ArrayHelper;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;

/**
 * Class ProjectController 工程管理 执行操作控制器
 * @package backend\controllers
 */
class ProjectController extends Controller
{
    protected $pk = 'g_id';

    protected $sort = 'g_id';

    /**
     * @var string 定义使用的model
     */
    public $modelClass = 'backend\models\DtoaProject';

    /**
     * 处理查询条件
     *
     * @return array
     */
    public function where()
    {
        return [
            // 其他查询字段信息
            [['g_status'], '='],
            [['g_name'], 'like'],
        ];
    }

    public function actionIndex()
    {
        $access = $this->get_access(1);
        /*$hash_password = \Yii::$app->security->generatePasswordHash('123456');
        var_dump($hash_password);*/
        return $this->render('index',[
            'access' => $access,
        ]);
    }

    public function actionView()
    {
        $access = $this->get_access(1);
        $id=Yii::$app->request->get('id');
        return $this->render('view', [
            'model' => $this->findModel($id),
            'access' => $access,
        ]);
    }

    public function actionCreate()
    {
        $access = $this->get_access(1);
        if($access!=1){
            throw new ForbiddenHttpException('您没有执行此操作的权限');
        }
        $model = new DtoaProject();
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['/project-grant/update', 'id' => $model->g_id]);
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    public function actionUpdate()
    {
        $access = $this->get_access(1);
        if($access!=1){
            throw new ForbiddenHttpException('您没有执行此操作的权限');
        }
        $id=Yii::$app->request->get('id');
        $model = $this->findModel($id);
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            if($model->g_status==0){
                return $this->redirect(['/project-grant/update', 'id' => $model->g_id]);
            }else{
                return $this->render('index', [
                    'closeallpage' => 1,
                    'access' => $access,
                ]);
            }
        }

        return $this->render('update', [
            'model' => $model,
            'access' => $access,
        ]);
    }

    public function actionDelete()
    {
        // 接收参数判断
        if (!$model = $this->findOne(Yii::$app->request->post())) {
            return $this->returnJson();
        }
        $id=Yii::$app->request->post('g_id');
        // 删除数据失败
        if (!$model->delete()) {
            return $this->error(1004, Helper::arrayToString($model->getErrors()));
        }else{  //删除工程授权等   dtoa_approval_group dtoa_items
            DtoaApprovalGroup::deleteAll(['g_id' => $id]);
            DtoaItems::deleteAll(['g_id' => $id]);
        }
        return $this->success($model);
    }

    public function getExportHandleParams()
    {
        $array['g_status'] = function ($value) {
            return DtoaProject::PROJECT_STATUS[$value];
        };

        return $array;
    }

    protected function findModel($id)
    {
        if (($model = DtoaProject::findOne($id)) !== null) {
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