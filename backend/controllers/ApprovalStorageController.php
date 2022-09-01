<?php

namespace backend\controllers;

use backend\models\DtoaApproval;
use backend\models\DtoaApprovalGroup;
use backend\models\DtoaCart;
use backend\models\DtoaCategory;
use backend\models\DtoaItems;
use backend\models\DtoaMaterial;
use backend\models\DtoaPlan;
use backend\models\DtoaAgreement;
use backend\models\DtoaProject;
use backend\models\DtoaStorageCart;
use backend\models\DtoaSupplier;
use backend\models\DtoaStorage;
use backend\models\DtoaTicketCart;
use jinxing\admin\models\Admin;
use jinxing\admin\models\AdminUser;
use Yii;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;
/**
 * Class StorageController 入库操作 执行操作控制器
 * @package backend\controllers
 */
class ApprovalStorageController extends Controller
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
            [['k_status'], 'IN'],
            [['s_id'], '='],
            [['g_id'], '='],
            [['next_admin_id'], '='],
            [['k_type'], '='],
            [['k_source'], '='],
        ];
    }

    public function actionIndex()
    {
        $k_type=Yii::$app->request->get('k_type');
        $closeallpage=Yii::$app->request->get('closeallpage');
        $access = 0;
        switch ($k_type) {
            case 1:
                $access6 = $this->get_access(6, Yii::$app->session['g_id']);
                $access13 = $this->get_access(13, Yii::$app->session['g_id']);
                $access14 = $this->get_access(14, Yii::$app->session['g_id']);
                if($access6 == 1 || $access13 == 1 || $access14 == 1){
                    $access = 1;
                }
                break;
            case 2:
                $access = $this->get_access(9, Yii::$app->session['g_id']);
                break;
            case 3:
                $access = $this->get_access(10, Yii::$app->session['g_id']);
                break;
        }
        return $this->render('index',[
            'access' => $access,
            'k_type' => $k_type,
            'closeallpage' => $closeallpage,
        ]);
    }

    public function actionUpdate()
    {
        $id=Yii::$app->request->get('id');
        $model = $this->findModel($id);
        if($model->k_status==0){
            echo "<script>alert('审批状态已改变，请刷新页面');</script>";
            return $this->redirect(['index?k_type='.$model->k_type]);
        }
        switch ($model->k_type) {
            case 1:
                switch ($model->k_source) {
                    case '计划入库':
                        $item_id=6;
                        break;
                    case '合同入库':
                        $item_id=13;
                        break;
                    case '直接入库':
                        $item_id=14;
                        break;
                }
                break;
            case 2:
                $item_id=9;
                break;
            case 3:
                $item_id=10;
                break;
        }
        $access = $this->get_access($item_id, Yii::$app->session['g_id']);
        if($access!=1){
            throw new ForbiddenHttpException('您没有执行此操作的权限');
        }
        $target_id=$model->k_id;
        switch ($model->k_type) {
            case 1:
                $view_url='material-update';
                $storagecart=DtoaStorageCart::find()->select(['dtoa_storage_cart.*','m.c_no','m.c_name','m.size','m.quality','m.num'])
                    ->andWhere(['k_id'=>$model->k_id])
                    ->join('INNER JOIN', ['m' => 'dtoa_material'], 'm.c_id = dtoa_storage_cart.c_id')->orderBy('sc_id')->asArray()->all();
                break;
            case 2:
                $storagecart=DtoaTicketCart::find()->select(['dtoa_ticket_cart.*','m.c_no','m.c_name','m.size','m.quality','m.num'])->andWhere(['k_id'=>$model->k_id])->join('INNER JOIN', ['m' => 'dtoa_material'], 'm.c_id = dtoa_ticket_cart.c_id')->asArray()->one();
                $view_url='ticket-update';
                break;
            case 3:
                $storagecart=DtoaStorageCart::find()->select(['dtoa_storage_cart.*','m.c_no','m.c_name','m.size','m.quality','m.num'])
                    ->andWhere(['k_id'=>$model->k_id])
                    ->join('INNER JOIN', ['m' => 'dtoa_material'], 'm.c_id = dtoa_storage_cart.c_id')->orderBy('sc_id')->asArray()->all();
                $view_url='lease-update';
                break;
        }
        if(empty($storagecart)){
            throw new NotFoundHttpException('入库单数据异常.');
        }
        if(Yii::$app->request->post()){
            $post=Yii::$app->request->post();
            $uid_arr=DtoaApprovalGroup::find()->select(['uid_arr'])->andWhere(['g_id'=>$model->g_id])->andWhere(['item_id'=>$item_id])->asArray()->one();
            $uid_arr=json_decode($uid_arr['uid_arr'],true);
            $uid_arr=$uid_arr[1];
            if($post['a_status']==1){//通过则下一级继续审核
                if(end($uid_arr)==$model->next_admin_id){//当前审批到了最后一级 更新storage k_status
                    $model->k_status=2;
                }else{
                    $keys=array_search($model->next_admin_id, $uid_arr);
                    $model->next_admin_id=$uid_arr[$keys+1];
                }
                $model->approval_time=date('Y-m-d H:i:s',time());
            }else{//拒绝则 k_status=0 next_admin_id=第一个审批人 删除所有审批记录
                /*$a_id_arr=DtoaApproval::find()->select(['a_id'])->andWhere(['g_id' => $model['g_id']])->andWhere(['table_index' => 3])->andWhere(['target_id' => $model['k_id']])->asArray()->all();
                $a_id_arr=array_column($a_id_arr,'a_id');
                DtoaApproval::deleteAll(['a_id' => $a_id_arr]);*/
                $model->k_status=0;
                $model->approval_time='';
                $model->next_admin_id=$uid_arr[0];
            }
            if(!$model->save()){
                //var_dump($model->getErrors());
            }else{
                /*if($model->k_type==2){  //如果商砼入库拒绝则更新材料入库状态为未入库
                    $ticket=DtoaTicketCart::find()->select(['jc_id'])->andWhere(['k_id'=>$model->k_id])->asArray()->one();
                    $cart_model=DtoaCart::findOne($ticket['jc_id']);
                    $cart_model->c_status=0;
                }*/
            }
            $Approvalmodel = new DtoaApproval();
            $Approvalmodel->g_id=$model->g_id;
            $Approvalmodel->table_index=3;
            $Approvalmodel->target_id=$target_id;
            $Approvalmodel->approver_id=$post['approver_id'];
            $Approvalmodel->approver=$post['approver'];
            $Approvalmodel->a_status=$post['a_status'];
            $Approvalmodel->a_info=empty($post['a_info'])?'':$post['a_info'];
            $Approvalmodel->created_at=date('Y-m-d H:i:s',time());
            if(!$Approvalmodel->save()){
                //var_dump($Approvalmodel->getErrors());
            }
            return $this->redirect(['index?k_type='.$model->k_type.'&closeallpage=1']);
        }
        return $this->render($view_url, [
            'model' => $model,
            'storagecart' => $storagecart,
        ]);
    }

    public function actionView()
    {
        $id=Yii::$app->request->get('id');
        $model = $this->findModel($id);
        switch ($model->k_type) {
            case 1:
                switch ($model->k_source) {
                    case '计划入库':
                        $item_id=6;
                        break;
                    case '合同入库':
                        $item_id=13;
                        break;
                    case '直接入库':
                        $item_id=14;
                        break;
                }
                $access = $this->get_access($item_id, Yii::$app->session['g_id']);
                $view_url='material-view';
                $storagecart=DtoaStorageCart::find()->select(['dtoa_storage_cart.*','m.c_no','m.c_name','m.size','m.quality','m.num'])
                    ->andWhere(['k_id'=>$model->k_id])
                    ->join('INNER JOIN', ['m' => 'dtoa_material'], 'm.c_id = dtoa_storage_cart.c_id')->orderBy('sc_id')->asArray()->all();
                break;
            case 2:
                $access = $this->get_access(9, Yii::$app->session['g_id']);
                $storagecart=DtoaTicketCart::find()->select(['dtoa_ticket_cart.*','m.c_no','m.c_name','m.size','m.quality','m.num'])->andWhere(['k_id'=>$model->k_id])->join('INNER JOIN', ['m' => 'dtoa_material'], 'm.c_id = dtoa_ticket_cart.c_id')->asArray()->one();
                $view_url='ticket-view';
                break;
            case 3:
                $access = $this->get_access(10, Yii::$app->session['g_id']);
                $storagecart=DtoaStorageCart::find()->select(['dtoa_storage_cart.*','m.c_no','m.c_name','m.size','m.quality','m.num'])
                    ->andWhere(['k_id'=>$model->k_id])
                    ->join('INNER JOIN', ['m' => 'dtoa_material'], 'm.c_id = dtoa_storage_cart.c_id')->orderBy('sc_id')->asArray()->all();
                $view_url='lease-view';
                break;
        }
        return $this->render($view_url, [
            'model' => $model,
            'storagecart' => $storagecart,
            'access' => $access,
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

    protected function getcname($cid){
        $cate=DtoaCategory::find()->select(['cname','cid','pid'])->andWhere(['cid'=>$cid])->asArray()->one();
        $namestr=$cate['cname'];
        if($cate['pid']!=0){
            $namestr=$this->getcname($cate['pid']).' 》'.$namestr;
        }
        return $namestr;
    }
}
