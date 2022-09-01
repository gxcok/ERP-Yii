<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%dtoa_approval_group}}".
 *
 * @property int $q_id
 * @property int $g_id 工程ID
 * @property string $approval_arr 各审批组数组 [4=>[用户ID],9=>[用户ID],11=>[用户ID]]
 */
class DtoaApprovalGroup extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%dtoa_approval_group}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['g_id','item_id'], 'required'],
            [['g_id','item_id'], 'integer'],
            [['uid_arr'], 'string'],
            [['item_id', 'uid_arr'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'q_id' => 'Q ID',
            'g_id' => 'G ID',
            'uid_arr' => 'Approval Arr',
        ];
    }
}
