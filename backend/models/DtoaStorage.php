<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "dtoa_storage".
 *
 * @property int $k_id 入库ID
 * @property string $k_no 入库单号
 * @property int $g_id 工程ID
 * @property int $s_id 供应商ID
 * @property int $j_id 计划ID
 * @property int $h_id 合同ID
 * @property string $k_data 入库对象ID数组 [jc_id]|[hc_id][c_id]
 * @property int $k_type 入库类型 1-计划入库 2-直接入库 3-商砼小票入库 4-租赁入库
 * @property string $k_info 入库备注
 * @property int $k_status 入库状态 0未审批
 * @property string $total_price 总金额
 * @property string $created_at 创建时间
 * @property string $updated_at 更新时间
 */
class DtoaStorage extends \yii\db\ActiveRecord
{
    const STORAGE_STATUS=[
        0 => '正在入库',
        1 => '等待审批',
        2 => '审批通过',
        3 => '已入结算',
        4 => '完成结算',
    ];

    const CHECKOUT_STATUS=[
        0 => '未出库',
        1 => '已出库',
    ];

    const CHECKOUT_STATUS_COLOR=[
        0 => 'label-info',
        1 => 'label-success',
    ];

    const STORAGE_STATUS_COLOR=[
        0 => 'label-primary',
        1 => 'label-warning',
        2 => 'label-success',
        3 => 'label-info',
        4 => 'label-default',
    ];

    const  STORAGE_TYPE = [
        1   => '材料入库',
        2   => '商砼小票入库',
        3   => '租赁入库',
    ];

    const STORAGE_SOURCE=[
        '计划入库' => '计划入库',
        '合同入库' => '合同入库',
        '直接入库' => '直接入库',
    ];

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'dtoa_storage';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['k_no', 'g_id', 's_id','h_id', 'k_type','cid', 'total_price','k_source', 'created_at','creator','creator_id','next_admin_id'], 'required'],
            [['g_id', 's_id', 'k_type', 'k_status', 'c_status','creator_id','next_admin_id','cid'], 'integer'],
            [['k_source'], 'string'],
            [['total_price'], 'number'],
            [['created_at', 'updated_at','creator','creator_id','next_admin_id','arrival_date','approval_time','checkout_time'], 'safe'],
            [['k_no'], 'string', 'max' => 20],
            [['k_info','c_info'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'k_id' => '入库ID',
            'k_no' => '入库单号',
            'g_id' => '工程',
            's_id' => '供应商',
            'h_id' => '合同',
            'k_type' => '入库类型',
            'k_source' => '入库来源',
            'cid' => '材料分类',
            'k_info' => '入库备注',
            'k_status' => '入库状态',
            'c_status' => '出库状态',
            'checkout_time' => '出库时间',
            'c_info' => '出库备注',
            'total_price' => '总金额',
            'next_admin_id' => '审批人',
            'approval_time' => '审批时间',
            'arrival_date' => '进场日期',
            'created_at' => '入库时间',
            'updated_at' => '更新时间',
            'creator' => '创建者',
        ];
    }

    public static function getno($k_type)
    {
        $no=DtoaStorage::find()->select(['k_no'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['k_type'=>$k_type])->orderBy('k_id desc')->asArray()->one();
        if(empty($no)){
            return '001';
        }else{
            return sprintf("%03d", (int)($no['k_no'])+1);
        }
    }
}
