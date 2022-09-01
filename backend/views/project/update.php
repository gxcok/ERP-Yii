<?php

use backend\models\DtoaItems;
use backend\models\DtoaProject;
use jinxing\admin\models\Admin;
use yii\helpers\Html;
use yii\web\ForbiddenHttpException;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Project */

$this->title = '更新工程：'.$model->g_name;
?>
<style>
    input[type='text'],select,textarea{width: 300px !important;}
    select:disabled{appearance:none !important;-moz-appearance:none !important;-webkit-appearance:none !important;}
    .help-block{text-indent: 140px;}
</style>
<div class="project-update">

    <div class="project-form">

        <?php $form = ActiveForm::begin([
            'options' => ['class' => 'form-inline'],
            'fieldConfig'=>[
                'template'=> "<span style='width:120px;text-align:right;display: inline-block;margin-right: 5px;'>{label} </span>\n{input}\n{error}",
            ],
        ]); ?>

        <?= $form->field($model, 'g_no')->textInput(['maxlength' => true,'readonly' => 'true']) ?>

        <?= $form->field($model, 'g_name')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'build_unit')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'build_master')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'build_no')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'build_address')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'build_area')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'creator')->textInput(['readonly' => 'true'])?>

        <?= $form->field($model, 'created_at')->textInput(['readonly' => 'true']) ?>

        <?= $form->field($model, 'g_status')->dropDownList(DtoaProject::PROJECT_STATUS) ?>

        <?= $form->field($model, 'g_info')->textInput(['maxlength' => true]) ?>

        <div class="form-group block" style="padding-left: 128px;">
            <?= Html::submitButton('保存', ['class' => 'btn btn-sm btn-success']) ?>
        </div>

        <?php ActiveForm::end(); ?>

    </div>

</div>
