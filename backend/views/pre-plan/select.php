<?php

use backend\models\DtoaSupplier;
use jinxing\admin\AdminAsset;
use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use backend\models\DtoaCategory;
use backend\models\DtoaItems;
use backend\models\DtoaMaterial;
use backend\models\DtoaPreCart;
use backend\models\DtoaProject;
use backend\models\DtoaPrePlan;
use jinxing\admin\models\Admin;
use jinxing\admin\widgets\MeTable;
use yii\helpers\Json;
use yii\web\ForbiddenHttpException;
//jinxing\admin\AppAsset::register($this);
//$this->context->layout = false;
AdminAsset::register($this);
$this->context->layout = false;
list(, $url) = Yii::$app->assetManager->publish((new AdminAsset())->sourcePath);
// 定义标题和面包屑信息
$this->title = '采购意向单';
$supplier=DtoaSupplier::find()->select(['s_name'])->indexBy('s_id')->column();
$plan_s_id=Yii::$app->request->get('plan_s_id');
$s_id=Yii::$app->request->get('s_id');
$j_id=Yii::$app->request->get('j_id');
//var_dump($s_id);
if($s_id==='unsign'){
    $preplan=DtoaPrePlan::find()->andWhere(['j_status'=>2])->andWhere(['IS','s_id',new \yii\db\Expression('NULL')])->select(['j_name'])->indexBy('j_id')->column();
}else{
    $s_id=$plan_s_id;
    $preplan=DtoaPrePlan::find()->andWhere(['j_status'=>2])->andWhere(['s_id'=>$s_id])->select(['j_name'])->indexBy('j_id')->column();
}

