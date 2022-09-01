<?php

use backend\models\DtoaCategory;
use backend\models\DtoaMaterial;
use backend\models\DtoaPrePlan;
use backend\models\DtoaProject;
use backend\models\DtoaSupplier;
use jinxing\admin\models\AdminUser;
use yii\helpers\Html;
use yii\helpers\Json;
use yii\widgets\ActiveForm;
$this->title = '采购意向单: ' . $model->j_name;
if($access==0){
    $this->title = $this->title.'（只读权限）';
}
$user=AdminUser::find()->andWhere(['status' => AdminUser::STATUS_ACTIVE])->select(['name'])->indexBy('id')->column();
/* @var $this yii\web\View */
/* @var $model backend\models\DtoaPrePlan */
bcscale(3);
?>
<style>
    .row{margin: 5px 0;}.row .form-group{width:100% !important;}.row input,.row select,.row textarea{width: 300px !important;}
    select:disabled{appearance:none !important;-moz-appearance:none !important;-webkit-appearance:none !important;}
</style>
<div class="dtoa-plan-update">
    <div class="dtoa-plan-form" style="">
        <?php $form = ActiveForm::begin([
            'id' => 'plan-update',
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
                <?=$form->field($model, 's_id')->dropdownList([$model['s_id']=>DtoaSupplier::findOne($model['s_id'])['s_name']],['disabled' => 'true'])?>
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'j_no')->textInput(['readonly' => 'true','value'=>$model['j_no']]) ?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <?= $form->field($model, 'j_name')->textInput(['maxlength' => true,'readonly' => 'true']) ?>
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'need_date')->textInput(['maxlength' => true,'readonly' => 'true']) ?>
            </div>
            <div class="col-md-4">
                <?=$form->field($model, 'next_admin_id')->dropdownList([$model['next_admin_id']=>$user[$model['next_admin_id']]],['disabled' => 'true'])?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <?= $form->field($model, 'j_status')->dropdownList([$model['j_status']=>DtoaPrePlan::PLAN_STATUS[$model['j_status']]],['disabled' => 'true'])?>
            </div>
            <div class="col-md-4"><?= $form->field($model, 'total_price')->textInput(['readonly' => 'true','value'=>floatval($model['total_price'])]) ?></div>
            <div class="col-md-4"><?= $form->field($model, 'j_info')->textarea(['maxlength' => true,'readonly' => 'true','rows' => 1])
                ?></div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <?= $form->field($model, 'approval_time')->textInput(['maxlength' => true,'readonly' => 'true']) ?>
            </div>
        </div>

        <ul style="list-style: none; padding:0 10px; border: 1px silver dashed; margin: 0 0 10px;">
            <p style="font-weight: bold;margin:5px 5px 5px 0;">已添加的材料列表：</p>
            <table class="table table-bordered table-condensed table-striped" style="margin-top: 10px;border: 1px solid #ddd;">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>材料编码</th>
                    <th>材料名</th>
                    <th>规格型号</th>
                    <th>材质</th>
                    <th>计量单位</th>
                    <th>采购数量</th>
                    <th>采购单价</th>
                    <th>采购金额</th>
                    <th>采购备注</th>
                    <th>创建时间</th>
                </tr>
                </thead>
                <tbody id="plancart-box">
                <?php foreach ($plancart as $k => $cart) { ?>
                    <tr>
                        <td><?= $k+1 ?></td>
                        <td><?=$cart['c_no']?></td>
                        <td><?=$cart['c_name']?></td>
                        <td><?=$cart['size']?></td>
                        <td><?=$cart['quality']?></td>
                        <td><?=$cart['num']?></td>
                        <td><?=floatval($cart['j_num'])?></td>
                        <td><?=floatval($cart['j_price'])?></td>
                        <td><?=floatval(bcmul($cart['j_num'],$cart['j_price']))?></td>
                        <td><?=$cart['jc_info']?></td>
                        <td><?=$cart['created_at']?></td>
                    </tr>
                <?php } ?>
                </tbody>
            </table>
        </ul>
        <?php ActiveForm::end(); ?>
    </div>
    <h3>
            <form method="post" action="/site/export" style="display: inline-block">
                <input type="hidden" name="_csrf-backend" value="<?= Yii::$app->request->csrfToken ?>">
                <input type="hidden" name="module" value="preplan">
                <input type="hidden" name="title" value="<?=$this->title?>">
                <input type="hidden" name="id" value="<?=$model['j_id']?>">
                <button type="submit" class="btn btn-primary btn-sm" id="export_btn">导出</button>
            </form>
        <?php if($model['j_status']>=2){ ?>
            <button type="button" class="btn btn-success btn-sm" id="print_btn" data-module="preplan" data-id="<?=$model['j_id']?>" data-title="采购意向单">打印</button>
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
<div id="print_box" style="display: none;margin:0;padding: 10px;font-size: 12px;">
    <h2 class="text-center" style="font-size: 14px;"></h2>
    <table class="table table-bordered table-condensed" id="print_model" style="font-size: 12px;">
    </table>
    <table class="table table-bordered table-condensed" id="print_cart" style="font-size: 12px;">
    </table>
</div>
<link rel="stylesheet" href="/css/PrintArea.css" />
<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/js/jquery.PrintArea.js"></script>
<script src="/layer/layer.js"></script><script src="/js/common.js"></script>
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
                        var cart_foot_html='<tfoot style="display: table-footer-group;"><tr><td colspan="7">' +
                            '<ul style="width: 98%;display:block;height:22px; line-height:22px;list-style:none;margin: 0;padding: 0;">' +
                            '<li style="float:left;width: 25%;">编制人员:</li>'+
                            '<li style="float:left;width: 25%;">材料员:</li>'+
                            '<li style="float:left;width: 25%;">部门经理:</li>'+
                            '<li style="float:left;width: 25%;">主管经理:</li>'+
                            '</ul></td></tr></tfoot>';
                        cart_html=cart_html+cart_foot_html;
                        $("#print_cart").append(cart_html);
                        $("#print_box").show();
                        $("#print_box").printArea();
                        $("#print_box").hide();
                    }
                }
            });
        });
    });
</script>