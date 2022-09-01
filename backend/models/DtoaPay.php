<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "dtoa_pay".
 *
 * @property int $p_id 结算ID
 * @property string $p_no 结算单编号
 * @property int $g_id 工程ID
 * @property int $s_id 供应商ID
 * @property string $p_data 结算对象：入库单ID数组 [k_id]
 * @property int $p_status 结算状态 0未审批
 * @property string $total_price 总金额
 * @property string $p_info 结算备注
 * @property string $created_at 创建时间
 * @property string $updated_at 更新时间
 */
class DtoaPay extends \yii\db\ActiveRecord
{
    const PAY_STATUS=[
        0 => '准备结算',
        1 => '等待审批',
        2 => '审批通过',
        3 => '完成结算'
    ];

    const PAY_STATUS_COLOR=[
        0 => 'label-primary',
        1 => 'label-warning',
        2 => 'label-success',
        3 => 'label-info',
    ];

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'dtoa_pay';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['p_no','created_at','g_id','s_id','p_status','creator','creator_id','next_admin_id'], 'required'],
            [['g_id', 's_id', 'p_status','creator_id','next_admin_id'], 'integer'],
            [['p_data'], 'string'],
            [['total_price'], 'number'],
            [['created_at', 'updated_at','approval_time'], 'safe'],
            [['p_no'], 'string', 'max' => 20],
            [['p_info'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'p_id' => '结算ID',
            'p_no' => '结算单号',
            'g_id' => '工程',
            's_id' => '供应商',
            'p_data' => '结算对象',
            'p_status' => '结算状态',
            'total_price' => '总金额(元)',
            'next_admin_id' => '审批人',
            'approval_time' => '审批时间',
            'p_info' => '结算备注',
            'creator' => '创建者',
            'created_at' => '创建时间',
            'updated_at' => '更新时间',
        ];
    }

    public static function getno()
    {
        $no=DtoaPay::find()->select(['p_no'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->orderBy('p_id desc')->asArray()->one();
        if(empty($no)){
            return '001';
        }else{
            return sprintf("%03d", (int)($no['p_no'])+1);
        }
    }
}
