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
class StorageTicketController extends Controller
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
            [['g_id'], '='],
            [['s_id'], '='],
            [['h_id'], '='],
            [['k_type'], '='],
        ];
    }

    public function actionIndex()
    {
        $access = $this->get_access(5,Yii::$app->session['g_id'],2);
        //商砼总金额核算
        /*$storage = DtoaStorage::find()->andWhere(['k_type'=>2])->andWhere(['k_source'=>'合同入库'])->asArray()->all();
        foreach ($storage as $st){
            $ticket = DtoaTicketCart::find()->andWhere(['k_id'=>$st['k_id']])->asArray()->one();
            if($st['total_price']<>bcmul($ticket['pour_num'],$ticket['j_price'],3)){
                var_dump($st['k_id'],$st['total_price'],bcmul($ticket['pour_num'],$ticket['j_price'],3));
            }
        }*/
        return $this->render('index',[
            'access' => $access,
        ]);
    }

    public function actionCreate()
    {
        bcscale(3);
        $access = $this->get_access(5,Yii::$app->session['g_id'],2);
        if($access!=1){
            throw new ForbiddenHttpException('您没有执行此操作的权限');
        }
        $model = new DtoaStorage();
        $post=Yii::$app->request->post();
        if(!empty($post)){
            $model->load($post);
            $model->total_price=bcmul($post['DtoaTicketCart']['pour_num'],$post['DtoaTicketCart']['j_price'],3);
            if ($model->save()) {
                $t_model = new DtoaTicketCart();
                $t_model->k_id=$model->k_id;
                $t_model->h_id=$model->h_id;
                $t_model->jc_id=$post['DtoaTicketCart']['jc_id'];
                $t_model->c_id=$post['DtoaTicketCart']['c_id'];
                $t_model->j_num=$post['DtoaTicketCart']['j_num'];
                $t_model->surplus_num=$post['DtoaTicketCart']['surplus_num'];
                $t_model->j_price=$post['DtoaTicketCart']['j_price'];
                $t_model->use_style=$post['DtoaTicketCart']['use_style'];
                $t_model->use_date=$post['DtoaTicketCart']['use_date'];
                $t_model->hc_grade=$post['DtoaTicketCart']['hc_grade'];
                $t_model->ticket_num=$post['DtoaTicketCart']['ticket_num'];
                $t_model->use_place=$post['DtoaTicketCart']['use_place'];
                $t_model->pour_num=$post['DtoaTicketCart']['pour_num'];
                $t_model->created_at=$post['DtoaTicketCart']['created_at'];
                $t_model->save();
                if($t_model->j_num>0){  //限制数量的更新DtoaCart
                    $cart_model=DtoaCart::findOne($t_model->jc_id);
                    $surplus_num=bcsub($t_model->surplus_num,$t_model->pour_num);
                    if($surplus_num<=0){
                        $surplus_num=0;
                    }
                    if($surplus_num==0){
                        $cart_model->c_status=1;
                    }else{
                        $cart_model->c_status=0;
                    }
                    $cart_model->surplus_num=$surplus_num;
                    if(!$cart_model->save()){
                        //var_dump($cart_model->getErrors());
                    }
                }
                return $this->redirect(['/storage-ticket/index']);
            }
        }
        return $this->render('create', [
            'model' => $model,
        ]);
    }

    public function actionUpdate()
    {
        $access = $this->get_access(5,Yii::$app->session['g_id'],2);
        if($access!=1){
            throw new ForbiddenHttpException('您没有执行此操作的权限');
        }
        bcscale(3);
        $id=Yii::$app->request->get('id');
        $model = $this->findModel($id);
        if($model->k_status>0){
            return $this->redirect(['view', 'id' => $model->k_id]);
        }
        $post=Yii::$app->request->post();
        if(!empty($post)){
            $model->arrival_date=$post['DtoaStorage']['arrival_date'];
            $model->s_id=$post['DtoaStorage']['s_id'];
            $model->h_id=$post['DtoaStorage']['h_id'];
            $model->k_status=$post['DtoaStorage']['k_status'];
            //$model->total_price=$post['DtoaStorage']['total_price'];
            $model->total_price=bcmul($post['DtoaTicketCart']['pour_num'],$post['DtoaTicketCart']['j_price'],3);
            $model->next_admin_id=$post['DtoaStorage']['next_admin_id'];
            $model->k_info=$post['DtoaStorage']['k_info'];
            $model->save();
            $ticket=DtoaTicketCart::find()->select(['jct_id'])->andWhere(['k_id'=>$model->k_id])->asArray()->one();
            if(empty($ticket)){
                $t_model= new DtoaTicketCart();
                $t_model->k_id=$model->k_id;
                $t_model->j_num=$post['DtoaTicketCart']['j_num'];
                $t_model->surplus_num=$post['DtoaTicketCart']['surplus_num'];
                $t_model->j_price=$post['DtoaTicketCart']['j_price'];
                $t_model->created_at=date('Y-m-d H:i:s',time());
            }else{
                $t_model=DtoaTicketCart::findOne($ticket['jct_id']);
            }
            $t_model->h_id=$model->h_id;
            $t_model->jc_id=$post['DtoaTicketCart']['jc_id'];
            $t_model->c_id=$post['DtoaTicketCart']['c_id'];
            $t_model->use_style=$post['DtoaTicketCart']['use_style'];
            $t_model->use_date=$post['DtoaTicketCart']['use_date'];
            $t_model->hc_grade=$post['DtoaTicketCart']['hc_grade'];
            $t_model->ticket_num=$post['DtoaTicketCart']['ticket_num'];
            $t_model->use_place=$post['DtoaTicketCart']['use_place'];
            $t_model->pour_num=$post['DtoaTicketCart']['pour_num'];
            $t_model->save();
            if($t_model->j_num>0){  //限制数量的更新DtoaCart
                $cart_model=DtoaCart::findOne($t_model->jc_id);
                $surplus_num=bcsub($t_model->surplus_num,$t_model->pour_num,3);
                if($surplus_num<=0){
                    $surplus_num=0;
                }
                if($surplus_num==0){
                    $cart_model->c_status=1;
                }else{
                    $cart_model->c_status=0;
                }
                $cart_model->surplus_num=$surplus_num;
                if(!$cart_model->save()){
                    //var_dump($cart_model->getErrors());
                }
            }
            return $this->redirect(['/storage-ticket/index']);
        }
        $ticket_model = DtoaTicketCart::find()->select(['dtoa_ticket_cart.*','m.c_no','m.c_name','m.size','m.quality','m.num'])->andWhere(['k_id'=>$model->k_id])->join('INNER JOIN', ['m' => 'dtoa_material'], 'm.c_id = dtoa_ticket_cart.c_id')->asArray()->one();
        $approval=DtoaApproval::find()->andWhere(['g_id' => $model['g_id']])->andWhere(['table_index' => 3])
            ->andWhere(['target_id' => $model['k_id']])->asArray()->all();
        return $this->render('update', [
            'model' => $model,
            'ticket_model' => $ticket_model,
            'approval' => $approval,
        ]);
    }

    public function actionDelete()
    {
        // 接收参数判断
        if (!$model = $this->findOne(Yii::$app->request->post())) {
            return $this->returnJson();
        }
        $k_id=$model->k_id;
        $h_id=$model->h_id;
        // 删除数据失败
        if (!$model->delete()) {
            return $this->error(1004, Helper::arrayToString($model->getErrors()));
        }else{  //删除成功后清除数据
            $ticket=DtoaTicketCart::find()->andWhere(['k_id'=>$k_id])->asArray()->one();
            if(!empty($ticket)){//填写了入库商砼小票
                $cart_model = DtoaCart::findOne($ticket['jc_id']);
                if($cart_model->j_num>0){//如果限制材料数量，更新DtoaCart，未入库数量=+加上入库的材料数量
                    $surplus_num=bcadd($cart_model->surplus_num,$ticket['pour_num']);
                    if($surplus_num > $cart_model->j_num){
                        $surplus_num=$cart_model->j_num;
                    }
                    $cart_model->surplus_num=floatval($surplus_num);
                    $cart_model->c_status=0;
                    $cart_model->save();
                }
                DtoaTicketCart::deleteAll(['k_id' => $k_id]);// 删除dtoa_ticket_cart
            }
        }
        return $this->success($model);
    }

    public function actionView()
    {
        $has_access=$this->has_more_access(7,Yii::$app->session['g_id']);
        $has_access2=$this->has_more_access(8,Yii::$app->session['g_id']);
        if($has_access || $has_access2){
            $access = 1;
        }else{
            $access = $this->get_access(5,Yii::$app->session['g_id'],2);
        }
        $id=Yii::$app->request->get('id');
        $model = $this->findModel($id);
        $ticket_model = DtoaTicketCart::find()->select(['dtoa_ticket_cart.*','m.c_no','m.c_name','m.size','m.quality','m.num'])->andWhere(['k_id'=>$model->k_id])->join('INNER JOIN', ['m' => 'dtoa_material'], 'm.c_id = dtoa_ticket_cart.c_id')->asArray()->one();
        $approval=DtoaApproval::find()->andWhere(['g_id' => $model['g_id']])->andWhere(['table_index' => 3])
            ->andWhere(['target_id' => $model['k_id']])->asArray()->all();
        return $this->render('view', [
            'model' => $model,
            'ticket_model' => $ticket_model,
            'access' => $access,
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
            //throw new ForbiddenHttpException('您没有执行此操作的权限');
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
