<?php
use backend\models\DtoaPay;
use backend\models\DtoaAgreement;
use backend\models\DtoaApprovalGroup;
use backend\models\DtoaCart;
use backend\models\DtoaCategory;
use backend\models\DtoaMaterial;
use backend\models\DtoaPlan;
use backend\models\DtoaProject;
use backend\models\DtoaStorage;
use backend\models\DtoaSupplier;
use jinxing\admin\models\AdminUser;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
$this->title = '查看结算';
/* @var $this yii\web\View */
/* @var $model backend\models\DtoaPlan */
$supplier=DtoaSupplier::find()->select(['s_name'])->indexBy('s_id')->column();
$plan=DtoaPlan::find()->select(['j_name'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->indexBy('j_id')->column();
$agreement=DtoaAgreement::find()->select(['h_name'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->indexBy('h_id')->column();
$project=DtoaProject::find()->select(['g_name'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->indexBy('g_id')->column();
$uid_arr=DtoaApprovalGroup::find()->select(['uid_arr'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['item_id'=>8])->asArray()->one();
$uid_arr=json_decode($uid_arr['uid_arr'],true);
$next_admin_id=$uid_arr[1][0];
$user=AdminUser::find()->andWhere(['status' => AdminUser::STATUS_ACTIVE])->select(['name'])->indexBy('id')->column();
?>
<style>
    .row{margin: 5px 0;}.row .form-group{width:100% !important;}.row input,.row select,.row textarea{width: 300px !important;}
    select:disabled{appearance:none !important;-moz-appearance:none !important;-webkit-appearance:none !important;}
    input.checkbox{width: 20px !important; height: 20px !important;}
    #c_str label{margin:5px;}
    #ticketbox th{line-height: 30px;}
</style>
<div class="dtoa-pay-create">
    <div class="dtoa-pay-form">
        <?php $form = ActiveForm::begin([
                'id' => 'pay-create',
            'options' => ['class' => 'form-inline'],
            'fieldConfig'=>[
                'template'=> "<span style='width:80px;text-align: right; display: inline-block;margin-right: 5px;'>{label} </span>\n{input}\n{error}",
                //form-inline
            ]
        ]); ?>
        <div class="row">
            <div class="col-md-4"><?= $form->field($model, 'p_no')->textInput(['readonly' => 'true']) ?></div>
            <div class="col-md-4"><?=$form->field($model, 'g_id')->dropdownList([Yii::$app->session['g_id']=>DtoaProject::findOne(Yii::$app->session['g_id'])['g_name']],['disabled' => 'true'])?></div>
            <div class="col-md-4"><?= $form->field($model, 'next_admin_id')->dropdownList
                ([$model['next_admin_id']=>$user[$model['next_admin_id']]],['disabled' => 'true']) ?></div>
        </div>
        <div class="row">
            <div class="col-md-4"><?=$form->field($model, 's_id')->dropdownList($supplier,['disabled' => 'true']); ?></div>
            <div class="col-md-4"><?= $form->field($model, 'total_price')->textInput(['readonly' => 'true']) ?></div>
            <div class="col-md-4"><?= $form->field($model, 'approval_time')->textInput(['readonly' => 'true']) ?></div>
        </div>
        <div class="row">
            <div class="col-md-4">
            </div>
        </div>

        <ul id="storagelist" style="list-style: none; padding: 0 10px; border: 1px silver dashed; margin: 10px 0;">
            <p style="margin-top: 5px;">所有入库单列表：</p>
            <table class="table table-bordered table-condensed table-striped" style="margin-top: 10px;border: 1px
            solid #ddd;font-size: 13px;">
                <thead>
                <tr>
                    <th>入库ID</th>
                    <th>入库单号</th>
                    <th>工程</th>
                    <th>供应商</th>
                    <th>合同</th>
                    <th>入库类型</th>
                    <th>入库来源</th>
                    <th>总金额</th>
                    <th>入库备注</th>
                    <th>创建者</th>
                    <th>创建时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <?php foreach ($paylist as $k => $s) { ?>
                    <tr>
                        <td><?=$s['k_id']?></td>
                        <td><?=$s['k_no']?></td>
                        <td><?=$project[$s['g_id']]?></td>
                        <td><?=$supplier[$s['s_id']]?></td>
                        <td><?php
                            if(!empty($s['h_id']) && isset($agreement[$s['h_id']])){
                                echo $agreement[$s['h_id']];
                            }
                            ?></td>
                        <td><?=DtoaStorage::STORAGE_TYPE[$s['k_type']]?></td>
                        <td><?=$s['k_source']?></td>
                        <td><?=floatval($s['total_price'])?></td>
                        <td><?=$s['k_info']?></td>
                        <td><?=$s['creator']?></td>
                        <td><?=$s['created_at']?></td>
                        <td>
                            <?php
                            if($s['k_type']==1){
                                $storage_path='storage-material';
                            }
                            if($s['k_type']==2){
                                $storage_path='storage-ticket';
                            }
                            if($s['k_type']==3){
                                $storage_path='storage-lease';
                            }
                            ?>
                            <a class="btn btn-xs" href="#" onclick="parent.addIframe(GetRandomNum(1000,100000),
                                    '/<?=$storage_path?>/view?id='+<?=$s['k_id']?>,'查看入库');">入库详情单</a> </td>
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
            <input type="hidden" name="module" value="pay">
            <input type="hidden" name="title" value="<?=$this->title?>">
            <input type="hidden" name="id" value="<?=$model['p_id']?>">
            <button type="submit" class="btn btn-primary btn-sm" id="export_btn">导出</button>
        </form>
        <?php if($model['p_status']>=2){ ?>
        <button type="button" class="btn btn-success btn-sm" id="print_btn" data-module="pay" data-id="<?=$model['p_id']?>" data-title="采购结算单">打印</button>
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
        $("#print_btn").bind("click",function(){
            var title = $(this).attr("data-title");
            $.ajax({
                type: "POST",
                url: "/ajax/getdata",
                data: {'module':'print-get','view':$(this).attr("data-module"),'id':$(this).attr("data-id")},
                success: function (data) {
                    data=JSON.parse(data);
                    //console.log(data.data.cart[0]);
                    if(data.error){
                        layer.msg('打印出错', {icon: 6});
                    }else{
                        var print_data = data.data;
                        $("#print_box h2").html(title);
                        var head = print_data.head;
                        var cart = print_data.cart;
                        var cart_head = print_data.cart_head;
                        var storage_cart_head = print_data.storage_cart_head;
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
                            if(cart_head[i].k_title!='入库明细') {
                                cart_head_html = cart_head_html + '<th>' + cart_head[i].k_title + '</th>';
                            }
                        }
                        cart_head_html=cart_head_html+'</tr></thead>';
                        $("#print_cart").append(cart_head_html);
                        var cart_html='<tbody>';
                        var cart_tr='';
                        for (i = 0; i < cart.length; i++) {
                            cart_tr=cart_tr+'<tr>';
                            for (j = 0; j < cart_head.length; j++) {
                                if(cart_head[j].k_name!='storage_cart'){
                                    cart_tr=cart_tr+'<td>'+cart[i][cart_head[j].k_name]+'</td>';
                                }
                            }
                            cart_tr=cart_tr+'</tr>';
                            cart_tr=cart_tr+'<tr><td colspan="6">';

                            var storage_head_html='<table class="table table-bordered table-condensed" style="font-size: 12px;"><thead><tr>';
                            for (n = 0; n < storage_cart_head.length; n++) {
                                storage_head_html=storage_head_html+'<th>'+storage_cart_head[n].k_title+'</th>';
                            }
                            storage_head_html=storage_head_html+'</tr></thead>';
                            var storage_cart = cart[i]['storage_cart'];
                            //console.log(storage_cart);
                            var storage_html='<tbody>';
                            var storage_tr='';
                            for (k = 0; k < storage_cart.length; k++) {
                                storage_tr=storage_tr+'<tr>';
                                for (g = 0; g < storage_cart_head.length; g++) {
                                    if($.inArray(storage_cart_head[g].k_name,['total_price','j_num','j_price','mul_price', 'j_real_num','j_real_price','pour_num'])!=-1){
                                        storage_tr=storage_tr+'<td>'+parseFloat(storage_cart[k][storage_cart_head[g].k_name])+'</td>';
                                    }else{
                                        storage_tr=storage_tr+'<td>'+storage_cart[k][storage_cart_head[g].k_name]+'</td>';
                                    }
                                }
                                storage_tr=storage_tr+'</tr>';
                            }

                            storage_html=storage_html+storage_tr+'</tbody></table>';
                            //console.log(storage_html);
                            cart_tr=cart_tr+storage_head_html+storage_html+'</td></tr>';
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
<script>
    function GetRandomNum(Min,Max) {
        var Range = Max - Min;
        var Rand = Math.random();
        return (Min + Math.round(Rand * Range));
    }
</script>