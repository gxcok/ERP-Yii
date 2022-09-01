<?php
use jinxing\admin\AdminAsset;
use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use backend\models\DtoaCategory;
use backend\models\DtoaItems;
use backend\models\DtoaMaterial;
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
$this->title = '材料库';
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
        .leftbar{width:500px;height:800px;float:none;position:fixed;}
        .right-content{margin-left:520px;}
        #category-box{width:500px;height:500px;overflow-y:scroll;overflow-x:hidden;}
        #material_box,#material_select_box{height:210px;overflow:auto;padding:0;}
        .catebox{width:200px;margin-right:0;position:relative;z-index:1;}
        .item_cate_no{width:200px;display:inline-block;}
        td,th{text-align:center;}
        tr td{padding:5px 0!important;}
        thead,thead th{background-color:#F5F5F5;}
        #material_box th,#material_select_box th{height:18px;line-height: 18px;font-weight: normal;}
        .cate_ul{list-style:none;width:100%;display:block;margin:0;padding:0;}
        .cate_ul li{display:block;height:31px;line-height:31px;border-bottom:1px #ddd solid;}
        td.cate_td{text-align:left;background-image:url('/images/line1.png');background-repeat:repeat;background-position:0 36px;padding:5px!important;}
        .tree-item{margin-top:-1px!important;}
        .cname{cursor:pointer;}
        ul.cname li{text-align:left;text-indent:5px;}
        .ul-selected{background-color:#BFBFBF;font-weight:700;}
        .category-create{line-height:25px;padding:15px 30px;}
        .category-create label{float:left;width:80px;text-align:right;margin-right:10px;}
        .cate_type_ul{display:inline-block;width:300px;list-style:none;margin:-5px 0 0;padding:0;}
        .cate_type_ul li{float:left;margin:5px;}
        .radio-inline{float:left;width:18px;height:18px;margin:5px 5px 0 0 !important;}
        .select-m,.select-m2{width:18px;height:18px;margin:7px 0 !important;}
        #material_frame{width:200px;}
        .folder-selected{background-color:#8CA6B5;}
        #category-box::-webkit-scrollbar,#material_box::-webkit-scrollbar{width:15px;}
        .has-error{ margin-bottom: 0 !important;}
        #m_table td,#select_m_table td{height: 25px; line-height: 25px; padding: 0 !important; vertical-align: middle;}
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
                            <h5>
                                <button class="btn btn-sm btn-default" id="all_show">全部展开</button>
                                <button class="btn btn-sm btn-default" id="all_hide">全部折叠</button>
                            </h5>
                            <div id="category-box" class='table-cont'>
                                <table class="table table-condensed table-responsive text-nowrap table-bordered" style="width:480px;">
                                    <thead style="">
                                    <tr>
                                        <th width="50">ID</th>
                                        <th width="200">编码</th>
                                        <th width="200">分类</th>
                                        <th width="100">分类类型</th>
                                    </tr>
                                    </thead>
                                    <tbody style="">
                                    <tr>
                                        <td width="50"><?= create_cate_more($cate, 'cid') ?></td>
                                        <td width="200" class="cate_td">
                                            <div class="tree catebox">
                                                <?= create_cate($cate); ?>
                                            </div>
                                        </td>
                                        <td width="200"><?= create_cate_more($cate, 'cname') ?></td>
                                        <td width="100"><?= create_cate_more($cate, 'cate_type') ?></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="right-content">
                            <h5>
                                <label>材料名：</label><input type="text" id="search_c_name">
                                <label>规格：</label><input type="text" id="search_size" style="width: 80px;">
                                <button type="button" class="btn btn-sm btn-success" id="search_m_bt">搜索</button>
                            </h5>
                            <div id="material_box">
                                <table class="table table-condensed table-responsive text-nowrap table-bordered">
                                    <thead>
                                    <tr>
                                        <th><input type="checkbox" id="select_all" style="width:18px;height:18px;
                                        margin:5px 5px 0!important;"></th>
                                        <?php
                                        $label_arr = $material_model->attributeLabels();
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
                                    <button class="btn btn-sm btn-success" id="select_ok">确认选择</button>
                                </span>
                            </h5>

                            <div id="material_select_box">
                                <table class="table table-condensed table-responsive text-nowrap table-bordered">
                                    <thead>
                                    <tr>
                                        <th><input type="checkbox" id="select_all2" style="width:18px;height:18px;
                                        margin:5px 5px 0!important;"></th>
                                        <?php
                                        $label_arr = $material_model->attributeLabels();
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
    var label_arr = <?=Json::encode(array_keys($material_model->attributeLabels()))?>;

    function show_all(display, pid) {
        var first = $(".cate_ul[data-pid='" + pid + "']");
        if (first.length > 0) {
            if (display) {
                first.show();
            } else {
                first.hide();
            }
            for (var i = 1; i <= first.length; i++) {
                show_all(display, first.eq(i).attr("data-id"));
            }
        }
    }

    function addClass_allChild(elem,id){
        var treeitem = $(".tree-item[data-id='"+id+"']");
        treeitem.addClass("tree-selected");
        treeitem.find("i").addClass('icon-ok').removeClass("icon-remove");
        $(elem+"[data-id='"+id+"']").addClass('ul-selected');
        if($(elem+"[data-pid='"+id+"']").length>0){
            var child_elem = $(elem+"[data-pid='"+id+"']");
            for (let i = 0; i < child_elem.length; i++){
                addClass_allChild(elem,child_elem.eq(i).attr("data-id"));
            }
            child_elem.addClass('ul-selected');
        }
    }

    function removeClass_allChild(elem,id){
        var treeitem = $(".tree-item[data-id='"+id+"']");
        treeitem.removeClass("tree-selected");
        treeitem.find("i").removeClass('icon-ok').addClass("icon-remove");
        $(elem+"[data-id='"+id+"']").removeClass('ul-selected');
        if($(elem+"[data-pid='"+id+"']").length>0){
            var child_elem = $(elem+"[data-pid='"+id+"']");
            for (let i = 0; i < child_elem.length; i++){
                removeClass_allChild(elem,child_elem.eq(i).attr("data-id"));
            }
            child_elem.removeClass('ul-selected');
        }
    }
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
        $('#category-box').bind('scroll', scrollHandle);
        $('#material_box').bind('scroll', scrollHandle);
        $('#material_select_box').bind('scroll', scrollHandle);

        $('#all_show').trigger("click");

        $('.tree-folder-header').bind('click', function () {
            var display = $(this).next(".tree-folder-content").is(":hidden");
            e = $(this);
            $(this).next(".tree-folder-content").toggle(400, function () {
                if (display) {
                    e.find("i").removeClass("icon-plus").addClass("icon-minus");
                    show_all(true, e.attr("data-id"));
                    //$(".cate_ul[data-pid='"+e.attr("data-id")+"']").show();
                } else {
                    e.find("i").removeClass("icon-minus").addClass("icon-plus");
                    show_all(false, e.attr("data-id"));
                    ///$(".cate_ul[data-pid='"+e.attr("data-id")+"']").hide();
                }
                $('.tree-folder-header').removeClass("folder-selected");
                e.addClass("folder-selected");
            }(e));
        });

        $('.cname').bind('click', function () {
            //$(this).parent('td').find('ul.cate_ul').removeClass('ul-selected');
            var treeitem = $(".tree-item[data-id='"+$(this).attr("data-id")+"']");
            if($(this).hasClass('ul-selected')){    //已经选中 取消
                $.ajax({
                    type: "GET",
                    url: "/material/view?type=ajax&id=" + $(this).attr("data-id"),
                    success: function (data) {
                        data = JSON.parse(data);
                        //console.log(data);//m_table label_arr
                        for (var i = 0; i < data.length; i++) {
                            $("#m_table tr[data-c_id='"+data[i]['c_id']+"']").remove();
                        }
                    }
                });
                if(treeitem.length > 0){//末级分类
                    $(this).removeClass('ul-selected');
                    treeitem.removeClass("tree-selected");
                    treeitem.find("i").removeClass('icon-ok').addClass("icon-remove");
                }else{
                    removeClass_allChild('.cname',$(this).attr("data-id"));
                    //$(".tree-item i").removeClass('icon-ok').addClass("icon-remove");
                }
                //$(this).removeClass('ul-selected');
            }else{
                if(treeitem.length > 0){
                    $(this).addClass('ul-selected');
                    treeitem.addClass("tree-selected");
                    treeitem.find("i").removeClass('icon-remove').addClass("icon-ok");
                }else{
                    addClass_allChild('.cname',$(this).attr("data-id"));
                }
                $.ajax({
                    type: "GET",
                    url: "/material/view?type=ajax&id=" + $(this).attr("data-id"),
                    success: function (data) {
                        data = JSON.parse(data);
                        //console.log(data);//m_table label_arr
                        var m_html = '';
                        for (var i = 0; i < data.length; i++) {
                            if($("#m_table tr[data-c_id='"+data[i]['c_id']+"']").length==0){
                                m_html = m_html + '<tr data-c_id="'+data[i]['c_id']+'"><td><input type="checkbox" ' + 'name="select-m" class="select-m" ' +
                                    'value="'+data[i]['c_id']+'"></td>';
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
                        }
                        //console.log(m_html);
                        $("#m_table").append(m_html);
                    }
                });
            }
        });

        $('#search_m_bt').bind('click', function () {
            if($('#search_c_name').val()!='' || $('#search_size').val()!=''){
                $(".tree-item").removeClass('tree-selected');
                $("ul.cname.ul-selected").removeClass('ul-selected');
                $(".tree-item i").removeClass('icon-ok').addClass("icon-remove");
                $.ajax({
                    type: "POST",
                    url: '/material/view',
                    data: {'type':'ajax','search_c_name':$('#search_c_name').val(),'search_size':$('#search_size').val()},
                    success: function (data) {
                        data = JSON.parse(data);
                        //console.log(data);//m_table label_arr
                        var m_html = '';
                        for (var i = 0; i < data.length; i++) {
                            m_html = m_html + '<tr data-c_id="'+data[i]['c_id']+'"><td><input type="checkbox" name="select-m" class="select-m" ' +
                                'value="'+data[i]['c_id']+'"></td>';
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
                        //console.log(m_html);
                        $("#m_table").html(m_html);
                    }
                });
            }
        });

    });

    $("#all_show").bind('click', function () {
        $(".tree-folder-content").show();
        $("ul.cate_ul").show();
        $('.tree-folder-header i').removeClass("icon-plus").addClass("icon-minus");
    });

    $("#all_hide").bind('click', function () {
        $(".tree-folder-content").hide();
        $("ul.cate_ul").hide();
        $("ul.cate_ul[data-pid='0']").show();
        $('.tree-folder-header i').removeClass("icon-minus").addClass("icon-plus");
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
        $("input.select-m2").each(function(i){
            arr[i] = $(this).val();
        });
        var vals = arr.join(",");
        if(vals){
            parent.create_input(vals,'material-select',0);
            //当你在iframe页面关闭自身时
            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
            parent.layer.close(index);
        }else{
            layer.msg('请选择一个材料再操作！', {icon: 6});
        }
    });

    $('#move_in').bind('click',function() {
        $("#material_box .select-m:checked").each(function(i){
            if($("#material_select_box tr[data-c_id='"+$(this).val()+"']").length==0){
                var tr_html = $("#material_box tr[data-c_id='"+$(this).val()+"']").prop("outerHTML");
                $("#select_m_table").append(tr_html);
            }
        });
        $("#material_select_box .select-m").addClass("select-m2").removeClass("select-m");
    });

    $('#move_out').bind('click',function() {
        $("#material_select_box .select-m2:checked").each(function(i){
            $("#material_select_box tr[data-c_id='"+$(this).val()+"']").remove();
        });
    });

    $('#all_move_in').bind('click',function() {
        $("#material_box .select-m").each(function(i){
            if($("#material_select_box tr[data-c_id='"+$(this).val()+"']").length==0){
                var tr_html = $("#material_box tr[data-c_id='"+$(this).val()+"']").prop("outerHTML");
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