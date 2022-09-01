<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\ProjectSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="project-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'g_id') ?>

    <?= $form->field($model, 'g_no') ?>

    <?= $form->field($model, 'g_name') ?>

    <?= $form->field($model, 'build_unit') ?>

    <?= $form->field($model, 'build_master') ?>

    <?php // echo $form->field($model, 'build_no') ?>

    <?php // echo $form->field($model, 'build_address') ?>

    <?php // echo $form->field($model, 'build_area') ?>

    <?php // echo $form->field($model, 'creator_id') ?>

    <?php // echo $form->field($model, 'creator') ?>

    <?php // echo $form->field($model, 'g_status') ?>

    <?php // echo $form->field($model, 'g_info') ?>

    <?php // echo $form->field($model, 'uid_arr') ?>

    <?php // echo $form->field($model, 'created_at') ?>

    <?php // echo $form->field($model, 'updated_at') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
