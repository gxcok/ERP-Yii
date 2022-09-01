<?php

namespace backend\controllers;

use backend\models\DtoaApproval;
use backend\models\DtoaApprovalGroup;
use backend\models\DtoaCart;
use backend\models\DtoaAgreement;
use backend\models\DtoaItems;
use backend\models\DtoaPlan;
use backend\models\DtoaProject;
use backend\models\DtoaSupplier;
use jinxing\admin\helpers\Helper;
use jinxing\admin\models\Admin;
use jinxing\admin\models\AdminUser;
use Yii;
use yii\helpers\ArrayHelper;
use yii\web\ForbiddenHttpException;
use yii\web\NotFoundHttpException;

/**
 * Class AgreementController 合同拟定 执行操作控制器
 * @package backend\controllers
 */
class AgreementController extends Controller
{
    protected $pk = 'h_id';

    protected $sort = 'h_id';

    /**
     * @var string 定义使用的model
     */
    public $modelClass = 'backend\models\DtoaAgreement';

    /**
     * 处理查询条件
     *
     * @return array
     */
    public function where()
    {
        return [
            // 其他查询字段信息
            [['h_name'], 'like'],
            [['h_status'], '='],
            [['h_type'], '='],
            [['s_id'], '='],
            [['g_id'], '='],
        ];
    }

    public function actionIndex()
    {
        $access = $this->get_access(2,Yii::$app->session['g_id']);
        return $this->render('index',[
            'access' => $access,
        ]);
    }

    public function actionCreate()
    {
        $access = $this->get_access(2,Yii::$app->session['g_id']);
        if($access!=1){
            throw new ForbiddenHttpException('您没有执行此操作的权限');
        }
        $model = new $this->modelClass();
        $post=Yii::$app->request->post();
        if(!empty($post)){
            if ($model->load(Yii::$app->request->post()) && $model->save()) {
                if($model->h_type==2){
                    return $this->redirect(['/agreement/leaseupdate?id='.$model->h_id]);
                }else{
                    return $this->redirect(['/agreement/update?id='.$model->h_id]);
                }
            }
        }
        return $this->render('create', [
            'model' => $model,
            'access' => $access,
        ]);
    }

    public function actionUpdate()
    {
        bcscale(3);
        $access = $this->get_access(2,Yii::$app->session['g_id']);
        if($access!=1){
            throw new ForbiddenHttpException('您没有执行此操作的权限');
        }
        $id=Yii::$app->request->get('id');
        $model = $this->findModel($id);
        $post=Yii::$app->request->post();
        if($model->h_status>0){
            return $this->redirect(['view', 'id' => $model->h_id]);
        }
        if(!empty($post)){
            $add_price=0;
            if(!empty($post['DtoaCart'])){
                $n=count($post['DtoaCart']['c_id']);
                for ($i = 0; $i < $n; $i++) {
                    $cartmodel = new DtoaCart();
                    $cartmodel->h_id=$model->h_id;
                    $cartmodel->c_id=$post['DtoaCart']['c_id'][$i];
                    $cartmodel->j_num=empty($post['DtoaCart']['j_num'][$i])?0:$post['DtoaCart']['j_num'][$i];
                    $cartmodel->surplus_num=empty($post['DtoaCart']['j_num'][$i])?0:$post['DtoaCart']['j_num'][$i];
                    $cartmodel->j_price=$post['DtoaCart']['j_price'][$i];
                    $cartmodel->one_price=bcmul($cartmodel->j_num,$cartmodel->j_price);
                    $cartmodel->jc_info=$post['DtoaCart']['jc_info'][$i];
                    $cartmodel->c_status=0;
                    $cartmodel->creator_id=Yii::$app->user->identity->id;
                    $cartmodel->creator=Yii::$app->user->identity->name;
                    $cartmodel->created_at=date('Y-m-d H:i:s',time());
                    if(!$cartmodel->save()){
                        var_dump($cartmodel->getErrors());
                    }
                }
            }
            $model->h_name=$post['DtoaAgreement']['h_name'];
            $model->h_status=$post['DtoaAgreement']['h_status'];
            $model->h_info=$post['DtoaAgreement']['h_info'];
            $model->need_date=$post['DtoaAgreement']['need_date'];
            $total_price=DtoaCart::find()->select(['total_price'=>'SUM(one_price)'])->andWhere(['h_id'=>$model->h_id])->asArray()->one()['total_price'];
            $model->total_price=empty($total_price)?0:$total_price;
            if(!$model->save()){
                var_dump($model->getErrors());
            }else{
                return $this->redirect(['index']);
            }
        }
        $agreementcart=DtoaCart::find()->select(['dtoa_cart.*','m.c_no','m.c_name','m.size','m.quality','m.num'])->andWhere(['h_id'=>$model->h_id])
            ->join('INNER JOIN', ['m' => 'dtoa_material'], 'm.c_id = dtoa_cart.c_id')->orderBy('jc_id')->asArray()->all();
        $approval=DtoaApproval::find()->andWhere(['g_id' => $model['g_id']])->andWhere(['table_index' => 2])
            ->andWhere(['target_id' => $model['h_id']])->asArray()->all();
        return $this->render('update', [
            'model' => $model,
            'agreementcart' => $agreementcart,
            'approval' => $approval,
            'access' => $access,
        ]);
    }

