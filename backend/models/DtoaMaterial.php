<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "dtoa_material".
 *
 * @property int $c_id 材料ID
 * @property string $c_no 材料编号
 * @property string $c_name 材料名
 * @property string $size 规格型号
 * @property string $price 单价
 * @property string $num 计量单位
 * @property string $c_info 材料备注
 * @property string $creator 创建者
 * @property string $created_at 创建时间
 * @property string $updated_at 更新时间
 */
class DtoaMaterial extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'dtoa_material';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['c_no', 'c_name','cid','cate_name','cate_no','num', 'creator', 'creator_id'], 'required'],
            [['c_no','cate_no'], 'number'],
            [['cid','creator_id'], 'integer'],
            [['created_at', 'updated_at'], 'safe'],
            [['c_name','quality', 'size', 'c_info'], 'string', 'max' => 255],
            [['num'], 'string', 'max' => 100],
            [['creator'], 'string', 'max' => 50],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'c_id' => '材料ID',
            'c_no' => '材料编号',
            'c_name' => '材料名(*)',
            'cate_name' => '材料分类',
            'cate_no' => '分类编码',
            'num' => '计量单位(*)',
            'size' => '规格型号',
            'quality'=> '材质',
            'c_info' => '材料备注',
            'creator' => '创建者',
            'created_at' => '创建时间',
        ];
    }

    public static function getno($cid,$cate_no)
    {
        $cno=DtoaMaterial::find()->select(['c_no'])->andWhere(['cid'=>$cid])->orderBy('c_id desc')->asArray()->one();
        if(empty($cno)){    //该分类还没有材料
            return $cate_no.'001';
        }else{
            $cno=(int)($cno['c_no'])+1;
            return $cno;
        }
    }
}
