<?php

use backend\models\DtoaApprovalGroup;
use backend\models\DtoaCategory;
use backend\models\DtoaItems;
use backend\models\DtoaMaterial;
use backend\models\DtoaPlan;
use backend\models\DtoaProject;
use backend\models\DtoaSupplier;
use jinxing\admin\models\Admin;
use jinxing\admin\models\AdminUser;
use yii\helpers\Html;
use yii\helpers\Json;
use yii\web\ForbiddenHttpException;
use yii\widgets\ActiveForm;
$this->title = '添加材料计划';

$supplier=DtoaSupplier::find()->select(['s_name'])->indexBy('s_id')->column();

$uid_arr=DtoaApprovalGroup::find()->select(['uid_arr'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['item_id'=>3])->asArray()->one();
$uid_arr=json_decode($uid_arr['uid_arr'],true);
$next_admin_id=$uid_arr[1][0];

$user=AdminUser::find()->andWhere(['status' => AdminUser::STATUS_ACTIVE])->select(['name'])->indexBy('id')->column();

/* @var $this yii\web\View */
/* @var $model backend\models\DtoaPlan */
?>
<style>
    .row{margin: 5px 0;}.row .form-group{width:100% !important;}.row input,.row select,.row textarea{width: 300px !important;}
    select:disabled{appearance:none !important;-moz-appearance:none !important;-webkit-appearance:none !important;}
    .help-block{text-indent: 90px;}
</style>
<link href="/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<link href="/css/chosen.css" rel="stylesheet">
<div class="dtoa-plan-create">
    <div class="dtoa-plan-form" style="">
        <?php $form = ActiveForm::begin([
            'id' => 'plan-create',
            'options' => ['class' => 'form-inline'],
            'fieldConfig'=>[
                'template'=> "<span style='width:80px;text-align: right; display: inline-block;margin-right: 5px;'>{label}</span>\n{input}\n{error}",
                //form-inline
            ]
        ]); ?>
        <div class="row">
            <div class="col-md-4">
                <?=$form->field($model, 'g_id')->dropdownList([Yii::$app->session['g_id']=>DtoaProject::findOne(Yii::$app->session['g_id'])['g_name']],['disabled' => 'true'])?>
            </div>
            <div class="col-md-4">
                <div class="form-group field-dtoaplan-s_id required">
                    <span style="width:80px;text-align: right; display: inline-block;margin-right: 5px;">
                        <label class="control-label" for="dtoaplan-s_id">供应商</label></span>
                    <select name="DtoaPlan[s_id]" data-placeholder="请选择供应商" data-no_results_text="没有找到供应商:"
                            id="dtoaplan-s_id" class="form-control supplier_select">
                        <option value=""></option>
                        <?php foreach ($supplier as $k => $v) { ?>
                            <option value="<?=$k?>"><?=$v?></option>
                        <?php } ?>
                    </select>
                    <div class="help-block"></div>
                </div>
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'j_no')->textInput(['readonly' => 'true','value'=>DtoaPlan::getno()]) ?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <?= $form->field($model, 'j_name')->textInput(['maxlength' => true]) ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'need_date')->textInput(['maxlength' => true]) ?>
            </div>
            <div class="col-md-4">
                <?=$form->field($model, 'next_admin_id')->dropdownList([$next_admin_id=>$user[$next_admin_id]],['disabled' => 'true'])?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <?= $form->field($model, 'j_info')->textarea(['maxlength' => true,'rows' => 1]) ?>
                <?= $form->field($model, 'j_status')->hiddenInput(['readonly' => 'true','value'=>0])->label(false)?>
                <?= $form->field($model, 'creator_id')->hiddenInput(['readonly' => 'true', 'value'=>Yii::$app->user->identity->id])->label(false)?>
                <?= $form->field($model, 'creator')->hiddenInput(['readonly' => 'true','value'=>Yii::$app->user->identity->name])->label(false)?>
                <?= $form->field($model, 'created_at')->hiddenInput(['readonly' => 'true','value'=>date('Y-m-d H:i:s',time())])->label(false)?>
                <?= $form->field($model, 'total_price')->hiddenInput(['readonly' => 'true', 'value'=>0])->label(false) ?>
            </div>
        </div>
        <div class="text-center">
            <?= Html::Button('保存', ['class' => 'btn btn-success plan-create-save']) ?>
        </div>
        <?php ActiveForm::end(); ?>
    </div>

</div>
<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/layer/layer.js"></script><script src="/js/common.js"></script>
<script src="/js/bootstrap-datetimepicker.js"></script>
<script src="/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="/js/chosen.jquery.js"></script>
<script>
    $(function(){
        $('.supplier_select').chosen().trigger('chosen:updated');
        $(".plan-create-save").bind('click',function(){
            if($("#dtoaplan-s_id").val()==''){
                layer.msg('请选择供应商', {icon: 6});
            }else{
                $("#dtoaplan-g_id").attr('disabled',false);
                $("#dtoaplan-next_admin_id").attr('disabled',false);
                $("#plan-create").submit();
            }
        });
    });
    var date = new Date();
    $('#dtoaplan-need_date').datetimepicker({
        language:  'zh-CN',
        //format: 'yyyy-mm-dd hh:ii',
        format: 'yyyy-mm-dd',
        //startDate: date,  //只能选现在之前的时间
        autoclose:true,
        startView:2,
        minView:2,  //0
        todayBtn:true,
        //minuteStep:30
    });
</script>