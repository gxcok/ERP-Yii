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
if($access==0){
    $this->title = $this->title.'（只读权限）';
}
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
    .ullist li:last-child{margin-bottom: 10px;}
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
    #itemslist li ol.approval_ol li span{float:left;display: inline-block;width: 140px;height: 28px;margin: 0;cursor: auto;}
    #itemslist li ol span{margin-right:5px;cursor: auto;}
    #itemslist li ol span label{margin: 0 !important; display: none;}
    #itemslist li ol.approval_ol li{width:160px;min-width: 160px;border-bottom: #8D8D8D 1px dotted;}
    #itemslist li ol.approval_ol li span label{margin: 0 !important; display: inline-block;cursor: auto;}
    #userlist{margin-right: 20px;cursor: auto;}
    #itemslist{min-height:1150px;}
    .ullist h4{text-indent: 10px;line-height:30px;font-size: 16px;margin:0;}
    #userlist li{border: none;height:32px;width:180px;}
    #userlist li span{width:180px;color: #fff; display: block;}
    #userlist li span label{margin: 0;cursor: auto;}
</style>
<div class="project-grant-update main-content">
    <h4 style="padding-left: 10px;color: #333;height:35px;margin: 0;"><?= Html::encode
        ($this->title) ?>
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
">以下为工程所有功能授权模块，各审批模块[ 计划审批 入库审批 结算审批 ]审核流程为①->②->③...顺序审批</h4>
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
            </ul>
        </div>
    </div>
</div>
<script src="/layer/layer.js"></script><script src="/js/common.js"></script>
<script src="/lib/laydate/laydate.js"></script>
<script>
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
    });
</script>
