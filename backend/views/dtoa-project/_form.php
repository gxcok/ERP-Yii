<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Project */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="project-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'g_no')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'g_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'build_unit')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'build_master')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'build_no')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'build_address')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'build_area')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'creator_id')->textInput() ?>

    <?= $form->field($model, 'creator')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'g_status')->textInput() ?>

    <?= $form->field($model, 'g_info')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'uid_arr')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'created_at')->textInput() ?>

    <?= $form->field($model, 'updated_at')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
