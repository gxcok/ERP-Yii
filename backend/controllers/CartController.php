<?php

namespace backend\controllers;

use backend\models\DtoaCart;
use backend\models\DtoaStorage;
use backend\models\DtoaStorageCart;
use backend\models\DtoaPlan;
use backend\models\DtoaAgreement;
use jinxing\admin\helpers\Helper;
use Yii;
use yii\web\NotFoundHttpException;

/**
 * Class ProjectController 工程管理 执行操作控制器
 * @package backend\controllers
 */
class CartController extends Controller
{
    protected $pk = 'jc_id';

    protected $sort = 'jc_id';

    /**
     * @var string 定义使用的model
     */
    public $modelClass = 'backend\models\DtoaCart';

    public function actionUpdate()
    {
        bcscale(3);
        $post=Yii::$app->request->post();
        if(empty($post['storagecart'])){//修改计划或合同材料单项
            $cart_model = $this->findModel($post['jc_id']);
            $old_one_price=$cart_model->one_price;
            $cart_model->j_num=$post['j_num'];
            $cart_model->surplus_num=$post['j_num'];
            $cart_model->j_price=$post['j_price'];
            $one_price = bcmul($cart_model->j_num,$cart_model->j_price);
            if(!empty($post['lease_time'])){
                $cart_model->lease_time=$post['lease_time'];
                $cart_model->lease_time_unit=$post['lease_time_unit'];
                $one_price = bcmul($one_price,$cart_model->lease_time);
            }
            $cart_model->one_price=$one_price;
            $cart_model->jc_info=$post['jc_info'];
            if (!$cart_model->save()) {
                return $this->error(1004, Helper::arrayToString($cart_model->getErrors()));
            }else{
                if($one_price!=floatval($old_one_price)){
                    if(!empty($post['j_id'])){  //获取plan total_price
                        $total_price=DtoaCart::find()->select(['total_price'=>'SUM(one_price)'])->andWhere(['j_id'=>$post['j_id']])->asArray()->one()['total_price'];
                        $model=DtoaPlan::findOne($post['j_id']);
                    }
                    if(!empty($post['h_id'])){  //获取agreement total_price
                        $total_price=DtoaCart::find()->select(['total_price'=>'SUM(one_price)'])->andWhere(['h_id'=>$post['j_id']])->asArray()->one()['total_price'];
                        $model=DtoaAgreement::findOne($post['h_id']);
                    }
                    $total_price = ($total_price<0)?0:$total_price;
                    $model->total_price = $total_price;
                    $model->save();
                }
                return $this->success($cart_model);
            }
        }
    }

    public function actionDelete()
    {
        bcscale(3);
        $post=Yii::$app->request->post();
        if(empty($post['storagecart'])){
            $cart_model=$this->findModel($post['jc_id']);
            $one_price=$cart_model->one_price;
            if (!$cart_model->delete()) {
                return $this->error(1004, Helper::arrayToString($cart_model->getErrors()));
            }else{
                if(!empty($post['j_id'])){  //更新plan total_price
                    $model = DtoaPlan::findOne($post['j_id']);
                }
                if(!empty($post['h_id'])){  //更新plan total_price
                    $model = DtoaAgreement::findOne($post['h_id']);
                }
                $total_price = bcsub($model->total_price,$one_price);
                $total_price = ($total_price<0)?0:$total_price;
                $model->total_price = $total_price;
                if($model->save()){
                    return $this->success($cart_model);
                }else{
                    return $this->error(1004, Helper::arrayToString($model->getErrors()));
                }
            }
        }else{
            $model = DtoaStorageCart::findOne($post['sc_id']);
            $s_model = DtoaStorage::findOne($model->k_id);
            $one_price = bcmul($model->j_real_num,$model->j_real_price);
            if(!empty($model->real_time)){
                $one_price = bcmul($one_price,$model->real_time);
            }
            $total_price = bcsub($s_model->total_price,$one_price);
            $total_price = ($total_price<0)?0:$total_price;
            $s_model->total_price = $total_price;
            $s_model->save();
            $jc_id=$model->jc_id;
            $model->delete();
            if(!empty($jc_id)){
                $c_model = DtoaCart::findOne($jc_id);
                if($c_model->j_num>0){  //限量时计算剩余量
                    $used_num=DtoaStorageCart::find()->select(['used_num'=>'SUM(j_real_num)'])->andWhere(['jc_id'=>$jc_id])->asArray()->one();
                    if(!empty($used_num['used_num'])){
                        $c_model->surplus_num=bcsub($c_model->j_num,$used_num['used_num']);
                        $c_model->surplus_num=($c_model->surplus_num<=0)?0:$c_model->surplus_num;
                    }else{
                        $c_model->surplus_num=$c_model->j_num;
                    }
                }
                if($c_model->lease_time>0){  //限量时计算剩余量
                    $used_time=DtoaStorageCart::find()->select(['used_time'=>'SUM(real_time)'])->andWhere(['jc_id'=>$jc_id])->asArray()->one();
                    if(!empty($used_time['used_time'])){
                        $c_model->surplus_time=bcsub($c_model->lease_time,$used_time['used_time']);
                        $c_model->surplus_time=($c_model->surplus_time<=0)?0:$c_model->surplus_time;
                    }else{
                        $c_model->surplus_time=$c_model->lease_time;
                    }
                }
                $c_model->c_status=0;
                $c_model->save();
            }
            return $this->success($c_model);
        }

    }

    protected function findModel($id)
    {
        if (($model = DtoaCart::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('请求页面不存在.');
    }
}