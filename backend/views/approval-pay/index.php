<?php

use backend\models\DtoaProject;
use backend\models\DtoaSupplier;
use jinxing\admin\models\AdminUser;
use jinxing\admin\widgets\MeTable;
use backend\models\DtoaPay;
use yii\helpers\Json;

// 定义标题和面包屑信息
$this->title = '结算审批';
$supplier=DtoaSupplier::find()->select(['s_name'])->indexBy('s_id')->column();
$project=DtoaProject::find()->select(['g_name'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->indexBy('g_id')->column();
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
<script type="text/javascript">
    var project = <?=Json::encode($project)?>;
    var pStatus = <?=Json::encode(array_slice(DtoaPay::PAY_STATUS,1,2,true))?>;
    var pStatusColor = <?=Json::encode(array_slice(DtoaPay::PAY_STATUS_COLOR,1,2,true))?>;
    var pStatus_this = <?=Json::encode(array_slice(array_keys(DtoaPay::PAY_STATUS),1,2))?>;
    //console.log(JSON.stringify(pStatus_this));
    var supplier = <?=Json::encode($supplier)?>;
    var user = <?=Json::encode($user)?>;
    var m = meTables({
        title: "结算审批",
        number: false,
        pk: "p_id",
        params:{'g_id':'<?=Yii::$app->session['g_id']?>', 'p_status||in':JSON.stringify(pStatus_this),'next_admin_id':'<?=Yii::$app->user->identity->id?>'},
        table: {
            columns: [
                
					{
						title: "结算ID",
						data: "p_id",
						edit: {type: "hidden"},
						sortable: false
					},
					{
						title: "结算单编号",
						data: "p_no",
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
						title: "供应商",
						data: "s_id",
                        value: supplier,
						edit: {type: "select", number: true},
						search: {type: "select"},
                        createdCell: function (td, data) {
                            $(td).html(supplier[data]);
                        },
						sortable: false
					},
                    {
                        title: "结算状态",
                        data: "p_status",
                        value: pStatus,
                        edit: {type: "select", required: true, number: true},
                        search: {type: "select"},
                        createdCell: function (td, data) {
                            $(td).html(MeTables.valuesString(pStatus, pStatusColor, data));
                        },
                        sortable: false
                    },
					{
						title: "总金额",
						data: "total_price",
                        createdCell: function (td, data) {
                            $(td).html(parseFloat(data));
                        },
						edit: {type: "text"},
						sortable: false
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
						title: "结算备注",
						data: "p_info",
						edit: {type: "text", rangeLength: "[2, 255]"},
						sortable: false
					},
					{
						title: "创建者",
						data: "creator",
						edit: {type: "text", required: true, rangeLength: "[2, 255]"},
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
            create: null,
            updateAll:null,
            deleteAll:null,
        },
        operations: {
            buttons: {
                see:null,
                delete:null,
                update:null,
                // 添加自定义的按钮
                view: {
                    title: "查看结算审批",
                    className: "btn-success",
                    cClass: "me-table-view",
                    icon: "fa fa-search-plus",
                    sClass: "blue",
                    "min-icon": "fa-search-plus",
                },
                <?php
                if($access==1){?>
                more: {
                    title: "结算审批",
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
         $("#search-p_status").val(1).trigger('change');
         $('#search-s_id').chosen().trigger('chosen:updated');
     });

    $(document).on("click", ".me-table-view-show-table", function () {
        // 当前点击按钮所在的行
        var row = $(this).data("row");
        // 获取当前行的所有数据信息
        var data = m.table.data()[row];
        // 自定义处理逻辑
        //console.log(data);
        window.parent.addIframe(GetRandomNum(1000,10000),'/approval-pay/view?id='+data['p_id'],'查看结算审批');
    });

    $(document).on("click", ".me-table-more-show-table", function () {
        // 当前点击按钮所在的行
        var row = $(this).data("row");
        // 获取当前行的所有数据信息
        var data = m.table.data()[row];
        // 自定义处理逻辑
        //console.log(data);
        window.parent.addIframe(GetRandomNum(1000,10000),'/approval-pay/update?id='+data['p_id'],'结算审批');
    });
</script>
<?php $this->endBlock(); ?>