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
$this->title = '商砼小票入库审批';

$supplier=DtoaSupplier::find()->select(['s_name'])->indexBy('s_id')->column();

$s_id_arr=DtoaAgreement::find()->select(['s_id'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['h_status'=>2])->groupBy('s_id')->asArray()->all();
$s_id_arr=array_column($s_id_arr,'s_id');
$agreement_supplier=DtoaSupplier::find()->select(['s_name'])->andWhere(['in', 's_id', $s_id_arr])->indexBy('s_id')->column();

$agreement=DtoaAgreement::find()->select(['h_name'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['h_status'=>2])->indexBy('h_id')->column();

$user=AdminUser::find()->andWhere(['status' => AdminUser::STATUS_ACTIVE])->select(['name'])->indexBy('id')->column();
$approval=DtoaApproval::find()->andWhere(['g_id' => $model['g_id']])->andWhere(['table_index' => 3])->andWhere(['target_id' => $model['k_id']])->asArray()->all();
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
    <?php
    //当前审批人是我时
    if(Yii::$app->user->identity->id==$model['next_admin_id']) { ?>
        <?php $form = ActiveForm::begin(['id' => 'approval-storage']); ?>
        <div class="form-inline" style="font-size: 14px; font-weight: bold;">
            <label style="margin: 0 10px;">我的意见：</label>
            <input name="a_status" class="a_status radio" type="radio" value="1"> <span style="color: green;">通过</span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input name="a_status" class="a_status radio" type="radio" value="0"> <span style="color: orange;">拒绝</span>
            <input type="hidden" name="approver_id" value="<?=Yii::$app->user->identity->id?>">
            <input type="hidden" name="approver" value="<?=Yii::$app->user->identity->name?>">
            <label style="margin: 0 10px;">备注：</label><input type="text" class="input-xxlarge" name="a_info">
            <button type="button" class="btn btn-success btn-sm" id="approval-storage-save">确定审批保存</button>
        </div>
        <?php ActiveForm::end(); ?>
    <?php } ?>

</div>

<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/layer/layer.js"></script><script src="/js/common.js"></script>
<script src="/js/bootstrap-datetimepicker.js"></script>
<script src="/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script>
    $("#dtoastorage-total_price").val(parseFloat($("#dtoastorage-total_price").val()));
    $("#approval-storage-save").bind('click',function(){
        //console.log($('input:radio[name="a_status"]:checked').val());
        var a_status = $('input:radio[name="a_status"]:checked').val();
        if(a_status==='0' || a_status==='1'){
            $('#approval-storage').submit();
        }
    });
</script>