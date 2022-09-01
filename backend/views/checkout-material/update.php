<?php

use backend\models\DtoaAgreement;
use backend\models\DtoaApprovalGroup;
use backend\models\DtoaCategory;
use backend\models\DtoaItems;
use backend\models\DtoaMaterial;
use backend\models\DtoaPlan;
use backend\models\DtoaProject;
use backend\models\DtoaSupplier;
use jinxing\admin\models\Admin;
use jinxing\admin\models\AdminUser;
use backend\models\DtoaStorage;
use yii\helpers\Html;
use yii\helpers\Json;
use yii\web\ForbiddenHttpException;
use yii\widgets\ActiveForm;
$this->title = '材料出库';

$supplier=DtoaSupplier::find()->select(['s_name'])->indexBy('s_id')->column();
$agreement=DtoaAgreement::find()->select(['h_name'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->indexBy('h_id')->column();
$agreement[0]='';
$category=DtoaCategory::find()->select(['cname'])->indexBy('cid')->column();
$category[0]='';

$user=AdminUser::find()->andWhere(['status' => AdminUser::STATUS_ACTIVE])->select(['name'])->indexBy('id')->column();
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
    #storagecart-box tr td{line-height:26px;}
    input.storage_ok{width:18px !important;height: 18px !important; margin-left: 5px;margin-top:5px;}
    input.edit_input{width:100px !important;height:26px;font-size: 14px;line-height: 26px !important;padding:0;}
</style>
<link href="/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
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
                <?= $form->field($model, 'k_no')->textInput(['readonly' => 'true'])->label('出库单号') ?>
            </div>
            <div class="col-md-4">
                <?=$form->field($model, 's_id')->dropdownList($supplier,['disabled' => 'true'])?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <?=$form->field($model, 'k_status')->dropdownList(DtoaStorage::STORAGE_STATUS,['disabled' => 'true'])?>
            </div>
            <div class="col-md-4">
                <?=$form->field($model, 'c_status')->dropdownList(DtoaStorage::CHECKOUT_STATUS,['disabled' => 'true'])?>
            </div>
            <div class="col-md-4">
                <?=$form->field($model, 'total_price')->textInput(['readonly' => 'true'])?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <?=$form->field($model, 'next_admin_id')->dropdownList([$model->next_admin_id=>$user[$model->next_admin_id]],['disabled'
                => 'true'])?>
            </div>
            <div class="col-md-4">
                <?=$form->field($model, 'checkout_time')->textInput(['readonly' => 'true'])?>
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'c_info')->textarea(['maxlength' => true,'rows' => 1,'readonly' => 'true']) ?>
            </div>
        </div>

        <ul style="list-style: none; padding: 0 10px; border: 1px silver dashed; margin: 0 0 10px;">
            <p>已出库的材料列表：</p>
            <table class="table table-bordered table-condensed table-striped text-nowrap" style="margin-top: 10px;border: 1px
            solid #ddd;">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>材料编码</th>
                    <th>材料名</th>
                    <th>规格型号</th>
                    <th>材质</th>
                    <th>计量单位</th>
                    <th>计划编号</th>
                    <th>合同编号</th>
                    <th>出库数量</th>
                    <th>出库单价</th>
                    <th>出库金额</th>
                </tr>
                </thead>
                <tbody id="storagecart-box">
                <?php foreach ($storagecart as $k => $cart) { ?>
                    <tr data-sc_id="<?=$cart['sc_id']?>">
                        <td><?= $k+1 ?></td>
                        <td><?=$cart['c_no']?></td>
                        <td><?=$cart['c_name']?></td>
                        <td><?=$cart['size']?></td>
                        <td><?=$cart['quality']?></td>
                        <td><?=$cart['num']?></td>
                        <td><?=$cart['j_no']?></td>
                        <td><?=$cart['h_no']?></td>
                        <td><div style="width:180px;height:30px;"><input type="text" class="edit_input j_num_item num_check" value="<?=floatval($cart['j_real_num'])?>" readonly>
                            </div></td>
                        <td><input type="text" class="edit_input j_price_item float_check" value="<?=floatval($cart['j_real_price'])?>" readonly></td>
                        <td><?=floatval(bcmul($cart['j_real_num'],$cart['j_real_price']))?></td>
                    </tr>
                <?php } ?>
                </tbody>
            </table>
        </ul>

        <?php ActiveForm::end(); ?>
    </div>

    <h3>
        <?php if($model['c_status']==0){ ?>
            <button type="button" class="btn btn-success btn-sm" id="checkout_btn">确认材料出库</button>
        <?php } ?>
        <?php if($model['c_status']==1){ ?>
            <button type="button" class="btn btn-success btn-sm" id="print_btn" data-module="checkout" data-id="<?=$model['k_id']?>" data-title="材料出库单">打印</button>
        <?php } ?>
    </h3>

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
<div id="print_box" style="display: none;margin:0;padding: 10px;font-size: 12px;">
    <h2 class="text-center" style="font-size: 14px;"></h2>
    <table class="table table-bordered table-condensed" id="print_model" style="font-size: 12px;">
    </table>
    <table class="table table-bordered table-condensed" id="print_cart" style="font-size: 12px;">
    </table>
</div>
<link rel="stylesheet" href="/css/PrintArea.css" />
<script src="/js/jquery.PrintArea.js"></script>
<script type="text/javascript">
    function repeat(target, n) {
        var s = target, total = "";
        while (n > 0) {
            if (n % 2 == 1) {
                total += s;
            }
            if (n == 1) {
                break;
            }
            s += s;
            n = n >> 1;//相当于将n除以2取其商，或者说是开2次方
        }
        return total;
    }
    $(function(){
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

        $("#checkout_btn").bind("click",function(){
            layer.prompt({
                formType: 2, //输入框类型，支持0（文本）默认1（密码）2（多行文本）
                value: '', //初始时的值，默认空字符
                maxlength: 120, //可输入文本的最大长度，默认500
                title: '确认出库，请填写出库备注',
                area: ['300px', '100px'] //自定义文本域宽高
            },function(val, index){
                //layer.msg('得到了'+val);
                $.ajax({
                    type: "POST",
                    url: "/checkout-material/update",
                    data: {'k_id':<?=$model['k_id']?>,'c_info':val},
                    success: function (data) {
                        //console.log(data);
                        if(data.errCode){
                            layer.msg(data.msg, {icon: 6});
                        }else{
                            //layer.msg(data.msg, {icon: 6});
                            window.location.reload();
                        }
                    }
                });
                layer.close(index);
            });
        });
        $("#print_btn").bind("click",function(){
            var title = $(this).attr("data-title");
            $.ajax({
                type: "POST",
                url: "/ajax/getdata",
                data: {'module':'print-get','view':$(this).attr("data-module"),'id':$(this).attr("data-id")},
                success: function (data) {
                    data=JSON.parse(data);
                    if(data.error){
                        layer.msg('打印出错', {icon: 6});
                    }else{
                        var print_data = data.data;
                        $("#print_box h2").html(title);
                        var head = print_data.head;
                        var cart = print_data.cart;
                        var cart_head = print_data.cart_head;
                        $("#print_model").html('');
                        $("#print_cart").html('');
                        for (i = 0; i < head.length; i++) {
if($.inArray(head[i].k_name,['total_price','j_num','j_price','mul_price', 'j_real_num','j_real_price','pour_num'])!=-1){
                                print_data.model[head[i].k_name]=parseFloat(print_data.model[head[i].k_name]);
                            }
                            if(i%4==0){
                                model_th='<thead><tr><th width="20%">'+head[i].k_title+'：</th>';
                                if(print_data.model[head[i].k_name]==null){
                                    model_td='<tbody><tr><td></td>';
                                }else{
                                    model_td='<tbody><tr><td>'+print_data.model[head[i].k_name]+'</td>';
                                }
                            }else if(i%4==3){
                                model_th=model_th+'<th width="20%">'+head[i].k_title+'：</th></tr></thead>';
                                if(print_data.model[head[i].k_name]==null){
                                    model_td=model_td+'<td></td></tr></tbody>';
                                }else{
                                    model_td=model_td+'<td>'+print_data.model[head[i].k_name]+'</td></tr></tbody>';
                                }
                                $("#print_model").append(model_th).append(model_td);
                            }else{
                                model_th=model_th+'<th width="30%">'+head[i].k_title+'：</th>';
                                if(print_data.model[head[i].k_name]==null){
                                    model_td=model_td+'<td></td>';
                                }else{
                                    model_td=model_td+'<td>'+print_data.model[head[i].k_name]+'</td>';
                                }
                            }
                            if(i==head.length-1 && i%4!=3){
                                model_th=model_th+repeat('<th></th>',3-(i%4))+'</tr></thead>';
                                model_td=model_td+repeat('<td></td>',3-(i%4))+'</tr></tbody>';
                                $("#print_model").append(model_th).append(model_td);
                            }
                        }
                        var cart_head_html='<thead style="display: table-header-group;"><tr>';
                        for (i = 0; i < cart_head.length; i++) {
                            cart_head_html=cart_head_html+'<th>'+cart_head[i].k_title+'</th>';
                        }
                        cart_head_html=cart_head_html+'</tr></thead>';
                        $("#print_cart").append(cart_head_html);
                        var cart_html='<tbody>';
                        var cart_tr='';
                        for (i = 0; i < cart.length; i++) {
                            cart_tr=cart_tr+'<tr>';
                            for (j = 0; j < cart_head.length; j++) {
                                cart_tr=cart_tr+'<td>'+cart[i][cart_head[j].k_name]+'</td>';
                            }
                            cart_tr=cart_tr+'</tr>';
                        }
                        cart_html=cart_html+cart_tr+'</tbody>';
                        var cart_foot_html='<tfoot style="display: table-footer-group;"><tr><td colspan="9">' +
                        '<ul style="width: 98%;display:block;height:22px; line-height:22px;list-style:none;margin: 0;padding: 0;">' +
                            '<li style="float:left;width: 25%;">编制人员:</li>'+
                            '<li style="float:left;width: 25%;">材料员:</li>'+
                            '<li style="float:left;width: 25%;">领取人:</li>'+
                            '<li style="float:left;width: 25%;"></li>'+
                        '</ul></td></tr></tfoot>';
                        cart_html=cart_html+cart_foot_html;
                        $("#print_cart").append(cart_html);
                        $("#print_box").show();
                        $("#print_box").printArea({
                            /*mode : 'popup',
                            popHt: 500,
                            popWd: 400,
                            popX : 200,
                            popY : 200,*/
                        });
                        $("#print_box").hide();
                    }
                }
            });
        });
    });
</script>