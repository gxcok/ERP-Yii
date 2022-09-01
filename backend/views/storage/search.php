<?php

use backend\models\DtoaCategory;
use backend\models\DtoaItems;
use backend\models\DtoaMaterial;
use jinxing\admin\models\Admin;
use jinxing\admin\widgets\MeTable;
use yii\helpers\Json;
use yii\web\ForbiddenHttpException;

// 定义标题和面包屑信息
$this->title = '入库材料查询';
?>
    <link rel="stylesheet" href="/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="/css/ace.min.css"/>
    <style>
        .main-content{margin:0;height:100%;padding:0;}
        .page-content{padding: 8px 20px 0;}
        .dtoa-storage-search{display: block;width:100%;height:750px;margin: 0;}
        .leftbar{float:left;width:500px;height:750px;border: 1px silver solid;overflow:auto;}
        .right-content{float:left;height:750px;display: block;border: 1px silver solid;padding:10px; margin-left: 20px;}
        #storage-box{height:680px;width:700px;margin: 10px 0 0;display: block;overflow:auto;}
        #search-form{width:498px;height:660px;padding:10px;font-size: 12px;display: block;}
        #search-form .form-group{margin-bottom: 5px;}
        #search-form .form-group label{font-size: 12px;}
        #search-form input{display: inline-block!important;height: 22px;}
        #search-form button,#storage-box button{margin-bottom: 5px;}
        #search-form button.search-btn{margin:0;}
        #object_select,#model_select{width: 100px;}
        input.radio_input{float: left;width:16px!important;height:16px!important;margin:3px 5px;}
        input.date_input{width: 150px!important;height: 25px;}
        h4.form-title{height:30px;line-height:30px; text-indent:15px;margin: 0 0 10px; background: silver; color: #fff;font-size: 12px;}
        .radio-box{height:25px;line-height:25px;border: 1px silver solid; border-radius: 3px;}
        .radio-box label{float: left;margin:0 10px;font-size: 12px;}
        .radio-box span{float: left;}
        .float-left{float: left;}
        .float-right{float: right;}
        td,th{text-align:center;}
        tr td{padding:5px 0!important;}
        thead,thead th{background-color:#F5F5F5;}
        #object-div{width:480px;height:200px;overflow: auto;}
        #model-box{width:480px;height:200px;overflow: auto;}
        input.select-o,input.select-m{width:18px;height:18px;}
        #storage-data-box{}
        #object_box td,#material-box td,#storage-data-box td{height:25px;line-height:25px;padding:0!important;vertical-align: middle;}
        .p_list{font-size: 14px;height:30px;line-height:30px;background:silver;cursor: pointer;}
        tr.p_list td{height:30px;line-height:30px;}
        .c_list{background: #e1e1e1;height:25px;}
        tr.p_list label{border: #9e9e9e 1px solid;color:#9e9e9e;width:20px;height:20px;margin: 5px;line-height:16px;
            font-size: 14px; font-weight: bold; text-align: center;}
        tr.p_list td:nth-child(2){text-align: left;}
        /*table{border: #1a1a1a 1px solid;} td{border: #1a1a1a 1px solid;}*/
    </style>
    <link href="/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <div class="dtoa-storage-search">
        <div class="leftbar">
            <form id="search-form" class="search-form" method="post">
                <h4 class="form-title">查询模板</h4>
                <div class="form-group">
                    <label class="control-label">入库日期：</label>
                    <input type="text" class="form-control date_input" name="start_date" id="start_date"> -
                    <input type="text" class="form-control date_input" name="end_date" id="end_date">
                </div>
                <div class="form-group radio-box">
                    <label class="control-label">指定</label>
                    <input type="radio" class="form-control radio_input" name="search-object" value="供应商" checked>
                    <span>供应商</span>
                    <input type="radio" class="form-control radio_input" name="search-object" value="合同"> <span>合同</span>
                </div>
                <span class="float-left">
                <button type="button" class="btn btn-xs btn-success select-btn" id="object_select">选择供应商</button>
            </span>
                <span class="float-right">
                <button type="button" class="btn btn-xs btn-default" id="object_del">删除</button>
                <button type="button" class="btn btn-xs btn-default" id="object_all_del">全部删除</button>
            </span>
                <div id="object-div">
                    <table class="table table-bordered table-condensed text-nowrap">
                        <thead>
                        <tr id="object_head_1">
                            <th></th>
                            <th>供应商名</th>
                            <th>供应商联系人</th>
                            <th>供应商电话</th>
                            <th>供应商备注</th>
                        </tr>
                        <tr id="object_head_2" style="display: none">
                            <th></th>
                            <th>合同名</th>
                            <th>合同编号</th>
                            <th>工程</th>
                            <th>供应商</th>
                        </tr>
                        </thead>
                        <tbody id="object_box">

                        </tbody>
                    </table>
                </div>
                <div class="form-group radio-box">
                    <label class="control-label">指定材料</label>
                    <input type="radio" class="form-control radio_input" name="search-model" value="材料分类" checked> <span>分类</span>
                    <input type="radio" class="form-control radio_input" name="search-model" value="材料"> <span>材料</span>
                </div>
                <span class="float-left">
                <button type="button" class="btn btn-xs btn-success select-btn" id="model_select">选择材料分类</button>
            </span>
                <span class="float-right">
                <button type="button" class="btn btn-xs btn-default" id="model_del">删除</button>
                <button type="button" class="btn btn-xs btn-default" id="model_all_del">全部删除</button>
            </span>
                <div class="form-group" id="model-box">
                    <table class="table table-bordered table-condensed text-nowrap">
                        <thead>
                        <tr>
                            <th></th>
                            <th>名称</th>
                            <th>编码</th>
                            <th>单位</th>
                            <th>规格型号</th>
                            <th>材质</th>
                            <th>分类名</th>
                            <th>分类编码</th>
                        </tr>
                        </thead>
                        <tbody id="material-box">

                        </tbody>
                    </table>
                </div>
                <div class="form-group text-center">
                    <button type="button" class="btn btn-sm btn-primary" id="search-btn">查询</button>
                </div>
            </form>
        </div>
        <div class="right-content">
            <button class="btn btn-sm btn-default" id="all_show">全部展开</button>
            <button class="btn btn-sm btn-default" id="all_hide">全部折叠</button>
            <button class="btn btn-sm btn-default" id="excel_export">导出报表</button>
            <div id="storage-box">
                <table class="table table-bordered table-condensed table-responsive text-nowrap" id="storage-data-table">
                    <thead>
                    <tr>
                        <th width="5%"></th>
                        <th width="15%">供应商名称</th>
                        <th width="10%">入库单号</th>
                        <th width="15%">合同名</th>
                        <th width="15%">材料名</th>
                        <th width="5%">规格型号</th>
                        <th width="5%">单位</th>
                        <th width="5%">数量</th>
                        <th width="10%">单价</th>
                        <th width="10%">金额</th>
                    </tr>
                    </thead>
                    <tbody id="storage-data-box">

                    </tbody>
                    <tfoot>
                    <tr>
                        <th colspan="10" class="text-right">总金额：<span id="all_total_price"></span> 元</th>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>

<?php $this->beginBlock('javascript') ?>
    <script src="/js/jquery.validate.min.js"></script>
    <script src="/js/validate.message.js"></script>
    <script src="/layer/layer.js"></script><script src="/js/common.js"></script>
    <script src="/js/bootstrap-datetimepicker.js"></script>
    <script src="/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="/js/jquery.table2excel.js"></script>

    <script type="text/javascript">
        var date = new Date();
        $('.date_input').datetimepicker({
            language:  'zh-CN',
            //format: 'yyyy-mm-dd hh:ii',
            format: 'yyyy-mm-dd',
            //endDate: date,  //只能选现在之前的时间
            autoclose:true,
            startView:2,
            minView:2,  //0
            todayBtn:true,
            minuteStep:30
        });
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
        $(function(){
            Browser = validBrowser();
            function scrollHandle(e) {
                var scrollTop = this.scrollTop;
                if(Browser.name=='IE'){//IE浏览器 $.browser.version
                    $(this).find('thead tr th').css("transform","translateY(" + scrollTop + "px)");
                }else{
                    $(this).find('thead').css("transform","translateY(" + scrollTop + "px)");
                }
            }

            $('#object-div').bind('scroll', scrollHandle);
            $('#model-box').bind('scroll', scrollHandle);
            $('#storage-box').bind('scroll', scrollHandle);

            $(".radio_input").bind('click',function(){
                if($(this).attr('name')=='search-object'){
                    var btn = $("#object_select");
                    if($(this).val()=='供应商'){
                        $("#object_head_2").hide();
                        $("#object_head_1").show();
                    }
                    if($(this).val()=='合同'){
                        $("#object_head_1").hide();
                        $("#object_head_2").show();
                    }
                    $("#object_box").html('');
                }
                if($(this).attr('name')=='search-model'){
                    var btn = $("#model_select");
                    $("#material-box").html('');
                }
                btn.text('选择'+$(this).val());
            });

            $(".select-btn").bind('click',function(){
                switch($(this).text()) {
                    case '选择供应商':
                        $url='/supplier/storageselect';
                        break;
                    case '选择合同':
                        $url='/agreement/storageselect';
                        break;
                    case '选择材料分类':
                        $url='/category/storageselect';
                        break;
                    case '选择材料':
                        $url='/material/select';
                        break;
                }
                layer.open({
                    type: 2,
                    //offset: '50px',
                    title: $(this).text(),
                    shade: 0.8,
                    area: ['1200px', '600px'],
                    content: $url,
                });
            });

            $("#object_del").bind('click',function(){
                var vals = get_select('input.select-o',1);
                if(vals){
                    $("input.select-o:checked").each(function() { // 遍历选中的checkbox
                        n = $(this).parents("tr").index();  // 获取checkbox所在行的顺序
                        $("#object_box tr:eq("+n+")").remove();
                    });
                }else{
                    layer.msg('请选择一个对象再操作！', {icon: 6,time: 2000,offset: ['300px', '120px']});
                }
            });

            $("#object_all_del").bind('click',function(){
                $("#object_box").html('');
            });

            $("#model_del").bind('click',function(){
                var vals = get_select('input.select-m',1);
                if(vals){
                    $("input.select-m:checked").each(function() { // 遍历选中的checkbox
                        n = $(this).parents("tr").index();  // 获取checkbox所在行的顺序
                        $("#material-box tr:eq("+n+")").remove();
                    });
                }else{
                    layer.msg('请选择一个材料再操作！', {icon: 6,time: 2000,offset: ['300px', '120px']});
                }
            });

            $("#model_all_del").bind('click',function(){
                $("#material-box").html('');
            });
        });

        function create_input(ids,module,id) {
            var id_arr = ids.split(",");
            $.ajax({
                type: "POST",
                url: "/ajax/getdata",
                data: {'module': module, 'id_arr': id_arr},
                success: function (data) {
                    data = JSON.parse(data);
                    //console.log(data);
                    if (data.error) {
                        layer.msg(data.msg, {icon: 6});
                    } else {
                        data = data.data;
                        var input_html = '';
                        if (module == 'supplier-select') {
                            for (var i in data) {
                                input_html = input_html +
                                    "<tr>" +
                                    "<td><input type='checkbox' name='select-o' class='select-o' value=" + data[i]['s_id'] + "></td>" +
                                    "<td>" + data[i]['s_name'] + "</td>" +
                                    "<td>" + data[i]['s_contact'] + "</td>" +
                                    "<td>" + data[i]['s_tel'] + "</td>" +
                                    "<td>" + data[i]['s_info'] + "</td>" +
                                    "</tr>";
                            }
                            $("#object_box").html(input_html);
                        }
                        if (module == 'agreement-storage-select') {
                            for (var i in data) {
                                input_html = input_html +
                                    "<tr>" +
                                    "<td><input type='checkbox' name='select-o' class='select-o' value=" + data[i]['c_id'] + "></td>" +
                                    "<td>" + data[i]['h_name'] + "</td>" +
                                    "<td>" + data[i]['h_no'] + "</td>" +
                                    "<td>" + data[i]['g_name'] + "</td>" +
                                    "<td>" + data[i]['s_name'] + "</td>" +
                                    "</tr>";
                            }
                            $("#object_box").html(input_html);
                        }
                        if (module == 'material-select' || module == 'category-select') {
                            for (var i in data) {
                                input_html = input_html +
                                    "<tr>" +
                                    "<td><input type='checkbox' name='select-m' class='select-m' value=" + data[i]['c_id'] + "></td>" +
                                    "<td>" + data[i]['c_name'] + "</td>" +
                                    "<td>" + data[i]['c_no'] + "</td>" +
                                    "<td>" + data[i]['num'] + "</td>" +
                                    "<td>" + data[i]['size'] + "</td>" +
                                    "<td>" + data[i]['quality'] + "</td>" +
                                    "<td>" + data[i]['cate_name'] + "</td>" +
                                    "<td>" + data[i]['cate_no'] + "</td>" +
                                    "</tr>";
                            }
                            $("#material-box").html(input_html);
                        }
                    }
                }
            });
        }


        $("#search-btn").bind('click',function() {
            var o_vals = get_select('input.select-o', 0);
            var m_vals = get_select('input.select-m', 0);
            var start_date = $("#start_date").val();
            var end_date = $("#end_date").val();
            var search_object = $("input[name='search-object']").val();

            //console.log(o_vals, m_vals,search_object);
            if(o_vals=='' && m_vals=='' && start_date=='' && end_date==''){
                layer.msg('请选择查询条件再操作！', {icon: 6,time: 2000,offset: ['300px', '120px']});
            }else{
                $.ajax({
                    type: "POST",
                    url: "/ajax/getdata",
                    data: {'module': 'storage-get','o_vals':o_vals,'m_vals':m_vals,'start_date':start_date,'end_date':end_date,'search_object':search_object},
                    success: function (data) {
                        data = JSON.parse(data);
                        //console.log(data);
                        if (data.error) {
                            layer.msg(data.msg, {icon: 6});
                            $("#storage-data-box").html('');
                        } else {
                            data = data.data;
                            var input_html = '';
                            var n = 0;
                            var all_total_price = 0;
                            for (var i in data) {
                                n=n+1;
                                input_html = input_html +
                                    "<tr class='p_list' data-id='"+ i +"'>" +
                                    "<td>"+ n +"</td>" +
                                    "<td><label class='show_list'>-</label>" + data[i]['s_name'] + "</td>" +
                                    "<td></td><td></td><td></td><td></td><td></td><td></td><td></td>" +
                                    "<td>" + parseFloat(data[i]['total_price']) + "</td>" +
                                    "</tr>";
                                all_total_price = all_total_price + parseFloat(data[i]['total_price']);
                                var sub = data[i]['sub'];
                                for (var k in sub) {
                                    n=n+1;
                                    input_html = input_html +
                                        "<tr class='c_list' data-pid='"+ i +"'>" +
                                        "<td>"+ n +"</td>" +
                                        "<td></td>" +
                                        "<td>" + sub[k]['k_no'] + "</td>" +
                                        "<td>" + sub[k]['h_name'] + "</td>" +
                                        "<td>" + sub[k]['c_name'] + "</td>" +
                                        "<td>" + sub[k]['size'] + "</td>" +
                                        "<td>" + sub[k]['num'] + "</td>" +
                                        "<td>" + parseFloat(sub[k]['j_real_num']) + "</td>" +
                                        "<td>" + parseFloat(sub[k]['j_real_price']) + "</td>" +
                                        "<td>" + parseFloat(sub[k]['one_price']) + "</td>" +
                                        "</tr>";
                                }
                            }
                            $("#storage-data-box").html(input_html);
                            $("#all_total_price").text(parseFloat(all_total_price));
                        }
                    }
                });
            }
        });

        function get_select(elem,checked) {
            var arr = new Array();
            if(checked){
                $(elem+":checked").each(function(i){
                    arr[i] = $(this).val();
                });
            }else{
                $(elem).each(function(i){
                    arr[i] = $(this).val();
                });
            }
            return arr.join(",");
        }

        $("#storage-data-box").on('click','tr.p_list',function() {
            s_id = $(this).attr('data-id');
            if($(this).find('label').hasClass('show_list')){
                $(this).find('label').removeClass('show_list').addClass('hide_list');
                $("tr.c_list[data-pid='"+s_id+"']").fadeOut();
                $(this).find('label').text('+');
            }else{
                $(this).find('label').removeClass('hide_list').addClass('show_list');
                $("tr.c_list[data-pid='"+s_id+"']").fadeIn();
                $(this).find('label').text('-');
            }
        });

        $("#all_show").bind('click',function(){
            $("tr.p_list label").removeClass('hide_list').addClass('show_list');
            $("tr.p_list label").text('-');
            $("tr.c_list").fadeIn();
        });

        $("#all_hide").bind('click',function(){
            $("tr.p_list label").removeClass('show_list').addClass('hide_list');
            $("tr.p_list label").text('+');
            $("tr.c_list").fadeOut();
        });

        /*excel = new ExcelGen({
            "src_id": "storage-data-table",
            "show_header": true
        });*/
        $("#excel_export").bind('click',function(){
            //console.log($("#storage-data-table").prop("outerHTML"));
            //excel.generate();
            $("#storage-data-table").table2excel({
                exclude: ".noExl",
                name: "入库材料查询报表",
                filename: "入库材料查询报表" + new Date().Format("yyyyMMddhhmm") + ".xls",
                fileext: ".xls",
                exclude_img: false,
                exclude_links: false,
                exclude_inputs: false,
                preserveColors: true
            });
        });
    </script>
<?php $this->endBlock(); ?>