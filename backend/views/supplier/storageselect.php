<?php

use backend\models\DtoaSupplier;
use jinxing\admin\AdminAsset;
use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use backend\models\DtoaCategory;
use backend\models\DtoaItems;
use backend\models\DtoaCart;
use backend\models\DtoaProject;
use backend\models\DtoaAgreement;
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
$this->title = '供应商';
$supplier=DtoaSupplier::find()->asArray()->all();
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
        #supplier_box,#supplier_select_box{min-height:220px;min-width:600px;overflow:scroll;padding:0;}
        td,th{text-align:center;}
        tr td{padding:5px 0!important;}
        thead,thead th{background-color:#F5F5F5;}
        #supplier_box th,#supplier_select_box th{height:18px;line-height: 18px;font-weight: normal;}
        .select-m{width:18px;height:18px;margin:7px 0 !important;}
        #m_table td,#select_m_table td{height: 18px; line-height: 18px; padding: 0 !important; vertical-align: middle;}
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
                        <div id="supplier_box">
                            <table class="table table-condensed table-responsive text-nowrap table-bordered">
                                <thead>
                                <tr>
                                    <th></th>
                                    <th>供应商名</th>
                                    <th>供应商联系人</th>
                                    <th>供应商电话</th>
                                    <th>供应商备注</th>
                                </tr>
                                </thead>
                                <tbody id="m_table">
                                <?php
                                foreach ($supplier as $s) { ?>
                                    <tr data-s_id="<?=$s['s_id']?>">
                                        <td><input type="checkbox" name="select-m" class="select-m" value="<?=$s['s_id']?>"></td>
                                        <td><?=$s['s_name']?></td>
                                        <td><?=$s['s_contact']?></td>
                                        <td><?=$s['s_tel']?></td>
                                        <td><?=$s['s_info']?></td>
                                    </tr>
                                <?php } ?>
                                </tbody>
                            </table>
                        </div>

                        <h5>
                            <button class="btn btn-sm btn-default" id="move_in">移入</button>
                            <button class="btn btn-sm btn-default" id="move_out">移出</button>
                            <button class="btn btn-sm btn-default" id="all_move_in">全部移入</button>
                            <button class="btn btn-sm btn-default" id="all_move_out">全部移出</button>

                            <button class="btn btn-sm btn-success" id="select_ok">确定选择</button>
                        </h5>

                        <div id="supplier_select_box">
                            <table class="table table-condensed table-responsive text-nowrap table-bordered">
                                <thead>
                                <tr>
                                    <th></th>
                                    <th>供应商名</th>
                                    <th>供应商联系人</th>
                                    <th>供应商电话</th>
                                    <th>供应商备注</th>
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
    $(function () {

    });

    $('#select_ok').bind('click',function() {
        var arr = new Array();
        $("#select_m_table .select-m").each(function(i){
            arr[i] = $(this).val();
        });
        var vals = arr.join(",");
        if(vals){
            parent.create_input(vals,'supplier-select',0);
            //当你在iframe页面关闭自身时
            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
            parent.layer.close(index);
        }else{
            layer.msg('请选择一个供应商再操作！', {icon: 6});
        }
    });

    $('#move_in').bind('click',function() {
        $("#supplier_box .select-m:checked").each(function(i){
            if($("#supplier_select_box tr[data-s_id='"+$(this).val()+"']").length==0){
                var tr_html = $("#supplier_box tr[data-s_id='"+$(this).val()+"']").prop("outerHTML");
                $("#select_m_table").append(tr_html);
            }
        });
    });

    $('#move_out').bind('click',function() {
        $("#supplier_select_box .select-m:checked").each(function(i){
            $("#supplier_select_box tr[data-s_id='"+$(this).val()+"']").remove();
        });
    });

    $('#all_move_in').bind('click',function() {
        $("#supplier_box .select-m").each(function(i){
            if($("#supplier_select_box tr[data-s_id='"+$(this).val()+"']").length==0){
                var tr_html = $("#supplier_box tr[data-s_id='"+$(this).val()+"']").prop("outerHTML");
                $("#select_m_table").append(tr_html);
            }
        });
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