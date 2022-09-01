<?php

use backend\models\DtoaApprovalGroup;
use backend\models\DtoaCategory;
use backend\models\DtoaItems;
use backend\models\DtoaMaterial;
use backend\models\DtoaPrePlan;
use backend\models\DtoaPreCart;
use backend\models\DtoaProject;
use backend\models\DtoaSupplier;
use jinxing\admin\models\Admin;
use jinxing\admin\models\AdminUser;
use yii\helpers\Html;
use yii\helpers\Json;
use yii\web\ForbiddenHttpException;
use yii\widgets\ActiveForm;
$this->title = '采购意向单: ' . $model->j_name;
$uid_arr=DtoaApprovalGroup::find()->select(['uid_arr'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['item_id'=>12])->asArray()->one();
$uid_arr=json_decode($uid_arr['uid_arr'],true);
$next_admin_id=$uid_arr[1][0];

$user=AdminUser::find()->andWhere(['status' => AdminUser::STATUS_ACTIVE])->select(['name'])->indexBy('id')->column();
$supplier=DtoaSupplier::find()->select(['s_name'])->indexBy('s_id')->column();
function getcate($pid = 0){
    $cate = DtoaCategory::find()->andWhere(['pid' => $pid])->asArray()->all();
    if (!empty($cate)) {
        foreach ($cate as $k => $c) {
            $cate[$k]['sub'] = getcate($c['cid']);
        }
    }
    return $cate;
}

$cate = getcate();
function create_cate($catedata)
{
    $catehtml = '';
    foreach ($catedata as $k => $c) {
        if (empty($c['sub'])) {   //如果没有子分类
            $catehtml = $catehtml . "<div class='tree-item' data-id='" . $c['cid'] . "'><i class='icon-remove'></i><div class='tree-item-name'>" . $c['cate_no'] . "</div></div>";
        } else {
            $catehtml = $catehtml . "<div class='tree-folder'><div class='tree-folder-header' data-id='" . $c['cid'] . "'><i 
            class='icon-plus'></i><span class='tree-folder-name item_cate_no'>" . $c['cate_no'] . "</span></div><div class='tree-folder-content' style='display: none'>" . create_cate($c['sub']) . "</div></div>";
        }
    }
    return $catehtml;
}

function create_cate_more($catedata, $parm)
{
    $catehtml = '';
    foreach ($catedata as $k => $c) {
        if ($c['pid'] == 0) {
            $catehtml = $catehtml . "<ul class='cate_ul " . $parm . "' data-pid='0' data-id='" . $c['cid'] . "'>";
        } else {
            $catehtml = $catehtml . "<ul class='cate_ul " . $parm . "' data-pid='" . $c['pid'] . "' data-id='" . $c['cid'] . "' style='display: none'>";
        }
        $catehtml = $catehtml . "<li>" . $c[$parm] . "</li>" . '</ul>';
        if (!empty($c['sub'])) {   //如果有子分类
            $catehtml = $catehtml . create_cate_more($c['sub'], $parm) . '</ul>';
        }
    }
    $catehtml = $catehtml . '</ul>';
    //var_dump($catehtml);
    return $catehtml;
}

$cate_type_arr = DtoaCategory::find()->select(['cate_type'])->groupBy('cate_type')->asArray()->all();
$cate_type_arr = array_column($cate_type_arr, 'cate_type');
$material_model = new DtoaMaterial();
bcscale(3);
/* @var $this yii\web\View */
/* @var $model backend\models\DtoaPrePlan */
?>
<style>
    .row{margin: 5px 0;}
    .row .form-group{width:100% !important;}
    .row input,.row select,.row textarea{width: 300px !important;}
    select:disabled{appearance:none !important;-moz-appearance:none !important;-webkit-appearance:none !important;}
    .row{margin: 5px 0;}.row .form-group{width:100% !important;}.row input,.row select,.row textarea{width: 300px !important;}
    select:disabled{appearance:none !important;-moz-appearance:none !important;-webkit-appearance:none !important;}
    input.a_status{width:18px !important;}
    #material_select_model{padding: 10px;}
    .main-content{margin-left:0;margin-right:0;margin-top:0;min-height:100%;padding:0;}
    .leftbar{width:500px;height:800px;float:none;position:fixed;}
    .right-content{margin-left:520px;}
    #category-box{width:500px;height:500px;overflow-y:scroll;overflow-x:hidden;}
    #material_box{height:550px;width:600px;overflow:scroll;padding:10px;}
    .catebox{width:200px;margin-right:0;position:relative;z-index:1;}
    .item_cate_no{width:200px;display:inline-block;}
    td,th{text-align:center;}
    tr td{padding:5px 0!important;}
    thead,thead th{background-color:#F5F5F5;}
    .cate_ul{list-style:none;width:100%;display:block;margin:0;padding:0;}
    .cate_ul li{display:block;height:31px;line-height:31px;border-bottom:1px #ddd solid;}
    td.cate_td{text-align:left;background-image:url('/images/line1.png');background-repeat:repeat;background-position:0 36px;padding:5px!important;}
    .tree-item{margin-top:-1px!important;}
    .cname{cursor:pointer;}
    ul.cname li{text-align:left;text-indent:5px;}
    .ul-selected{background-color:#8D8D8D;font-weight:700;}
    .category-create{line-height:25px;padding:15px 30px;}
    .category-create label{float:left;width:80px;text-align:right;margin-right:10px;}
    .cate_type_ul{display:inline-block;width:300px;list-style:none;margin:-5px 0 0;padding:0;}
    .cate_type_ul li{float:left;margin:5px;}
    .radio-inline{float:left;width:18px;height:18px;margin:5px 5px 0 0 !important;}
    .select-m{width:18px;height:18px;}
    #material_frame{width:200px;}
    .folder-selected{background-color:#8CA6B5;}
    #category-box::-webkit-scrollbar,#material_box::-webkit-scrollbar{width:15px;}
    .m-add input,.m-add select,.m-add textarea{width:100px !important;height:28px;line-height:28px;}
    .m-add input.long_input{width:250px !important;}
    .m-add td{line-height:28px !important;}
    #plancart-box tr td{line-height:26px;}
    input.edit_input{width:100px !important;height:25px;line-height:25px;font-size: 14px;padding:0;}
    input.one_price{border: 0;width:100px !important;height:25px;line-height:25px;font-size: 14px;padding:0;}
    input.long_input{width:250px !important;}
    input[type="text"]{color: #000;font-weight: bold;}
</style>
<link href="/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<link href="/css/chosen.css" rel="stylesheet">
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
                <?= $form->field($model, 'j_no')->textInput(['readonly' => 'true']) ?>
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
            <div class="col-md-4"><?= $form->field($model, 'total_price')->textInput(['readonly' => 'true']) ?></div>
            <div class="col-md-4"><?= $form->field($model, 'j_info')->textarea(['maxlength' => true,'readonly' => 'true','rows' => 1])
                ?></div>
        </div>

        <ul style="list-style: none; padding: 0 10px; border: 1px silver dashed; margin: 0 0 10px;">
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
                    <th>操作</th>
                </tr>
                </thead>
                <tbody id="plancart-box">
                <?php foreach ($plancart as $k => $cart) { ?>
                    <tr data-jc_id="<?=$cart['jc_id']?>" data-j_id="<?=$model['j_id']?>">
                        <td><?= $k+1 ?></td>
                        <td><?=$cart['c_no']?></td>
                        <td><?=$cart['c_name']?></td>
                        <td><?=$cart['size']?></td>
                        <td><?=$cart['quality']?></td>
                        <td><?=$cart['num']?></td>
                        <td><input type="text" class="edit_input j_num_item num_check" value="<?=floatval($cart['j_num'])?>"></td>
                        <td><input type="text" class="edit_input j_price_item float_check" value="<?=floatval($cart['j_price'])?>"></td>
                        <td><input type='text' class='one_price' value="<?=floatval(bcmul($cart['j_num'],$cart['j_price']))?>" readonly></td>
                        <td><input type="text" class="edit_input long_input jc_info_item" value="<?=$cart['jc_info']?>"></td>
                        <td><?=$cart['created_at']?></td>
                        <td>
                            <button type="button" class="btn btn-xs btn-primary cart-save">保存</button>
                        </td>
                    </tr>
                <?php } ?>
                </tbody>
            </table>
        </ul>
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
    <?php
    //当前审批人是我时
    if(Yii::$app->user->identity->id==$model['next_admin_id']) { ?>
        <?php $form = ActiveForm::begin(['id' => 'approval-pre-plan']); ?>
        <div class="form-inline" style="font-size: 14px; font-weight: bold;">
            <label style="margin: 0 10px;">我的审批意见：</label>
            <?php
            //当前已审批通过时 不再显示通过选项
            if($model['j_status']==1) { ?>
                <input name="a_status" class="a_status radio" type="radio" value="1"> <span style="color: green;">通过</span>
            <?php } ?>
            <input name="a_status" class="a_status radio" type="radio" value="0"> <span style="color: orange;">拒绝</span>
            <input type="hidden" name="approver_id" value="<?=Yii::$app->user->identity->id?>">
            <input type="hidden" name="approver" value="<?=Yii::$app->user->identity->name?>">
            <label style="margin: 0 10px;">备注：</label><input type="text" class="input-large" name="a_info">
            <button type="button" class="btn btn-success btn-sm" id="approval-pre-plan-save">确定审批保存</button>
        </div>
        <?php ActiveForm::end(); ?>
    <?php } ?>
</div>
<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/layer/layer.js"></script><script src="/js/common.js"></script>
<script src="/js/bootstrap-datetimepicker.js"></script>
<script src="/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="/js/chosen.jquery.js"></script>
<script>
    $(function(){
        $('.supplier_select').chosen().trigger('chosen:updated');
        $.each($('input.num_check'), function() {
            $(this).val(parseFloat($(this).val()));
        });
        $.each($('input.float_check'), function() {
            $(this).val(parseFloat($(this).val()));
        });
        $.each($('input.one_price'), function() {
            $(this).val(parseFloat($(this).val()));
        });
        $("#dtoapreplan-total_price").val(parseFloat($("#dtoapreplan-total_price").val()));

        $(".cart-save").bind('click',function(){
            var jc_id = $(this).parent('td').parent('tr').attr('data-jc_id');
            var j_id = $(this).parent('td').parent('tr').attr('data-j_id');
            var j_num = $(this).parent('td').parent('tr').find('.j_num_item').val();
            var j_price = $(this).parent('td').parent('tr').find('.j_price_item').val();
            var jc_info = $(this).parent('td').parent('tr').find('.jc_info_item').val();
            if(parseFloat(j_num)>=0){
                $.ajax({
                    type: "POST",
                    url: "/pre-cart/update",
                    data: {'jc_id':jc_id,'j_id':j_id,'j_num':j_num,'j_price':j_price,'jc_info':jc_info},
                    success: function (data) {
                        if(data.errCode==0){
                            layer.msg('保存成功', {icon: 6});
                            window.location.reload();
                        }else{
                            layer.msg(data.msg, {icon: 6});
                        }
                    }
                });
            }else{
                layer.msg('数量不能为空 和 <0', {icon: 6});
            }
        });
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

    $('input.num_check').each(function(){
        $(this).bind('keyup',function() {
            $(this).val($(this).val().replace(/^(\d+)\.(\d{0,3}).*$/,'$1.$2'));
            var j_num = $(this).val();
            var j_price = $(this).parent('td').parent('tr').find('.j_price_item').val();
            if(j_num!='' || j_price==''){
                var one_price = mathmul(parseFloat(j_num),parseFloat(j_price));
            }else{
                var one_price = 0;
            }
            one_price = parseFloat(formatMoney(one_price,3));
            $(this).parent('td').parent('tr').find('.one_price').val(one_price);
            //console.log(sum_total_price());
            $("#dtoapreplan-total_price").val(sum_total_price());
        });
    });

    $('input.float_check').each(function(){
        $(this).bind('keyup',function() {
            $(this).val($(this).val().replace(/^(\d+)\.(\d{0,3}).*$/,'$1.$2'));
            var j_price = $(this).val();
            var j_num = $(this).parent('td').parent('tr').find('.j_num_item').val();
            if(j_num!='' || j_price==''){
                var one_price = mathmul(parseFloat(j_num),parseFloat(j_price));
            }else{
                var one_price = 0;
            }
            one_price = parseFloat(formatMoney(one_price,3));
            $(this).parent('td').parent('tr').find('.one_price').val(one_price);
            $("#dtoapreplan-total_price").val(sum_total_price());
        });
    });

    $("#approval-pre-plan-save").bind('click',function(){
        //console.log($('input:radio[name="a_status"]:checked').val());
        var a_status = $('input:radio[name="a_status"]:checked').val();
        if(a_status==='0' || a_status==='1'){
            $('#approval-pre-plan').submit();
        }
    });
</script>