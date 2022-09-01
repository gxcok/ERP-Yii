<?php

use backend\models\DtoaApprovalGroup;
use backend\models\DtoaItems;
use jinxing\admin\models\Admin;
use yii\helpers\Html;
use yii\helpers\Json;
use yii\widgets\ActiveForm;
use backend\models\DtoaProject;
use jinxing\admin\models\AdminUser;
/* @var $this yii\web\View */
/* @var $model backend\models\DtoaCart */

$this->title = '系统赋权';
$user=AdminUser::find()->andWhere(['status' => AdminUser::STATUS_ACTIVE])->andWhere(['!=', 'id', Admin::SUPER_ADMIN_ID])->asArray()->all();
?>
<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/css/jquery.dad.css">
<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<style>
    .main-content{display:block;padding: 10px;color: #fff;}
    .wrap{display:block;}
    .ullist{float: left;width:100%;display:block;margin:10px 0;padding: 0;list-style: none;line-height: 30px;border: #8D8D8D 1px solid;}
    .ullist li{margin:6px 10px 0;border: #8D8D8D 1px solid;}
    .ullist li:last-child{ margin-bottom: 10px;}
    #itemslist li{width: 50%;min-width:500px;}
    #itemslist li ol{display:block;height:210px;border: #8D8D8D 1px dashed;margin: 5px 5px 10px;border-radius: 5px;
        padding: 3px; list-style: none;}
    #itemslist li h5{height: 25px;color: #8D8D8D;text-align: center;
        line-height: 25px; margin:5px 5px 0; font-weight: bold;}
    #itemslist li ol li{border: none;width: 100%;height:30px;border-bottom: #8D8D8D 1px dotted;margin: 0;}
    .row{ margin: 0 !important;}
    .col-xs-1, .col-sm-1, .col-md-1, .col-lg-1, .col-xs-2, .col-sm-2, .col-md-2, .col-lg-2, .col-xs-3, .col-sm-3, .col-md-3, .col-lg-3, .col-xs-4, .col-sm-4, .col-md-4, .col-lg-4, .col-xs-5, .col-sm-5, .col-md-5, .col-lg-5, .col-xs-6, .col-sm-6, .col-md-6, .col-lg-6, .col-xs-7, .col-sm-7, .col-md-7, .col-lg-7, .col-xs-8, .col-sm-8, .col-md-8, .col-lg-8, .col-xs-9, .col-sm-9, .col-md-9, .col-lg-9, .col-xs-10, .col-sm-10, .col-md-10, .col-lg-10, .col-xs-11, .col-sm-11, .col-md-11, .col-lg-11, .col-xs-12, .col-sm-12, .col-md-12, .col-lg-12{padding: 0 !important;}
    #itemslist li ol span{margin-right: 10px; margin-top: 5px;}
    #itemslist li ol li span{ width: 100% !important;}
    #itemslist li ol span label{margin: 0 !important;}
    #userlist{margin-right: 20px;}
    #itemslist{min-height:800px;}
    .ullist h4{text-indent: 10px;line-height:30px;font-size: 16px;margin:0;}
    #userlist li{border: none;height:32px;width:230px;min-height:32px;}
    #userlist li span{width:230px;color: #fff; display: block;cursor: pointer;}
    #userlist li label{margin: 0;cursor: pointer;}
</style>
<div class="project-grant-update main-content">
    <h4 style="padding-left: 10px;color: #333;height:35px;margin: 0;line-height: 35px;"><?= Html::encode($this->title) ?></h4>
    <div class="wrap">
        <div style="float:none;position: fixed;width:270px;height:500px;overflow-x: hidden;overflow-y:auto;">
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
        <div style="margin-left:290px;">
            <ul class="ullist" id="itemslist">
                <h4 style="background-color: #8D8D8D;margin-top: 0; line-height: 35px; font-size: 14px; letter-spacing:1px;
">以下为系统所有共用授权模块，将对应人员拖拽到指定的模块保存即可</h4>
                <?php foreach (DtoaProject::SYSTEM_ITEMS as $key => $item) { ?>
                    <li data-id="<?=$key?>">
                        <h4><?=$item?></h4>
                        <div class="row">
                            <div class="col-md-8">
                                <h5 class="view">查看人员</h5>
                                <ol class="view-ol">
                                    <?php
                                    if(!empty($data[$key][0])){
                                        foreach ($data[$key][0] as $i) {?>
                                            <span class="btn btn-sm" data-userid="<?=$i['id']?>"><?=$i['name']?>
                                                <label><?=$i['department']?></label></span>
                                        <?php }} ?>
                                </ol>
                            </div>
                            <div class="col-md-4">
                                <h5 class="update">编辑人员</h5>
                                <ol class="update-ol">
                                    <?php
                                    if(!empty($data[$key][1])){
                                        foreach ($data[$key][1] as $i) {?>
                                            <span class="btn btn-sm" data-userid="<?=$i['id']?>"><?=$i['name']?>
                                                <label><?=$i['department']?></label></span>
                                        <?php } }?>
                                </ol>
                            </div>
                        </div>
                    </li>
                <?php } ?>
                <h3 style="float:left;display: block;width: 100%;padding-left: 50px;">
                    <input type="hidden" id="csrf-system-grant" value="<?= Yii::$app->request->csrfToken ?>" />
                    <input type="hidden" name="item_arr" id="item_arr">
                    <button type="button" class="btn btn-success" id="system-grant-save" style="margin:0 160px 0 70px;
">保存授权</button>
                </h3>
            </ul>
        </div>
    </div>
</div>
<script src="/layer/layer.js"></script><script src="/js/common.js"></script>
<script src="/js/jquery.dad.min.js"></script>
<script>
    var system_items = <?=Json::encode(DtoaProject::SYSTEM_ITEMS)?>;
    //console.log(approval_items);

    $(function(){
        var itemsColor=['#8ca9aa','#87a288','#938894','#a29597','#a4aaa4','#95ac90','#8da2a0','#938c9e','#a29597',
            '#9f9ea8','#aaa187', "#8f9590", "#a8939e"];
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
                //console.log(has,userid);
                if(!has){
                    e.find('span').appendTo(target);
                    //target.find('label').hide();
                }
            });
        });
    });
    $('#itemslist li ol').on('click', 'span',function(){
        //console.log($(this).attr('data-userid'));
        $(this).remove();
    });

    $('#system-grant-save').bind('click',function(){
        var item_arr = get_item_arr();
        for (var item_id in item_arr){
            if(typeof(item_arr[item_id][1]) == "undefined"){
                layer.msg(system_items[item_id]+'编辑人员未设置!', {icon: 6});
                return ;
            }
        }
        $("#item_arr").val(JSON.stringify(item_arr));
        //console.log(get_item_arr());
        $.ajax({
            type: "POST",
            url: "/system-grant/save",
            data: {'_csrf-backend':$('#csrf-system-grant').val(), 'item_arr':JSON.stringify(item_arr)},
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
            var update_ol_span = $(this).find('ol.update-ol>span');
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
</script>
