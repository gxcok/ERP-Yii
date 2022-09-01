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
use Yii;
use yii\helpers\ArrayHelper;
use yii\web\ForbiddenHttpException;

/**
 * Class StorageController 入库操作 执行操作控制器
 * @package backend\controllers
 */
class StorageController extends Controller
{
    protected $pk = 'k_id';

    protected $sort = 'k_id';
    
    /**
     * @var string 定义使用的model
     */
    public $modelClass = 'backend\models\DtoaStorage';

    public function actionSearch()
    {
        return $this->render('search',[
        ]);
    }

    protected function get_access($item_id,$g_id=0,$k_type=1,$k_source=''){
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
        }elseif ($item_id==11 || $item_id==12){
            $approval_item_id=12;
        }elseif ($item_id==7 || $item_id==8){
            $approval_item_id=8;
        }
        $uid_arr=DtoaApprovalGroup::find()->select(['uid_arr'])->andWhere(['g_id'=>$g_id])->andWhere(['item_id'=>$approval_item_id])->asArray()->one();
        if(empty($uid_arr)){
            throw new ForbiddenHttpException('当前工程['.DtoaProject::PROJECT_APPROVAL_ITEMS[$approval_item_id].']没有分配员工');
        }else{
            $uid_arr=json_decode($uid_arr['uid_arr'],true);
            if(empty($uid_arr[1])){
                throw new ForbiddenHttpException('当前工程['.DtoaProject::PROJECT_APPROVAL_ITEMS[$approval_item_id].']没有分配员工');
            }
        }
        if(Yii::$app->user->identity->id==Admin::SUPER_ADMIN_ID){
            return 1;
        }
        $item_arr=DtoaItems::find()->andWhere(['g_id'=>$g_id])->andWhere(['uid'=>Yii::$app->user->identity->id])->asArray()->one();
        if(empty($item_arr)){
            throw new ForbiddenHttpException('您没有当前工程['.DtoaProject::PROJECT_ITEMS[$item_id].']-[查看/编辑]权限');
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
                throw new ForbiddenHttpException('您没有当前工程['.DtoaProject::PROJECT_ITEMS[$item_id].']-[查看/编辑]权限');
            }
            return $access;
        }
    }
}
