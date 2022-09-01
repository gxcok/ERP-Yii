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
use yii\helpers\ArrayHelper;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;

/**
 * Class StorageController 入库操作 执行操作控制器
 * @package backend\controllers
 */
class StorageMaterialController extends Controller
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
            [['s_id'], '='],
            [['g_id'], '='],
            [['k_source'], '='],
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

    public function actionCreate()
    {
        $access = $this->get_access(5, Yii::$app->session['g_id']);
        if($access!=1){
            throw new ForbiddenHttpException('您没有执行此操作的权限');
        }
        $model = new DtoaStorage();
        $post=Yii::$app->request->post();
        if(!empty($post)){
            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                return $this->redirect(['/storage-material/update?id='.$model->k_id]);
            }
        }
        return $this->render('create', [
            'model' => $model,
        ]);
    }

    public function actionUpdate()
    {
        bcscale(3);
        $id=Yii::$app->request->get('id');
        $model = $this->findModel($id);
        $access = $this->get_access(5,Yii::$app->session['g_id'],1,$model->k_source);
        if($access!=1){
            throw new ForbiddenHttpException('您没有执行此操作的权限');
        }
        if($model->k_status>0){
            return $this->redirect(['view', 'id' => $model->k_id]);
        }
        $post=Yii::$app->request->post();
        if(!empty($post)){
            $add_price=0;
            if(!empty($post['DtoaStorage']['k_source'])){
                $model->k_source=$post['DtoaStorage']['k_source'];
            }
            if(!empty($post['DtoaStorageCart'])){
                $n=count($post['DtoaStorageCart']['c_id']);
                for ($i = 0; $i < $n; $i++) {
                    $cartmodel = new DtoaStorageCart();
                    $cartmodel->k_id=$model->k_id;
                    $cartmodel->j_id=empty($post['DtoaStorageCart']['j_id'])?0:$post['DtoaStorageCart']['j_id'][$i];
                    $cartmodel->j_no=empty($post['DtoaStorageCart']['j_no'])?'':$post['DtoaStorageCart']['j_no'][$i];
                    $cartmodel->h_id=empty($post['DtoaStorageCart']['h_id'])?0:$post['DtoaStorageCart']['h_id'][$i];
                    $cartmodel->h_no=empty($post['DtoaStorageCart']['h_no'])?'':$post['DtoaStorageCart']['h_no'][$i];
                    $cartmodel->jc_id=$post['DtoaStorageCart']['jc_id'][$i];
                    $cartmodel->c_id=$post['DtoaStorageCart']['c_id'][$i];
                    $cartmodel->j_real_num=$post['DtoaStorageCart']['j_real_num'][$i];
                    $cartmodel->j_num=empty($post['DtoaStorageCart']['j_num'][$i])?0:$post['DtoaStorageCart']['j_num'][$i];
                    $cartmodel->j_price=empty($post['DtoaStorageCart']['j_price'][$i])?0:$post['DtoaStorageCart']['j_price'][$i];
                    $cartmodel->j_real_price=$post['DtoaStorageCart']['j_real_price'][$i];
                    $cartmodel->one_price=bcmul($cartmodel->j_real_num,$cartmodel->j_real_price);
                    if(!empty($post['DtoaStorageCart']['storage_ok']) && in_array($i,$post['DtoaStorageCart']['storage_ok'])){
                        $cartmodel->storage_ok=1;
                    }else{
                        $cartmodel->storage_ok=0;
                    }
                    $cartmodel->jc_info=$post['DtoaStorageCart']['jc_info'][$i];
                    $cartmodel->created_at=date('Y-m-d H:i:s',time());
                    if(!$cartmodel->save()){
                        //var_dump($cartmodel->getErrors());
                    }else{
                        if($model->k_source=='直接入库'){

                        }else{
                            //更新DtoaCart
                            $oacartmodel=DtoaCart::findOne($cartmodel->jc_id);
                            if($cartmodel->storage_ok==1){
                                $oacartmodel->c_status=1;
                                $surplus_num=0;
                            }else{
                                if($oacartmodel->j_num==0){
                                    $surplus_num=0;
                                }else{
                                    $surplus_num=bcsub($oacartmodel->surplus_num,$cartmodel->j_real_num);
                                    if($surplus_num<=0){
                                        $surplus_num=0;
                                    }
                                }
                            }
                            $oacartmodel->surplus_num=$surplus_num;
                            if(!$oacartmodel->save()){
                                //var_dump($oacartmodel->getErrors());
                            }
                        }
                    }
                }
            }
            if(!empty($post['DtoaStorage']['s_id'])){
                $model->s_id=$post['DtoaStorage']['s_id'];
            }
            if(!empty($post['DtoaStorage']['h_id'])){
                $model->h_id=$post['DtoaStorage']['h_id'];
            }
            if(!empty($post['DtoaStorage']['cid'])){
                $model->cid=$post['DtoaStorage']['cid'];
            }
            $model->k_status=$post['DtoaStorage']['k_status'];
            $model->arrival_date=$post['DtoaStorage']['arrival_date'];
            $model->k_info=$post['DtoaStorage']['k_info'];
            $model->next_admin_id=$post['DtoaStorage']['next_admin_id'];
            $total_price=DtoaStorageCart::find()->select(['total_price'=>'SUM(one_price)'])->andWhere(['k_id'=>$model['k_id']])->asArray()->one()['total_price'];
            $model->total_price=empty($total_price)?0:$total_price;
            if(!$model->save()){
                //var_dump($model->getErrors());
            }else{
                return $this->redirect(['update?id='.$model['k_id']]);
            }
        }
        $storagecart=DtoaStorageCart::find()->select(['dtoa_storage_cart.*','m.c_no','m.c_name','m.size','m.quality','m.num'])->andWhere(['k_id'=>$model->k_id])->join('INNER JOIN', ['m' => 'dtoa_material'], 'm.c_id = dtoa_storage_cart.c_id')->orderBy('sc_id')->asArray()->all();
        $approval=DtoaApproval::find()->andWhere(['g_id' => $model['g_id']])->andWhere(['table_index' => 3])
            ->andWhere(['target_id' => $model['k_id']])->asArray()->all();
        return $this->render('update', [
            'model' => $model,
            'storagecart' => $storagecart,
            'approval' => $approval,
        ]);
    }

    public function actionDelete()
    {
        // 接收参数判断
        if (!$model = $this->findOne(Yii::$app->request->post())) {
            return $this->returnJson();
        }
        //删除storage_cart每个入库材料 恢复cart 每个材料未入库数量surplus_num 材料入库状态c_status
        $k_source=$model->k_source;
        $s_id=$model->s_id;
        if($model->k_source=='直接入库'){

        }else{
            $storage_cart=DtoaStorageCart::find()->select(['sc_id'])->andWhere(['k_id'=>$model->k_id])->asArray()->all();
            if(!empty($storage_cart)){
                foreach ($storage_cart as $sc) {
                    $storage_cart_model = DtoaStorageCart::findOne($sc['sc_id']);
                    $c_model = DtoaCart::findOne($storage_cart_model->jc_id);
                    $c_model->surplus_num=$c_model->j_num;
                    $c_model->c_status=0;
                    $c_model->save();
                    $storage_cart_model->delete();
                }
            }
        }
        // 删除数据失败
        if (!$model->delete()) {
            return $this->error(1004, Helper::arrayToString($model->getErrors()));
        }else{
            if($k_source=='计划入库'){
                $plan=DtoaPlan::find()->select(['j_id'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['s_id'=>$s_id])->andWhere(['>=','j_status',2])->asArray()->all();
//检查计划 是否完成入库
                if(!empty($plan)){
                    foreach ($plan as $p) {
                        $count = DtoaCart::find()->andWhere(['j_id'=>$p['j_id']])->andWhere(['c_status'=>0])->count();
                        $plan_model = DtoaPlan::findOne($p['j_id']);
                        if($count==0){  //都已入库
                            $plan_model->j_status=3;
                        }else{
                            $plan_model->j_status=2;
                        }
                        $plan_model->save();
                    }
                }
            }
            if($k_source=='合同入库'){
                $agreement=DtoaAgreement::find()->select(['h_id'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['s_id'=>$s_id])->andWhere(['>=','h_status', 2])->asArray()->all();
//检查合同 是否完成入库
                if(!empty($agreement)){
                    foreach ($agreement as $a) {
                        $count = DtoaCart::find()->andWhere(['h_id'=>$a['h_id']])->andWhere(['c_status'=>0])->count();
                        $agreement_model = DtoaAgreement::findOne($a['h_id']);
                        if($count==0){  //都已入库
                            $agreement_model->h_status=3;
                        }else{
                            $agreement_model->h_status=2;
                        }
                        $agreement_model->save();
                    }
                }
            }
        }
        return $this->success($model);
    }

    public function actionView()
    {
        $has_access=$this->has_more_access(7,Yii::$app->session['g_id']);
        $has_access2=$this->has_more_access(8,Yii::$app->session['g_id']);
        $id=Yii::$app->request->get('id');
        $model = $this->findModel($id);
        if($has_access || $has_access2){
            $access = 1;
        }else{
            $access = $this->get_access(5,Yii::$app->session['g_id'],1,$model->k_source);
        }
        $storagecart=DtoaStorageCart::find()->select(['dtoa_storage_cart.*','m.c_no','m.c_name','m.size','m.quality','m.num'])
            ->andWhere(['k_id'=>$model->k_id])
            ->join('INNER JOIN', ['m' => 'dtoa_material'], 'm.c_id = dtoa_storage_cart.c_id')->orderBy('sc_id')->asArray()->all();
        $approval=DtoaApproval::find()->andWhere(['g_id' => $model['g_id']])->andWhere(['table_index' => 3])
            ->andWhere(['target_id' => $model['k_id']])->asArray()->all();
        return $this->render('view', [
            'model' => $model,
            'access' => $access,
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
        }elseif ($item_id==11 || $item_id==12){
            $approval_item_id=12;
        }elseif ($item_id==7 || $item_id==8){
            $approval_item_id=8;
        }
        if(!empty($approval_item_id)) {
            $uid_arr = DtoaApprovalGroup::find()->select(['uid_arr'])->andWhere(['g_id' => $g_id])->andWhere(['item_id' => $approval_item_id])->asArray()->one();
            if (empty($uid_arr)) {
                throw new ForbiddenHttpException('当前工程[' . DtoaProject::PROJECT_APPROVAL_ITEMS[$approval_item_id] . ']没有分配员工');
            } else {
                $uid_arr = json_decode($uid_arr['uid_arr'], true);
                if (empty($uid_arr[1])) {
                    throw new ForbiddenHttpException('当前工程[' . DtoaProject::PROJECT_APPROVAL_ITEMS[$approval_item_id] . ']没有分配员工');
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
