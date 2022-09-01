<?php

use backend\models\DtoaApprovalGroup;
use backend\models\DtoaCategory;
use backend\models\DtoaItems;
use backend\models\DtoaMaterial;
use backend\models\DtoaPlan;
use backend\models\DtoaAgreement;
use backend\models\DtoaProject;
use backend\models\DtoaSupplier;
use jinxing\admin\models\Admin;
use jinxing\admin\models\AdminUser;
use backend\models\DtoaStorage;
use yii\helpers\Html;
use yii\helpers\Json;
use yii\web\ForbiddenHttpException;
use yii\widgets\ActiveForm;
$this->title = '添加租赁入库';

$uid_arr=DtoaApprovalGroup::find()->select(['uid_arr'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['item_id'=>10])->asArray()->one();
$uid_arr=json_decode($uid_arr['uid_arr'],true);
$next_admin_id=$uid_arr[1][0];

//获取当前工程所有等待入库的计划供应商
$s_id_arr=DtoaAgreement::find()->select(['s_id'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['h_status'=>2])->andWhere(['h_type'=>2])->groupBy('s_id')->asArray()->all();
$s_id_arr=array_column($s_id_arr,'s_id');
$agreement_supplier=DtoaSupplier::find()->select(['s_name'])->andWhere(['in', 's_id', $s_id_arr])->indexBy('s_id')->column();

$user=AdminUser::find()->andWhere(['status' => AdminUser::STATUS_ACTIVE])->select(['name'])->indexBy('id')->column();

/* @var $this yii\web\View */
/* @var $model backend\models\DtoaPlan */
?>
<style>
    .row{margin: 5px 0;}.row .form-group{width:100% !important;}.row input,.row select,.row textarea{width: 300px !important;}
    select:disabled{appearance:none !important;-moz-appearance:none !important;-webkit-appearance:none !important;}
    .m-add input,.m-add select,.m-add textarea{width:200px !important;height:28px;line-height:28px;}
    .m-add td{line-height:28px !important;}

    input::-webkit-input-placeholder, textarea::-webkit-input-placeholder {color: #939192;font-size: 12px;}
    input:-moz-placeholder, textarea:-moz-placeholder {color: #939192;font-size: 12px;}
    input::-moz-placeholder, textarea::-moz-placeholder {color: #939192;font-size: 12px;}
    input:-ms-input-placeholder, textarea:-ms-input-placeholder {color: #939192;font-size: 12px;}

    input.storage_ok{width:18px !important;height: 18px !important; margin-left: 5px;}
    .warning{border: 2px solid red !important;}
    .help-block{text-indent: 90px;}
</style>
<link href="/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<link href="/css/chosen.css" rel="stylesheet">
<div class="dtoa-storage-create">
    <div class="dtoa-storage-form" style="">
        <?php $form = ActiveForm::begin([
            'id' => 'storage-create',
            'options' => ['class' => 'form-inline'],
            'fieldConfig'=>[
                'template'=> "<span style='width:80px;text-align: right; display: inline-block;margin-right: 5px;'>{label} </span>\n{input}\n{error}",
                //form-inline
            ]
        ]); ?>
        <div class="row">
            <div class="col-md-4">
                <?=$form->field($model, 'g_id')->dropdownList([Yii::$app->session['g_id']=>DtoaProject::findOne(Yii::$app->session['g_id'])['g_name']],['disabled' => 'true'])?>
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'k_no')->textInput(['readonly' => 'true','value'=> $model::getno(3)]) ?>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <span style="width:80px;text-align: right; display: inline-block;margin-right: 5px;">
                        <label class="control-label">进场日期</label> </span>
                    <input type="text" class="form-control" name="DtoaStorage[arrival_date]" id="dtoastorage-arrival_date">
                    <div class="help-block"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group field-dtoastorage-s_id required">
	<span style="width:80px;text-align: right; display: inline-block;margin-right: 5px;">
		<label class="control-label" for="dtoastorage-s_id">供应商</label></span>
                    <select name="DtoaStorage[s_id]" data-placeholder="请选择供应商" data-no_results_text="没有找到供应商:"
                            id="dtoastorage-s_id" class="form-control supplier_select">
                        <option value=""></option>
                        <?php foreach ($agreement_supplier as $k => $v) { ?>
                            <option value="<?=$k?>"><?=$v?></option>
                        <?php } ?>
                    </select>
                    <div class="help-block"></div>
                </div>
            </div>
            <div class="col-md-4">
                <?=$form->field($model, 'h_id')->dropdownList([],['prompt'=>'请选择合同'])?>
            </div>
            <div class="col-md-4"><?= $form->field($model, 'k_info')->textarea(['maxlength' => true,'rows' => 1]) ?></div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <?=$form->field($model, 'next_admin_id')->dropdownList([$next_admin_id=>$user[$next_admin_id]],['disabled' => 'true'])?>
            </div>
            <div class="col-md-8">
                <?= $form->field($model, 'k_source')->hiddenInput(['readonly' => 'true','value'=>'合同入库'])->label(false) ?>
                <?=$form->field($model, 'cid')->hiddenInput(['value'=> 0,'readonly' => 'true'])->label(false)?>
                <?=$form->field($model, 'total_price')->hiddenInput(['value'=> 0,'readonly' => 'true'])->label(false)?>
                <?=$form->field($model, 'k_status')->hiddenInput(['value'=> 0,'readonly' => 'true'])->label(false)?>
                <?=$form->field($model, 'k_type')->hiddenInput(['value'=> 3,'readonly' => 'true'])->label(false)?>
                <?= $form->field($model, 'creator_id')->hiddenInput(['readonly' => 'true', 'value'=>Yii::$app->user->identity->id])->label(false)?>
                <?= $form->field($model, 'creator')->hiddenInput(['readonly' => 'true','value'=>Yii::$app->user->identity->name])->label(false)?>
                <?= $form->field($model, 'created_at')->hiddenInput(['readonly' => 'true','value'=>date('Y-m-d H:i:s',time())])->label(false)?>
            </div>
        </div>
        <div class="text-center">
            <?= Html::Button('保存', ['class' => 'btn btn-success storage-create-save']) ?>
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
        $("#dtoastorage-s_id").bind('change',function(){
            if($(this).val()!=''){
                $.ajax({
                    type: "POST",
                    url: "/ajax/getdata",
                    data: {'module': 'agreement-get', 's_id': $(this).val()},
                    success: function (data) {
                        data = JSON.parse(data);
                        data = data.data;
                        //console.log(data);
                        if (data.error) {
                            layer.msg(data.msg, {icon: 6});
                        } else {
                            var op_str='<option value="">请选择合同</option>';
                            for (i = 0; i < data.length; i++) {
                                op_str=op_str+'<option value="'+data[i]['h_id']+'">'+data[i]['h_name']+'</option>';
                            }
                            $("#dtoastorage-h_id").html(op_str);
                        }
                    }
                });
            }
        });

        $(".storage-create-save").bind('click',function(){
            if($("#dtoastorage-s_id").val()==''){
                layer.msg('请选择供应商', {icon: 6});
            }else{
                $("#dtoastorage-g_id").attr('disabled',false);
                $("#dtoastorage-next_admin_id").attr('disabled',false);
                $("#storage-create").submit();
            }
        });
    });
    var date = new Date();
    $('#dtoastorage-arrival_date').datetimepicker({
        language:  'zh-CN',
        //format: 'yyyy-mm-dd hh:ii',
        format: 'yyyy-mm-dd',
        //endDate: date,  //只能选现在之前的时间
        autoclose:true,
        startView:2,
        minView:2,  //0
        todayBtn:true,
        minuteStep:30
    });
</script>