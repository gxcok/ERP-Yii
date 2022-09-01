<?php

use backend\models\DtoaSupplier;
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
if($access==0){
    $this->title = $this->title.'（只读权限）';
}

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
            .leftbar{width:500px;height:600px;float:none;position:fixed;top:0;}
            .right-content{margin-left:520px;top:0;}
            #category-box{width:500px;height:600px;overflow-y:scroll;overflow-x:hidden;}
            #material_box{height:550px;overflow:auto;padding:0;}
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
            .select-m{width:18px;height:18px;margin:7px 0!important;}
            .edit-save,.create-save{float:left;width:22px;height:22px;padding: 0;border-radius:2px;margin:3px 0
            0 5px;}
            .edit-save i,.create-save i{float:left;width:18px;height:18px;display:block;margin-left: -3px;]}
            #material_frame{width:200px;}
            .folder-selected{background-color:#8CA6B5;}
            #category-box::-webkit-scrollbar,#material_box::-webkit-scrollbar{width:15px;}
            .has-error{ margin-bottom: 0 !important;}
            #m_table td{height: 25px; line-height: 25px; padding: 0 !important; vertical-align: middle;}
            input.edit_input{width:50px !important;height:22px;line-height:22px;font-size: 12px;padding:0;margin: 2px 0;}
            input.edit_size,input.edit_c_info{width:100px !important;}
            .create_tr input{width:120px !important;height:22px;line-height:22px;font-size: 12px;padding:0;margin: 2px 0;}
            input.edit_c_name,#create_c_name{width:160px !important;}
            #create_num,#create_quality{width:50px !important;}
            .create_tr input.readonly{border: 0; text-align: center;}
            .create_tr input.edit_size{width:100px !important;}
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
                                    <?php
                                    if($access==1){?>
                                        <button class="btn btn-sm btn-primary" id="siblings_add">同级新增</button>
                                        <button class="btn btn-sm btn-primary" id="children_add">下级新增</button>
                                        <button class="btn btn-sm btn-info" id="edit_cate">修改</button>
                                        <button class="btn btn-sm btn-danger" id="delete_cate">删除</button>
                                    <?php }?>
                                    <button class="btn btn-sm btn-default" id="all_show">全部展开</button>
                                    <button class="btn btn-sm btn-default" id="all_hide">全部折叠</button>
                                    <form class="form-inline" action="/category/export" method="post" style="display: inline-block;">
                                        <input type="hidden" name="_csrf-backend" value="<?= Yii::$app->request->csrfToken ?>">
                                        <input type="hidden" name="cid" id="export_cate_cid">
                                        <button type="submit" class="btn btn-sm btn-success" id="export_cate">导出</button>
                                    </form>
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
                                    <?php
                                    if($access==1){?>
                                        <button class="btn btn-sm btn-primary" id="material_add">添加材料</button>
                                        <button class="btn btn-sm btn-danger" id="delete_material">删除材料</button>
                                        <button class="btn btn-sm btn-default" id="material_merge">合并</button>
                                        <button class="btn btn-sm btn-default" id="material_move">移动</button>
                                    <?php }?>
                                    <form class="form-inline" action="/material/export" method="post" style="display: inline-block;">
                                        <input type="hidden" name="_csrf-backend" value="<?= Yii::$app->request->csrfToken ?>">
                                        <input type="hidden" name="cid" id="export_m_cid">
                                        <input type="hidden" name="is_search" id="is_search">
                                        <input type="hidden" name="m_id_arr" id="m_id_arr">
                                        <button type="submit" class="btn btn-sm btn-success" id="export_material">导出</button>
                                    </form>

                                    <label>材料名：</label><input type="text" id="search_c_name">
                                    <label>规格：</label><input type="text" id="search_size" style="width: 80px;">
                                    <button type="button" class="btn btn-sm btn-success" id="search_m_bt">搜索</button>
                                </h5>

                                <div id="material_box">
                                    <table class="table table-condensed text-nowrap table-bordered">
                                        <thead>
                                        <tr>
                                            <th width="60"><input type="checkbox" id="select_all" style="width:18px;height:18px;margin:5px 5px 0!important;"></th>
                                            <th>#</th>
                                            <th>材料ID</th>
                                            <th width="120">材料编号</th>
                                            <th width="280">材料名(*)</th>
                                            <th width="120">材料分类</th>
                                            <th width="120">分类编码</th>
                                            <th width="50">计量单位(*)</th>
                                            <th width="120">规格型号</th>
                                            <th width="60">材质</th>
                                            <th width="120">材料备注</th>
                                            <th width="120">创建者</th>
                                            <th width="120">创建时间</th>
                                        </tr>
                                        </thead>
                                        <tbody id="m_table">
                                        <tr class="create_tr">
                                            <form method="post" id="material-form">
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td><input type="text" name="c_no" class="readonly" id="create_c_no" readonly="true"></td>
                                            <td>
                                                <button type="button" class="btn btn-default create-save"><i class="fa fa-floppy-o"></i></button>
                                                <input type="text" required="true" rangelength="[2, 255]" name="c_name" id="create_c_name">
                                                <input type="hidden" required="true" name="cid" id="create_cid" readonly="true">
                                            </td>
                                            <td><input type="text" class="readonly" name="cate_name" id="create_cate_name" readonly="true"></td>
                                            <td><input type="text" class="readonly" name="cate_no" id="create_cate_no" readonly="true"></td>
                                            <td><input type="text" required="true" name="num" id="create_num" rangelength="[0, 100]"></td>
                                            <td><input type="text" name="size" class="edit_input edit_size" rangelength="[0, 255]"></td>
                                            <td><input type="text" name="quality" id="create_quality" rangelength="[0, 255]"></td>
                                            <td><input type="text" name="c_info" class="edit_input edit_size" rangelength="[0, 255]"></td>
                                            <td>
                                                <input type="text" class="readonly" name="creator" readonly="true" value="<?=Yii::$app->user->identity->name?>">
                                                <input type="hidden" required="true" name="creator_id" readonly="true" value="<?=Yii::$app->user->identity->id?>">
                                                <input type="hidden" name="_csrf-backend" value="<?= Yii::$app->request->csrfToken ?>">
                                            </td>
                                            <td><input type="text" class="readonly" name="created_at" readonly="true" value="<?=date('Y-m-d H:i:s',time())?>"></td>
                                            </form>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="category-create" id="category-create" style="display: none">
                                <form class="form-inline" id="category-form" method="post" style="display:
            inline-block;
            width:100%;">
                                    <div class="form-group">
                                        <label>分类名:</label>
                                        <input type="text" name="cate-cname" id="cate-cname">
                                    </div>
                                    <p></p>
                                    <div class="form-group">
                                        <label>分类类型:</label>
                                        <ul class="cate_type_ul">
                                            <?php foreach ($cate_type_arr as $v) { ?>
                                                <li><input type="radio" class="radio-inline" name="cate_type" value="<?= $v ?>"> <?= $v ?></li>
                                            <?php } ?>
                                            <li><input type="radio" class="radio-inline" name="cate_type" value="0"> 其他</li>
                                            <li><input name="other_cate_type" id="other_cate_type" style="display: none"></li>
                                        </ul>
                                    </div>
                                    <input type="hidden" name="cate-pid" id="cate-pid"/>
                                    <input type="hidden" name="cate-id" id="cate-id"/>
                                    <input type="hidden" name="_csrf-backend" value="<?= Yii::$app->request->csrfToken ?>"/>
                                    <div class="text-center">
                                        <button type="button" class="btn btn-sm btn-success" id="category_save">保存</button>
                                    </div>
                                </form>
                            </div>

                            <div class="modal-body" id="material-merge-modal" style="display: none">
                                <fieldset>
                                    <div class="form-group">
                                        <label class="control-label"> 合并目标材料ID: </label>
                                        <input type="hidden" name="merge_id_arr" id="merge_id_arr">
                                        <input type="text" required="true" id="merge_id" class="form-control" onkeyup="this.value=this.value.replace(/[^\d]/g,'');">
                                    </div>
                                    <div class="text-center"><button type="button" class="btn btn-sm btn-success" id="m_merge_btn">合并</button></div>
                                </fieldset>
                            </div>

                            <div class="modal-body" id="material-move-modal" style="display: none">
                                <fieldset>
                                    <div class="form-group">
                                        <label class="control-label"> 移动目标分类ID: </label>
                                        <input type="hidden" name="move_id_arr" id="move_id_arr">
                                        <input type="text" required="true" id="move_id" class="form-control" onkeyup="this.value=this.value.replace(/[^\d]/g,'');">
                                    </div>
                                    <div class="text-center"><button type="button" class="btn btn-sm btn-success" id="m_move_btn">移动</button></div>
                                </fieldset>
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
    <script src="/js/jquery.validate.min.js"></script>
    <script src="/js/validate.message.js"></script>
    <script type="text/javascript">
        var label_arr = <?=Json::encode(array_keys($material_model->attributeLabels()))?>;
        var label_arr = <?=Json::encode(array_keys($material_model->attributeLabels()))?>;
        var cid = '<?=$cid?>';
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
            $('#category-box').bind('scroll',scrollHandle);
            $('#material_box').bind('scroll',scrollHandle);

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
                $(this).parent('td').find('ul.cate_ul').removeClass('ul-selected');
                $(this).addClass('ul-selected');
                $("#export_cate_cid").val($(this).attr("data-id"));
                $("#is_search").val(0);
                $("#export_m_cid").val($(this).attr("data-id"));
                var treeitem = $(".tree-item[data-id='"+$(this).attr("data-id")+"']");
                if(treeitem.length > 0){
                    $(".tree-item").removeClass('tree-selected');
                    treeitem.addClass("tree-selected");
                    $(".tree-item i").removeClass('icon-ok').addClass("icon-remove");
                    treeitem.find("i").removeClass('icon-remove').addClass("icon-ok");
                }else{
                    $(".tree-item").removeClass('tree-selected');
                    $(".tree-item i").removeClass('icon-ok').addClass("icon-remove");
                }

                //console.log($(this).attr('data-id'));
                $.ajax({
                    type: "GET",
                    url: "/material/view?type=ajax&id=" + $(this).attr("data-id"),
                    success: function (data) {
                        data = JSON.parse(data);
                        //console.log(data);
                        var m_html = '';
                        for (var i = 0; i < data.length; i++) {
                            m_html = m_html + '<tr data-c_id="'+data[i]['c_id']+'"><td>' +
                                '<input type="checkbox" name="select-m" class="select-m" value="'+data[i]['c_id']+'">' +
                                '</td><td>' + (i+1) + '</td>';
                            for (k in label_arr) {
                                if($.inArray(label_arr[k],['c_name','num','size','quality','c_info'])!=-1){
                                    if (data[i][label_arr[k]] == null) {
                                        input_value = '';
                                    } else {
                                        input_value = data[i][label_arr[k]];
                                    }
                                    if(label_arr[k]=='c_name'){
                                        var td_value = '<button type="button" class="btn btn-default edit-save"><i class="fa fa-floppy-o"></i></button>';
                                    }else{
                                        var td_value = '';
                                    }
                                    td_value=td_value+'<input type="text" class="edit_input edit_'+label_arr[k]+'" value="'+input_value+'">';
                                }else{
                                    if (data[i][label_arr[k]] == null) {
                                        td_value = '';
                                    } else {
                                        td_value = data[i][label_arr[k]];
                                    }
                                }
                                m_html = m_html + '<td>' + td_value + '</td>';
                            }
                            m_html = m_html + '</tr>';
                        }
                        //console.log(m_html);
                        $("#m_table tr:nth-of-type(n+2)").remove();
                        $("#m_table").append(m_html);
                        $("#create_c_no").val('');
                        $("#create_cate_name").val('');
                        $("#create_cate_no").val('');
                        $("#create_cid").val('');
                    }
                });
            });

            if(cid!=''){
                $(".cname[data-id='"+cid+"']").click();
                var index = $(".cname").index($(".cname[data-id='"+cid+"']"));
                if(index>3){
                    $("#category-box").scrollTop((index-3) * 30);
                }
            }
            $('#search_m_bt').bind('click', function () {
                if($('#search_c_name').val()!='' || $('#search_size').val()!=''){
                    $(".tree-item").removeClass('tree-selected');
                    $("ul.cname.ul-selected").removeClass('ul-selected');
                    $(".tree-item i").removeClass('icon-ok').addClass("icon-remove");
                    $.ajax({
                        type: "POST",
                        url: "/material/view",
                        data: {'type':'ajax','search_c_name':$('#search_c_name').val(),'search_size':$('#search_size').val()},
                        success: function (data) {
                            data = JSON.parse(data);
                            //console.log(data);//m_table label_arr
                            var m_html = '';
                            for (var i = 0; i < data.length; i++) {
                                m_html = m_html + '<tr data-c_id="'+data[i]['c_id']+'"><td>' +
                                    '<input type="checkbox" name="select-m" class="select-m" value="'+data[i]['c_id']+'">' +
                                    '</td><td>' + (i+1) + '</td>';
                                for (k in label_arr) {
                                    if($.inArray(label_arr[k],['c_name','num','size','quality','c_info'])!=-1){
                                        if (data[i][label_arr[k]] == null) {
                                            input_value = '';
                                        } else {
                                            input_value = data[i][label_arr[k]];
                                        }
                                        if(label_arr[k]=='c_name'){
                                            var td_value = '<button type="button" class="btn btn-default edit-save"><i class="fa fa-floppy-o"></i></button>';
                                        }else{
                                            var td_value = '';
                                        }
                                        td_value=td_value+'<input type="text" class="edit_input edit_'+label_arr[k]+'" value="'+input_value+'">';
                                    }else{
                                        if (data[i][label_arr[k]] == null) {
                                            td_value = '';
                                        } else {
                                            td_value = data[i][label_arr[k]];
                                        }
                                    }
                                    m_html = m_html + '<td>' + td_value + '</td>';
                                }
                                m_html = m_html + '</tr>';
                            }
                            //console.log(m_html);
                            $("#m_table tr:nth-of-type(n+2)").remove();
                            $("#m_table").append(m_html);
                            $("#create_c_no").val('');
                            $("#create_cate_name").val('');
                            $("#create_cate_no").val('');
                            $("#create_cid").val('');
                            $("#is_search").val(1);
                            $("#m_id_arr").val(get_select(0));
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

        $("#siblings_add").bind('click', function () {
            var ulselected = $('ul.cname.ul-selected');
            //console.log(ulselected.attr("data-id"));
            if (typeof (ulselected.attr("data-id")) == "undefined") {
                layer.msg('请点击分类名选择一个分类再操作！', {icon: 6});
            } else {
                $("#cate-pid").val(ulselected.attr("data-pid"));
                $("#cate-id").val('');
                $("#cate-cname").val('');
                $("input[name='cate_type']").attr("checked",false);
                $("#other_cate_type").val('');
                $("#category-form").attr("action","/category/create");
                layer.open({
                    type: 1,
                    title: '添加材料分类',
                    area: ['450px', '300px'],
                    content: $('#category-create'),
                });
            }
        });

        $("#children_add").bind('click', function () {
            var ulselected = $('ul.cname.ul-selected');
            //console.log(ulselected.attr("data-id"));
            if (typeof (ulselected.attr("data-id")) == "undefined") {
                layer.msg('请点击分类名选择一个分类再操作！', {icon: 6});
            } else {
                $("#cate-pid").val(ulselected.attr("data-id"));
                $("#cate-id").val('');
                $("#cate-cname").val('');
                $("input[name='cate_type']").prop("checked",false);
                $("#other_cate_type").val('');
                $("#category-form").attr("action","/category/create");
                layer.open({
                    type: 1,
                    title: '添加材料分类',
                    area: ['450px', '300px'],
                    content: $('#category-create'),
                });
            }
        });

        $("#edit_cate").bind('click', function () {
            var ulselected = $('ul.cname.ul-selected');
            //console.log(ulselected.attr("data-id"));
            if (typeof (ulselected.attr("data-id")) == "undefined") {
                layer.msg('请点击分类名选择一个分类再操作！', {icon: 6});
            } else {
                $("#cate-id").val(ulselected.attr("data-id"));
                $("#cate-cname").val($('ul.cname.ul-selected li').text());
                var cate_type = $("ul.cate_type[data-id='" + ulselected.attr("data-id") + "'] li").text();
                $("input[name='cate_type'][value='" + cate_type + "']").prop("checked",true);
                $("#category-form").attr("action","/category/create");
                layer.open({
                    type: 1,
                    title: '修改材料分类',
                    area: ['450px', '300px'],
                    content: $('#category-create'),
                });
            }
        });

        $("#delete_cate").bind('click', function () {
            var ulselected = $('ul.cname.ul-selected');
            //console.log(ulselected.attr("data-id"));
            if (typeof (ulselected.attr("data-id")) == "undefined") {
                layer.msg('请点击分类名选择一个分类再操作！', {icon: 6});
            } else {
                var children = ulselected.nextAll(".cname[data-pid='" + ulselected.attr("data-id") + "']");
                if (children.length > 0) {
                    layer.msg('此分类下还有子分类，无法删除！', {icon: 6});
                } else {
                    if($("#m_table tr").length > 1){
                        layer.msg('此分类下还有材料，无法删除！', {icon: 6});
                    }else{
                        layer.confirm('确认删除此分类?', {icon: 3, title: '删除分类'}, function (index) {
                            $.ajax({
                                type: "POST",
                                url: "/category/delete",
                                data: {'cid':ulselected.attr("data-id")},
                                success: function (data) {
                                    //data = JSON.parse(data);
                                    console.log($.type(data.errCode==0));
                                    if (data.errCode==0) {
                                        layer.msg(data.errMsg, {icon: 6});
                                        document.location.reload();
                                    } else {
                                        layer.msg(data.errMsg, {icon: 6});
                                    }
                                }
                            });
                            layer.close(index);
                        });
                    }
                }
            }
        });

        $("#material_add").bind('click', function () {
            var treeselected = $('div.tree-item.tree-selected');
            //console.log(treeselected.attr("data-id"));
            if (typeof (treeselected.attr("data-id")) == "undefined") {
                layer.msg('请选择一个末级分类！', {icon: 6});
            } else {    //material-modal
                var cid = treeselected.attr("data-id");
                if($("#add-box").html()==''){   //正在添加
                    layer.msg('一次只能添加一个材料！', {icon: 6});
                }else{
                    $.ajax({
                        type: "POST",
                        url: "/ajax/getdata",
                        data: {'module':'material-add','cid':cid},
                        success: function (data) {
                            data=JSON.parse(data);
                            console.log(data);
                            if(data.error){
                                layer.msg(data.msg, {icon: 6});
                            }else{
                                $("#create_c_no").val(data.data.c_no);
                                $("#create_cid").val(cid);
                                $("#create_cate_no").val(data.data.cate_no);
                                $("#create_cate_name").val(data.data.cate_name);
                            }
                        }
                    });
                }
            }
        });

        $("input[name='cate_type']").bind('click', function () {
            if ($('input[name="cate_type"]:checked').val() == 0) {
                $("#other_cate_type").show();
            } else {
                $("#other_cate_type").val('');
                $("#other_cate_type").hide();
            }
        });

        $("#category_save").bind('click', function () {
            if ($("#cate-cname").val() == ''){
                layer.msg('请填写分类名！', {icon: 6});
            }else if(typeof ($('input[name="cate_type"]:checked').val()) == "undefined"){
                layer.msg('请选择分类类型！', {icon: 6});
            }else if($('input[name="cate_type"]:checked').val() == 0 && $("#other_cate_type").val() == ''){
                layer.msg('请填写分类类型！', {icon: 6});
            }else {
                $("#category-form").submit();
            }
        });

        var formValidate = {
            errorElement: 'div',
            errorClass: 'help-block',
            focusInvalid: false,
            highlight: function (e) {
                $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
            },
            success: function (e) {
                $(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
                $(e).remove();
            }
        };

        $("#m_add_btn").bind('click', function () {
            if (!$("#material-form").validate(formValidate).form()) {
                return false;
            }
            formData = transformToJson($("#material-form").serializeArray());
            $.ajax({
                type: "POST",
                url: "/material/create",
                data: formData,
                success: function (data) {
                    //data=JSON.parse(data);
                    //console.log(data);
                    if(data.errCode!=0){
                        layer.msg(data.msg, {icon: 6});
                    }else{
                        layer.msg('添加材料成功！', {icon: 6});
                        location.href='/category-material/index?cid='+$("#create_cid").val();
                    }
                }
            });
        });

        $("#delete_material").bind('click', function () {
            var vals = get_select(1);
            if(vals){
                var cid = $('ul.cname.ul-selected').attr("data-id");
                layer.confirm('确认删除材料?', {icon: 3, title: '删除材料'}, function (index) {
                    $.ajax({
                        type: "POST",
                        url: "/material/delete",
                        data: {'id_arr':vals},
                        success: function (data) {
                            data = JSON.parse(data);
                            //console.log(data);
                            if (data.error) {
                                layer.msg(data.msg, {icon: 6});
                            } else {
                                layer.msg(data.msg, {icon: 6});
                                location.href='/category-material/index?cid='+cid;
                            }
                        }
                    });
                    layer.close(index);
                });
            }else{
                layer.msg('请选择一个材料再操作！', {icon: 6});
            }
        });

        $("#material_merge").bind('click', function () {
            var vals = get_select(1);
            if(vals){
                $("#merge_id_arr").val(vals);
                layer.open({
                    type: 1,
                    title: '合并材料',
                    area: ['300px', '200px'],
                    offset: '50px',	//只定义top坐标，水平保持居中
                    shadeClose:true,
                    content: $('#material-merge-modal'),
                });
            }else{
                layer.msg('请选择一个材料再操作！', {icon: 6});
            }
        });

        $("#material_move").bind('click', function () {
            var vals = get_select(1);
            if(vals){
                $("#move_id_arr").val(vals);
                layer.open({
                    type: 1,
                    title: '移动材料',
                    area: ['300px', '200px'],
                    offset: '50px',	//只定义top坐标，水平保持居中
                    shadeClose:true,
                    content: $('#material-move-modal'),
                });
            }else{
                layer.msg('请选择一个材料再操作！', {icon: 6});
            }
        });

        $('#select_all').bind('click',function() {
            if($(this).is(':checked')){
                $('.select-m').prop("checked",true);
            }else{
                $('.select-m').prop("checked",false);
            }
        });

        $('#m_merge_btn').bind('click',function() {
            if($('#merge_id').val()!=''){
                layer.confirm('确认合并到此材料?', {icon: 3, title: '合并材料'}, function (index) {
                    $.ajax({
                        type: "POST",
                        url: "/ajax/getdata",
                        data: {'module':'material-merge','merge_id':$("#merge_id").val(),'merge_id_arr':$("#merge_id_arr").val()},
                        success: function (data) {
                            data = JSON.parse(data);
                            if(data.error){
                                layer.msg(data.msg, {icon: 6});
                            }else{
                                layer.msg('合并成功！', {icon: 6});
                                location.href='/category-material/index?cid='+data.data.cid;
                            }
                        }
                    });
                    layer.close(index);
                });
            }
        });

        $('#m_move_btn').bind('click',function() {
            if($('#move_id').val()!=''){
                layer.confirm('确认移动到此分类下?', {icon: 3, title: '移动材料'}, function (index) {
                    $.ajax({
                        type: "POST",
                        url: "/ajax/getdata",
                        data: {'module':'material-move','move_id':$("#move_id").val(),'move_id_arr':$("#move_id_arr").val()},
                        success: function (data) {
                            data = JSON.parse(data);
                            if(data.error){
                                layer.msg(data.msg, {icon: 6});
                            }else{
                                layer.msg('移动成功！', {icon: 6});
                                location.href='/category-material/index?cid='+data.data.cid;
                            }
                        }
                    });
                    layer.close(index);
                });
            }
        });

        $("#m_table").on('click','.edit-save',function(){
            var tr = $(this).parent('td').parent('tr');
            var c_id = tr.attr('data-c_id');//'c_name','num','size','quality','c_info'
            var c_name = tr.find('.edit_c_name').val();
            var num = tr.find('.edit_num').val();
            var size = tr.find('.edit_size').val();
            var quality = tr.find('.edit_quality').val();
            var c_info = tr.find('.edit_c_info').val();
            var cid = $(".cname.ul-selected").attr("data-id");
            if(c_name!='' && num!=''){
                $.ajax({
                    type: "POST",
                    url: "/material/update",
                    data: {'c_id':c_id,'c_name':c_name,'num':num,'size':size,'quality':quality,'c_info':c_info},
                    success: function (data) {
                        if(data.errCode==0){
                            layer.msg('保存成功', {icon: 6});
                            setTimeout(function () {
                                window.location.href='/category-material/index?cid='+cid;
                            }, 500);
                        }else{
                            layer.msg(data.errMsg, {icon: 6});
                        }
                    }
                });
            }else{
                layer.msg('材料名和计量单位不能为空', {icon: 6});
                setTimeout(function () {
                    window.location.href='/category-material/index?cid='+cid;
                }, 500);
            }
        });

        $('.create-save').bind('click',function(){
            var cid = $(".cname.ul-selected").attr("data-id");
            if($("#create_c_name").val()!='' && $("#create_num").val()!='' && $("#create_c_no").val()!=''){
                var formData = new FormData($("#material-form")[0]);
                $.ajax({
                    type: "POST",
                    url: "/material/create",
                    data: formData,
                    contentType : false,
                    processData : false,
                    success: function (data) {
                        if(data.errCode==0){
                            layer.msg('保存成功', {icon: 6});
                            setTimeout(function () {
                                window.location.href='/category-material/index?cid='+cid;
                            }, 500);
                        }else{
                            layer.msg(data.errMsg, {icon: 6});
                        }
                    }
                });
            }else{
                layer.msg('材料编号、材料名和计量单位不能为空', {icon: 6});
            }
        });

        function get_select(checked) {
            var arr = new Array();
            if(checked){
                $("input.select-m:checked").each(function(i){
                    arr[i] = $(this).val();
                });
            }else{
                $("input.select-m").each(function(i){
                    arr[i] = $(this).val();
                });
            }
            return arr.join(",");
        }
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