    public function actionLeaseupdate()
    {
        bcscale(3);
        $access = $this->get_access(2,Yii::$app->session['g_id']);
        if($access!=1){
            throw new ForbiddenHttpException('您没有执行此操作的权限');
        }
        $id=Yii::$app->request->get('id');
        $model = $this->findModel($id);
        $post=Yii::$app->request->post();
        if($model->h_status>0){
            return $this->redirect(['view', 'id' => $model->h_id]);
        }
        if(!empty($post)){
            $add_price=0;
            if(!empty($post['DtoaCart'])){
                $n=count($post['DtoaCart']['c_id']);
                for ($i = 0; $i < $n; $i++) {
                    $cartmodel = new DtoaCart();
                    $cartmodel->h_id=$model->h_id;
                    $cartmodel->c_id=$post['DtoaCart']['c_id'][$i];
                    $cartmodel->j_num=empty($post['DtoaCart']['j_num'][$i])?0:$post['DtoaCart']['j_num'][$i];
                    $cartmodel->surplus_num=$cartmodel->j_num;
                    $cartmodel->j_price=$post['DtoaCart']['j_price'][$i];
                    $cartmodel->lease_time=empty($post['DtoaCart']['lease_time'][$i])?0:$post['DtoaCart']['lease_time'][$i];
                    $cartmodel->lease_time_unit=$post['DtoaCart']['lease_time_unit'][$i];
                    $cartmodel->surplus_time=$cartmodel->lease_time;
                    $cartmodel->one_price=bcmul($cartmodel->j_num,$cartmodel->j_price);
                    if(!empty($cartmodel->lease_time)){
                        $cartmodel->one_price=bcmul($cartmodel->one_price,$cartmodel->lease_time);
                    }
                    $cartmodel->jc_info=$post['DtoaCart']['jc_info'][$i];
                    $cartmodel->c_status=0;
                    $cartmodel->creator_id=Yii::$app->user->identity->id;
                    $cartmodel->creator=Yii::$app->user->identity->name;
                    $cartmodel->created_at=date('Y-m-d H:i:s',time());
                    if(!$cartmodel->save()){
                        var_dump($cartmodel->getErrors());
                    }
                }
            }
            $model->h_name=$post['DtoaAgreement']['h_name'];
            $model->h_status=$post['DtoaAgreement']['h_status'];
            $model->h_info=$post['DtoaAgreement']['h_info'];
            $model->need_date=$post['DtoaAgreement']['need_date'];
            $total_price=DtoaCart::find()->select(['total_price'=>'SUM(one_price)'])->andWhere(['h_id'=>$model->h_id])->asArray()->one()['total_price'];
            $model->total_price=empty($total_price)?0:$total_price;
            if(!$model->save()){
                var_dump($model->getErrors());
            }else{
                return $this->redirect(['index']);
            }
        }
        $agreementcart=DtoaCart::find()->select(['dtoa_cart.*','m.c_no','m.c_name','m.size','m.quality','m.num'])->andWhere(['h_id'=>$model->h_id])
            ->join('INNER JOIN', ['m' => 'dtoa_material'], 'm.c_id = dtoa_cart.c_id')->orderBy('jc_id')->asArray()->all();
        $approval=DtoaApproval::find()->andWhere(['g_id' => $model['g_id']])->andWhere(['table_index' => 2])
            ->andWhere(['target_id' => $model['h_id']])->asArray()->all();
        return $this->render('leaseupdate', [
            'model' => $model,
            'agreementcart' => $agreementcart,
            'approval' => $approval,
            'access' => $access,
        ]);
    }

    public function actionView()
    {
        $access = $this->get_access(2,Yii::$app->session['g_id']);

        $id=Yii::$app->request->get('id');
        $model = $this->findModel($id);

        $agreementcart=DtoaCart::find()->select(['dtoa_cart.*','m.c_no','m.c_name','m.size','m.quality','m.num'])->andWhere(['h_id'=>$model->h_id])
            ->join('INNER JOIN', ['m' => 'dtoa_material'], 'm.c_id = dtoa_cart.c_id')->orderBy('jc_id')->asArray()->all();
        $approval=DtoaApproval::find()->andWhere(['g_id' => $model['g_id']])->andWhere(['table_index' => 2])
            ->andWhere(['target_id' => $model['h_id']])->asArray()->all();
        return $this->render('view', [
            'model' => $model,
            'agreementcart' => $agreementcart,
            'approval' => $approval,
            'access' => $access,
        ]);
    }

    public function actionDelete()
    {
        // 接收参数判断
        if (!$model = $this->findOne(Yii::$app->request->post())) {
            return $this->returnJson();
        }
        $id=Yii::$app->request->post('h_id');
        // 删除数据失败
        if (!$model->delete()) {
            return $this->error(1004, Helper::arrayToString($model->getErrors()));
        }else{  //删除dtoa_cart
            DtoaCart::deleteAll(['h_id' => $id]);
        }
        return $this->success($model);
    }

    public function actionSelect()
    {
        return $this->render('select');
    }

    public function actionStorageselect()
    {
        //$this->layout= false;
        return $this->render('storageselect');
    }

    public function getExportHandleParams()
    {
        $array['g_id'] = function ($value) {
            return DtoaProject::find()->select(['g_name'])->andWhere(['g_id'=>$value])->asArray()->one()['g_name'];
        };

        $array['s_id'] = function ($value) {
            return DtoaSupplier::find()->select(['s_name'])->andWhere(['s_id'=>$value])->asArray()->one()['s_name'];
        };

        $array['h_type'] = function ($value) {
            return DtoaAgreement::AGREEMENT_TYPE[$value];
        };

        $array['h_status'] = function ($value) {
            return DtoaAgreement::AGREEMENT_STATUS[$value];
        };

        $array['next_admin_id'] = function ($value) {
            return AdminUser::find()->select(['name'])->andWhere(['id'=>$value])->asArray()->one()['name'];
        };

        return $array;
    }

    protected function findModel($id)
    {
        if (($model = DtoaAgreement::findOne($id)) !== null) {
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
