<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%dtoa_items}}".
 *
 * @property int $i_id
 * @property int $g_id 工程ID
 * @property int $u_id 用户ID
 * @property string $item_arr 权限数组
 */
class Authassignment extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%auth_assignment}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['item_name', 'user_id','created_at'], 'required'],
            [['user_id'], 'integer'],
            [['user_id', 'created_at'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'user_id' => '用户ID',
            'item_name' => '角色名',
            'created_at' => '创建时间',
        ];
    }
}
