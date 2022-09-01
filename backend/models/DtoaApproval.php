<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "dtoa_approval".
 *
 * @property int $a_id 审批ID
 * @property int $g_id 工程ID
 * @property int $table_index 审批对象表:1-合同agreement 2-计划plan 3-入库storage 4-结算pay
 * @property int $user_id
 * @property string $approver 审批人
 * @property int $a_status 审批状态 1通过 0拒绝
 * @property string $a_info 审批备注
 * @property string $created_at 审批时间
 */
class DtoaApproval extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'dtoa_approval';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['g_id', 'table_index', 'approver_id', 'a_status', 'created_at','target_id'], 'required'],
            [['g_id', 'table_index', 'approver_id', 'a_status','target_id'], 'integer'],
            [['created_at','a_info'], 'safe'],
            [['approver'], 'string', 'max' => 100],
            [['a_info'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'a_id' => '审批ID',
            'g_id' => '工程ID',
            'table_index' => '审批对象',
            'approver_id' => '审批人ID',
            'approver' => '审批人',
            'a_status' => '审批状态',
            'a_info' => '审批备注',
            'created_at' => '审批时间',
        ];
    }
}
