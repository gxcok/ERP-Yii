<?php

namespace backend\controllers;
use backend\models\DtoaApproval;
use backend\models\DtoaItems;
use backend\models\DtoaPay;
use backend\models\DtoaApprovalGroup;
use backend\models\DtoaProject;
use backend\models\DtoaStorage;
use backend\models\DtoaSupplier;
use jinxing\admin\models\Admin;
use jinxing\admin\models\AdminUser;
use Yii;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;

/**
 * Class PayController 财务结算 执行操作控制器
 * @package backend\controllers
 */
class ApprovalPayController extends Controller
{
    protected $pk = 'p_id';

    protected $sort = 'p_id';

    /**
     * 处理查询条件
     *
     * @return array
     */
    public function where()
    {
        return [
            // 其他查询字段信息
            [['p_status'], '='],
            [['p_status'], 'IN'],
            [['s_id'], '='],
            [['g_id'], '='],
            [['next_admin_id'], '='],
        ];
    }

    /**
     * @var string 定义使用的model
     */
    public $modelClass = 'backend\models\DtoaPay';

    public function actionIndex()
    {
        $access = $this->get_access(8,Yii::$app->session['g_id']);
        $closeallpage=Yii::$app->request->get('closeallpage');
        return $this->render('index',[
            'access' => $access,
            'closeallpage' => $closeallpage,
        ]);
    }

    public function actionUpdate()
    {
        $access = $this->get_access(8,Yii::$app->session['g_id']);
        if($access!=1){
            throw new ForbiddenHttpException('您没有执行此操作的权限');
        }
        $id=Yii::$app->request->get('id');
        $model = $this->findModel($id);
        if($model->p_status==0){
            echo "<script>alert('审批状态已改变，请刷新页面');</script>";
            return $this->redirect(['index']);
        }
        $post=Yii::$app->request->post();
        if(!empty($post)){
            $uid_arr=DtoaApprovalGroup::find()->select(['uid_arr'])->andWhere(['g_id'=>$model->g_id])->andWhere(['item_id'=>8])->asArray()->one();
            $uid_arr=json_decode($uid_arr['uid_arr'],true);
            $uid_arr=$uid_arr[1];
            if($post['a_status']==1){//通过则下一级继续审核
                if(end($uid_arr)==$model->next_admin_id){//当前审批到了最后一级 更新plan j_status
                    $model->p_status=2;
                    DtoaStorage::updateAll(['k_status'=>4],['in', 'k_id', json_decode($model->p_data,true)]);
                }else{
                    $keys=array_search($model->next_admin_id, $uid_arr);
                    if(empty($uid_arr[$keys+1])){
                        $model->next_admin_id=end($uid_arr);
                    }else{
                        $model->next_admin_id=$uid_arr[$keys+1];
                    }
                }
            }else{//拒绝则 pay p_status=0 next_admin_id=第一个审批人 删除结算审批记录
                /*$a_id_arr=DtoaApproval::find()->select(['a_id'])->andWhere(['g_id' => $model['g_id']])->andWhere(['table_index' => 4])->andWhere(['target_id' => $model['p_id']])->asArray()->all();
                $a_id_arr=array_column($a_id_arr,'a_id');
                DtoaApproval::deleteAll(['a_id' => $a_id_arr]);//删除结算审批记录*/

                DtoaStorage::updateAll(['k_status'=>3],['in', 'k_id', json_decode($model->p_data,true)]);

                $model->p_status=0;
                $model->approval_time='';
                $model->next_admin_id=$uid_arr[0];
            }
            if(!$model->save()){
                //var_dump($model->getErrors());
            }
            $Approvalmodel = new DtoaApproval();
            $Approvalmodel->g_id=$model->g_id;
            $Approvalmodel->table_index=4;
            $Approvalmodel->target_id=$model->p_id;
            $Approvalmodel->approver_id=$post['approver_id'];
            $Approvalmodel->approver=$post['approver'];
            $Approvalmodel->a_status=$post['a_status'];
            $Approvalmodel->a_info=empty($post['a_info'])?'':$post['a_info'];
            $Approvalmodel->created_at=date('Y-m-d H:i:s',time());
            if(!$Approvalmodel->save()){
                //var_dump($Approvalmodel->getErrors());
            }
            return $this->redirect(['index?closeallpage=1']);
            /*return $this->render('index', [
                'closeallpage' => 1,
                'access' => $access,
            ]);*/
        }
        $paylist=DtoaStorage::find()->andWhere(['in', 'k_id', json_decode($model->p_data,true)])->asArray()->all();
        return $this->render('update', [
            'model' => $model,
            'paylist' => $paylist,
            'access' => $access,
        ]);
    }

    public function actionView()
    {
        $access = $this->get_access(8,Yii::$app->session['g_id']);
        $id=Yii::$app->request->get('id');
        $model = $this->findModel($id);
        $paylist=DtoaStorage::find()->andWhere(['in', 'k_id', json_decode($model->p_data,true)])->asArray()->all();
        return $this->render('view', [
            'model' => $model,
            'paylist' => $paylist,
            'access' => $access,
        ]);
    }

    public function getExportHandleParams()
    {
        $array['g_id'] = function ($value) {
            return DtoaProject::find()->select(['g_name'])->andWhere(['g_id'=>$value])->asArray()->one()['g_name'];
        };

        $array['s_id'] = function ($value) {
            return DtoaSupplier::find()->select(['s_name'])->andWhere(['s_id'=>$value])->asArray()->one()['s_name'];
        };

        $array['p_status'] = function ($value) {
            return DtoaPay::PAY_STATUS[$value];
        };

        $array['next_admin_id'] = function ($value) {
            return AdminUser::find()->select(['name'])->andWhere(['id'=>$value])->asArray()->one()['name'];
        };

        return $array;
    }

    protected function findModel($id)
    {
        if (($model = DtoaPay::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('请求页面不存在.');
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
            throw new ForbiddenHttpException('您没有执行此操作的权限');
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
                throw new ForbiddenHttpException('您没有执行此操作的权限');
            }
            return $access;
        }
    }
}
