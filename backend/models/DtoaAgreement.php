<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "dtoa_agreement".
 *
 * @property int $h_id 合同ID
 * @property int $g_id 工程ID
 * @property int $s_id 供应商ID
 * @property int $h_type 合同类型 1-买卖合同 2-租赁合同
 * @property string $h_no 合同编号
 * @property string $h_name 合同名
 * @property int $h_status 合同状态 0未审批
 * @property string $h_info 合同备注
 * @property string $creator 创建者
 * @property string $created_at 创建时间
 * @property string $updated_at 更新时间
 */
class DtoaAgreement extends \yii\db\ActiveRecord
{
    const AGREEMENT_TYPE=[
        1 => '买卖合同',
        2 => '租赁合同',
    ];

    const AGREEMENT_STATUS=[
        0 => '正在筹备',
        1 => '等待审批',
        2 => '审批通过',
        3 => '完成入库',
    ];

    const AGREEMENT_STATUS_COLOR=[
        0 => 'label-primary',
        1 => 'label-warning',
        2 => 'label-success',
        3 => 'label-inverse',
    ];

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'dtoa_agreement';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['g_id', 's_id', 'h_no', 'h_name','h_type', 'next_admin_id', 'creator', 'created_at', 'creator_id', 'total_price'], 'required'],
            [['g_id', 's_id', 'next_admin_id', 'creator_id','h_type', 'h_status'], 'integer'],
            [['h_info'], 'string'],
            [['created_at', 'updated_at','approval_time','need_date'], 'safe'],
            [['h_no'], 'string', 'max' => 20],
            [['h_name'], 'string', 'max' => 255],
            [['creator'], 'string', 'max' => 50],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'h_id' => '合同ID',
            'g_id' => '工程',
            's_id' => '供应商',
            'h_no' => '合同编号',
            'h_name' => '合同名',
            'h_type' => '合同类型',
            'h_status' => '合同状态',
            'total_price' => '总金额',
            'next_admin_id' => '审批人',
            'need_date' => '生效日期',
            'approval_time' => '审批时间',
            'h_info' => '合同备注',
            'creator' => '创建者',
            'created_at' => '创建时间',
            'updated_at' => '更新时间',
        ];
    }

    public static function getno()
    {
        $no=DtoaAgreement::find()->select(['h_no'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->orderBy('h_id desc')->asArray()->one();
        if(empty($no)){
            return '001';
        }else{
            return sprintf("%03d", (int)($no['h_no'])+1);
        }
    }
}
