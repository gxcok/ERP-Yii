<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "dtoa_cart".
 *
 * @property int $jc_id 采购ID
 * @property int $j_id 计划ID
 * @property int $c_id 材料ID
 * @property int $j_num 材料计划采购数量
 * @property string $jc_info 材料计划采购备注
 * @property int $c_status 材料采购计划入库状态 0-未入库 1-已入库
 * @property string $need_date 需用时间
 * @property string $created_at 创建时间
 * @property string $updated_at 更新时间
 */
class DtoaPreCart extends \yii\db\ActiveRecord
{

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'dtoa_precart';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['c_id','j_num','c_status','creator_id','creator','created_at'], 'required'],
            [['j_id', 'c_id', 'c_status','creator_id'], 'integer'],
            [['j_num','j_price'], 'number'],
            [['created_at', 'updated_at'], 'safe'],
            [['jc_info'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'jc_id' => '采购ID',
            'j_id' => '意向单ID',
            'c_id' => '材料ID',
            'j_num' => '采购数量',
            'j_price' => '采购单价',
            'jc_info' => '采购备注',
            'c_status' => '入库状态',
            'creator' => '创建者',
            'created_at' => '创建时间',
            'updated_at' => '更新时间',
        ];
    }
}
