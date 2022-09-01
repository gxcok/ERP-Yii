<?php

use backend\models\DtoaItems;
use jinxing\admin\models\Admin;
use yii\helpers\Html;
use yii\web\ForbiddenHttpException;
use yii\widgets\DetailView;
use backend\models\DtoaProject;
/* @var $this yii\web\View */
/* @var $model backend\models\Project */

$this->title = $model->g_name;
if($access==0){
    $this->title = $this->title.'（只读权限）';
}
?>
<style>
    .viewtable th{width:200px;}
</style>
<div class="project-view viewtable">
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'g_id',
            'g_no',
            'g_name',
            'build_unit',
            'build_master',
            'build_no',
            'build_address',
            'build_area',
            'creator',
            [
                'label' => '工程状态',
                'attribute' => 'g_status',
                'format' => 'html',
                'value' => function ($model) {
                    return "<span class='label label-sm ".DtoaProject::PROJECT_STATUS_COLOR[$model['g_status']]."'>".DtoaProject::PROJECT_STATUS[$model['g_status']]."</span>";
                }
            ],
            [
                'label' => '工程授权',
                'format' => 'html',
                'value' => function ($model) {
                    return "<a class='btn btn-sm' href='/project-grant/view?id=".$model['g_id']."'>查看工程授权</a>";
                }
            ],
            'g_info',
            'created_at',
            'updated_at',
        ],
    ]) ?>

</div>
