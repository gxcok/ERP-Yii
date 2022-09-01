<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "dtoa_project".
 *
 * @property int $g_id 工程ID
 * @property string $g_no 工程编号
 * @property string $g_name 工程名
 * @property string $creator 创建者
 * @property int $g_status 工程状态 1正常 2只读 0禁用
 * @property string $created_at 创建时间
 * @property string $updated_at 更新时间
 */
class DtoaProject extends \yii\db\ActiveRecord
{
    //1正常 2只读 3禁用
    const PROJECT_STATUS=[
        0 => '筹备',
        1 => '正常',
        2 => '只读',
        4 => '禁用',
    ];

    const PROJECT_STATUS_COLOR=[
        0 => 'label-primary',
        1 => 'label-success',
        2 => 'label-warning',
        4 => 'label-danger',
    ];

    const PROJECT_ITEMS = [
        11  => '计划意向单',
        12  => '意向单审批',
        1  => '材料计划',
        2  => '合同列表',
        3  => '计划审批',
        4  => '合同审批',
        5  => '入库操作',
        6  => '材料计划入库审批',
        13  => '材料合同入库审批',
        14  => '材料直接入库审批',
        9  => '商砼入库审批',
        10  => '租赁入库审批',
        7  => '入库结算',
        8  => '结算审批',
    ];

    const PROJECT_ITEMS_NAME = [
        11  => 'preplan',
        12  => 'approval-preplan',
        13  => 'approval-storage-material',
        14  => 'approval-storage-material',
        1  => 'plan',
        2  => 'agreement',
        3  => 'approval-plan',
        4  => 'approval-agreement',
        5  => 'storage',
        6  => 'approval-storage-material',
        9  => 'approval-storage-ticket',
        10  => 'approval-storage-lease',
        7  => 'pay',
        8  => 'approval-pay',
    ];

    const SYSTEM_ITEMS = [
        1  => '工程管理',
        2  => '资料库管理',
    ];

    const SYSTEM_ITEMS_NAME = [
        1  => 'project',
        2  => 'dbmange',
    ];

    //审批权限组
    const PROJECT_APPROVAL_ITEMS=[
        12  => '意向单审批',
        3  => '计划审批',
        4  => '合同审批',
        6  => '材料计划入库审批',
        13  => '材料合同入库审批',
        14  => '材料直接入库审批',
        8  => '结算审批',
        9  => '商砼入库审批',
        10  => '租赁入库审批',
    ];

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'dtoa_project';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['g_no', 'g_name', 'creator', 'creator_id'], 'required'],
            [['g_status', 'creator_id'], 'integer'],
            [['created_at', 'updated_at'], 'safe'],
            [['g_no'], 'string', 'max' => 20],
            [['g_name', 'build_unit', 'build_master', 'build_no', 'build_address', 'g_info', 'uid_arr'], 'string', 'max' => 255],
            [['build_area', 'creator'], 'string', 'max' => 50],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'g_id' => '工程ID',
            'g_no' => '工程编号',
            'g_name' => '工程名',
            'build_unit' => '建设单位',
            'build_master' => '项目负责人',
            'build_no' => '施工许可证编号',
            'build_address' => '建设地点',
            'build_area' => '建筑面积',
            'creator' => '创建者',
            'g_status' => '工程状态',
            'g_info' => '工程备注',
            'uid_arr' => '工程用户',
            'created_at' => '创建时间',
            'updated_at' => '更新时间',
        ];
    }

    public static function getno()
    {
        $gno=DtoaProject::find()->select(['g_no'])->orderBy('g_id desc')->asArray()->one();
        if(empty($gno)){
            return '001';
        }else{
            return sprintf("%03d", (int)($gno['g_no'])+1);
        }
    }
}
