<?php

namespace backend\controllers;

use backend\models\DtoaPreCart;
use backend\models\DtoaPrePlan;
use jinxing\admin\helpers\Helper;
use Yii;
use yii\web\NotFoundHttpException;

/**
 * Class ProjectController 工程管理 执行操作控制器
 * @package backend\controllers
 */
class PreCartController extends Controller
{
    protected $pk = 'jc_id';

    protected $sort = 'jc_id';

    /**
     * @var string 定义使用的model
     */
    public $modelClass = 'backend\models\DtoaPreCart';

    public function actionUpdate()
    {
        bcscale(3);
        $post=Yii::$app->request->post();
        $cart_model = $this->findModel($post['jc_id']);
        $old_cart_price = bcmul($cart_model->j_num,$cart_model->j_price);
        $cart_model->j_num=$post['j_num'];
        $cart_model->j_price=$post['j_price'];
        $cart_model->jc_info=$post['jc_info'];
        if (!$cart_model->save()) {
            return $this->error(1004, Helper::arrayToString($cart_model->getErrors()));
        }else{
            $cart_price = bcmul($cart_model->j_num,$cart_model->j_price);
            if(bccomp($old_cart_price,$cart_price)!=0){
                $diff_price=bcsub($cart_price,$old_cart_price);
                if(!empty($post['j_id'])){  //更新plan total_price
                    $model = DtoaPrePlan::findOne($post['j_id']);
                }
                $total_price = bcadd($model->total_price,$diff_price);
                $total_price = ($total_price<0)?0:$total_price;
                $model->total_price = $total_price;
                $model->save();
            }
            return $this->success($cart_model);
        }
    }

    public function actionDelete()
    {
        bcscale(3);
        $post=Yii::$app->request->post();
        $cart_model=$this->findModel($post['jc_id']);
        $cart_price = bcmul($cart_model->j_num,$cart_model->j_price);
        if (!$cart_model->delete()) {
            return $this->error(1004, Helper::arrayToString($cart_model->getErrors()));
        }else{
            if(!empty($post['j_id'])){  //更新plan total_price
                $model = DtoaPrePlan::findOne($post['j_id']);
            }
            $total_price = bcsub($model->total_price,$cart_price);
            $total_price = ($total_price<0)?0:$total_price;
            $model->total_price = $total_price;
            $model->save();
            return $this->success($cart_model);
        }

    }

    protected function findModel($id)
    {
        if (($model = DtoaPreCart::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('请求页面不存在.');
    }
}