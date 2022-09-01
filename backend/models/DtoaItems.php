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
class DtoaItems extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%dtoa_items}}';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['g_id', 'uid'], 'required'],
            [['g_id', 'uid'], 'integer'],
            [['item_arr'], 'string', 'max' => 255],
            [['uid', 'item_arr'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'i_id' => 'I ID',
            'g_id' => 'G ID',
            'uid' => 'U ID',
            'item_arr' => 'Item Arr',
        ];
    }
}
