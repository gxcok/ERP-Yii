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
$this->title = '更新租赁入库';

$uid_arr=DtoaApprovalGroup::find()->select(['uid_arr'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['item_id'=>10])->asArray()->one();
$uid_arr=json_decode($uid_arr['uid_arr'],true);
$next_admin_id=$uid_arr[1][0];

/*//获取当前工程所有等待入库的供应商
$s_id_arr=DtoaAgreement::find()->select(['s_id'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['h_status'=>2])->groupBy('s_id')->asArray()->all();
$s_id_arr=array_column($s_id_arr,'s_id');
$agreement_supplier=DtoaSupplier::find()->select(['s_name'])->andWhere(['in', 's_id', $s_id_arr])->indexBy('s_id')->column();*/

$supplier=DtoaSupplier::find()->select(['s_name'])->indexBy('s_id')->column();
$agreement=DtoaAgreement::find()->select(['h_name'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->indexBy('h_id')->column();
$agreement[0]='';

$user=AdminUser::find()->andWhere(['status' => AdminUser::STATUS_ACTIVE])->select(['name'])->indexBy('id')->column();
bcscale(3);
/* @var $this yii\web\View */
/* @var $model backend\models\DtoaPlan */
?>
<style>
    body{background: #fff !important;}
    .row{margin: 5px 0;}.row .form-group{width:100% !important;}.row input,.row select,.row textarea{width: 300px !important;}
    select:disabled{appearance:none !important;-moz-appearance:none !important;-webkit-appearance:none !important;}
    #storagecart-box tr td{height: 40px;line-height: 40px;}
    #storagecart-box tr td input{float:left;display: inline-block;line-height:26px;}
    .m-add input,.m-add select,.m-add textarea{width:200px !important;height:26px;line-height:26px;}
    .m-add td{line-height:26px !important;}

    input::-webkit-input-placeholder, textarea::-webkit-input-placeholder {color: #939192;font-size: 12px;}
    input:-moz-placeholder, textarea:-moz-placeholder {color: #939192;font-size: 12px;}
    input::-moz-placeholder, textarea::-moz-placeholder {color: #939192;font-size: 12px;}
    input:-ms-input-placeholder, textarea:-ms-input-placeholder {color: #939192;font-size: 12px;}
    .warning{border: 2px solid red !important;}
    .help-block{text-indent: 90px;}
    .m-add input,.m-add select,.m-add textarea{width:100px !important;height:26px;line-height:26px;}
    .m-add td{line-height:26px !important;}
    #storagecart-box tr td{line-height:26px;}
    input.storage_ok_item,input.storage_ok{width:16px !important;height: 16px !important; margin-left: 5px;margin-top:5px;}
    #storagecart-box tr td input.edit_input{width:100px !important;height:26px;line-height: 26px !important;
        font-size: 14px;padding:0;}
    input.one_price{border: 0;width:150px !important;height:26px;line-height:26px;font-size: 14px;padding:0;}
    input.long_input{width:200px !important;}
    input[type="text"]{color: #000;font-weight: bold;line-height:26px !important;height:26px;}
    .m-add td input[type="text"]{height:26px;line-height:26px !important;padding:0;}
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
                <?= $form->field($model, 'k_no')->textInput(['readonly' => 'true']) ?>
            </div>
            <div class="col-md-4">
                <?=$form->field($model, 'k_source')->dropdownList($model::STORAGE_SOURCE,['disabled' => 'true'])?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <?=$form->field($model, 's_id')->dropdownList($supplier,['disabled' => 'true'])?>
            </div>
            <div class="col-md-4">
                <?=$form->field($model, 'h_id')->dropdownList($agreement,['disabled' => 'true'])?>
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'arrival_date')->textInput() ?>
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

            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <?=$form->field($model, 'next_admin_id')->dropdownList([$next_admin_id=>$user[$next_admin_id]],['disabled' => 'true'])?>
            </div>
            <div class="col-md-4">
                <?= $form->field($model, 'k_info')->textarea(['maxlength' => true,'rows' => 1]) ?>
            </div>
        </div>

        <ul style="list-style: none; padding: 0 10px; border: 1px silver dashed; margin: 0 0 10px;">
            <h2 style="margin: 5px 0;"><a class="btn btn-primary btn-sm" id="add_storagecart" data-k-id="<?=$model['k_id']?>">选择入库租赁</a></h2>
            <p>已入库的租赁列表：</p>
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
                    <th>合同编号</th>
                    <th>数量</th>
                    <th>可用数量</th>
                    <th>租赁时间</th>
                    <th>可租赁时间</th>
                    <th>租赁时间单位</th>
                    <th>单价</th>
                    <th>合同单价</th>
                    <th>入库金额</th>
                    <th style="width: 300px !important;">入库备注</th>
                    <th>入库时间</th>
                    <th>操作</th>
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
                        <td><?=$cart['h_no']?></td>
                        <td><input type="text" class="edit_input j_real_num_item <?php if($cart['over_num']==1){?>warning<?php }?>" value="<?=floatval($cart['j_real_num'])
                            ?>" readonly></td>
                        <td></td>
                        <td><div style="display: block;width:150px;"><input type="text" class="edit_input real_time_item
                        <?php if ($cart['over_time']==1) {?>warning<?php }?>" value="<?=empty(floatval($cart['real_time']))?'':floatval($cart['real_time'])?>" readonly>
                            <span style="float: left;width:50px;"><input type="checkbox" class="storage_ok_item" disabled <?php if($cart['storage_ok']==1)
                            {?>checked<?php }?>></span></div>
                        </td>
                        <td></td>
                        <td><?=$cart['lease_time_unit']?></td>
                        <td><input type="text" class="edit_input j_price_item" value="<?=floatval($cart['j_real_price'])?>" readonly>
                            <input type='hidden' class="j_price" value="<?=floatval($cart['j_price'])?>">
                        </td>
                        <td><?=floatval($cart['j_price'])?></td>
                        <td><input type='text' class='one_price' value="<?=floatval($cart['one_price'])?>" readonly></td>
                        <td style="width: 300px !important;"><?=$cart['jc_info']?></td>
                        <td><?=$cart['created_at']?></td>
                        <td>
                            <button type="button" class="btn btn-xs btn-danger cart-del">删除</button>
                        </td>
                    </tr>
                <?php } ?>
                </tbody>
            </table>
        </ul>

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
<script>
    var supplier = <?=Json::encode($supplier)?>;
    $(function(){
        $("#dtoastorage-total_price").val(parseFloat($("#dtoastorage-total_price").val()));
        if($("#storagecart-box tr").length>0){
            $("#dtoastorage-k_source").attr('disabled',true);
            $("#dtoastorage-s_id").attr('disabled',true);
        }

        $("#add_storagecart").bind('click',function(){
            if($("#dtoastorage-s_id").val()==''){
                layer.msg('请先选择供应商', {icon: 6});
                return ;
            }
            layer.open({
                type: 2,
                //offset: '50px',
                title: '选择入库材料',
                shade: 0.8,
                area: ['1200px', '600px'],
                content: '/agreement/select?s_id='+$("#dtoastorage-s_id").val()+'&h_type=2',
            });
        });

        $(".cart-del").bind('click',function(){
            var sc_id = $(this).parent('td').parent('tr').attr('data-sc_id');
            layer.confirm('确认删除入库材料?', {icon: 3, title: '删除入库材料'}, function (index) {
                $.ajax({
                    type: "POST",
                    url: "/cart/delete",
                    data: {'sc_id':sc_id,'storagecart':1},
                    success: function (data) {
                        //console.log(data);
                        if(data.errCode==0){
                            layer.msg('删除成功', {icon: 6});
                            window.location.reload();
                        }else{
                            layer.msg(data.msg, {icon: 6});
                        }
                    }
                });
                layer.close(index);
                $("#dtoastorage-total_price").val(sum_total_price());
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
        return parseFloat(total_price);
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
                    for (var i in data) {
                        if(data[i]['j_num']==0){
                            var surplus_num='不限';
                        }else{
                            var surplus_num=parseFloat(data[i]['surplus_num']);
                        }
                        if(data[i]['lease_time']==0){
                            var surplus_time='不限';
                        }else{
                            var surplus_time=parseFloat(data[i]['surplus_time']);
                        }
                        input_html = input_html + "<tr class='m-add' data-index='" + (parseInt(i) + n + 1) + "'>" +
                            "<td><span class='tr_index'>" + (parseInt(i)+n+1) + "</span> " +
                            "<input type='hidden' name='DtoaStorageCart[jc_id][]' value='" + data[i]['jc_id'] + "'>" +
                            "<input type='hidden' name='DtoaStorageCart[c_id][]' value='" + data[i]['c_id'] + "'></td>" +
                            "<td>" + data[i]['c_no'] + "</td>" +
                            "<td>" + data[i]['c_name'] + "</td>" +
                            "<td>" + data[i]['size'] + "</td>" +
                            "<td>" + data[i]['quality'] + "</td>" +
                            "<td>" + data[i]['num'] + "</td>" +
                            "<td>" + data[i]['h_no'] +
                            "<input type='hidden' name='DtoaStorageCart[h_id][]' value='" + data[i]['h_id'] + "'>" +
                            "<input type='hidden' name='DtoaStorageCart[h_no][]' value='" + data[i]['h_no'] + "'></td>" +
                            "<td><input type='text' autocomplete='off' name='DtoaStorageCart[j_real_num][]' class='j_real_num_input' data-max='"+surplus_num+"'>" +
                            "<input type='hidden' name='DtoaStorageCart[surplus_num][]' value='" + data[i]['surplus_num'] + "' class='surplus_num'>"+
                            "<input type='hidden' name='DtoaStorageCart[j_num][]' value='" + data[i]['j_num'] + "' class='j_num'>" +
                            "<input type='hidden' name='DtoaStorageCart[over_num][]' class='over_num'></td>" +
                            "<td>"+surplus_num+"</td>" +
                            "<td><div style='display: block;width:150px;'><input type='text' autocomplete='off'" +
                            "name='DtoaStorageCart[real_time][]' class='real_time_input' data-max='"+surplus_time+"'>" +
                            "<span style='float: left;width:50px;'><input type='checkbox' name='DtoaStorageCart[storage_ok][]' class='storage_ok' value='"+ i +"'>" +
                            "<input type='hidden' name='DtoaStorageCart[surplus_time][]' value='" + data[i]['surplus_time'] + "' class='surplus_time'>"+
                            "<input type='hidden' name='DtoaStorageCart[lease_time_unit][]' value='" + data[i]['lease_time_unit'] + "' class='lease_time_unit'>"+
                            "<input type='hidden' name='DtoaStorageCart[lease_time][]' value='" + data[i]['lease_time'] + "' class='lease_time'>" +
                            "<input type='hidden' name='DtoaStorageCart[over_time][]' " +
                            "class='over_time'></span></div></td>" +
                            "<td>"+surplus_time+"</td>" +
                            "<td>"+data[i]['lease_time_unit']+"</td>" +
                            "<td><input type='text' name='DtoaStorageCart[j_real_price][]' class='j_real_price_input'" +
                            " value='" + parseFloat(data[i]['j_price']) +"' readonly>" +
                            "<input type='hidden' name='DtoaStorageCart[j_price][]' class='j_price' value='" + parseFloat(data[i]['j_price']) + "'></td>" +
                            "<td>" + parseFloat(data[i]['j_price']) + "</td>" +
                            "<td><input type='text' class='one_price' readonly></td>" +
                            "<td><input type='text' name='DtoaStorageCart[jc_info][]' class='long_input'></td>" +
                            "<td></td>" +
                            "<td><button type='button' class='btn btn-xs btn-danger addcart-del'>删除</button></td>" +
                            "</tr>";
                    }

                    $("#storagecart-box").append(input_html);
                    /*$("#add_storagecart").hide();*/
                    $('input.j_real_num_input').each(function(){
                        $(this).on('keyup',function() {
                            $(this).val($(this).val().replace(/^(\d+)\.(\d{0,3}).*$/,'$1.$2'))
                            var j_real_num = parseFloat($(this).val());
                            var j_real_price = parseFloat($(this).parent('td').parent('tr').find('.j_real_price_input').val());
                            var real_time = parseFloat($(this).parent('td').parent('tr').find('.real_time_input').val());
                            if(j_real_num>0){
                                var one_price = mathmul(j_real_num,j_real_price);
                                if(real_time>0){
                                    one_price = mathmul(one_price,real_time);
                                }
                            }else{
                                var one_price = 0;
                            }
                            one_price = parseFloat(formatMoney(one_price,3));
                            $(this).parent('td').parent('tr').find('.one_price').val(one_price);
                            $("#dtoastorage-total_price").val(sum_total_price());
                            var lease_time = $(this).parent('td').parent('tr').find('.lease_time').val();
                            var j_num = $(this).parent('td').parent('tr').find('.j_num').val();
                            var surplus_time = $(this).parent('td').parent('tr').find('.surplus_time').val();
                            var surplus_num = $(this).parent('td').parent('tr').find('.surplus_num').val();
                            if(j_num>0 && lease_time>0){
                                if(j_real_num>=surplus_num && real_time>=surplus_time){
                                    $(this).parent('td').parent('tr').find(".storage_ok").prop("checked",true);
                                    $(this).parent('td').parent('tr').find(".storage_ok").attr("disabled",true);
                                }else{
                                    $(this).parent('td').parent('tr').find(".storage_ok").prop("checked",false);
                                    $(this).parent('td').parent('tr').find(".storage_ok").attr("disabled",false);
                                }
                                if(j_real_num>surplus_num){  //数量超出标红
                                    $(this).addClass('warning');
                                    $(this).parent('td').parent('tr').find('.over_num').val(1);
                                }else{
                                    $(this).removeClass('warning');
                                    $(this).parent('td').parent('tr').find('.over_num').val(0);
                                }
                            }
                        });
                    });
                    $('input.real_time_input').each(function(){
                        $(this).on('keyup',function() {
                            $(this).val($(this).val().replace(/^(\d+)\.(\d{0,3}).*$/,'$1.$2'));
                            var real_time = parseFloat($(this).val());
                            var j_real_price = parseFloat($(this).parent('div').parent('td').parent('tr').find('.j_real_price_input').val());
                            var j_real_num = parseFloat($(this).parent('div').parent('td').parent('tr').find('.j_real_num_input').val());
                            if(j_real_num>0){
                                var one_price = mathmul(j_real_num,j_real_price);
                                if(real_time>0){
                                    one_price = mathmul(one_price,real_time);
                                }
                            }else{
                                var one_price = 0;
                            }
                            console.log(j_real_num,real_time,one_price);
                            one_price = parseFloat(formatMoney(one_price,3));
                            $(this).parent('div').parent('td').parent('tr').find('.one_price').val(one_price);
                            $("#dtoastorage-total_price").val(sum_total_price());
                            var lease_time = $(this).parent('div').parent('td').parent('tr').find('.lease_time').val();
                            var j_num = $(this).parent('div').parent('td').parent('tr').find('.j_num').val();
                            var surplus_time = $(this).parent('div').parent('td').parent('tr').find('.surplus_time').val();
                            var surplus_num = $(this).parent('div').parent('td').parent('tr').find('.surplus_num').val();
                            if(j_num>0 && lease_time>0){
                                if(j_real_num>=surplus_num && real_time>=surplus_time){
                                    $(this).parent('div').parent('td').parent('tr').find(".storage_ok").prop("checked",true);
                                    $(this).parent('div').parent('td').parent('tr').find(".storage_ok").attr("disabled",true);
                                }else{
                                    $(this).parent('div').parent('td').parent('tr').find(".storage_ok").prop("checked",false);
                                    $(this).parent('div').parent('td').parent('tr').find(".storage_ok").attr("disabled",false);
                                }
                                if(real_time>surplus_time){  //数量超出标红
                                    $(this).addClass('warning');
                                    $(this).parent('div').parent('td').parent('tr').find('.over_time').val(1);
                                }else{
                                    $(this).removeClass('warning');
                                    $(this).parent('div').parent('td').parent('tr').find('.over_time').val(0);
                                }
                            }
                        });
                    });
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
                            var confirm_ok = confirm(label+'此租赁完成入库?');
                            if(confirm_ok){
                                o.prop("checked",checked);
                            }else{
                                o.prop("checked",!checked);
                            }
                        });
                    });
                    $(".addcart-del").on('click',function(){
                        var parent_tr = $(this).parent('td').parent('tr');
                        layer.confirm('确认删除租赁入库?', {icon: 3, title: '删除租赁入库'}, function (index) {
                            var m_add = parent_tr.nextAll('.m-add');
                            for (i = 0; i < m_add.length; i++) {
                                $(m_add).eq(i).attr('data-index',parseInt($(m_add).eq(i).attr('data-index'))-1);
                                $(m_add).eq(i).find('td span.tr_index').html(parseInt($(m_add).eq(i).find('td span.tr_index').html())-1);
                            }
                            parent_tr.remove();
                            layer.close(index);
                            $("#dtoastorage-total_price").val(sum_total_price());
                        });
                    });
                }
            }
        });
    }

    $(".storage-update-save").bind('click',function(){
        var check = true;
        $("tr.m-add").each(function(){
            var n = $(this).attr("data-index");
            var j_real_num = $(this).find(".j_real_num_input").val();
            var real_time = $(this).find(".real_time_input").val();
            if(j_real_num=='' || parseFloat(j_real_num)<=0){
                layer.msg('第'+n+'行 [数量] 不能为空 和 <=0', {icon: 6});
                check = false;
            }
        });
        if(check){
            if($('#dtoastorage-k_status').val()==1 && $("#storagecart-box tr").length<=0){
                layer.msg('没有选择材料，不能提交审核！', {icon: 6});
            }else{
                $("#dtoastorage-next_admin_id").attr('disabled',false);
                $(".storage_ok").attr('disabled',false);
                $("#storage-update").submit();
            }
        }
    });
</script>