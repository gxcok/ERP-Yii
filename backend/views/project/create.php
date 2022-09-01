<?php

use backend\models\DtoaItems;
use backend\models\DtoaProject;
use jinxing\admin\models\Admin;
use yii\helpers\Html;
use yii\web\ForbiddenHttpException;
use yii\widgets\ActiveForm;


/* @var $this yii\web\View */
/* @var $model backend\models\Project */

$this->title = '添加工程';
?>
<style>
    input[type='text'],select,textarea{width: 400px !important;}
    .help-block{text-indent: 140px;}
</style>
<div class="project-create">

    <div class="project-form">

        <?php $form = ActiveForm::begin([
                'options' => ['class' => 'form-inline'],
                'fieldConfig'=>[
                    'template'=> "<span style='width:120px;text-align:right;display: inline-block;margin-right: 5px;'>{label} </span>\n{input}\n{error}",
                    ],
           ]
        ); ?>

        <?= $form->field($model, 'g_no')->textInput(['maxlength' => true,'readonly' => 'true','value'=>DtoaProject::getno()]) ?>

        <?= $form->field($model, 'g_name')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'build_unit')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'build_master')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'build_no')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'build_address')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'build_area')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'g_info')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'creator_id')->hiddenInput(['value'=>Yii::$app->user->identity->id])->label(false) ?>

        <?= $form->field($model, 'creator')->hiddenInput(['value'=>Yii::$app->user->identity->name])->label(false) ?>

        <?= $form->field($model, 'g_status')->hiddenInput(['value'=>0])->label(false) ?>

        <?= $form->field($model, 'created_at')->hiddenInput(['value'=>date('Y-m-d H:i:s',time())])->label(false) ?>

        <div class="form-group block" style="padding-left: 128px;">
            <?= Html::submitButton('保存', ['class' => 'btn btn-sm btn-success']) ?>
        </div>

        <?php ActiveForm::end(); ?>

    </div>

</div>
<script src="/js/jquery-3.3.1.min.js"></script>
<script>
    $(function(){
        $("input[type='hidden']").each(function(k,v){
            //console.log($(this).prev('span'));
            $(this).prev('span').hide();
        });
    });
</script>