if(!empty($j_id)){
    $plancart=DtoaPreCart::find()->select(['dtoa_precart.*','m.c_no','m.c_name','m.size','m.quality','m.num'])
        ->andWhere(['j_id'=>$j_id])->join('INNER JOIN', ['m' => 'dtoa_material'], 'm.c_id = dtoa_precart.c_id')
        ->orderBy('jc_id')->asArray()->all();
}else{
    $plancart=[];
}
?>
<?php $this->beginPage() ?>
    <!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="<?= Yii::$app->charset ?>"/>
    <title><?=Yii::$app->name.Html::encode($this->title) ?></title>
    <meta name="description" content="3 styles with inline editable feature" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
    <?= Html::csrfMetaTags() ?>
    <?php $this->head(); ?>
    <!-- ace styles -->
    <link rel="stylesheet" href="<?=$url?>/css/ace.min.css" id="main-ace-style" />
    <!--[if lte IE 9]>
    <link rel="stylesheet" href="<?=$url?>/css/ace-part2.min.css" />
    <![endif]-->
    <!--[if lte IE 9]>
    <link rel="stylesheet" href="<?=$url?>/css/ace-ie.min.css" />
    <![endif]-->
    <!-- inline styles related to this page -->
    <!-- ace settings handler -->
    <script src="<?=$url?>/js/ace-extra.min.js"></script>
    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->
    <!--[if lte IE 8]>
    <script src="<?=$url?>/js/html5shiv.min.js"></script>
    <script src="<?=$url?>/js/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" href="/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="/css/ace.min.css"/>
    <link href="/css/chosen.css" rel="stylesheet">
    <style>
        .main-content{margin-left:0;margin-right:0;margin-top:0;min-height:100%;padding:0;}
        .leftbar{width:400px;height:500px;float:none;position:fixed;}
        .right-content{margin-left:420px;}
        #material_box,#material_select_box{height:220px;overflow:auto;padding:0;}
        td,th{text-align:center;}
        tr td{padding:5px 0!important;}
        thead,thead th{background-color:#F5F5F5;}
        #material_box th,#material_select_box th{height:18px;line-height: 18px;font-weight: normal;}
        #plan_box{height:500px;overflow:auto; font-size: 12px;}
        #plan_box tr{cursor: pointer;height:30px;}
        #plan_box tr td{padding:5px!important;}
        .select-m,.select-m2{width:18px;height:18px;margin:7px 0 !important;}
        #m_table td,#select_m_table td{height: 18px; line-height: 18px; padding: 0 !important; vertical-align: middle;}
        .tr_select{ background-color: #E3E3E3}
    </style>
</head>

<body class="no-skin">
<?php $this->beginBody() ?>
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
    <!--主要内容信息-->
    <div class="main-content">
        <div class="page-content">
            <!--主要内容信息-->
            <div class="page-content-area">
                <div class="row">
                    <div class="col-xs-3">
                        <div class="form-inline field-DtoaPrePlan-s_id required">
                            <span style="width:80px;text-align: right; display: inline-block;margin-right: 5px;">
                        <label class="control-label" for="DtoaPrePlan-s_id">所属代理商</label></span>
                            <select name="DtoaPrePlan[s_id]" id="DtoaPrePlan-s_id" class="form-inline s_select">
                                <option value="unsign" <?php if($s_id==='unsign'){ echo 'selected';}?>>未指定代理商</option>
                                <option value="<?=$plan_s_id?>" <?php if($s_id==$plan_s_id){ echo 'selected';
                                }?>><?=$supplier[$plan_s_id]?></option>
                            </select>
                        </div>
                    </div>
                    <div class="col-xs-9">
                        <div class="form-inline field-DtoaPrePlan-j_id required">
                            <span style="width:80px;text-align: right; display: inline-block;margin-right: 5px;">
                        <label class="control-label" for="DtoaPrePlan-j_id">采购意向单</label></span>
                            <select name="DtoaPrePlan[j_id]" data-placeholder="请选择采购意向单" data-no_results_text="没有找到意向单:"
                                    id="DtoaPrePlan-j_id" class="form-inline preplan_select" style="width: 400px;">
                                <option value=""></option>
                                <?php foreach ($preplan as $k => $v) { ?>
                                    <option value="<?=$k?>" <?php if($k==$j_id){ echo 'selected';}?>><?=$v?></option>
                                <?php } ?>
                            </select>
                            <div class="help-block"></div>
                        </div>
                    </div>
                    <div class="col-xs-12">
                        <p style="font-weight: bold;margin:5px 5px 5px 0;">意向单材料列表：</p>
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
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
        ::-webkit-scrollbar-track {
            background-color: #F5F5F5;
        }
        ::-webkit-scrollbar {
            width: 15px;
            background-color: #F5F5F5;
        }
        ::-webkit-scrollbar-thumb {
            background-color: #bbd4e5;
        }
    </style>
</div>
<!-- 公共的JS文件 -->
<!-- basic scripts -->
<!--[if !IE]> -->
<script type="text/javascript">
    window.jQuery || document.write("<script src='<?=$url?>/js/jquery.min.js'>"+"<"+"/script>");
</script>
<!-- <![endif]-->
<!--[if IE]>
<script type="text/javascript">
    window.jQuery || document.write("<script src='<?=$url?>/js/jquery1x.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
<script src="<?=$url?>/js/bootstrap.min.js"></script>
<script src="/js/chosen.jquery.js"></script>
<script type="text/javascript">
    $(function () {
        $('.preplan_select').chosen().trigger('chosen:updated');
        $("#DtoaPrePlan-s_id").bind('change',function(){
            //console.log($(this).val());
            window.location.href='/pre-plan/select?plan_s_id=<?=$plan_s_id?>&s_id='+$(this).val();
        });
        $("#DtoaPrePlan-j_id").bind('change',function(){
            window.location.href='/pre-plan/select?plan_s_id=<?=$plan_s_id?>&s_id=<?=$s_id?>&j_id='+$(this).val();
        });
    });
</script>
<!-- page specific plugin scripts -->
<!--[if lte IE 8]>
<script src="<?=$url?>/js/excanvas.min.js"></script>
<![endif]-->
<?php $this->endBody() ?>
<?=$this->blocks['javascript']?>
</body>
</html>
<?php $this->endPage() ?>