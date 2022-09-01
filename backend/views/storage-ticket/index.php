<?php

use backend\models\DtoaApprovalGroup;
use backend\models\DtoaCategory;
use backend\models\DtoaSupplier;
use jinxing\admin\models\AdminUser;
use jinxing\admin\widgets\MeTable;
use backend\models\DtoaStorage;
use backend\models\DtoaProject;
use backend\models\DtoaPlan;
use backend\models\DtoaAgreement;
use yii\helpers\Json;

// 定义标题和面包屑信息
$this->title = '商砼小票入库';
$project=DtoaProject::find()->select(['g_name'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->indexBy('g_id')->column();
$supplier=DtoaSupplier::find()->select(['s_name'])->indexBy('s_id')->column();
$category=DtoaCategory::find()->select(['cname'])->indexBy('cid')->column();
$agreement=DtoaAgreement::find()->select(['h_name'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->indexBy('h_id')->column();
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
    <script src="/js/common.js"></script>
<script type="text/javascript">
    var project = <?=Json::encode($project)?>;
    var user = <?=Json::encode($user)?>;
    var supplier = <?=Json::encode($supplier)?>;
    var agreement = <?=Json::encode($agreement)?>;
    var category = <?=Json::encode($category)?>;
    var storage_type = <?=Json::encode(DtoaStorage::STORAGE_TYPE)?>;
    var storage_source = <?=Json::encode(DtoaStorage::STORAGE_SOURCE)?>;
    var kStatus = <?=Json::encode(DtoaStorage::STORAGE_STATUS)?>;
    var kStatusColor = <?=Json::encode(DtoaStorage::STORAGE_STATUS_COLOR)?>;
    var m = meTables({
        title: "入库操作",
        number: false,
        pk: "k_id",
        params:{'g_id':'<?=Yii::$app->session['g_id']?>','k_type':2},
        table: {
            columns: [
					{
						title: "入库ID",
						data: "k_id",
						sortable: false
					},
					{
						title: "入库单号",
						data: "k_no",
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
                        title: "合同",
                        data: "h_id",
                        createdCell: function (td, data) {
                            $(td).html(strCut(agreement[data],15));
                        },
                        sortable: false
                    },
                    {
                        title: "入库类型",
                        data: "k_type",
                        createdCell: function (td, data) {
                            $(td).html(storage_type[data]);
                        },
                        sortable: false
                    },
                    {
                        title: "入库状态",
                        data: "k_status",
                        value: kStatus,
                        search: {type: "select"},
                        createdCell: function (td, data) {
                            $(td).html(MeTables.valuesString(kStatus, kStatusColor, data));
                        },
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
                        title: "总金额",
                        data: "total_price",
                        createdCell: function (td, data) {
                            $(td).html(parseFloat(data));
                        },
                        sortable: false
                    },
                    {
                        title: "进场日期",
                        data: "arrival_date",
                        sortable: false,
                    },
					{
						title: "入库备注",
						data: "k_info",
						sortable: false
					},
					{
						title: "创建者",
						data: "creator",
						sortable: false
					},
					{
						title: "入库时间",
						data: "created_at",
						sortable: false,
					}
            ]       
        },
        buttons: {
            create:null,
            updateAll:null,
            deleteAll:null,
            <?php if($access==1){?>
            add: {
                "data-func": "add",
                text: "添加",
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
                    title: "查看小票入库",
                    className: "btn-success",
                    cClass: "me-table-view",
                    icon: "fa fa-search-plus",
                    sClass: "blue",
                    "min-icon": "fa-search-plus",
                },
                <?php
                if($access==1){?>
                more: {
                    title: "更新小票入库",
                    className: "btn-warning",
                    cClass: "me-table-more",
                    icon: "fa fa-pencil",
                    sClass: "blue",
                    "min-icon": "fa-search-plus",
                },
                del: {
                    show: function (rows) {
                        return rows.k_status == 0;
                    },
                    title: "删除入库",
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

    /*$.extend(m, {
        // 编辑的前置和后置操作
        beforeSave: function(data) {
            //console.log(data);
            if(data[4].value==''){
                data[4].value=0;
            }
            return true;
        },
    });*/

     $(function(){
         m.init();
         $('#search-s_id').chosen().trigger('chosen:updated');
     });

    $(document).on("click", "#show-table-add", function () {
        parent.addIframe(GetRandomNum(1000,100000),'/storage-ticket/create','添加小票入库');
    });

    $(document).on("click", ".me-table-view-show-table", function () {
        // 当前点击按钮所在的行
        var row = $(this).data("row");
        // 获取当前行的所有数据信息
        var data = m.table.data()[row];
        // 自定义处理逻辑
        //console.log(data);
        parent.addIframe(GetRandomNum(1000,100000),'/storage-ticket/view?id='+data['k_id'],'查看小票入库');
    });

    $(document).on("click", ".me-table-more-show-table", function () {
        // 当前点击按钮所在的行
        var row = $(this).data("row");
        // 获取当前行的所有数据信息
        var data = m.table.data()[row];
        // 自定义处理逻辑
        //console.log(data);
        parent.addIframe(GetRandomNum(1000,100000),'/storage-ticket/update?id='+data['k_id'],'更新小票入库');
    });

</script>
<?php $this->endBlock(); ?>