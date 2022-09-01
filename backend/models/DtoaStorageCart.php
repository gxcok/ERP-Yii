<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%dtoa_storage_cart}}".
 *
 * @property int $sc_id 采购ID
 * @property int $k_id 入库ID
 * @property int $j_id 计划ID
 * @property string $j_no 计划编号
 * @property int $h_id 合同ID
 * @property string $h_no 合同编号
 * @property int $c_id 材料ID
 * @property string $c_name 材料名
 * @property int $c_no 材料编码
 * @property int $j_num 材料采购数量
 * @property string $j_price 材料采购单价
 * @property int $j_real_num 材料实际采购数量
 * @property string $j_real_price 材料实际采购单价
 * @property string $jc_info 材料入库备注
 * @property string $created_at 创建时间
 */
class DtoaStorageCart extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%dtoa_storage_cart}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['k_id','jc_id', 'c_id','j_num', 'j_real_num', 'j_price','one_price', 'j_real_price','storage_ok', 'created_at'], 'required'],
            [['k_id', 'j_id', 'h_id','jc_id', 'c_id','storage_ok'], 'integer'],
            [['j_price', 'j_real_price','j_num', 'j_real_num'], 'number'],
            [['created_at'], 'safe'],
            [['j_no', 'h_no'], 'string', 'max' => 20],
            [['jc_info'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'sc_id' => 'ID',
            'k_id' => '入库ID',
            'j_id' => '计划ID',
            'j_no' => '计划编号',
            'h_id' => '合同ID',
            'h_no' => '合同编号',
            'jc_id' => '采购ID',
            'c_id' => '材料ID',
            'j_num' => '入库数量',
            'j_real_num' => '实际入库数量',
            'lease_time' => '租赁时间',
            'lease_time_unit' => '租赁时间单位',
            'real_time' => '实际入库租赁时间',
            'j_price' => '入库单价',
            'j_real_price' => '实际入库单价',
            'one_price' => '采购价格',
            'jc_info' => '入库备注',
            'created_at' => '入库时间',
        ];
    }
}
