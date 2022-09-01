<?php

use backend\models\DtoaAgreement;
use backend\models\DtoaApproval;
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
$this->title = '查看商砼小票入库审批';

$supplier=DtoaSupplier::find()->select(['s_name'])->indexBy('s_id')->column();

$s_id_arr=DtoaAgreement::find()->select(['s_id'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['h_status'=>2])->groupBy('s_id')->asArray()->all();
$s_id_arr=array_column($s_id_arr,'s_id');
$agreement_supplier=DtoaSupplier::find()->select(['s_name'])->andWhere(['in', 's_id', $s_id_arr])->indexBy('s_id')->column();

$agreement=DtoaAgreement::find()->select(['h_name'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['h_status'=>2])->indexBy('h_id')->column();

$user=AdminUser::find()->andWhere(['status' => AdminUser::STATUS_ACTIVE])->select(['name'])->indexBy('id')->column();
$approval=DtoaApproval::find()->andWhere(['g_id' => $model['g_id']])->andWhere(['table_index' => 3])->andWhere(['target_id' => $model['k_id']])->asArray()->all();
if($access==0){
    $this->title = $this->title.'（只读权限）';
}
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
    input.a_status{width:18px !important;}
</style>
<link href="/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
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
                <?= $form->field($model, 'k_no')->textInput(['readonly' => 'true']) ?>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <span style="width:80px;text-align: right; display: inline-block;margin-right: 5px;">
                        <label class="control-label">进场日期</label> </span>
                    <input type="text" class="form-control" name="DtoaStorage[arrival_date]"
                           id="dtoastorage-arrival_date" value="<?=$model->arrival_date?>" readonly>
                    <div class="help-block"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <?=$form->field($model, 's_id')->dropdownList($agreement_supplier,['disabled' => 'true'])?>
            </div>
            <div class="col-md-4">
                <?=$form->field($model, 'h_id')->dropdownList($agreement,['disabled' => 'true'])?>
            </div>
            <div class="col-md-4">
                <div class="form-group field-dtoa_ticket_cart">
                    <span style="width:80px;text-align: right; display: inline-block;margin-right: 5px;">
                        <label class="control-label" for="c_id">商砼名称</label> </span>
                    <select id="ticketcart-c_id" class="form-control" name="DtoaTicketCart[c_id]" disabled>
                        <option value="<?=$storagecart['c_id']?>"><?=$storagecart['c_name']?></option>
                    </select>
                    <div class="help-block"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <span style="width:80px;text-align: right; display: inline-block;margin-right: 5px;">
                        <label class="control-label">商砼编号</label> </span>
                        <input type="text" class="form-control" id="c_no_item" value="<?=$storagecart['c_no']?>" disabled>
                    <div class="help-block"></div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <span style="width:80px;text-align: right; display: inline-block;margin-right: 5px;">
                        <label class="control-label">计量单位</label> </span>
                    <input type="text" class="form-control" id="num_item" value="<?=$storagecart['num']?>" disabled>
                    <div class="help-block"></div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <span style="width:80px;text-align: right; display: inline-block;margin-right: 5px;">
                        <label class="control-label">商砼单价</label> </span>
                    <input type="text" class="form-control" id="j_price_item" name="DtoaTicketCart[j_price]"
                           value="<?=$storagecart['j_price']?>" readonly>
                    <div class="help-block"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <span style="width:80px;text-align: right; display: inline-block;margin-right: 5px;">
                <label class="control-label">浇筑方式</label> </span>
                <select name="DtoaTicketCart[use_style]" id="use_style" class="form-control" disabled>
                    <option value="<?=$storagecart['use_style']?>"><?=DtoaTicketCart::USE_STYLE[$storagecart['use_style']]?></option>
                </select>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <span style="width:80px;text-align: right; display: inline-block;margin-right: 5px;">
                        <label class="control-label">浇筑日期</label> </span>
                    <input type="text" class="form-control" name="DtoaTicketCart[use_date]" id="ticketcart-use_date"
                           value="<?=$storagecart['use_date']?>" readonly>
                    <div class="help-block"></div>
                </div>
            </div>
            <div class="col-md-4">
                    <span style="width:80px;text-align: right; display: inline-block;margin-right: 5px;">
                    <label class="control-label">强度等级</label> </span>
                    <select name="DtoaTicketCart[hc_grade]" id="hc_grade" class="form-control" disabled>
                        <option value="<?=$storagecart['hc_grade']?>"><?=DtoaTicketCart::HC_GRADE[$storagecart['hc_grade']]?></option>
                    </select>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <span style="width:80px;text-align: right; display: inline-block;margin-right: 5px;">
                        <label class="control-label">小票张数</label> </span>
                    <input type="text" class="form-control" name="DtoaTicketCart[ticket_num]" id="ticket_num" value="<?=$storagecart['ticket_num']?>" readonly>
                    <div class="help-block"></div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <span style="width:80px;text-align: right; display: inline-block;margin-right: 5px;">
                        <label class="control-label">施工部位</label> </span>
                    <input type="text" class="form-control" name="DtoaTicketCart[use_place]" id="use_place" value="<?=$storagecart['use_place']?>" readonly>
                    <div class="help-block"></div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <span style="width:80px;text-align: right; display: inline-block;margin-right: 5px;">
                        <label class="control-label">浇筑方量</label> </span>
                    <input type="text" class="form-control num_check" name="DtoaTicketCart[pour_num]"
                           value="<?=$storagecart['pour_num']?>" id="pour_num" readonly>
                    <input type="hidden" id="j_num" name="DtoaTicketCart[j_num]">
                    <div class="help-block"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <?=$form->field($model, 'k_status')->dropdownList(DtoaStorage::STORAGE_STATUS,['disabled' => 'true'])?>
            </div>
            <div class="col-md-4">
                <?=$form->field($model, 'total_price')->textInput(['readonly' => 'true'])?>
            </div>
            <div class="col-md-4">
                <?=$form->field($model, 'next_admin_id')->dropdownList([$model->next_admin_id=>$user[$model->next_admin_id]],['disabled' => 'true'])?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <?= $form->field($model, 'approval_time')->textInput(['readonly' => 'true']) ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'k_info')->textarea(['maxlength' => true,'rows' => 1,'readonly' => 'true']) ?>
            </div>
            <div class="col-md-4">
            </div>
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

    <h3>
        <form method="post" action="/site/export" style="display: inline-block">
            <input type="hidden" name="_csrf-backend" value="<?= Yii::$app->request->csrfToken ?>">
            <input type="hidden" name="module" value="storage-ticket">
            <input type="hidden" name="title" value="<?=$this->title?>">
            <input type="hidden" name="id" value="<?=$model['k_id']?>">
            <button type="submit" class="btn btn-primary btn-sm" id="export_btn">导出</button>
        </form>
        <?php if($model['k_status']>=2){ ?>
        <button type="button" class="btn btn-success btn-sm" id="print_btn" data-module="storage-ticket"
                data-id="<?=$model['k_id']?>" data-title="商砼入库单">打印</button>
        <?php } ?>
    </h3>

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
                                model_td=model_td+repeat('<td></td>',3-(i%4))+'</td></tr></tbody>';
                                $("#print_model").append(model_th).append(model_td);
                            }
                        }

                        for (i = 0; i < cart_head.length; i++) {
                            if(i%4==0){
                                cart_th='<thead><tr><th width="20%">'+cart_head[i].k_title+'</th>';
                                cart_td='<tbody><tr><td>'+cart[0][cart_head[i].k_name]+'</td>';
                            }else if(i%4==3){
                                cart_th=cart_th+'<th width="20%">'+cart_head[i].k_title+'</th></tr></thead>';
                                cart_td=cart_td+'<td>'+cart[0][cart_head[i].k_name]+'</td></tr></tbody>';
                                $("#print_cart").append(cart_th).append(cart_td);
                            }else{
                                cart_th=cart_th+'<th width="30%">'+cart_head[i].k_title+'</th>';
                                cart_td=cart_td+'<td>'+cart[0][cart_head[i].k_name]+'</td>';
                            }
                            if(i==cart_head.length-1 && i%4!=3){

                                cart_th=cart_th+repeat('<th></th>',3-(i%4))+'</tr></thead>';
                                cart_td=cart_td+repeat('<td></td>',3-(i%4))+'</td></tr></tbody>';
                                $("#print_cart").append(cart_th).append(cart_td);
                            }
                        }
                        var cart_foot_html='<tfoot style="display: table-footer-group;"><tr><td colspan="4">' +
                            '<ul style="width: 98%;display:block;height:22px; line-height:22px;list-style:none;margin: 0;padding: 0;">' +
                            '<li style="float:left;width: 25%;">编制人员:</li>'+
                            '<li style="float:left;width: 25%;">材料员:</li>'+
                            '<li style="float:left;width: 25%;">部门经理:</li>'+
                            '<li style="float:left;width: 25%;">主管经理:</li>'+
                            '</ul></td></tr></tfoot>';
                        $("#print_cart").append(cart_foot_html);
                        $("#print_box").show();
                        $("#print_box").printArea();
                        $("#print_box").hide();
                    }
                }
            });
        });
    });
</script>