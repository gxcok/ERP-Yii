<?php

namespace backend\controllers;

use backend\models\DtoaAgreement;
use backend\models\DtoaPlan;
use backend\models\DtoaStorage;
use jinxing\admin\helpers\Helper;
use Yii;

/**
 * Class SupplierController 供应商 执行操作控制器
 * @package backend\controllers
 */
class SupplierController extends Controller
{
    protected $pk = 's_id';

    protected $sort = 's_id';

    /**
     * @var string 定义使用的model
     */
    public $modelClass = 'backend\models\DtoaSupplier';

    /**
     * 处理查询条件
     *
     * @return array
     */
    public function where()
    {
        return [
            // 其他查询字段信息
            [['s_name'], 'like'],
            [['s_contact'], 'like'],
            [['s_tel'], 'like'],
        ];
    }

    public function actionStorageselect()
    {
        //$this->layout= false;
        return $this->render('storageselect');
    }

    public function actionDelete()
    {
        // 接收参数判断
        if (!$model = $this->findOne(Yii::$app->request->post())) {
            return $this->returnJson();
        }

        //如果供应商被使用
        $agreement=DtoaAgreement::find()->andWhere(['s_id'=>$model->s_id])->asArray()->one();
        $plan=DtoaPlan::find()->andWhere(['s_id'=>$model->s_id])->asArray()->one();
        $storage=DtoaStorage::find()->andWhere(['s_id'=>$model->s_id])->asArray()->one();
        if(!empty($agreement) || !empty($plan) || !empty($storage)){
            return $this->error(1004, '供应商材料已采购,不能删除！');
        }

        // 删除数据失败
        if (!$model->delete()) {
            return $this->error(1004, Helper::arrayToString($model->getErrors()));
        }

        return $this->success($model);
    }

    protected function findOne($data = [])
    {
        // 接收参数判断
        $data = $data ?: Yii::$app->request->post();
        if (!$data || empty($data[$this->pk])) {
            $this->setCode(201);
            return false;
        }

        // 通过传递过来的唯一主键值查询数据
        /* @var $model \yii\db\ActiveRecord */
        $model = $this->modelClass;
        if (!$model = $model::findOne($data[$this->pk])) {
            $this->setCode(220);
            return false;
        }

        return $model;
    }
}
