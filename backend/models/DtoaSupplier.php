<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "dtoa_supplier".
 *
 * @property int $s_id 供应商ID
 * @property string $s_name 供应商名
 * @property string $s_tel 供应商电话
 * @property string $s_info 供应商备注
 */
class DtoaSupplier extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'dtoa_supplier';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['s_name'], 'required'],
            [['s_name', 's_info'], 'string', 'max' => 255],
            [['s_tel', 's_contact'], 'string', 'max' => 50],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            's_id' => '供应商ID',
            's_name' => '供应商名',
            's_contact' => '供应商联系人',
            's_tel' => '供应商电话',
            's_info' => '供应商备注',
        ];
    }
}
