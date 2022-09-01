<?php

use backend\models\DtoaAgreement;
use backend\models\DtoaApprovalGroup;
use backend\models\DtoaCart;
use backend\models\DtoaCategory;
use backend\models\DtoaItems;
use backend\models\DtoaMaterial;
use backend\models\DtoaTicketCart;
use backend\models\DtoaProject;
use backend\models\DtoaSupplier;
use jinxing\admin\models\Admin;
use jinxing\admin\models\AdminUser;
use backend\models\DtoaStorage;
use yii\helpers\Html;
use yii\helpers\Json;
use yii\web\ForbiddenHttpException;
use yii\widgets\ActiveForm;
$this->title = '更新商砼小票入库';

$uid_arr=DtoaApprovalGroup::find()->select(['uid_arr'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['item_id'=>9])->asArray()->one();
$uid_arr=json_decode($uid_arr['uid_arr'],true);
$next_admin_id=$uid_arr[1][0];

$supplier=DtoaSupplier::find()->select(['s_name'])->indexBy('s_id')->column();

$s_id_arr=DtoaAgreement::find()->select(['s_id'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['h_status'=>2])->groupBy('s_id')->asArray()->all();
$s_id_arr=array_column($s_id_arr,'s_id');
$agreement_supplier=DtoaSupplier::find()->select(['s_name'])->andWhere(['in', 's_id', $s_id_arr])->indexBy('s_id')->column();

$agreement=DtoaAgreement::find()->select(['h_name'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['s_id'=>$model->s_id])->andWhere(['h_status'=>2])->indexBy('h_id')->column();

$user=AdminUser::find()->andWhere(['status' => AdminUser::STATUS_ACTIVE])->select(['name'])->indexBy('id')->column();

/* @var $this yii\web\View */
/* @var $model backend\models\DtoaPlan */
?>
<style>
    .row{margin: 5px 0;}.row .form-group{width:100% !important;}.row input,.row select,.row textarea{width: 300px !important;}
    select:disabled{appearance:none !important;-moz-appearance:none !important;-webkit-appearance:none !important;}
    input::-webkit-input-placeholder, textarea::-webkit-input-placeholder {color: #939192;font-size: 12px;}
    input:-moz-placeholder, textarea:-moz-placeholder {color: #939192;font-size: 12px;}
    input::-moz-placeholder, textarea::-moz-placeholder {color: #939192;font-size: 12px;}
    input:-ms-input-placeholder, textarea:-ms-input-placeholder {color: #939192;font-size: 12px;}
    .warning{border: 2px solid red !important;}
    .help-block{text-indent: 90px;}
    input[type="text"]{color: #000;font-weight: bold;}
    #chancel_storage{height:32px;width: 30px;border:1px #c3c3c3 solid;border-radius: 3px;}
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
                <?=$form->field($model, 'g_id')->dropdownList([Yii::$app->session['g_id']=>DtoaProject::findOne(Yii::$app->session['g_id'])['g_name']],['disabled' => 'true'])?>
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'k_no')->textInput(['readonly' => 'true']) ?>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <span style="width:80px;text-align: right; display: inline-block;margin-right: 5px;">
                        <label class="control-label">进场日期</label> </span>
                    <input type="text" class="form-control" name="DtoaStorage[arrival_date]"
                           id="dtoastorage-arrival_date" value="<?=$model->arrival_date?>">
                    <div class="help-block"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <?=$form->field($model, 's_id')->dropdownList($agreement_supplier)?>
            </div>
            <div class="col-md-4">
                <?=$form->field($model, 'h_id')->dropdownList($agreement)?>
            </div>
            <div class="col-md-4">
                <div class="form-group field-dtoa_ticket_cart">
                    <span style="width:80px;text-align: right; display: inline-block;margin-right: 5px;">
                        <label class="control-label" for="c_id">商砼名称</label> </span>
                    <select id="ticketcart-c_id" class="form-control" name="DtoaTicketCart[c_id]" disabled>
                        <option value="<?=$ticket_model['c_id']?>"><?=$ticket_model['c_name']?> <?=$ticket_model['size']?></option>
                    </select>
                    <button type="button" id="chancel_storage" data-k_id="<?=$model['k_id']?>" data-h_id="<?=$model['h_id']?>" class="glyphicon
                    glyphicon-trash" title="重新选择商砼"></button>
                    <div class="help-block"></div>
                    <input type="hidden" id="jc_id" name="DtoaTicketCart[jc_id]" value="<?=$ticket_model['jc_id']?>">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <span style="width:80px;text-align: right; display: inline-block;margin-right: 5px;">
                        <label class="control-label">商砼编号</label> </span>
                        <input type="text" class="form-control" id="c_no_item" value="<?=$ticket_model['c_no']?>" disabled>
                    <div class="help-block"></div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <span style="width:80px;text-align: right; display: inline-block;margin-right: 5px;">
                        <label class="control-label">计量单位</label> </span>
                    <input type="text" class="form-control" id="num_item" value="<?=$ticket_model['num']?>" disabled>
                    <div class="help-block"></div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <span style="width:80px;text-align: right; display: inline-block;margin-right: 5px;">
                        <label class="control-label">商砼单价</label> </span>
                    <input type="text" class="form-control" id="j_price_item" value="<?=$ticket_model['j_price']?>" name="DtoaTicketCart[j_price]" readonly>
                    <div class="help-block"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <span style="width:80px;text-align: right; display: inline-block;margin-right: 5px;">
                <label class="control-label">浇筑方式</label> </span>
                <select name="DtoaTicketCart[use_style]" id="use_style" class="form-control">
                    <option value="">浇筑方式</option>
                    <?php foreach (DtoaTicketCart::USE_STYLE as $k => $u) { ?>
                        <option value="<?=$k?>" <?php if($ticket_model['use_style']==$k){
                            echo'selected';}?>><?=$u?></option>
                    <?php } ?>
                </select>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <span style="width:80px;text-align: right; display: inline-block;margin-right: 5px;">
                        <label class="control-label">浇筑日期</label> </span>
                    <input type="text" class="form-control" name="DtoaTicketCart[use_date]" value="<?=$ticket_model['use_date']?>" id="ticketcart-use_date">
                    <div class="help-block"></div>
                </div>
            </div>
            <div class="col-md-4">
                    <span style="width:80px;text-align: right; display: inline-block;margin-right: 5px;">
                    <label class="control-label">强度等级</label> </span>
                    <select name="DtoaTicketCart[hc_grade]" id="hc_grade" class="form-control" disabled="true">
                        <option value="">强度等级</option>
                        <?php foreach (DtoaTicketCart::HC_GRADE as $k => $u) { ?>
                            <option value="<?=$k?>" <?php if($ticket_model['hc_grade']==$k){
                                echo'selected';}?>><?=$u?></option>
                        <?php } ?>
                    </select>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <span style="width:80px;text-align: right; display: inline-block;margin-right: 5px;">
                        <label class="control-label">小票张数</label> </span>
                    <input type="text" class="form-control" name="DtoaTicketCart[ticket_num]" value="<?=$ticket_model['ticket_num']?>" id="ticket_num">
                    <div class="help-block"></div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <span style="width:80px;text-align: right; display: inline-block;margin-right: 5px;">
                        <label class="control-label">施工部位</label> </span>
                    <input type="text" class="form-control" name="DtoaTicketCart[use_place]" value="<?=$ticket_model['use_place']?>" id="use_place">
                    <div class="help-block"></div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <span style="width:80px;text-align: right; display: inline-block;margin-right: 5px;">
                        <label class="control-label">浇筑方量</label> </span>
                    <input type="text" class="form-control float_check" name="DtoaTicketCart[pour_num]" value="<?=$ticket_model['pour_num']?>" id="pour_num">
                    <input type="hidden" id="j_num" name="DtoaTicketCart[j_num]" value="<?=$ticket_model['j_num']?>">
                    <input type="hidden" id="surplus_num" name="DtoaTicketCart[surplus_num]" value="<?=$ticket_model['surplus_num']?>">
                    <div class="help-block"></div>
                </div>
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
                <?=$form->field($model, 'next_admin_id')->dropdownList([$next_admin_id=>$user[$next_admin_id]],['disabled' => 'true'])?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <?= $form->field($model, 'approval_time')->textInput(['readonly' => 'true']) ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'k_info')->textarea(['maxlength' => true,'rows' => 1]) ?>
            </div>
            <div class="col-md-4">
            </div>
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
    $(function(){
        $("#dtoastorage-total_price").val(parseFloat($("#dtoastorage-total_price").val()));
        if(parseFloat($("#pour_num").val())>0){
            $("#pour_num").val(parseFloat($("#pour_num").val()));
        }
        if(parseFloat($("#j_price_item").val())>0){
            $("#j_price_item").val(parseFloat($("#j_price_item").val()));
        }
        $('#dtoastorage-s_id').chosen().trigger('chosen:updated');
        <?php if(empty($ticket_model)){?>
        $.ajax({
            type: "POST",
            url: "/ajax/getdata",
            data: {'module': 'agreement-material-get','h_id': $("#dtoastorage-h_id").val()},
            success: function (data) {
                data = JSON.parse(data);
                data = data.data;
                //console.log(data);
                if (data.error) {
                    layer.msg(data.msg, {icon: 6});
                } else {
                    $("#ticketcart-c_id").attr('disabled',false);
                    var op_str='<option value="">请选择合同商砼</option>';
                    for (i = 0; i < data.length; i++) {
                        op_str=op_str+'<option value="'+data[i]['c_id']+'" data-jc_id="'+data[i]['jc_id']+'" data-size="'+data[i]['size']+'" data-num="'+data[i]['num']+'" data-j_num="'+data[i]['j_num']+'" data-surplus_num="'+data[i]['surplus_num']+'" data-c_no="'+data[i]['c_no']+'" ' +
                            'data-j_price="'+data[i]['j_price']+'">'+data[i]['c_name']+' '+data[i]['size']+'</option>';
                    }
                    $("#ticketcart-c_id").html(op_str);
                    $("#chancel_storage").hide();
                    $('#dtoastorage-total_price').val(0);
                }
            }
        });
        <?php }?>

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
                            $("#ticketcart-c_id").html('<option value="">请选择合同商砼</option>');
                            $("#chancel_storage").hide();
                        }
                    }
                });
            }
        });

        $("#dtoastorage-h_id").bind('change',function(){
            if($(this).val()!=''){
                $.ajax({
                    type: "POST",
                    url: "/ajax/getdata",
                    data: {'module': 'agreement-material-get', 'h_id': $(this).val()},
                    success: function (data) {
                        data = JSON.parse(data);
                        data = data.data;
                        //console.log(data);
                        if (data.error) {
                            layer.msg(data.msg, {icon: 6});
                        } else {
                            $("#ticketcart-c_id").attr('disabled',false);
                            var op_str='<option value="">请选择合同商砼</option>';
                            for (i = 0; i < data.length; i++) {
                                op_str=op_str+'<option value="'+data[i]['c_id']+'" data-jc_id="'+data[i]['jc_id']+'" data-size="'+data[i]['size']+'" data-num="'+data[i]['num']+'" data-j_num="'+data[i]['j_num']+'" data-surplus_num="'+data[i]['surplus_num']+'" data-c_no="'+data[i]['c_no']+'" ' +
                                    'data-j_price="'+data[i]['j_price']+'">'+data[i]['c_name']+' '+data[i]['size']+'</option>';
                            }
                            $("#ticketcart-c_id").html(op_str);
                            $("#chancel_storage").hide();
                        }
                    }
                });
            }
        });

        $("#chancel_storage").bind('click',function(){
            $.ajax({
                type: "POST",
                url: "/ajax/getdata",
                data: {'module': 'agreement-material-get', 'h_id': $(this).attr('data-h_id'), 'k_id': $(this).attr
                    ('data-k_id'),'chancel_storage':1},
                success: function (data) {
                    data = JSON.parse(data);
                    data = data.data;
                    //console.log(data);
                    if (data.error) {
                        layer.msg(data.msg, {icon: 6});
                    } else {
                        $("#ticketcart-c_id").attr('disabled',false);
                        var op_str='<option value="">请选择合同商砼</option>';
                        for (i = 0; i < data.length; i++) {
                            op_str=op_str+'<option value="'+data[i]['c_id']+'" data-jc_id="'+data[i]['jc_id']+'" data-size="'+data[i]['size']+'" data-num="'+data[i]['num']+'" data-j_num="'+data[i]['j_num']+'" data-surplus_num="'+data[i]['surplus_num']+'" data-c_no="'+data[i]['c_no']+'" ' +
                                'data-j_price="'+data[i]['j_price']+'">'+data[i]['c_name']+' '+data[i]['size']+'</option>';
                        }
                        $("#ticketcart-c_id").html(op_str);
                        $("#chancel_storage").hide();
                        $("#pour_num").val('');
                        $('#dtoastorage-total_price').val('');
                    }
                }
            });
        });

        $("#ticketcart-c_id").bind('change',function(){
            if($(this).val()!=''){
                selected = $("#ticketcart-c_id option:selected");
                $("#c_no_item").val(selected.attr('data-c_no'));
                $("#num_item").val(selected.attr('data-num'));
                $("#j_price_item").val(parseFloat(selected.attr('data-j_price')));
                $("#jc_id").val(selected.attr('data-jc_id'));
                $("#j_num").val(selected.attr('data-j_num'));
                $("#surplus_num").val(selected.attr('data-surplus_num'));
                $("#pour_num").val('');
                $("#dtoastorage-total_price").val('');
                if($("#j_num").val()>0){
                    $("#pour_num").attr('placeholder','未入库：'+$("#surplus_num").val());
                }else{
                    $("#pour_num").attr('placeholder','不限量');
                }
                var size = selected.attr('data-size');
                var match=0;
                if(size!=''){
                    $.each($('#hc_grade option'), function() {
                        if($(this).val()!=''){
                            if(size.toLowerCase().indexOf($(this).val().toLowerCase())!=-1){
                                $('#hc_grade').val($(this).val());
                                $("#hc_grade").attr('disabled',true);
                                match=1;
                                return;
                            }
                        }
                    });
                }
                if(match==0){
                    layer.msg('商砼强度等级无法识别，请手动选择', {icon: 6});
                    $("#hc_grade").attr('disabled',false);
                    $('#hc_grade').val('');
                }
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

    $('#ticketcart-use_date').datetimepicker({
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

    $('input.float_check').each(function(){
        $(this).on('keyup',function() {
            $(this).val($(this).val().replace(/^(\d+)\.(\d{0,3}).*$/,'$1.$2'));
            if($(this).val()!='' && $("#j_price_item").val()!=''){
                if($("#j_num").val()!=0){
                    if(parseFloat($(this).val()) >= parseFloat($("#surplus_num").val())){
                        $(this).val($("#surplus_num").val());
                    }
                }
                var total_price = mathmul(parseFloat($("#pour_num").val()),parseFloat($("#j_price_item").val()))
            }else{
                var total_price = 0;
            }
            total_price = parseFloat(formatMoney(total_price));
            $("#dtoastorage-total_price").val(total_price);
        });
    });

    $(".storage-update-save").bind('click',function(){
        var check = true;
        if($('#dtoastorage-s_id').val()=='' || $('#dtoastorage-h_id').val()=='' || $('#dtoastorage-total_price').val()<=0){
            check=false;
        }
        $("#hc_grade").attr('disabled',false);
        if($('#ticketcart-c_id').val()=='' || $('#ticket_num').val()=='' || $('#pour_num').val()=='' ||
            $('#use_place').val()=='' ||
            $('#use_style').val()=='' || $('#ticketcart-use_date').val()=='' || $('#hc_grade').val()=='' ){
            check=false;
        }
        if(check){
            $("#ticketcart-c_id").attr('disabled',false);
            $("#dtoastorage-next_admin_id").attr('disabled',false);
            $("#storage-update").submit();
        }else {
            $("#hc_grade").attr('disabled',true);
            layer.msg('所有项都需要填写！', {icon: 6});
        }
    });
</script>