<?php

use backend\models\DtoaApprovalGroup;
use backend\models\DtoaCategory;
use backend\models\DtoaItems;
use backend\models\DtoaMaterial;
use backend\models\DtoaCart;
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
$this->title = '添加材料入库';
$user=AdminUser::find()->andWhere(['status' => AdminUser::STATUS_ACTIVE])->select(['name'])->indexBy('id')->column();
$uid_arr=DtoaApprovalGroup::find()->select(['uid_arr'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['item_id'=>6])->asArray()->one();
$uid_arr=json_decode($uid_arr['uid_arr'],true);
if(empty($uid_arr[1][0])){
    echo "<script>alert('【材料计划入库审批】 没有设置人员')</script>";
    exit;
}else{
    $next_admin_id_6=$uid_arr[1][0];
}
$uid_arr=DtoaApprovalGroup::find()->select(['uid_arr'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['item_id'=>13])->asArray()->one();
$uid_arr=json_decode($uid_arr['uid_arr'],true);
if(empty($uid_arr[1][0])){
    echo "<script>alert('【材料合同入库审批】 没有设置人员')</script>";
    exit;
}else{
    $next_admin_id_13=$uid_arr[1][0];
}
$uid_arr=DtoaApprovalGroup::find()->select(['uid_arr'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['item_id'=>14])->asArray()->one();
$uid_arr=json_decode($uid_arr['uid_arr'],true);
if(empty($uid_arr[1][0])){
    echo "<script>alert('【材料直接入库审批】 没有设置人员')</script>";
    exit;
}else{
    $next_admin_id_14=$uid_arr[1][0];
}
$next_admin_id_arr=[0=>'',$next_admin_id_6=>$user[$next_admin_id_6],$next_admin_id_13=>$user[$next_admin_id_13],$next_admin_id_14=>$user[$next_admin_id_14]];
//检查计划 是否完成入库
$plan=DtoaPlan::find()->select(['j_id'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['>=','j_status',2])->asArray()->all();
if(!empty($plan)){
    foreach ($plan as $p) {
        $count = DtoaCart::find()->andWhere(['j_id'=>$p['j_id']])->andWhere(['c_status'=>0])->count();
        $plan_model = DtoaPlan::findOne($p['j_id']);
        if($count==0){  //都已入库
            $plan_model->j_status=3;
        }else{
            $plan_model->j_status=2;
        }
        $plan_model->save();
    }
}

//检查合同 是否完成入库
$agreement=DtoaAgreement::find()->select(['h_id'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['>=','h_status', 2])->asArray()->all();
if(!empty($agreement)){
    foreach ($agreement as $a) {
        $count = DtoaCart::find()->andWhere(['h_id'=>$a['h_id']])->andWhere(['c_status'=>0])->count();
        $agreement_model = DtoaAgreement::findOne($a['h_id']);
        if($count==0){  //都已入库
            $agreement_model->h_status=3;
        }else{
            $agreement_model->h_status=2;
        }
        $agreement_model->save();
    }
}

//获取当前工程所有等待入库的计划供应商
$s_id_arr=DtoaPlan::find()->select(['s_id'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['j_status'=>2])->groupBy('s_id')->asArray()->all();
$s_id_arr=array_column($s_id_arr,'s_id');
$plan_supplier=DtoaSupplier::find()->select(['s_name'])->andWhere(['in', 's_id', $s_id_arr])->indexBy('s_id')->column();

$s_id_arr=DtoaAgreement::find()->select(['s_id'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['h_status'=>2])->andWhere(['h_type'=>1])->groupBy('s_id')->asArray()->all();
$s_id_arr=array_column($s_id_arr,'s_id');
$agreement_supplier=DtoaSupplier::find()->select(['s_name'])->andWhere(['in', 's_id', $s_id_arr])->indexBy('s_id')->column();
//var_dump($agreement_supplier);
foreach ($agreement_supplier as $s_id => $s_name){
    $agreement_supplier[$s_id]=[
            's_name'=>$s_name,
            'agree'=>DtoaAgreement::find()->select(['h_name'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['s_id'=>$s_id])->andWhere(['h_status'=>2])->andWhere(['h_type'=>1])->indexBy('h_id')->column()
    ];
}
//var_dump($agreement_supplier);
$supplier=DtoaSupplier::find()->select(['s_name'])->indexBy('s_id')->column();

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
                <?= $form->field($model, 'k_no')->textInput(['readonly' => 'true','value'=> $model::getno(1)]) ?>
            </div>
            <div class="col-md-4">
                <?=$form->field($model, 'k_source')->dropdownList($model::STORAGE_SOURCE,['prompt'=>'请选择入库来源'])?>
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
                    </select>
                    <div class="help-block"></div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group s_h_id" style="display: none">
	<span style="width:80px;text-align: right; display: inline-block;margin-right: 5px;">
		<label class="control-label" for="dtoastorage-h_id">合同</label></span>
                    <select name="s_h_id" data-placeholder="请选择合同" id="s_h_id" class="form-control">
                        <option value=""></option>
                    </select>
                    <div class="help-block"></div>
                </div>
            </div>
            <div class="col-md-4"></div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <?= $form->field($model, 'arrival_date')->textInput() ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'k_info')->textarea(['maxlength' => true,'rows' => 1]) ?>
            </div>
            <div class="col-md-4" style="height: 44px;">
                <?=$form->field($model, 'next_admin_id')->dropdownList([$next_admin_id_arr],['disabled' => 'true'])?>
                <?=$form->field($model, 'h_id')->hiddenInput(['value'=> 0,'readonly' => 'true'])->label(false)?>
                <?=$form->field($model, 'cid')->hiddenInput(['value'=> 0,'readonly' => 'true'])->label(false)?>
                <?=$form->field($model, 'total_price')->hiddenInput(['value'=> 0,'readonly' => 'true'])->label(false)?>
                <?=$form->field($model, 'k_status')->hiddenInput(['value'=> 0,'readonly' => 'true'])->label(false)?>
                <?=$form->field($model, 'k_type')->hiddenInput(['value'=> 1,'readonly' => 'true'])->label(false)?>
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
    var plan_supplier = <?=Json::encode($plan_supplier)?>;
    var agreement_supplier = <?=Json::encode($agreement_supplier)?>;
    var supplier = <?=Json::encode($supplier)?>;
    $(function(){
        $("#dtoastorage-k_source").bind('change',function(){
            if($(this).val()!=''){
                var op_str='<option value="">请选择供应商</option>';
                if($(this).val()=='计划入库'){
                    var supplier_arr=plan_supplier;
                    $("#dtoastorage-next_admin_id").val(<?=$next_admin_id_6?>);
                }
                if($(this).val()=='合同入库'){
                    var supplier_arr=agreement_supplier;
                    $("#dtoastorage-next_admin_id").val(<?=$next_admin_id_13?>);
                    $(".s_h_id").show();
                }else{
                    $(".s_h_id").hide();
                    $("#dtoastorage-h_id").val(0);
                }
                if($(this).val()=='直接入库'){
                    var supplier_arr=supplier;
                    $("#dtoastorage-next_admin_id").val(<?=$next_admin_id_14?>);
                }
                if(supplier_arr.length<=0){
                    layer.msg('对应入库来源没有供应商可选择', {icon: 6});
                }else{
                    for(let s_id in supplier_arr){
                        if($(this).val()=='合同入库'){
                            op_str=op_str+'<option value="'+s_id+'">'+supplier_arr[s_id].s_name+'</option>';
                        }else{
                            op_str=op_str+'<option value="'+s_id+'">'+supplier_arr[s_id]+'</option>';
                        }
                    }
                    //console.log(op_str)
                    $("#dtoastorage-s_id").html(op_str);
                    $('.supplier_select').chosen().trigger("chosen:updated");
                }
            }
        });

        $("#dtoastorage-s_id").bind('change',function(){
            var k_source=$("#dtoastorage-k_source").val();
            if(k_source=='合同入库'){
                var supplier_arr=agreement_supplier;
                var op_str2='<option value="">请选择合同</option>';
                var agree = supplier_arr[$(this).val()].agree;
                //console.log(agree)
                for(let h_id in agree){
                    op_str2=op_str2+'<option value="'+h_id+'">'+agree[h_id]+'</option>';
                }
                $("#s_h_id").html(op_str2);
            }
        });
        $("#s_h_id").bind('change',function(){
            $("#dtoastorage-h_id").val($(this).val());
        });

        $(".storage-create-save").bind('click',function(){
            if($("#dtoastorage-s_id").val()==''){
                layer.msg('请选择供应商', {icon: 6});
            }else{
                if($("#dtoastorage-k_source").val()=='合同入库' && $("#s_h_id").val()==''){
                    layer.msg('请选择合同', {icon: 6});
                }
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