<?php

use backend\models\DtoaAgreement;
use backend\models\DtoaApprovalGroup;
use backend\models\DtoaProject;
use backend\models\DtoaSupplier;
use jinxing\admin\models\AdminUser;
use jinxing\admin\widgets\MeTable;
use yii\helpers\Json;

// 定义标题和面包屑信息
$this->title = '合同审批';
$project=DtoaProject::find()->select(['g_name'])->indexBy('g_id')->column();
$supplier=DtoaSupplier::find()->select(['s_name'])->indexBy('s_id')->column();

$user=AdminUser::find()->andWhere(['status' => AdminUser::STATUS_ACTIVE])->select(['name'])->indexBy('id')->column();
if($access==0){
    $this->title = $this->title.'（只读权限）';
}
?>
<?php if(!empty($closeallpage)){?>
    <script>parent.closeallpage();</script>
<?php } ?>
<?=MeTable::widget()?>
    <style>
        #search_s_id_chosen span,ul.chosen-results li{text-align: left !important;}
    </style>
<?php $this->beginBlock('javascript') ?>
    <link href="/css/chosen.css" rel="stylesheet">
    <script src="/js/chosen.jquery.js"></script>
    <script src="/js/common.js"></script>
<script type="text/javascript">
    var user = <?=Json::encode($user)?>;
    var project = <?=Json::encode($project)?>;
    var supplier = <?=Json::encode($supplier)?>;
    var h_type = <?=Json::encode(DtoaAgreement::AGREEMENT_TYPE)?>;
    var hStatus = <?=Json::encode(array_slice(DtoaAgreement::AGREEMENT_STATUS,1,2,true))?>;
    var hStatusColor = <?=Json::encode(array_slice(DtoaAgreement::AGREEMENT_STATUS_COLOR,1,2,true))?>;
    var hStatus_this = <?=Json::encode(array_slice(array_keys(DtoaAgreement::AGREEMENT_STATUS),1,2))?>;
    //console.log(JSON.stringify(hStatus_this));
    var m = meTables({
        title: "合同拟定",
        number: false,
        pk: "h_id",
        params:{'g_id':'<?=Yii::$app->session['g_id']?>', 'h_status||in':JSON.stringify(hStatus_this), 'next_admin_id':'<?=Yii::$app->user->identity->id?>'},
        table: {
            columns: [
					{
						title: "合同ID",
						data: "h_id",
						sortable: false
					},
					{
						title: "工程",
						data: "g_id",
                        createdCell: function (td, data) {
                            $(td).html(project[data]);
                        },
                        visible: false,
						sortable: false
					},
                    {
                        title: "合同编号",
                        data: "h_no",
                        sortable: false
                    },
                    {
                        title: "合同名",
                        data: "h_name",
                        createdCell: function (td, data) {
                            $(td).html(strCut(data,15));
                        },
                        search: {type: "text"},
                        sortable: false
                    },
                    {
                        title: "合同类型",
                        data: "h_type",
                        value: h_type,
                        search: {type: "select"},
                        createdCell: function (td, data) {
                            $(td).html(h_type[data]);
                        },
                        sortable: false
                    },
                    {
                        title: "供应商",
                        data: "s_id",
                        value: supplier,
                        search: {type: "select"},
                        createdCell: function (td, data) {
                            $(td).html(supplier[data]);
                        },
                        sortable: false
                    },
                    {
                        title: "合同状态",
                        data: "h_status",
                        value: hStatus,
                        edit: {type: "select", required: true, number: true},
                        search: {type: "select"},
                        createdCell: function (td, data) {
                            $(td).html(MeTables.valuesString(hStatus, hStatusColor, data));
                        },
                        sortable: false
                    },
                    {
                        title: "总金额",
                        data: "total_price",
                        createdCell: function (td, data) {
                            $(td).html(parseFloat(data));
                        },
                        sortable: false
                    },
                    {
                        title: "生效日期",
                        data: "need_date",
                        sortable: false,
                    },
                    {
                        title: "审批人",
                        data: "next_admin_id",
                        createdCell: function (td, data) {
                            $(td).html(user[data]);
                        },
                        sortable: false,
                    },
                    {
                        title: "审批通过时间",
                        data: "approval_time",
                        sortable: false,
                    },
					{
						title: "合同备注",
						data: "h_info",
						edit: {type: "text", rangeLength: "[0, 255]"},
						sortable: false
					},
					{
						title: "创建者ID",
						data: "creator_id",
						sortable: false,
                        hide:true,
					},
					{
						title: "创建者",
						data: "creator",
						sortable: false
					},
					{
						title: "创建时间",
						data: "created_at",
						sortable: false,
					}
            ]       
        },
        buttons: {
            create:null,
            updateAll:null,
            deleteAll:null,
        },
        operations: {
            buttons: {
                see:null,
                delete:null,
                update:null,
                view: {
                    title: "查看合同审批",
                    className: "btn-success",
                    cClass: "me-table-view",
                    icon: "fa fa-search-plus",
                    sClass: "blue",
                    "min-icon": "fa-search-plus",
                },
                <?php
                if($access==1){?>
                more: {
                    title: "审批合同",
                    className: "btn-warning",
                    cClass: "me-table-more",
                    icon: "fa fa-plus",
                    sClass: "blue",
                    "min-icon": "fa-search-plus",
                },
                <?php }?>
            }
        },
    });
    
    /**
    $.extend(m, {
        // 显示的前置和后置操作
        beforeShow: function(data) {
            return true;
        },
        afterShow: function(data) {
            return true;
        },
        
        // 编辑的前置和后置操作
        beforeSave: function(data) {
            return true;
        },
        afterSave: function(data) {
            return true;
        }
    });
    */

     $(function(){
         m.init();
         $("#search-h_status").val(1).trigger('change');
         $('#search-s_id').chosen().trigger('chosen:updated');
     });

    $(document).on("click", ".me-table-view-show-table", function () {
        // 当前点击按钮所在的行
        var row = $(this).data("row");
        // 获取当前行的所有数据信息
        var data = m.table.data()[row];
        // 自定义处理逻辑
        //console.log(data);
        window.parent.addIframe(GetRandomNum(1000,10000),'/approval-agreement/view?id='+data['h_id'],'查看合同审批');
    });

    $(document).on("click", ".me-table-more-show-table", function () {
        // 当前点击按钮所在的行
        var row = $(this).data("row");
        // 获取当前行的所有数据信息
        var data = m.table.data()[row];
        // 自定义处理逻辑
        //console.log(data);
        parent.addIframe(GetRandomNum(1000,100000),'/approval-agreement/update?id='+data['h_id'],'审批合同');
    });
</script>
<?php $this->endBlock(); ?>