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
$this->title = '开始结算';
/* @var $this yii\web\View */
/* @var $model backend\models\DtoaPlan */
//获取所有审批通过的入库单供应商
$s_id_arr=DtoaStorage::find()->select(['s_id'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['k_status'=>2])->groupBy('s_id')->asArray()->all();
$s_id_arr=array_column($s_id_arr,'s_id');
$supplier=DtoaSupplier::find()->select(['s_name'])->andWhere(['in', 's_id', $s_id_arr])->indexBy('s_id')->column();
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
            <div class="col-md-4"><?= $form->field($model, 'p_no')->textInput(['readonly' => 'true','value'=>DtoaPay::getno()]) ?></div>
            <div class="col-md-4"><?=$form->field($model, 'g_id')->dropdownList([Yii::$app->session['g_id']=>DtoaProject::findOne(Yii::$app->session['g_id'])['g_name']],['disabled' => 'true'])?></div>
            <div class="col-md-4"><?= $form->field($model, 'next_admin_id')->dropdownList([$next_admin_id=>$user[$next_admin_id]],['disabled' => 'true']) ?></div>
        </div>
        <div class="row">
            <div class="col-md-4"><?=$form->field($model, 's_id')->dropdownList($supplier,['prompt'=>'请选择供应商']); ?></div>
            <div class="col-md-4"><?= $form->field($model, 'total_price')->textInput(['readonly' => 'true']) ?></div>
            <div class="col-md-4"><?= $form->field($model, 'p_info')->textarea(['maxlength' => true,'rows' => 1]) ?></div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <?= $form->field($model, 'p_status')->dropdownList(array_slice(DtoaPay::PAY_STATUS,0,2))?>
                <input type="hidden" name="DtoaPay[p_data]" id="dtoapay-p_data">
                <input type="hidden" name="DtoaPay[creator]" id="dtoapay-creator" value="<?=Yii::$app->user->identity->name?>">
                <input type="hidden" name="DtoaPay[creator_id]" id="dtoapay-creator_id" value="<?=Yii::$app->user->identity->id?>">
                <input type="hidden" name="DtoaPay[created_at]" id="dtoapay-created_at" value="<?=date('Y-m-d H:i:s', time())?>">
            </div>
        </div>

        <ul id="storagelist" style="list-style: none; padding: 0 10px; border: 1px silver dashed; margin: 10px 0;">
            <p style="margin-top: 5px;">所有入库单列表：</p>
            <table class="table table-bordered table-condensed table-striped" style="margin-top: 10px;border: 1px
            solid #ddd;font-size: 13px;">
                <thead>
                <tr>
                    <th><input type="checkbox" class="checkbox" id="list_all"></th>
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
                <?php foreach ($storagelist as $k => $s) { ?>
                    <tr>
                        <td><input type="checkbox" class="checkbox storage" data-id="<?=$s['k_id']?>" data-price="<?=floatval($s['total_price'])?>"></td>
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

        <div class="text-center">
            <?= Html::Button('保存', ['class' => 'btn btn-success save-btn']) ?>
        </div>
        <?php ActiveForm::end(); ?>
    </div>

</div>
<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/layer/layer.js"></script><script src="/js/common.js"></script>
<script>
    $(function(){
        $('#dtoapay-s_id').bind('change',function() {
            //console.log('/pay/create?s_id='+$(this).val());
            //parent.changeIframe('/pay/create?s_id='+$(this).val(),'开始结算');
            location.href='/pay/create?s_id='+$(this).val();
        });
    });

    function GetRandomNum(Min,Max) {
        var Range = Max - Min;
        var Rand = Math.random();
        return (Min + Math.round(Rand * Range));
    }

    Array.prototype.remove = function(val) {
        var index = this.indexOf(val);
        if (index > -1) {
            this.splice(index, 1);
        }
    };

    $('#list_all').bind('click',function() {
        var p_data=new Array();
        var sum=0;
        if($(this).is(':checked')){
            $('.storage').prop("checked",true);
            $('.storage').each(function(k,v){
                p_data.push($(v).attr('data-id'));
                sum = mathadd(sum,parseFloat($(v).attr('data-price')));
            });
            $('#dtoapay-p_data').val(JSON.stringify(p_data));
            $('#dtoapay-total_price').val(sum);
        }else{
            $('.storage').prop("checked",false);
            $('#dtoapay-p_data').val('');
            $('#dtoapay-total_price').val(0);
        }
    });

    $('#storagelist td').on('click', '.storage',function() {
        var p_data;
        var total_price=$('#dtoapay-total_price').val();
        if(!total_price){
            total_price=0;
        }
        if($('#dtoapay-p_data').val()==''){
            p_data=new Array();
        }else{
            p_data=JSON.parse($('#dtoapay-p_data').val());
        }
        if($(this).is(':checked')){
            p_data.push($(this).attr('data-id'));
            total_price=mathadd(parseFloat(total_price),parseFloat($(this).attr('data-price')));
        }else{
            p_data.remove($(this).attr('data-id'));
            total_price=mathsub(parseFloat(total_price),parseFloat($(this).attr('data-price')));
        }
        $('#dtoapay-p_data').val(JSON.stringify(p_data));
        $('#dtoapay-total_price').val(total_price);
    });

    $('.save-btn').bind('click',function() {
        if($('#dtoapay-p_data').val()==''){
            layer.msg('请选择入库单再提交！', {icon: 6});
        }else{
            $("#dtoapay-g_id").attr('disabled',false);
            $("#dtoapay-next_admin_id").attr('disabled',false);
            $('#pay-create').submit();
        }
    });
</script>