<?php
use backend\models\DtoaPlan;
use backend\models\DtoaProject;
use backend\models\DtoaStorageCart;
use backend\models\DtoaSupplier;
use jinxing\admin\models\AdminUser;
use yii\widgets\ActiveForm;
$this->title = '材料计划: ' . $model->j_name;

$user=AdminUser::find()->andWhere(['status' => AdminUser::STATUS_ACTIVE])->select(['name'])->indexBy('id')->column();
bcscale(3);
//如果通过审核并已入库，则不能再审核拒绝
if($model->j_status==2){
    $rs=DtoaStorageCart::find()->select(['sc_id'])->andWhere(['j_id'=>$model->j_id])->asArray()->all();
    if(!empty($rs)){
        echo '<script>alert(\'此计划已通过审核并已入库，则不能再审核拒绝\');location.href=\'/approval-plan/index\';</script>';
    }
}
/* @var $this yii\web\View */
/* @var $model backend\models\DtoaPlan */
?>
<style>
    .row{margin: 5px 0;}.row .form-group{width:100% !important;}.row input,.row select,.row textarea{width: 300px !important;}
    select:disabled{appearance:none !important;-moz-appearance:none !important;-webkit-appearance:none !important;}
    input.a_status{width:18px !important;}
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
                <?= $form->field($model, 'j_status')->dropdownList([$model['j_status']=>DtoaPlan::PLAN_STATUS[$model['j_status']]],['disabled' => 'true'])?>
            </div>
            <div class="col-md-4"><?= $form->field($model, 'total_price')->textInput(['readonly' => 'true']) ?></div>
            <div class="col-md-4"><?= $form->field($model, 'j_info')->textarea(['maxlength' => true,'readonly' => 'true','rows' => 1])
                ?></div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <?= $form->field($model, 'approval_time')->textInput(['maxlength' => true,'readonly' => 'true']) ?>
            </div>
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
        <?php $form = ActiveForm::begin(['id' => 'approval-plan']); ?>
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
            <button type="button" class="btn btn-success btn-sm" id="approval-plan-save">确定审批保存</button>
        </div>
        <?php ActiveForm::end(); ?>
    <?php } ?>
</div>
<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/layer/layer.js"></script><script src="/js/common.js"></script>
<script>
    $(function(){
        $("#dtoaplan-total_price").val(parseFloat($("#dtoaplan-total_price").val()));
        $("#approval-plan-save").bind('click',function(){
            //console.log($('input:radio[name="a_status"]:checked').val());
            var a_status = $('input:radio[name="a_status"]:checked').val();
            if(a_status==='0' || a_status==='1'){
                $('#approval-plan').submit();
            }
        });
    });
</script>