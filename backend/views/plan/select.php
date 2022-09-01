<?php

use backend\models\DtoaSupplier;
use jinxing\admin\AdminAsset;
use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use backend\models\DtoaCategory;
use backend\models\DtoaItems;
use backend\models\DtoaMaterial;
use backend\models\DtoaCart;
use backend\models\DtoaProject;
use backend\models\DtoaPlan;
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
$this->title = '待入库计划';
$s_id=Yii::$app->request->get('s_id');
$cart_model = new DtoaCart();
$m_model = new DtoaMaterial();
$supplier=DtoaSupplier::find()->select(['s_name'])->indexBy('s_id')->column();
$project=DtoaProject::find()->select(['g_name'])->indexBy('g_id')->column();
$plan=DtoaPlan::find()->select(['j_id'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['s_id'=>$s_id])->andWhere(['>=','j_status',2])->asArray()->all();
//检查计划 是否完成入库
if(!empty($plan)){
    foreach ($plan as $p) {
        $count = DtoaCart::find()->andWhere(['j_id'=>$p['j_id']])->andWhere(['c_status'=>0])->count();
        $plan_model = DtoaPlan::findOne($p['j_id']);
        if($count==0){  //都已入库
            $plan_model->j_status=3;
        }else{
            $plan_model->j_status=2;
        }
        $plan_model->save();
    }
}
$plan=DtoaPlan::find()->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['s_id'=>$s_id])->andWhere(['j_status'=>2])->asArray()->all();
$label_arr = $cart_model->attributeLabels();
$m_arr=[
    'c_no' => '材料编号',
    'c_name' => '材料名',
    'size' => '规格型号',
    'quality' => '材质',
    'num' => '计量单位',
];
$label_arr=array_merge($m_arr,$label_arr);
unset($label_arr['jc_id']);
unset($label_arr['j_id']);
unset($label_arr['h_id']);
unset($label_arr['c_id']);
unset($label_arr['c_status']);
unset($label_arr['creator_id']);
unset($label_arr['creator']);
unset($label_arr['updated_at']);
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
                    <div class="col-xs-12">
                        <div class="leftbar">
                            <div id="plan_box">
                                <table class="table table-condensed table-responsive text-nowrap table-bordered">
                                    <thead>
                                    <tr>
                                        <th>计划名</th>
                                        <th>计划编号</th>
                                        <th>工程</th>
                                        <th>供应商</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php
                                    foreach ($plan as $p) { ?>
                                        <tr data-j_id="<?=$p['j_id']?>">
                                            <td><?=$p['j_name']?></td>
                                            <td><?=$p['j_no']?></td>
                                            <td><?=$project[$p['g_id']]?></td>
                                            <td><?=$supplier[$p['s_id']]?></td>
                                        </tr>
                                    <?php } ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="right-content">
                            <div id="material_box">
                                <table class="table table-condensed table-responsive text-nowrap table-bordered">
                                    <thead>
                                    <tr>
                                        <th><input type="checkbox" id="select_all" style="width:16px;height:16px;
                                        margin:5px 5px 0!important;"></th>
                                        <?php
                                        foreach ($label_arr as $v) { ?>
                                            <th><?= $v ?></th>
                                        <?php } ?>
                                    </tr>
                                    </thead>
                                    <tbody id="m_table">

                                    </tbody>
                                </table>
                            </div>

                            <h5 style="margin-bottom: 5px; display: block; height: 35px;">
                                <span style="float: left">
                                    <button class="btn btn-sm btn-default" id="move_in">移入</button>
                                    <button class="btn btn-sm btn-default" id="move_out">移出</button>
                                    <button class="btn btn-sm btn-default" id="all_move_in">全部移入</button>
                                    <button class="btn btn-sm btn-default" id="all_move_out">全部移出</button>
                                </span>
                                <span style="float: right">
                                    <button class="btn btn-sm btn-success" id="select_ok">确定选择</button>
                                </span>
                            </h5>
                            <div id="material_select_box">
                                <table class="table table-condensed table-responsive text-nowrap table-bordered">
                                    <thead>
                                    <tr>
                                        <th><input type="checkbox" id="select_all2" style="width:16px;height:16px;
                                        margin:5px 5px 0!important;"></th>
                                        <?php
                                        foreach ($label_arr as $v) { ?>
                                            <th><?= $v ?></th>
                                        <?php } ?>
                                    </tr>
                                    </thead>
                                    <tbody id="select_m_table">

                                    </tbody>
                                </table>
                            </div>
                        </div>
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
<script type="text/javascript">
    try {
        window.parent.removeOverlay();
    } catch (e) {}
    if('ontouchstart' in document.documentElement) document.write("<script src='<?=$url?>/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
</script>
<script src="<?=$url?>/js/bootstrap.min.js"></script>
<script type="text/javascript">
    var label_arr = <?=Json::encode(array_keys($label_arr))?>;
    function validBrowser(){
        var u_agent = navigator.userAgent;
        var Browser = {};
        if(u_agent.indexOf('Firefox')>-1){
            Browser.name='Firefox';
        }else if(u_agent.indexOf('Chrome')>-1){
            Browser.name='Chrome';
        }else if(u_agent.indexOf('Trident')>-1&&u_agent.indexOf('rv:11')>-1){
            Browser.name='IE';
            Browser.version='11';
        }else if(u_agent.indexOf('MSIE')>-1&&u_agent.indexOf('Trident')>-1){
            Browser.name='IE';
            Browser.version='8-10';
        }else if(u_agent.indexOf('MSIE')>-1){
            Browser.name='IE';
            Browser.version='6-7';
        }else if(u_agent.indexOf('Opera')>-1){
            Browser.name='Opera';
        }else{
            Browser.name='Unknown';
            Browser.userAgent=u_agent;
        }
        return Browser;
    }
    $(function () {
        Browser = validBrowser();
        function scrollHandle(e) {
            var scrollTop = this.scrollTop;
            if(Browser.name=='IE'){//IE浏览器 $.browser.version
                $(this).find('thead tr th').css("transform","translateY(" + scrollTop + "px)");
            }else{
                $(this).find('thead').css("transform","translateY(" + scrollTop + "px)");
            }
        }
        $('#plan_box').bind('scroll', scrollHandle);
        $('#material_box').bind('scroll', scrollHandle);
        $('#material_select_box').bind('scroll', scrollHandle);

        $("#plan_box tr").each(function(i){
            $(this).click(function() {
                $("#plan_box tr").removeClass('tr_select');
                $(this).addClass('tr_select');
                $.ajax({
                    type: "POST",
                    url: "/ajax/getdata",
                    data: {'module':'plan-get','j_id':$(this).attr("data-j_id")},
                    success: function (data) {
                        data = JSON.parse(data);
                        data=data.data;
                        var m_html = '';
                        for (var i = 0; i < data.length; i++) {
                            m_html = m_html + '<tr data-jc_id="'+data[i]['jc_id']+'"><td><input type="checkbox" name="select-m" class="select-m" ' +
                                'value="'+data[i]['jc_id']+'"></td>';
                            for (k in label_arr) {
                                if (data[i][label_arr[k]] == null) {
                                    td_value = '';
                                } else {
                                    td_value = data[i][label_arr[k]];
                                }
                                m_html = m_html + '<td>' + td_value + '</td>';
                            }
                            m_html = m_html + '</tr>';
                        }
                        $("#m_table").html(m_html);
                    }
                });
            });
        });
    });

    $('#select_all').bind('click',function() {
        if($(this).is(':checked')){
            $('.select-m').prop("checked",true);
        }else{
            $('.select-m').prop("checked",false);
        }
    });

    $('#select_all2').bind('click',function() {
        if($(this).is(':checked')){
            $('.select-m2').prop("checked",true);
        }else{
            $('.select-m2').prop("checked",false);
        }
    });

    $('#select_ok').bind('click',function() {
        var arr = new Array();
        $("#select_m_table .select-m2").each(function(i){
            arr[i] = $(this).val();
        });
        var vals = arr.join(",");
        if(vals){
            parent.create_input(vals,'plan-select',0);
            //当你在iframe页面关闭自身时
            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
            parent.layer.close(index);
        }else{
            layer.msg('请选择一个材料再操作！', {icon: 6});
        }
    });

    $('#move_in').bind('click',function() {
        $("#material_box .select-m:checked").each(function(i){
            if($("#material_select_box tr[data-jc_id='"+$(this).val()+"']").length==0){
                var tr_html = $("#material_box tr[data-jc_id='"+$(this).val()+"']").prop("outerHTML");
                $("#select_m_table").append(tr_html);
            }
        });
        $("#material_select_box .select-m").addClass("select-m2").removeClass("select-m");
    });

    $('#move_out').bind('click',function() {
        $("#material_select_box .select-m2:checked").each(function(i){
            $("#material_select_box tr[data-jc_id='"+$(this).val()+"']").remove();
        });
    });

    $('#all_move_in').bind('click',function() {
        $("#material_box .select-m").each(function(i){
            if($("#material_select_box tr[data-jc_id='"+$(this).val()+"']").length==0){
                var tr_html = $("#material_box tr[data-jc_id='"+$(this).val()+"']").prop("outerHTML");
                $("#select_m_table").append(tr_html);
            }
        });
        $("#material_select_box .select-m").addClass("select-m2").removeClass("select-m");
    });

    $('#all_move_out').bind('click',function() {
        $("#select_m_table").html('');
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