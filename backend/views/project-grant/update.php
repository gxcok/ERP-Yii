<?php

use backend\models\DtoaApprovalGroup;
use backend\models\DtoaItems;
use jinxing\admin\models\Admin;
use yii\helpers\Html;
use yii\helpers\Json;
use yii\web\ForbiddenHttpException;
use yii\widgets\ActiveForm;
use backend\models\DtoaProject;
use jinxing\admin\models\AdminUser;
/* @var $this yii\web\View */
/* @var $model backend\models\DtoaCart */

$this->title = '工程授权: ' . $project->g_name;
$user=AdminUser::find()->andWhere(['status' => AdminUser::STATUS_ACTIVE])->andWhere(['!=', 'id', Admin::SUPER_ADMIN_ID])->asArray()->all();
$project_more=DtoaProject::find()->select(['g_name'])->andWhere(['!=', 'g_status', 0])->andWhere(['!=', 'g_id', $project->g_id])->indexBy('g_id')->column();
?>
<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/css/jquery.dad.css">
<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<style>
    .main-content{display:block;padding: 10px;color: #fff;}
    .wrap{display:block;}
    .ullist{float: left;width:100%;display:block;margin:10px 0;padding: 0;list-style: none;line-height: 30px;border: #8D8D8D 1px solid;}
    .ullist li{float: left;margin:6px 10px 0;border: #8D8D8D 1px solid;}
    .ullist li:last-child{ margin-bottom: 10px;}
    #itemslist li{width: 30%;}
    .view_box{float:left;display:inline-block;width:calc(100% - 180px);min-width: 140px;}
    .update_box{float:left;display:inline-block;width: 180px;}
    #itemslist li ol{display: block;height:180px;border: #8D8D8D 1px dashed;margin: 5px;border-radius: 5px; padding:
            3px; list-style: none;}
    #itemslist li h5{height: 25px;color: #8D8D8D;text-align: center;
        line-height: 25px; margin:5px 5px 0; font-weight: bold;}
    #itemslist li ol li{border: none;width: 100%;height:29px;margin: 0;}
    #itemslist li ol.approval_ol li b{float:left;display: inline-block; width: 20px;height: 28px;
        background:#8D8D8D;color: #fff;margin:0; line-height: 28px; text-align: center;border: 0; border-radius: 2px;}
    #itemslist li ol.approval_ol li span{float:left;display: inline-block;width: 140px;height: 28px;margin: 0;}
    #itemslist li ol span{}
    #itemslist li ol span label{margin: 0 !important; display: none;}
    #itemslist li ol.approval_ol li{width:160px;min-width: 160px;border-bottom: #8D8D8D 1px dotted;}
    #itemslist li ol.approval_ol li span label{margin: 0 !important; display: inline-block;}
    #userlist{margin-right: 20px;}
    #itemslist{min-height:1150px;}
    .ullist h4{text-indent: 10px;line-height:30px;font-size: 16px;margin:0;}
    #userlist li{border: none;height:32px;width:180px;min-width:180px;}
    #userlist li span{width:180px;color: #fff; display: block;cursor: pointer;}
    #userlist li span label{margin: 0;cursor: pointer;}
</style>
<div class="project-grant-update main-content">
    <h4 style="padding-left: 10px;color: #333;height:35px;margin: 0;"><?= Html::encode
        ($this->title) ?>
        <form class="form-inline" style="display: inline-block;margin-left: 15px;">
            <?php
            if($project->g_status==0){
            ?>
            <select class="form-control " id="select_project">
                <option value="">选择已有工程一键引用授权</option>
                <?php foreach ($project_more as $k => $p) { ?>
                    <option value="<?=$k?>"><?=$p?></option>
                <?php } ?>
            </select>
            <?php
            }
            ?>
            <input type="hidden" id="grant_g_id" name="g_id" value="<?=$project->g_id?>">
            <input type="hidden" id="csrf-project-grant" value="<?= Yii::$app->request->csrfToken ?>" />
        </form>
    </h4>
    <div class="wrap">
        <div style="float:none;position: fixed;width:220px;height:500px;overflow-x: hidden;overflow-y:auto;">
            <ul class="ullist selectbox" id="userlist">
                <h4 style="background-color: #8D8D8D;margin-top:0; line-height: 35px; font-size: 14px;">所有员工用户列表：</h4>
                <?php foreach ($user as $k => $u) {
                    if($u['id']!=Admin::SUPER_ADMIN_ID){
                        ?>
                        <li class="item item<?=$k?>"><span class="btn btn-sm" data-userid="<?=$u['id']?>"><?=$u['name']?> <label><?=$u['department']?></label></span></li>
                    <?php }
                } ?>
            </ul>
        </div>
        <div style="margin-left:230px;">
            <ul class="ullist" id="itemslist">
                <h4 style="background-color: #8D8D8D;margin-top: 0; line-height: 35px; font-size: 14px; letter-spacing:1px;
">以下为工程所有功能授权模块，将对应人员拖拽到指定的模块保存即可，各审批模块[ 计划审批 入库审批 结算审批 ]审核流程为①->②->③...顺序审批</h4>
                <?php foreach (DtoaProject::PROJECT_ITEMS as $key => $item) { ?>
                    <li data-id="<?=$key?>">
                        <h4><?=$item?></h4>
                        <div class="view_box">
                            <h5 class="view">查看人员</h5>
                            <ol class="view-ol">
                                <?php
                                if(!empty($data[$key][0])){
                                    foreach ($data[$key][0] as $i) {?>
                                        <span class="btn btn-sm" data-userid="<?=$i['id']?>"><?=$i['name']?>
                                            <label><?=$i['department']?></label></span>
                                    <?php }} ?>
                            </ol></div>
                        <div class="update_box">
                            <h5 class="update">编辑人员</h5>
                            <ol class="update-ol <?php if(in_array($key,array_keys(DtoaProject::PROJECT_APPROVAL_ITEMS))) {?>approval_ol<?php }?>">
                                <?php
                                if(in_array($key,array_keys(DtoaProject::PROJECT_APPROVAL_ITEMS))) {
                                    for ($i = 1; $i <= 6; $i++) {
                                        ?>
                                        <li><b><?=$i?></b>
                                            <?php
                                            if(!empty($data[$key][1][$i-1])){
                                                $ii=$data[$key][1][$i-1];
                                                ?>
                                                <span class="btn btn-sm"
                                                      data-userid="<?=$ii['id']?>"><?=$ii['name']?> <label><?=$ii['department']?></label></span>
                                                <?php
                                            }?>
                                        </li>
                                        <?php
                                    }
                                }else{
                                    if(!empty($data[$key][1])){
                                        foreach ($data[$key][1] as $i) {?>
                                            <span class="btn btn-sm" data-userid="<?=$i['id']?>"><?=$i['name']?>
                                                <label><?=$i['department']?></label></span>
                                        <?php }
                                    }
                                }?>
                            </ol>
                        </div>
                    </li>
                <?php } ?>
                <input type="hidden" name="item_arr" id="item_arr">
                <h3 class="inline" style="float:left;display: block;width: 100%;padding-left: 50px;">
                    <button class="btn btn-success" id="project-grant-save" style="margin:0 160px 0 70px;
">保存工程授权</button>
                    <?php
                    if($project->g_status==0){
                    ?>
                    <button class="btn btn-primary" id="project-grant-savemore">保存授权并正式启动工程</button>
                        <?php
                    }
                    ?>
                </h3>
            </ul>
        </div>
    </div>
</div>
<script src="/layer/layer.js"></script><script src="/js/common.js"></script>
<script src="/lib/laydate/laydate.js"></script>
<script src="/js/jquery.dad.min.js"></script>
<script>
    var project_items = <?=Json::encode(DtoaProject::PROJECT_ITEMS)?>;
    var approval_items = <?=Json::encode(array_keys(DtoaProject::PROJECT_APPROVAL_ITEMS))?>;
    //console.log(approval_items);
    
    function loaditems(g_id){
        $.ajax({
            type: "POST",
            url: "/project-grant/loaditems",
            data: {"g_id": g_id,'_csrf-backend':$('#csrf-project-grant').val()},
            success: function (data) {
                data=JSON.parse(data);
                $.each($('#itemslist>li'),function(key,li){
                    var item_id = parseInt($(this).attr('data-id'));
                    //console.log($.type(data[item_id][1]),data[item_id][1]);
                    if(typeof(data[item_id][0]) != "undefined"){
                        var view_arr = data[item_id][0];
                        $(this).find('ol.view-ol').html('');
                        for (var i=0; i<view_arr.length; i++){
                            var user_html = $("#userlist>li>span[data-userid="+view_arr[i]+"]").prop("outerHTML");
                            $(this).find('ol.view-ol').append(user_html);
                        }
                    }
                    if(typeof(data[item_id][1]) != "undefined"){
                        var update_arr = data[item_id][1];
                        if($.inArray(item_id,approval_items)!==-1) {//是审批组
                            $(this).find('ol.approval_ol li span').remove();
                            for (var i=0; i<update_arr.length; i++){
                                var user_html = $("#userlist>li>span[data-userid="+update_arr[i]+"]").prop("outerHTML");
                                $(this).find('ol.approval_ol li').eq(i).append(user_html);
                            }
                        }else{
                            $(this).find('ol.update-ol').html('');
                            for (var i=0; i<update_arr.length; i++){
                                var user_html = $("#userlist>li>span[data-userid="+update_arr[i]+"]").prop("outerHTML");
                                $(this).find('ol.update-ol').append(user_html);
                            }
                        }
                    }
                });
            }
        })
    }

    $(function(){
        var itemsColor=['#8ca9aa','#938894','#8ca9aa','#8ca9aa','#938894','#938894','#95ac90','#938894','#938894',
            '#938894','#938894','#938894','#aaa187','#938894'];
        var moreColor=["#909a91", "#97ac87", "#898597", "#958e85", "#a48888", "#ac8dab", "#91a2a1",
            "#a28e97",
            "#9791a9", "#a089a3", "#939893", "#8794a6", "#ab9e8c", "#8fa188", "#9ea988", "#8d8888", "#949eab", "#8daba0", "#9694a8", "#aba997", "#93a199", "#9ca085", "#8ba3a2", "#8f9590", "#a0aba7", "#a8939e", "#a8a996", "#9a8d8c", "#8dabac", "#a79994", "#9a91ac", "#9b87a5", "#a291a5", "#aa8d98", "#8d8785", "#959a91", "#91a697", "#88a6ab", "#8ca08b", "#8f948a", "#9aa68d", "#998c87", "#a19d85", "#aca592", "#8ba99f", "#a4a18d", "#91898e", "#a0ac9c", "#a599a2"];
        $.each($('#itemslist li h4'),function(index,val){
            //console.log(RandomColor());
            $(this).attr('style','background-color:'+itemsColor[index]);
        });
        $.each($('#userlist li span'),function(index,val){
            //console.log(RandomColor());
            $(this).attr('style','background-color:'+moreColor[index]);
        });

        var Colorarr=[];
        $.each($('#itemslist li ol span'),function(index,val){
            //console.log(RandomColor());
            var userid = $(this).attr('data-userid');
            var style='';
            if(typeof(Colorarr[userid]) == "undefined"){
                style=Colorarr[userid]=$("#userlist li span[data-userid='"+userid+"']").attr('style');
            }else{
                style=Colorarr[userid];
            }
            $(this).attr('style',style);
        });

        var select = $('.selectbox').dad({
            target: '>li',
            active:true,
        });

        $.each($('#itemslist ol'),function(index,val){
            var target = $(this);
            select.addDropzone(target, function(e){
                var userid= e.find('span').attr('data-userid');
                var has=false;
                var target_span = target.find('span');
                if(target.html()!=''){
                    for (var index in target_span){
                        if(target_span.eq(index).attr('data-userid')==userid){
                            has=true;
                        }
                    }
                }
                if(!has){
                    if($.inArray(parseInt(target.parent('div').parent('li').attr('data-id')), approval_items)!==-1){//审批组插入到li
                        //console.log(target_span.length);
                        if(target.hasClass('approval_ol')){
                            e.find('span').appendTo(target.find('li').eq(target_span.length));
                        }else{
                            e.find('span').appendTo(target);
                        }
                    }else{
                        e.find('span').appendTo(target);
                        //target.find('label').hide();
                    }
                }
            });
        });
    });
    $('#itemslist li ol').on('click', 'span',function(){
        //console.log($(this).attr('data-userid'));
        $(this).remove();
    });

    function get_item_arr(){
        var item_arr=[];
        $.each($('#itemslist>li'),function(key,li){
            //console.log($(this).attr('data-id'));
            var item_id = parseInt($(this).attr('data-id'));

            var view_ol_span = $(this).find('ol.view-ol>span');
            var view_span_arr=[],update_span_arr=[];
            $.each(view_ol_span,function(k,span){ //value代表找到的span
                view_span_arr[k] = parseInt($(this).attr('data-userid'));
            });
            //console.log(view_span_arr);
            item_arr[item_id] = [];
            if(view_span_arr.length>=1){
                item_arr[item_id][0] = view_span_arr;
            }

            if($.inArray(item_id,approval_items)!==-1) {//是审批组
                var update_ol_span = $(this).find('ol.update-ol>li>span');
            }else{
                var update_ol_span = $(this).find('ol.update-ol>span');
            }
            $.each(update_ol_span,function(k,span){ //value代表找到的span
                update_span_arr[k] = parseInt($(this).attr('data-userid'));
            });
            //console.log(update_span_arr);
            if(update_span_arr.length>=1){
                item_arr[item_id][1] = update_span_arr;
            }
        });
        if(item_arr.length>=1){
            return item_arr;
        }else{
            return ;
        }
    }

    function ajax_post(item_arr,status){
        $("#item_arr").val(JSON.stringify(item_arr));
        $.ajax({
            type: "POST",
            url: "/project-grant/save",
            data: {"g_id": $('#grant_g_id').val(),"g_status":status,'_csrf-backend':$('#csrf-project-grant').val(), 'item_arr':JSON.stringify(item_arr)},
            success: function (data) {
                data=JSON.parse(data);
                //console.log(data);
                if(data.error){
                    layer.msg(data.msg, {icon: 6});
                }else{
                    layer.msg(data.msg, {icon: 6});
                    //parent.location.reload();
                }
            }
        })
    }

    $('#select_project').bind('change',function() {    //引用其他工程授权
        if($(this).val()==''){

        }else{
            loaditems($(this).val());
        }
    });

    $('#project-grant-save').bind('click',function() {    //保存工程授权
        var item_arr = get_item_arr();
        //console.log(item_arr);
        for (var item_id in item_arr){
            if(typeof(item_arr[item_id][1]) == "undefined"){
                layer.msg(project_items[item_id]+'编辑人员没有设置！', {icon: 6});
                return ;
            }
        }
        if(get_item_arr()){
            ajax_post(get_item_arr(),0);
        }
    });

    $('#project-grant-savemore').bind('click',function() {    //保存授权并正式启动工程
        var item_arr = get_item_arr();
        for (var item_id in item_arr){
            if(typeof(item_arr[item_id][1]) == "undefined"){
                layer.msg(project_items[item_id]+'编辑人员没有设置！', {icon: 6});
                return ;
            }
        }
        if(get_item_arr()){
            ajax_post(get_item_arr(),1);
        }
    });
</script>
