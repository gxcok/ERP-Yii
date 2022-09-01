<?php

use backend\models\DtoaAgreement;
use backend\models\DtoaApprovalGroup;
use backend\models\DtoaCategory;
use backend\models\DtoaItems;
use backend\models\DtoaMaterial;
use backend\models\DtoaPlan;
use backend\models\DtoaProject;
use backend\models\DtoaStorageCart;
use backend\models\DtoaSupplier;
use jinxing\admin\models\Admin;
use jinxing\admin\models\AdminUser;
use backend\models\DtoaStorage;
use yii\helpers\Html;
use yii\helpers\Json;
use yii\web\ForbiddenHttpException;
use yii\widgets\ActiveForm;
$this->title = '更新材料入库';
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
$next_admin_id_arr=[$next_admin_id_6=>$user[$next_admin_id_6],$next_admin_id_13=>$user[$next_admin_id_13],
$next_admin_id_14=>$user[$next_admin_id_14]];
//获取当前工程所有等待入库的计划供应商
$s_id_arr=DtoaPlan::find()->select(['s_id'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['j_status'=>2])->groupBy('s_id')->asArray()->all();
$s_id_arr=array_column($s_id_arr,'s_id');
$plan_supplier=DtoaSupplier::find()->select(['s_name'])->andWhere(['in', 's_id', $s_id_arr])->indexBy('s_id')->column();

$s_id_arr=DtoaAgreement::find()->select(['s_id'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['h_status'=>2])->andWhere(['h_type'=>1])->groupBy('s_id')->asArray()->all();
$s_id_arr=array_column($s_id_arr,'s_id');
$agreement_supplier=DtoaSupplier::find()->select(['s_name'])->andWhere(['in', 's_id', $s_id_arr])->indexBy('s_id')->column();
foreach ($agreement_supplier as $s_id => $s_name){
    $agreement_supplier[$s_id]=[
        's_name'=>$s_name,
        'agree'=>DtoaAgreement::find()->select(['h_name'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['s_id'=>$s_id])->andWhere(['h_status'=>2])->andWhere(['h_type'=>1])->indexBy('h_id')->column()
    ];
}

$supplier=DtoaSupplier::find()->select(['s_name'])->indexBy('s_id')->column();
$agreement=DtoaAgreement::find()->select(['h_name'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->indexBy('h_id')->column();
$agreement[0]='';
$category=DtoaCategory::find()->select(['cname'])->indexBy('cid')->column();
$category[0]='';

bcscale(3);
/* @var $this yii\web\View */
/* @var $model backend\models\DtoaPlan */
?>
<style>
    .row{margin: 5px 0;}.row .form-group{width:100% !important;}.row input,.row select,.row textarea{width: 300px !important;}
    select:disabled{appearance:none !important;-moz-appearance:none !important;-webkit-appearance:none !important;}
    #storagecart-box tr td{height: 40px;line-height: 40px;}
    #storagecart-box tr td input{float:left;display: inline-block;line-height:26px;}

    input::-webkit-input-placeholder, textarea::-webkit-input-placeholder {color: #939192;font-size: 12px;}
    input:-moz-placeholder, textarea:-moz-placeholder {color: #939192;font-size: 12px;}
    input::-moz-placeholder, textarea::-moz-placeholder {color: #939192;font-size: 12px;}
    input:-ms-input-placeholder, textarea:-ms-input-placeholder {color: #939192;font-size: 12px;}
    .warning{border: 2px solid red !important;}
    .help-block{text-indent: 90px;}
    .m-add input,.m-add select,.m-add textarea{width:100px !important;height:26px;line-height:26px;}
    .m-add td{line-height:26px !important;}
    #storagecart-box tr td{line-height:26px !important;}
    input.storage_ok{width:18px !important;height: 18px !important; margin-left: 5px;margin-top:5px; margin-right: 5px;}
    #storagecart-box tr td input.edit_input{width:100px !important;height:26px; line-height: 26px !important;font-size: 14px;padding:0;}
    input.one_price{border: 0;width:120px !important;height:26px;line-height:26px;font-size: 14px;padding:0;}
    input.long_input{width:300px !important;}
    input[type="text"]{color: #000;font-weight: bold;line-height:26px !important;height:26px;}
    .m-add td input[type="text"]{height:26px;line-height:26px !important;padding:0;}
</style>
<link href="/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<link href="/css/chosen.css" rel="stylesheet">
<div class="dtoa-storage-update">
    <div class="dtoa-storage-form" style="">
        <?php $form = ActiveForm::begin([
            'id' => 'storage-update',
            'options' => ['class' => 'form-inline'],
            'fieldConfig'=>[
                'template'=> "<span style='width:80px;text-align: right; display: inline-block;margin-right: 5px;'>{label} </span>\n{input}\n{error}",
                //form-inline
            ]
        ]); ?>
        <div class="row">
            <div class="col-md-4">
                <?=$form->field($model, 'g_id')->dropdownList([$model['g_id']=>DtoaProject::findOne($model['g_id'])['g_name']],['disabled' => 'true'])?>
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'k_no')->textInput(['readonly' => 'true']) ?>
            </div>
            <div class="col-md-4">
                <?=$form->field($model, 'k_source')->dropdownList($model::STORAGE_SOURCE,['data-k_source'=>$model['k_source']])?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group field-dtoastorage-s_id required">
	<span style="width:80px;text-align: right; display: inline-block;margin-right: 5px;">
		<label class="control-label" for="dtoastorage-s_id">供应商</label></span>
                    <select name="DtoaStorage[s_id]" data-placeholder="请选择供应商" data-no_results_text="没有找到供应商:"
                            id="dtoastorage-s_id" class="form-control supplier_select" data-id="<?=$model['s_id']?>">
                        <?php
                        if($model['k_source']=='计划入库'){
                            $s_arr=$plan_supplier;
                        }
                        if($model['k_source']=='合同入库'){
                            $s_arr=[$model['s_id']=>$agreement_supplier[$model['s_id']]];
                        }
                        if($model['k_source']=='直接入库'){
                            $s_arr=$supplier;
                        }
                        foreach ($s_arr as $k => $v){
                            if($model['k_source']=='合同入库'){
                                if($model['s_id']==$k){
                                    echo "<option value='$k' selected>".$v['s_name']."</option>";
                                }else{
                                    echo "<option value='$k'>".$v['s_name']."</option>";
                                }
                            }else{
                                if($model['s_id']==$k){
                                    echo "<option value='$k' selected>".$v."</option>";
                                }else{
                                    echo "<option value='$k'>".$v."</option>";
                                }
                            }
                        }?>
                    </select>
                    <div class="help-block"></div>
                </div>
            </div>
            <div class="col-md-4">
                <?=$form->field($model, 'h_id')->dropdownList([$model['h_id']=>$agreement[$model['h_id']]],['disabled' => 'true','data-id'=>$model['h_id']])?>
            </div>
            <div class="col-md-4">
                <?=$form->field($model, 'cid')->dropdownList($category,['disabled' => 'true'])?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <?=$form->field($model, 'k_status')->dropdownList(array_slice(DtoaStorage::STORAGE_STATUS,0,2))?>
            </div>
            <div class="col-md-4">
                <?=$form->field($model, 'total_price')->textInput(['readonly' => 'true'])?>
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'arrival_date')->textInput() ?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <?=$form->field($model, 'next_admin_id')->dropdownList($next_admin_id_arr,['disabled' => 'true'])?>
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'k_info')->textarea(['maxlength' => true,'rows' => 1]) ?>
            </div>
        </div>

        <div style="list-style: none; padding: 0 10px; border: 1px silver dashed; margin: 0 0 10px; width: 100%;overflow: scroll;">
            <h2 style="margin: 5px 0;"><a class="btn btn-primary btn-sm" id="add_storagecart" data-k-id="<?=$model['k_id']?>">选择入库材料</a></h2>
            <p>已入库的材料列表：</p>
            <table class="table table-bordered table-condensed table-striped text-nowrap" style="margin-top: 10px;border: 1px
            solid #ddd;width: 100%;" id="storage_table">
                <thead>
                <tr>
                    <th width="20">序号</th>
                    <th width="200">材料编码</th>
                    <th width="400">材料名</th>
                    <th width="80">规格型号</th>
                    <th width="100">材质</th>
                    <th width="40">计量单位</th>
                    <th width="80">计划编号</th>
                    <th width="80">合同编号</th>
                    <th width="100">入库数量</th>
                    <th width="100">未入库数量</th>
                    <th width="100">计划/合同单价</th>
                    <th width="120">入库金额</th>
                    <th width="300">入库备注</th>
                    <th width="200">入库时间</th>
                    <th width="300">操作</th>
                </tr>
                </thead>
                <tbody id="storagecart-box">
                <?php
                foreach ($storagecart as $k => $cart) { ?>
                    <tr data-sc_id="<?=$cart['sc_id']?>">
                        <td><?= $k+1 ?></td>
                        <td><?=$cart['c_no']?></td>
                        <td><?=$cart['c_name']?></td>
                        <td><?=$cart['size']?></td>
                        <td><?=$cart['quality']?></td>
                        <td><?=$cart['num']?></td>
                        <td><?=$cart['j_no']?></td>
                        <td><?=$cart['h_no']?></td>
                        <td>
                            <div style="width:180px;height:30px;">
                                <input type="text" class="edit_input j_num_item num_check"
                                       value="<?=floatval($cart['j_real_num'])?>" readonly>
                                <span style="float: left;width:80px;">
                            <input type="hidden" class="j_num" value="<?=floatval($cart['j_num'])?>">
                            <?php if($model->k_source!='直接入库'){?>
                                <input type="checkbox" name="storage_ok" class="storage_ok" value="<?=$cart['storage_ok']?>"> 完成入库
                            <?php }?>
                            </span>
                            </div>
                        </td>
                        <td></td>
                        <td><input type="text" class="edit_input j_price_item float_check" value="<?=floatval($cart['j_real_price'])?>" readonly>
                            <input type='hidden' class="j_price" value="<?=floatval($cart['j_price'])?>">
                        </td>
                        <td><input type='text' class='one_price' value="<?=floatval($cart['one_price'])?>" readonly></td>
                        <td style="width: 300px !important;"><?=$cart['jc_info']?></td>
                        <td><?=$cart['created_at']?></td>
                        <td>
                            <button type="button" class="btn btn-xs btn-danger cart-del">删除</button>
                        </td>
                    </tr>
                <?php }
                ?>
                </tbody>
            </table>
        </div>

        <div class="text-center">
            <?= Html::Button('保存', ['class' => 'btn btn-success storage-update-save']) ?>
        </div>
        <?php ActiveForm::end(); ?>
    </div>

    <h4 style="margin-top:0; line-height: 35px;font-size: 14px;">项目审批记录：</h4>
    <table class="table table-bordered table-condensed">
        <thead>
        <tr>
            <th>序号</th>
            <th>审批人</th>
            <th>审批状态</th>
            <th>审批备注</th>
            <th>审批时间</th>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($approval as $k => $ap) {?>
            <tr>
                <td><?=$k+1?></td>
                <td><?=$ap['approver']?></td>
                <td><?php
                    if($ap['a_status']==1){
                        echo '<span class="label label-sm  label-success"> 通过 </span>';
                    }
                    if($ap['a_status']==0){
                        echo '<span class="label label-sm  label-warning"> 拒绝 </span>';
                    }
                    ?></td>
                <td><?=$ap['a_info']?></td>
                <td><?=$ap['created_at']?></td>
            </tr>
        <?php } ?>
        </tbody>
    </table>
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
    var category = <?=Json::encode($category)?>;
    var k_source = $("#dtoastorage-k_source").val();

    $(function(){
        $('.supplier_select').chosen();
        $('.supplier_select').chosen();
        //console.log(parseFloat(formatMoney(3.887,3)));
        $("#dtoastorage-total_price").val(parseFloat($("#dtoastorage-total_price").val()));
        $.each($('input.num_check'), function() {
            $(this).val(parseFloat($(this).val()));
        });
        $.each($('input.float_check'), function() {
            $(this).val(parseFloat($(this).val()));
        });
        $.each($('input.one_price'), function() {
            $(this).val(parseFloat($(this).val()));
        });
        $("#dtoastorage-total_price").val(parseFloat($("#dtoastorage-total_price").val()));
        if($("#storagecart-box tr").length>0){
            $("#dtoastorage-k_source").attr('disabled',true);
            $("#dtoastorage-s_id").attr('disabled',true);
        }else{
            $("#dtoastorage-k_source").attr('disabled',false);
            $("#dtoastorage-s_id").attr('disabled',false);
        }
        //禁止更换
        if($("#dtoastorage-k_source").attr("data-k_source")=="合同入库"){
            $("#dtoastorage-k_source").attr('disabled',true);
            $("#dtoastorage-s_id").attr('disabled',true);
            $("#dtoastorage-h_id").attr('disabled',true);
        }

        $("#dtoastorage-k_source").bind('change',function(){
            if($(this).val()!=''){
                op_str='<option value="">请选择供应商</option>';
                if($(this).val()=='计划入库'){
                    var supplier_arr=plan_supplier;
                    $("#dtoastorage-next_admin_id").val(<?=$next_admin_id_6?>);
                }
                if($(this).val()=='合同入库'){
                    var supplier_arr=agreement_supplier;
                    $("#dtoastorage-next_admin_id").val(<?=$next_admin_id_13?>);
                    $("#dtoastorage-h_id").attr('disabled',false);
                    $("#dtoastorage-h_id").val($("#dtoastorage-h_id").attr("data-id"));
                }else{
                    $("#dtoastorage-h_id").attr('disabled',false);
                    $("#dtoastorage-h_id").val(0);
                    $("#dtoastorage-h_id").attr('disabled',true);
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
                            if($("#dtoastorage-s_id").attr("data-id")==s_id){
                                op_str=op_str+'<option value="'+s_id+'" selected>'+supplier_arr[s_id].s_name+'</option>';
                            }else{
                                op_str=op_str+'<option value="'+s_id+'">'+supplier_arr[s_id].s_name+'</option>';
                            }
                        }else{
                            if($("#dtoastorage-s_id").attr("data-id")==s_id){
                                op_str=op_str+'<option value="'+s_id+'" selected>'+supplier_arr[s_id]+'</option>';
                            }else{
                                op_str=op_str+'<option value="'+s_id+'">'+supplier_arr[s_id]+'</option>';
                            }
                        }
                    }
                    $("#dtoastorage-s_id").html(op_str);
                    $('.supplier_select').chosen().trigger('chosen:updated');
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
                $("#dtoastorage-h_id").html(op_str2);
                $("#dtoastorage-h_id").attr('disabled',false);
            }
        });

        $("#dtoastorage-h_id").bind('change',function(){
            //当合同改变时检查是否已选择了材料
            console.log($("tr.m-add").length)
            if($(this).val()!=$(this).attr("data-id") && $("tr.m-add").length>0){

            }
        });

        $("#add_storagecart").bind('click',function(){
            if($("#dtoastorage-s_id").val()==''){
                layer.msg('请先选择供应商', {icon: 6});
                return ;
            }
            if($("#dtoastorage-k_source").val()=='计划入库'){
                $url='/plan/select?s_id='+$("#dtoastorage-s_id").val();
            }
            if($("#dtoastorage-k_source").val()=='合同入库'){
                $url='/agreement/select?h_id='+$("#dtoastorage-h_id").val()+'&h_type=1';
            }
            if($("#dtoastorage-k_source").val()=='直接入库'){
                $url='/material/select';
            }
            layer.open({
                type: 2,
                //offset: '50px',
                title: '选择入库材料',
                shade: 0.8,
                area: ['1200px', '600px'],
                content: $url,
            });
        });

        $('input.num_check').each(function(){
            if(k_source=='计划入库'){
                if(parseFloat($(this).val())>=parseFloat($(this).parent('div').find('.surplus_num').val())){
                    $(this).parent('div').find(".storage_ok").prop("checked",true);
                }else{
                    $(this).parent('div').find(".storage_ok").prop("checked",false);
                }
                if($(this).parent('div').find(".storage_ok").val()==1){
                    $(this).parent('div').find(".storage_ok").prop("checked",true);
                }
                $(this).parent('div').find(".storage_ok").attr("disabled",true);
                if(parseFloat($(this).val())>parseFloat($(this).parent('div').find('.surplus_num').val())){  //数量超出标红
                    $(this).addClass('warning');
                }else{
                    $(this).removeClass('warning');
                }
            }
            if(k_source=='合同入库'){
                if($(this).parent('div').find(".storage_ok").val()==1){
                    $(this).parent('div').find(".storage_ok").prop("checked",true);
                }
                $(this).parent('div').find(".storage_ok").attr("disabled",true);
            }
            if(k_source=='直接入库'){

            }
        });

        $('input.float_check').each(function(){
            if(k_source=='直接入库'){

            }else{
                if(parseFloat($(this).val())!=parseFloat($(this).next('.j_price').val())){  //数量超出标红
                    $(this).addClass('warning');
                }else{
                    $(this).removeClass('warning');
                }
            }
        });

        $(".cart-del").bind('click',function(){
            var sc_id = $(this).parent('td').parent('tr').attr('data-sc_id');
            layer.confirm('确认删除入库材料?', {icon: 3, title: '删除入库材料'}, function (index) {
                $.ajax({
                    type: "POST",
                    url: "/cart/delete",
                    data: {'sc_id':sc_id,'storagecart':1},
                    success: function (data) {
                        if(data.errCode==0){
                            layer.msg('删除成功', {icon: 6});
                            window.location.reload();
                        }else{
                            layer.msg(data.msg, {icon: 6});
                        }
                    }
                });
            });
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

    function sum_total_price(){
        var total_price=0;
        $.each($('input.one_price'), function() {
            if($(this).val()!=''){
                total_price = mathadd(total_price,parseFloat($(this).val()));
            }
        });
        return total_price;
    }

    function create_input(ids,module,id) {
        var id_arr = ids.split(",");
        $.ajax({
            type: "POST",
            url: "/ajax/getdata",
            data: {'module':module,'id_arr':id_arr},
            success: function (data) {
                data=JSON.parse(data);
                //console.log(data);
                if(data.error){
                    layer.msg(data.msg, {icon: 6});
                }else{
                    data=data.data;
                    var input_html='';
                    n=$("#storagecart-box tr").length;
                    if(module=='plan-select'){
                        for (var i in data) {
                            input_html = input_html + "<tr class='m-add' data-index='" + (parseInt(i) + n + 1) + "'>" +
                            "<td><span>" + (parseInt(i)+n+1) + "</span> " +
                            "<input type='hidden' name='DtoaStorageCart[jc_id][]' value='" + data[i]['jc_id'] + "'>" +
                            "<input type='hidden' name='DtoaStorageCart[c_id][]' value='" + data[i]['c_id'] + "'></td>" +
                            "<td>" + data[i]['c_no'] + "</td>" +
                            "<td>" + data[i]['c_name'] + "</td>" +
                            "<td>" + data[i]['size'] + "</td>" +
                            "<td>" + data[i]['quality'] + "</td>" +
                            "<td>" + data[i]['num'] + "</td>" +
                            "<td>" + data[i]['j_no'] +
                            "<input type='hidden' name='DtoaStorageCart[j_id][]' value='" + data[i]['j_id'] + "'>" +
                            "<input type='hidden' name='DtoaStorageCart[j_no][]' value='" + data[i]['j_no'] + "'></td>" +
                            "<td></td>" +
                            "<td><div style=\"width:180px;height:30px;\"><input type='text' autocomplete='off'" +
                                "name='DtoaStorageCart[j_real_num][]' class='j_real_num_input num_check' " +
                                "value='" + parseFloat(data[i]['surplus_num']) + "'>" +
                            "<span style=\"float: left;width:80px;\"><input type='hidden' " +
                                "name='DtoaStorageCart[surplus_num][]' value='" + data[i]['surplus_num'] + "' class='surplus_num'>"+
                            "<input type='hidden' name='DtoaStorageCart[j_num][]' value='" + data[i]['j_num'] + "' class='j_num'>"+
                            "<input type='checkbox' name='DtoaStorageCart[storage_ok][]' class='storage_ok' checked " +
                                "disabled value='"+ i +"'> 完成入库</span></div></td>" +
                            "<td>" + parseFloat(data[i]['surplus_num']) + "</td>" +
                            "<td><input type='text' name='DtoaStorageCart[j_real_price][]' autocomplete='off' class='j_real_price_input " +
                                "float_check' value='" + parseFloat(data[i]['j_price']) +"'>" +
                            "<input type='hidden' name='DtoaStorageCart[j_price][]' class='j_price' value='" + data[i]['j_price'] + "'></td>" +
                            "<td><input type='text' class='one_price' value='" + parseFloat(data[i]['one_price']) +"' readonly></td>" +
                            "<td><input type='text' name='DtoaStorageCart[jc_info][]' class='long_input'></td>" +
                            "<td></td>" +
                            "<td><button type='button' class='btn btn-xs btn-danger addcart-del'>删除</button></td>" +
                            "</tr>";
                        }
                    }
                    if(module=='agreement-select'){
                        for (var i in data) {
                            if(data[i]['j_num']==0){
                                var surplus_num = '不限';
                            }else{
                                var surplus_num = parseFloat(data[i]['surplus_num']);
                            }
                            input_html = input_html + "<tr class='m-add' data-index='" + (parseInt(i) + n + 1) + "'>" +
                            "<td><span>" + (parseInt(i)+n+1) + "</span> " +
                            "<input type='hidden' name='DtoaStorageCart[jc_id][]' value='" + data[i]['jc_id'] + "'>" +
                            "<input type='hidden' name='DtoaStorageCart[c_id][]' value='" + data[i]['c_id'] + "'></td>" +
                            "<td>" + data[i]['c_no'] + "</td>" +
                            "<td>" + data[i]['c_name'] + "</td>" +
                            "<td>" + data[i]['size'] + "</td>" +
                            "<td>" + data[i]['quality'] + "</td>" +
                            "<td>" + data[i]['num'] + "</td>" +
                            "<td></td>" +
                            "<td>" + data[i]['h_no'] +
                            "<input type='hidden' name='DtoaStorageCart[h_id][]' value='" + data[i]['h_id'] + "'>" +
                            "<input type='hidden' name='DtoaStorageCart[h_no][]' value='" + data[i]['h_no'] + "'></td>" +
                            "<td><div style=\"width:180px;height:30px;\"><input type='text' autocomplete='off' name='DtoaStorageCart[j_real_num][]' class='j_real_num_input num_check'>" +
                            "<span style=\"float: left;width:80px;\"><input type='hidden' name='DtoaStorageCart[surplus_num][]' value='" + data[i]['surplus_num'] + "' class='surplus_num'>"+
                            "<input type='hidden' name='DtoaStorageCart[j_num][]' value='" + data[i]['j_num'] + "' class='j_num'>"+
                            "<input type='checkbox' name='DtoaStorageCart[storage_ok][]' class='storage_ok' value='" + i + "'> 完成入库</span></div></td>" +
                            "<td>" + surplus_num + "</td>" +
                            "<td><input type='text' autocomplete='off' name='DtoaStorageCart[j_real_price][]' class='j_real_price_input float_check' value='" +
                                parseFloat(data[i]['j_price']) +"' readonly>" +
                            "<input type='hidden' name='DtoaStorageCart[j_price][]' class='j_price' value='" + data[i]['j_price'] + "'></td>" +
                            "<td><input type='text' class='one_price' value='" + parseFloat(data[i]['one_price']) +"' readonly></td>" +
                            "<td><input type='text' name='DtoaStorageCart[jc_info][]' class=''></td>" +
                            "<td></td>" +
                            "<td><button type='button' class='btn btn-xs btn-danger addcart-del'>删除</button></td>" +
                            "</tr>";
                        }
                    }
                    if(module=='material-select'){
                        for (var i in data) {
                            input_html = input_html + "<tr class='m-add' data-index='" + (parseInt(i) + n + 1) + "'>" +
                            "<td><span class='tr_index'>" + (parseInt(i)+n+1) + "</span> " +
                            "<input type='hidden' name='DtoaStorageCart[jc_id][]' value='0'>" +
                            "<input type='hidden' name='DtoaStorageCart[c_id][]' value='" + data[i]['c_id'] + "'></td>" +
                            "<td>" + data[i]['c_no'] + "</td>" +
                            "<td>" + data[i]['c_name'] + "</td>" +
                            "<td>" + data[i]['size'] + "</td>" +
                            "<td>" + data[i]['quality'] + "</td>" +
                            "<td>" + data[i]['num'] + "</td>" +
                            "<td></td>" +
                            "<td></td>" +
                            "<td><div><input type='text' autocomplete='off' name='DtoaStorageCart[j_real_num][]' " +
                                "class='j_real_num_input num_check'></div></td>" +
                            "<td></td>" +
                            "<td><input type='text' autocomplete='off' name='DtoaStorageCart[j_real_price][]' class='j_real_price_input float_check'></td>" +
                            "<td><input type='text' class='one_price' value='' readonly></td>" +
                            "<td><input type='text' name='DtoaStorageCart[jc_info][]' class=''></td>" +
                            "<td></td>" +
                            "<td><button type='button' class='btn btn-xs btn-danger addcart-del'>删除</button></td>" +
                            "</tr>";
                        }
                    }

                    //console.log($('#dtoastorage-cid').val(),id);
                    if($('#dtoastorage-cid').val()==0){
                        $('#dtoastorage-cid').val(id);
                    }

                    $("#storagecart-box").append(input_html);
                    $("#add_storagecart").hide();
                    $("#dtoastorage-k_source").attr('disabled',true);
                    $("#dtoastorage-s_id").attr('disabled',true);
                    $("#dtoastorage-total_price").val(sum_total_price());
                    $('tr.m-add input.storage_ok').each(function(){
                        $(this).on('click',function() {
                            o = $(this);
                            if($(this).is(':checked')){
                                label='【确认】';
                                checked=true;
                            }else{
                                label='【取消】';
                                checked=false;
                            }
                            var confirm_ok = confirm(label+'此材料完成入库?');
                            if(confirm_ok){
                                o.prop("checked",checked);
                            }else{
                                o.prop("checked",!checked);
                            }
                        });
                    });

                    $('input.j_real_num_input').each(function(){
                        $(this).on('keyup',function() {
                            $(this).val($(this).val().replace(/^(\d+)\.(\d{0,3}).*$/,'$1.$2'));
                            if(k_source=='计划入库'){
                                if(parseFloat($(this).val())>=parseFloat($(this).parent('div').find('.surplus_num')
                                    .val())){
                                    $(this).parent('div').find(".storage_ok").prop("checked",true);
                                    $(this).parent('div').find(".storage_ok").attr("disabled",true);
                                    //layer.msg('材料 入库数量>=未入库数,完成入库', {icon: 6,time: 1000});
                                }else{
                                    $(this).parent('div').find(".storage_ok").prop("checked",false);
                                    $(this).parent('div').find(".storage_ok").attr("disabled",false);
                                }
                                if(parseFloat($(this).val())>parseFloat($(this).parent('div').find('.surplus_num').val())){  //数量超出标红
                                    $(this).addClass('warning');
                                }else{
                                    $(this).removeClass('warning');
                                }
                            }
                            if(k_source=='合同入库'){
                                var j_num = $(this).parent('div').find('.j_num').val();
                                if(j_num==0){

                                }else{
                                    if(parseFloat($(this).val())>=parseFloat($(this).parent('div').find('.surplus_num').val())){
                                        $(this).val(parseFloat($(this).parent('div').find('.surplus_num').val()));
                                        $(this).parent('div').find(".storage_ok").prop("checked",true);
                                        $(this).parent('div').find(".storage_ok").attr("disabled",true);
                                        //layer.msg('材料 入库数量>=未入库数,完成入库', {icon: 6,time: 1000});
                                    }else{
                                        $(this).parent('div').find(".storage_ok").prop("checked",false);
                                        $(this).parent('div').find(".storage_ok").attr("disabled",false);
                                    }
                                }
                            }
                            if(k_source=='直接入库'){

                            }
                            var j_num = $(this).val();
                            var j_price = $(this).parent('div').parent('td').parent('tr').find('.j_real_price_input').val();
                            if((j_num!='' || j_num!=0) && j_price!=''){
                                var one_price = mathmul(parseFloat(j_num),parseFloat(j_price));
                            }else{
                                var one_price = 0;
                            }
                            one_price = parseFloat(formatMoney(one_price,3));
                            $(this).parent('div').parent('td').parent('tr').find('.one_price').val(one_price);
                            $("#dtoastorage-total_price").val(sum_total_price());
                        });
                    });

                    $('input.j_real_price_input').each(function(){
                        $(this).on('keyup',function() {
                            $(this).val($(this).val().replace(/^(\d+)\.(\d{0,3}).*$/,'$1.$2'));
                            if(k_source=='直接入库'){

                            }else{
                                if(parseFloat($(this).val())!=parseFloat($(this).next('.j_price').val())){  //数量超出标红
                                    $(this).addClass('warning');
                                }else{
                                    $(this).removeClass('warning');
                                }
                            }
                            var j_price = $(this).val();
                            var j_num = $(this).parent('td').parent('tr').find('.j_real_num_input').val();
                            if((j_num!='' || j_num!=0) && j_price!=''){
                                var one_price = mathmul(parseFloat(j_num),parseFloat(j_price));
                            }else{
                                var one_price = 0;
                            }
                            one_price = parseFloat(formatMoney(one_price,3));
                            $(this).parent('td').parent('tr').find('.one_price').val(one_price);
                            $("#dtoastorage-total_price").val(sum_total_price());
                        });
                    });

                    $(".addcart-del").on('click',function(){
                        var parent_tr = $(this).parent('td').parent('tr');
                        layer.confirm('确认删除入库材料?', {icon: 3, title: '删除入库材料'}, function (index) {
                            var m_add = parent_tr.nextAll('.m-add');
                            for (i = 0; i < m_add.length; i++) {
                                $(m_add).eq(i).attr('data-index',parseInt($(m_add).eq(i).attr('data-index'))-1);
                                $(m_add).eq(i).find('td span.tr_index').html(parseInt($(m_add).eq(i).find('td span.tr_index').html()) -1);
                                $(m_add).eq(i).find('.storage_ok').val(parseInt($(m_add).eq(i).find('.storage_ok').val())-1);
                            }
                            parent_tr.remove();
                            if($("#storagecart-box tr").length==0){
                                $("#dtoastorage-k_source").attr('disabled',false);
                                $("#dtoastorage-s_id").attr('disabled',false);
                            }
                            layer.close(index);
                            $("#dtoastorage-total_price").val(sum_total_price());
                            $("#add_storagecart").show();
                        });
                    });
                }
            }
        });
    }

    $(".storage-update-save").bind('click',function(){
        var check = true;
        if($("#dtoastorage-s_id").val()==''){
            layer.msg('请选择供应商', {icon: 6});
            check = false;
        }
        $("tr.m-add").each(function(){
            var n = $(this).attr("data-index");
            var j_real_num = $(this).find(".j_real_num_input").val();
            var storage_ok = $(this).find(".storage_ok");
            var j_real_price = $(this).find(".j_real_price_input").val();

            if(j_real_num=='' || parseFloat(j_real_num)<=0){
                layer.msg('第'+n+'行 [入库数量] 不能为空 和 <=0', {icon: 6});
                check = false;
            }
            if(j_real_price=='' || parseFloat(j_real_price)<=0){
                layer.msg('第'+n+'行 [入库单价] 不能为空 和 <=0', {icon: 6});
                check = false;
            }
        });
        if(check){
            if($('#dtoastorage-k_status').val()==1 && $("#storagecart-box tr").length<=0){
                layer.msg('没有选择材料，不能提交审核！', {icon: 6});
            }else{
                $("#dtoastorage-k_source").attr('disabled',false);
                $("#dtoastorage-s_id").attr('disabled',false);
                $("#dtoastorage-next_admin_id").attr('disabled',false);
                $("#dtoastorage-h_id").attr('disabled',false);
                $("#dtoastorage-cid").attr('disabled',false);
                $(".storage_ok").attr('disabled',false);
                $("#storage-update").submit();
            }
        }
    });
</script>