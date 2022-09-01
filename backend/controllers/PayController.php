<?php

namespace backend\controllers;
use backend\models\DtoaApproval;
use backend\models\DtoaItems;
use backend\models\DtoaPay;
use backend\models\DtoaAgreement;
use backend\models\DtoaApprovalGroup;
use backend\models\DtoaCart;
use backend\models\DtoaCategory;
use backend\models\DtoaMaterial;
use backend\models\DtoaPlan;
use backend\models\DtoaProject;
use backend\models\DtoaStorage;
use backend\models\DtoaStorageCart;
use backend\models\DtoaSupplier;
use jinxing\admin\helpers\Helper;
use jinxing\admin\models\Admin;
use jinxing\admin\models\AdminUser;
use Yii;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;

/**
 * Class PayController 财务结算 执行操作控制器
 * @package backend\controllers
 */
class PayController extends Controller
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
            [['s_id'], '='],
            [['g_id'], '='],
        ];
    }

    public function actionIndex()
    {
        $access = $this->get_access(7,Yii::$app->session['g_id']);
/*        $the_data=DtoaPlan::find()->select(['j_id','total_price'])->asArray()->all();
        foreach ($the_data as $t_data) {
            $total_price=DtoaCart::find()->select(['total_price'=>'SUM(one_price)'])->andWhere(['j_id'=>$t_data['j_id']])->asArray()->one()['total_price'];
            if(floatval($t_data['total_price'])<>floatval($total_price)){
                print_r('计划'.$t_data['j_id'].'总金额修正');
                $the_one=DtoaPlan::findOne($t_data['j_id']);
                $the_one->total_price=floatval($total_price);
                if(!$the_one->save()){
                    //var_dump($the_one->getErrors());
                }
            }
        }
        $the_data=DtoaAgreement::find()->select(['h_id','total_price'])->asArray()->all();
        foreach ($the_data as $t_data) {
            $total_price=DtoaCart::find()->select(['total_price'=>'SUM(one_price)'])->andWhere(['h_id'=>$t_data['h_id']])->asArray()->one()['total_price'];
            if(floatval($t_data['total_price'])<>floatval($total_price)){
                print_r('合同'.$t_data['h_id'].'总金额修正');
                $the_one=DtoaAgreement::findOne($t_data['h_id']);
                $the_one->total_price=floatval($total_price);
                if(!$the_one->save()){
                    //var_dump($the_one->getErrors());
                }
            }
        }
        $the_data=DtoaStorage::find()->select(['k_id','total_price'])->andWhere(['<>','k_type', 2])->asArray()->all();
        foreach ($the_data as $t_data) {
            $total_price=DtoaStorageCart::find()->select(['total_price'=>'SUM(one_price)'])->andWhere(['k_id'=>$t_data['k_id']])->asArray()->one()['total_price'];
            if(floatval($t_data['total_price'])<>floatval($total_price)){
                print_r('入库'.$t_data['k_id'].'总金额修正');
                $the_one=DtoaStorage::findOne($t_data['k_id']);
                $the_one->total_price=floatval($total_price);
                if(!$the_one->save()){
                    //var_dump($the_one->getErrors());
                }
            }
        }*/
        return $this->render('index',[
            'access' => $access,
        ]);
    }

    /**
     * @var string 定义使用的model
     */
    public $modelClass = 'backend\models\DtoaPay';

    public function actionCreate()
    {
        $access = $this->get_access(7,Yii::$app->session['g_id']);
        if($access!=1){
            throw new ForbiddenHttpException('您没有执行此操作的权限');
        }
        $model= new DtoaPay();
        $s_id=Yii::$app->request->get('s_id');
        if(Yii::$app->request->post()){
            $model->load(Yii::$app->request->post());
            $p_data=Yii::$app->request->post()['DtoaPay']['p_data'];
            if(is_array($p_data)){
                $model->total_price=DtoaStorage::find()->select(['total_price'=>'SUM(total_price)'])->andWhere(['in','k_id',$p_data])->asArray()->one(['total_price']);
            }else{
                $model->total_price=Yii::$app->request->post()['DtoaPay']['total_price'];
            }
            if ($model->save()) {
                if(!empty(Yii::$app->request->post()['DtoaPay']['p_data'])) {
                    $p_data = json_decode(Yii::$app->request->post()['DtoaPay']['p_data'], true);
                    DtoaStorage::updateAll(['k_status' => 3], ['in', 'k_id', $p_data]);
                }
                return $this->redirect(['index']);
            }else{
                //var_dump($model->getErrors());
            }
        }
        //获取当前工程通过入库审核的所有入库单
        $storage=DtoaStorage::find()->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['k_status'=>2]);
        if(!empty($s_id)){
            $storage->andWhere(['s_id'=>$s_id]);
            $model->s_id=$s_id;
        }
        $storagelist=$storage->asArray()->all();

        return $this->render('create', [
            'model' => $model,
            'storagelist' => $storagelist,
        ]);
    }

    public function actionUpdate()
    {
        $access = $this->get_access(7,Yii::$app->session['g_id']);
        if($access!=1){
            throw new ForbiddenHttpException('您没有执行此操作的权限');
        }
        $id=Yii::$app->request->get('id');
        $s_id=Yii::$app->request->get('s_id');
        $model = $this->findModel($id);
        if($model->p_status>0){ //结算审批通过后只能查看
            return $this->redirect(['view', 'id' => $model->p_id]);
        }
        if(empty($s_id)){
            $s_id=$model->s_id;
        }

        if(Yii::$app->request->post()){
            if(!empty($model->p_data)){
                DtoaStorage::updateAll(['k_status'=>2],['in', 'k_id', json_decode($model->p_data,true)]);
            }
            $p_data=Yii::$app->request->post()['DtoaPay']['p_data'];
            if(is_array($p_data)){
                $total_price=DtoaStorage::find()->select(['total_price'=>'SUM(total_price)'])->andWhere(['in', 'k_id',$p_data])->asArray()->one()['total_price'];
                $p_data=json_encode($p_data);
            }else{
                $total_price=Yii::$app->request->post()['DtoaPay']['total_price'];
            }
            $model->s_id=Yii::$app->request->post()['DtoaPay']['s_id'];
            $model->p_status=Yii::$app->request->post()['DtoaPay']['p_status'];
            //$model->total_price=Yii::$app->request->post()['DtoaPay']['total_price'];
            $model->total_price=$total_price;
            $model->p_data=$p_data;
            if(!$model->save()){
                var_dump($model->getErrors());
            }
            if(!empty($model->p_data)) {
                DtoaStorage::updateAll(['k_status' => 3], ['in', 'k_id', json_decode($model->p_data, true)]);
            }
            return $this->redirect(['index']);
        }
        //获取当前工程通过入库审核的所有入库单 并剔除已选择结算的入库单
        $select_rs=DtoaPay::find()->select(['p_data'])->andWhere(['g_id'=>Yii::$app->session['g_id']])
            ->andWhere(['s_id'=>$s_id])->andWhere(['<>', 'p_id', $model->p_id])->asArray()->all();
        //$k_id_select_arr=array_filter(array_merge(array_column($select_rs,'p_data')));
        $p_data_arr=array_column($select_rs,'p_data');
        $k_id_select_arr=[];
        foreach($p_data_arr as $p_data){
            if(!empty($p_data)){
                $k_id_select_arr=array_merge($k_id_select_arr,json_decode($p_data, true));
            }
        }
        $storage_db=DtoaStorage::find()->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['s_id'=>$s_id])->andWhere(['in', 'k_status', [2,3]]);
        if(!empty($k_id_select_arr)){
            $storage_db=$storage_db->andWhere(['not in', 'k_id', $k_id_select_arr]);
        }
        $storagelist=$storage_db->asArray()->all();
        $approval=DtoaApproval::find()->andWhere(['g_id' => $model['g_id']])->andWhere(['table_index' => 4])
            ->andWhere(['target_id' => $model['p_id']])->asArray()->all();
        return $this->render('update', [
            'model' => $model,
            'storagelist' => $storagelist,
            'approval' => $approval,
            's_id' => Yii::$app->request->get('s_id'),
        ]);
    }

    public function actionDelete()
    {
        // 接收参数判断
        if (!$model = $this->findOne(Yii::$app->request->post())) {
            return $this->returnJson();
        }
        //删除pay 恢复DtoaStorage k_status=2
        if(!empty($model->p_data)) {
            $p_data= json_decode($model->p_data,true);
        }
        // 删除数据失败
        if (!$model->delete()) {
            return $this->error(1004, Helper::arrayToString($model->getErrors()));
        }else{
            if(!empty($p_data)) {
                DtoaStorage::updateAll(['k_status'=>2],['in', 'k_id', $p_data]);
            }
        }
        return $this->success($model);
    }

    public function actionView()
    {
        $access = $this->get_access(7,Yii::$app->session['g_id']);
        $id=Yii::$app->request->get('id');
        $model = $this->findModel($id);
        $paylist=DtoaStorage::find()->andWhere(['in', 'k_id', json_decode($model->p_data,true)])->asArray()->all();
        $approval=DtoaApproval::find()->andWhere(['g_id' => $model['g_id']])->andWhere(['table_index' => 4])
            ->andWhere(['target_id' => $model['p_id']])->asArray()->all();
        return $this->render('view', [
            'model' => $model,
            'paylist' => $paylist,
            'approval' => $approval,
            'access' => $access,
        ]);
    }

    protected function findModel($id)
    {
        if (($model = DtoaPay::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('请求页面不存在.');
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
