<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "dtoa_plan_cart".
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
class DtoaTicketCart extends \yii\db\ActiveRecord
{
    const USE_STYLE = [
        '用泵' => '用泵',
        '自卸' => '自卸',
        '地泵' => '地泵',
        '自备泵' => '自备泵',
    ];

    const HC_GRADE = [
        'C15' => 'C15',
        'C20' => 'C20',
        'C25' => 'C25',
        'C30' => 'C30',
        'C35' => 'C35',
        'C40' => 'C40',
        'C45' => 'C45',
        'C50' => 'C50',
        'C55' => 'C55',
        'C60' => 'C60',
        'C65' => 'C65',
        'C70' => 'C70',
        'C75' => 'C75',
        'C80' => 'C80',
    ];

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'dtoa_ticket_cart';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['k_id','c_id','j_num','surplus_num','use_style','use_date','hc_grade','ticket_num','use_place','j_price', 'created_at'], 'required'],
            [['c_id','ticket_num'], 'integer'],
            [['j_num', 'surplus_num'], 'number'],
            [['created_at','use_date'], 'safe'],
            [['jc_info'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'c_id' => '材料',
            'c_name' => '材料名',
            'j_num' => '采购数量',
            'surplus_num' => '剩余未入库数量',
            'j_price' => '采购单价',
            'use_style' => '浇筑方式',
            'use_date' => '浇筑日期',
            'hc_grade' => '强度等级',
            'ticket_num' => '小票张数',
            'use_place' => '施工部位',
            'jc_info' => '采购备注',
            'created_at' => '创建时间',
        ];
    }
}
