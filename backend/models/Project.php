<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%dtoa_project}}".
 *
 * @property int $g_id 工程ID
 * @property string $g_no 工程编号
 * @property string $g_name 工程名
 * @property string $build_unit 建设单位
 * @property string $build_master 建设单位项目负责人
 * @property string $build_no 施工许可证编号
 * @property string $build_address 建设地点
 * @property string $build_area 建筑面积
 * @property int $creator_id 创建者ID
 * @property string $creator 创建者
 * @property int $g_status 工程状态 1正常 2只读 0禁用
 * @property string $g_info 工程备注
 * @property string $uid_arr 工程对应的用户ID
 * @property string $created_at 创建时间
 * @property string $updated_at 更新时间
 */
class Project extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%dtoa_project}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['g_no', 'g_name', 'creator_id', 'creator'], 'required'],
            [['creator_id', 'g_status'], 'integer'],
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
            'g_id' => 'G ID',
            'g_no' => 'G No',
            'g_name' => 'G Name',
            'build_unit' => 'Build Unit',
            'build_master' => 'Build Master',
            'build_no' => 'Build No',
            'build_address' => 'Build Address',
            'build_area' => 'Build Area',
            'creator_id' => 'Creator ID',
            'creator' => 'Creator',
            'g_status' => 'G Status',
            'g_info' => 'G Info',
            'uid_arr' => 'Uid Arr',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }
}
