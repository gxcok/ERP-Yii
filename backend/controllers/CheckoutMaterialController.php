<?php

namespace backend\controllers;

use backend\models\DtoaApproval;
use backend\models\DtoaApprovalGroup;
use backend\models\DtoaCart;
use backend\models\DtoaItems;
use backend\models\DtoaProject;
use backend\models\DtoaTicketCart;
use backend\models\DtoaCategory;
use backend\models\DtoaMaterial;
use backend\models\DtoaPlan;
use backend\models\DtoaAgreement;
use backend\models\DtoaSupplier;
use backend\models\DtoaStorage;
use backend\models\DtoaStorageCart;
use jinxing\admin\helpers\Helper;
use jinxing\admin\models\Admin;
use jinxing\admin\models\AdminUser;
use Yii;
use yii\db\Query;
use yii\helpers\ArrayHelper;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;

/**
 * Class StorageController 入库操作 执行操作控制器
 * @package backend\controllers
 */
class CheckoutMaterialController extends Controller
{
    protected $pk = 'k_id';

    protected $sort = 'k_id';
    
    /**
     * @var string 定义使用的model
     */
    public $modelClass = 'backend\models\DtoaStorage';

    /**
     * 处理查询条件
     *
     * @return array
     */
    public function where()
    {
        return [
            // 其他查询字段信息
            [['k_status'], '='],
            [['c_status'], '='],
            [['s_id'], '='],
            [['g_id'], '='],
            [['k_type'], '='],
        ];
    }

    public function actionIndex()
    {
        $access = $this->get_access(5, Yii::$app->session['g_id']);
        return $this->render('index',[
            'access' => $access,
        ]);
    }

    public function actionUpdate()
    {
        bcscale(3);
        $id=Yii::$app->request->get('id');
        $post=Yii::$app->request->post();
        if(empty($id)){
            $id=$post['k_id'];
        }
        $model = $this->findModel($id);
        $access = $this->get_access(5,Yii::$app->session['g_id'],1,$model->k_source);
        if($access!=1){
            throw new ForbiddenHttpException('您没有执行此操作的权限');
        }
        if(!empty($post)){
            $model->c_status=1;
            $model->checkout_time=date('Y-m-d H:i:s',time());
            $model->c_info=$post['c_info'];
            if(!$model->save()){
                return json_encode(['errCode'=>1,'msg'=>$model->getErrors()]);
            }else{
                return json_encode(['errCode'=>0,'msg'=>'出库成功']);
            }
        }
        $storagecart=DtoaStorageCart::find()->select(['dtoa_storage_cart.*','m.c_no','m.c_name','m.size','m.quality','m.num'])->andWhere(['k_id'=>$model->k_id])->join('INNER JOIN', ['m' => 'dtoa_material'], 'm.c_id = dtoa_storage_cart.c_id')->orderBy('sc_id')->asArray()->all();
        $approval=DtoaApproval::find()->andWhere(['g_id' => $model['g_id']])->andWhere(['table_index' => 3])
            ->andWhere(['target_id' => $model['k_id']])->asArray()->all();
        return $this->render('update', [
            'access' => $access,
            'model' => $model,
            'storagecart' => $storagecart,
            'approval' => $approval,
        ]);
    }

    public function getExportHandleParams()
    {
        $array['g_id'] = function ($value) {
            return DtoaProject::find()->select(['g_name'])->andWhere(['g_id'=>$value])->asArray()->one()['g_name'];
        };

        $array['k_type'] = function ($value) {
            return DtoaStorage::STORAGE_TYPE[$value];
        };

        $array['h_id'] = function ($value) {
            if(!empty($value)){
                return DtoaAgreement::find()->select(['h_name'])->andWhere(['h_id'=>$value])->asArray()->one()['h_name'];
            }
        };

        $array['s_id'] = function ($value) {
            return DtoaSupplier::find()->select(['s_name'])->andWhere(['s_id'=>$value])->asArray()->one()['s_name'];
        };

        $array['k_status'] = function ($value) {
            return DtoaStorage::STORAGE_STATUS[$value];
        };

        $array['next_admin_id'] = function ($value) {
            return AdminUser::find()->select(['name'])->andWhere(['id'=>$value])->asArray()->one()['name'];
        };

        return $array;
    }

    protected function findModel($id)
    {
        if (($model = DtoaStorage::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('请求页面不存在.');
    }

    protected function get_access($item_id,$g_id=0,$k_type=1,$k_source=''){
        if(Yii::$app->user->identity->id==Admin::SUPER_ADMIN_ID){
            return 1;
        }
        if($item_id==1 || $item_id==3){
            $approval_item_id=3;
        }elseif ($item_id==2 || $item_id==4){
            $approval_item_id=4;
        }elseif (($item_id==5 && $k_type==1 && $k_source=='计划入库') || $item_id==6){
            $approval_item_id=6;
        }elseif (($item_id==5 && $k_type==1 && $k_source=='合同入库') || $item_id==13){
            $approval_item_id=13;
        }elseif (($item_id==5 && $k_type==1 && $k_source=='直接入库') || $item_id==14){
            $approval_item_id=14;
        }elseif (($item_id==5 && $k_type==2) || $item_id==9){
            $approval_item_id=9;
        }elseif (($item_id==5 && $k_type==3) || $item_id==10){
            $approval_item_id=10;
        }elseif ($item_id==7 || $item_id==8){
            $approval_item_id=8;
        }
        if(!empty($approval_item_id)){
            $uid_arr=DtoaApprovalGroup::find()->select(['uid_arr'])->andWhere(['g_id'=>$g_id])->andWhere(['item_id'=>$approval_item_id])->asArray()->one();
            if(empty($uid_arr)){
                throw new ForbiddenHttpException('当前工程['.DtoaProject::PROJECT_APPROVAL_ITEMS[$approval_item_id].']没有分配员工');
            }else{
                $uid_arr=json_decode($uid_arr['uid_arr'],true);
                if(empty($uid_arr[1])){
                    throw new ForbiddenHttpException('当前工程['.DtoaProject::PROJECT_APPROVAL_ITEMS[$approval_item_id].']没有分配员工');
                }
            }
        }
        $item_arr=DtoaItems::find()->andWhere(['g_id'=>$g_id])->andWhere(['uid'=>Yii::$app->user->identity->id])->asArray()->one();
        $access = 0;  //权限 0:查看 1：修改
        if(empty($item_arr)){
            //throw new ForbiddenHttpException('您没有执行此操作的权限');
        }else{
            $item_arr=json_decode($item_arr['item_arr'],true);
            $has_access = false ;
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
                //throw new ForbiddenHttpException('您没有执行此操作的权限');
            }
            return $access;
        }
    }

    protected function has_more_access($item_id,$g_id=0){
        $item_arr=DtoaItems::find()->andWhere(['g_id'=>$g_id])->andWhere(['uid'=>Yii::$app->user->identity->id])->asArray()->one();
        $has_access=false;
        if(!empty($item_arr)){
            $item_arr=json_decode($item_arr['item_arr'],true);
            if(!empty($item_arr[0])){
                if(in_array($item_id,$item_arr[0])){
                    $has_access=true;
                }
            }
            if(!empty($item_arr[1])){
                if(in_array($item_id,$item_arr[1])){
                    $has_access=true;
                }
            }
        }
        return $has_access;
    }
}
