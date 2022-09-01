<?php

use backend\models\DtoaProject;
use backend\models\DtoaSupplier;
use jinxing\admin\models\AdminUser;
use jinxing\admin\widgets\MeTable;
use backend\models\DtoaPay;
use yii\helpers\Json;

// 定义标题和面包屑信息
$this->title = '采购结算';
$supplier=DtoaSupplier::find()->select(['s_name'])->indexBy('s_id')->column();
$project=DtoaProject::find()->select(['g_name'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->indexBy('g_id')->column();
$user=AdminUser::find()->andWhere(['status' => AdminUser::STATUS_ACTIVE])->select(['name'])->indexBy('id')->column();
if($access==0){
    $this->title = $this->title.'（只读权限）';
}
?>
<?=MeTable::widget()?>
    <style>
        #search_s_id_chosen span,ul.chosen-results li{text-align: left !important;}
    </style>
<?php $this->beginBlock('javascript') ?>
    <link href="/css/chosen.css" rel="stylesheet">
    <script src="/js/chosen.jquery.js"></script>
<script type="text/javascript">
    var project = <?=Json::encode($project)?>;
    var supplier = <?=Json::encode($supplier)?>;
    var user = <?=Json::encode($user)?>;
    var pStatus = <?=Json::encode(DtoaPay::PAY_STATUS)?>;
    var pStatusColor = <?=Json::encode(DtoaPay::PAY_STATUS_COLOR)?>;
    var m = meTables({
        title: "采购结算",
        number: false,
        pk: "p_id",
        params:{'g_id':'<?=Yii::$app->session['g_id']?>'},
        table: {
            columns: [
                
					{
						title: "结算ID",
						data: "p_id",
						sortable: false
					},
					{
						title: "结算单号",
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
						search: {type: "select"},
                        createdCell: function (td, data) {
                            $(td).html(supplier[data]);
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
                        title: "结算状态",
                        data: "p_status",
                        value: pStatus,
                        search: {type: "select"},
                        createdCell: function (td, data) {
                            $(td).html(MeTables.valuesString(pStatus, pStatusColor, data));
                        },
                        sortable: false
                    },
                    {
                        title: "是否打印",
                        data: "has_print",
                        createdCell: function (td, data) {
                            $(td).html((data==1)?'<span class="label label-sm label-success"> 是 </span>':'<span ' +
                                'class="label label-sm label-default">否 </span>');
                        },
                        sortable: false,
                        export: false
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
						sortable: false
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
            create: null,
            updateAll:null,
            deleteAll:null,
            <?php if($access==1){?>
            pay: {
                text: "结算",
                icon: "ace-icon fa fa-plus-circle blue",
                className: "btn btn-white btn-primary btn-bold",
            },
            <?php }?>
        },
        operations: {
            buttons: {
                see:null,
                delete:null,
                update:null,
                // 添加自定义的按钮
                view: {
                    title: "查看结算",
                    className: "btn-success",
                    cClass: "me-table-view",
                    icon: "fa fa-search-plus",
                    sClass: "blue",
                    "min-icon": "fa-search-plus"
                },
                <?php
                if($access==1){?>
                more: {
                    title: "更新结算",
                    className: "btn-warning",
                    cClass: "me-table-more",
                    icon: "fa fa-pencil",
                    sClass: "blue",
                    "min-icon": "fa-search-plus",
                },
                del: {
                    show: function (rows) {
                        return rows.p_status == 0;
                    },
                    title: "删除结算",
                    className: "btn-danger",
                    cClass: "me-table-delete",
                    icon: "fa-trash-o",
                    sClass: "red",
                    "min-icon": "fa-trash-o"
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
         $('#search-s_id').chosen().trigger('chosen:updated');
     });

    $(document).on("click", "#show-table-pay", function () {
        parent.addIframe(GetRandomNum(1000,100000),'/pay/create','添加结算');
    });

    $(document).on("click", ".me-table-view-show-table", function () {
        // 当前点击按钮所在的行
        var row = $(this).data("row");
        // 获取当前行的所有数据信息
        var data = m.table.data()[row];
        // 自定义处理逻辑
        //console.log(data);
        parent.addIframe(GetRandomNum(1000,100000),'/pay/view?id='+data['p_id'],'查看结算');
    });

    $(document).on("click", ".me-table-more-show-table", function () {
        // 当前点击按钮所在的行
        var row = $(this).data("row");
        // 获取当前行的所有数据信息
        var data = m.table.data()[row];
        // 自定义处理逻辑
        //console.log(data);
        parent.addIframe(GetRandomNum(1000,100000),'/pay/update?id='+data['p_id'],'更新结算');
    });
</script>
<?php $this->endBlock(); ?>