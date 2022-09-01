<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "dtoa_category".
 *
 * @property int $cid 分类ID
 * @property int $pid 一级分类ID
 * @property int $sid 二级分类ID
 * @property int $gid 三级分类ID
 * @property string $cname 分类名
 */
class DtoaCategory extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'dtoa_category';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['pid'], 'integer'],
            [['pid','cname','cate_no','cate_type'], 'required'],
            [['cname'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'cid' => '分类ID',
            'pid' => '上级分类ID',
            'cate_no' => '分类编码',
            'cate_type' => '分类类型',
            'cname' => '分类名',
        ];
    }

    public static function getno($pid)
    {
        $cno=DtoaCategory::find()->select(['cate_no'])->andWhere(['pid'=>$pid])->orderBy('cid desc')->asArray()->one();
        if(empty($cno)){    //在此pid下新增分类
            $cate_no=DtoaCategory::find()->select(['cate_no'])->andWhere(['cid'=>$pid])->asArray()->one();
            $cate_no=$cate_no['cate_no'];
            $cno=$cate_no.'01';
        }else{
            $cno=(int)($cno['cate_no'])+1;
        }
        return $cno;
    }
}
