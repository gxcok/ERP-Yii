<?php

use backend\models\DtoaApproval;
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
$this->title = '结算审批';
/* @var $this yii\web\View */
/* @var $model backend\models\DtoaPlan */
$supplier=DtoaSupplier::find()->select(['s_name'])->indexBy('s_id')->column();
$plan=DtoaPlan::find()->select(['j_name'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->indexBy('j_id')->column();
$agreement=DtoaAgreement::find()->select(['h_name'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->indexBy('h_id')->column();
$approval=DtoaApproval::find()->andWhere(['g_id' => $model['g_id']])->andWhere(['table_index' => 4])->andWhere(['target_id' => $model->p_id])->asArray()->all();
$user=AdminUser::find()->andWhere(['status' => AdminUser::STATUS_ACTIVE])->select(['name'])->indexBy('id')->column();
$project=DtoaProject::find()->select(['g_name'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->indexBy('g_id')->column();
?>
<style>
    .row{margin: 5px 0;}.row .form-group{width:100% !important;}.row input,.row select,.row textarea{width: 300px !important;}
    select:disabled{appearance:none !important;-moz-appearance:none !important;-webkit-appearance:none !important;}
    input.checkbox{width: 20px !important; height: 20px !important;}
    #c_str label{margin:5px;}
    #ticketbox th{line-height: 30px;}
    input.a_status{width:18px !important;}
</style>
<div class="dtoa-pay-view">
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
            <div class="col-md-4"><?= $form->field($model, 'next_admin_id')->dropdownList([$model['next_admin_id']=>$user[$model['next_admin_id']]],['disabled' => 'true']) ?></div>
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
        <?php $form = ActiveForm::begin(['id' => 'approval-pay']); ?>
        <div class="form-inline" style="font-size: 14px; font-weight: bold;">
            <label style="margin: 0 10px;">我的意见：</label>
            <?php
            //当前已审批通过时 不再显示通过选项
            if($model['p_status']==1) { ?>
                <input name="a_status" class="a_status radio" type="radio" value="1"> <span style="color: green;">通过</span>
            <?php } ?>
            <input name="a_status" class="a_status radio" type="radio" value="0"> <span style="color: orange;">拒绝</span>
            <input type="hidden" name="approver_id" value="<?=Yii::$app->user->identity->id?>">
            <input type="hidden" name="approver" value="<?=Yii::$app->user->identity->name?>">
            <label style="margin: 0 10px;">备注：</label><input type="text" class="input-xxlarge" name="a_info">
            <button type="button" class="btn btn-success btn-sm" id="approval-pay-save">确定审批保存</button>
        </div>
        <?php ActiveForm::end(); ?>
    <?php } ?>

</div>
<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/layer/layer.js"></script><script src="/js/common.js"></script>
<script>
    $(function(){
        $("#dtoapay-total_price").val(parseFloat($("#dtoapay-total_price").val()));
        $("#approval-pay-save").bind('click',function(){
            //console.log($('input:radio[name="a_status"]:checked').val());
            var a_status = $('input:radio[name="a_status"]:checked').val();
            if(a_status==='0' || a_status==='1'){
                $('#approval-pay').submit();
            }
        });
    });
    function GetRandomNum(Min,Max) {
        var Range = Max - Min;
        var Rand = Math.random();
        return (Min + Math.round(Rand * Range));
    }
</script>