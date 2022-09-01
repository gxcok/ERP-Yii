<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "dtoa_plan".
 *
 * @property int $j_id 计划ID
 * @property int $g_id 工程ID
 * @property int $s_id 供应商ID
 * @property string $j_no 材料计划编号
 * @property string $j_name 材料计划名
 * @property int $j_status 材料计划状态 0未审批
 * @property string $total_price 总金额
 * @property string $j_info 材料计划备注
 * @property int $creator_id 创建者ID
 * @property string $creator 创建者
 * @property string $created_at 创建时间
 * @property string $updated_at 更新时间
 */
class DtoaPlan extends \yii\db\ActiveRecord
{
    const PLAN_STATUS=[
        0 => '正在筹备',
        1 => '等待审批',
        2 => '审批通过',
        3 => '完成入库',
    ];

    const PLAN_STATUS_COLOR=[
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
        return 'dtoa_plan';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['g_id', 's_id', 'j_no', 'j_name', 'next_admin_id','creator', 'created_at', 'creator_id'], 'required'],
            [['g_id', 's_id', 'j_status', 'creator_id','next_admin_id'], 'integer'],
            [['total_price'], 'number'],
            [['created_at', 'updated_at','approval_time','need_date'], 'safe'],
            [['j_no'], 'string', 'max' => 20],
            [['j_name', 'j_info'], 'string', 'max' => 255],
            [['creator'], 'string', 'max' => 50],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'j_id' => '计划ID',
            'g_id' => '工程',
            's_id' => '供应商',
            'j_no' => '计划编号',
            'j_name' => '计划名',
            'j_status' => '计划状态',
            'next_admin_id' => '审批人',
            'total_price' => '总金额',
            'need_date' => '需用日期',
            'approval_time' => '审批时间',
            'j_info' => '计划备注',
            'creator_id' => '创建者ID',
            'creator' => '创建者',
            'created_at' => '创建时间',
            'updated_at' => '更新时间',
        ];
    }

    public static function getno()
    {
        $no=DtoaPlan::find()->select(['j_no'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->orderBy('j_id desc')->asArray()->one();
        if(empty($no)){
            return '001';
        }else{
            return sprintf("%03d", (int)($no['j_no'])+1);
        }
    }
}
