<?php

use backend\models\DtoaCategory;
use backend\models\DtoaProject;
use backend\models\DtoaSupplier;
use jinxing\admin\models\AdminUser;
use jinxing\admin\widgets\MeTable;
use backend\models\DtoaStorage;
use backend\models\DtoaPlan;
use backend\models\DtoaAgreement;
use yii\helpers\Json;

// 定义标题和面包屑信息
switch ($k_type) {
    case 1:
        $this->title = '材料入库审批';
        break;
    case 2:
        $this->title = '商砼入库审批';
        break;
    case 3:
        $this->title = '租赁入库审批';
        break;
}
$project=DtoaProject::find()->select(['g_name'])->indexBy('g_id')->column();
$supplier=DtoaSupplier::find()->select(['s_name'])->indexBy('s_id')->column();
$plan=DtoaPlan::find()->select(['j_name'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->indexBy('j_id')->column();
$agreement=DtoaAgreement::find()->select(['h_name'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->indexBy('h_id')->column();
$user=AdminUser::find()->andWhere(['status' => AdminUser::STATUS_ACTIVE])->select(['name'])->indexBy('id')->column();
$category=DtoaCategory::find()->select(['cname'])->indexBy('cid')->column();
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
    var supplier = <?=Json::encode($supplier)?>;
    var plan = <?=Json::encode($plan)?>;
    var user = <?=Json::encode($user)?>;
    var agreement = <?=Json::encode($agreement)?>;
    var category = <?=Json::encode($category)?>;
    var storage_type = <?=Json::encode(DtoaStorage::STORAGE_TYPE)?>;
    var storage_source = <?=Json::encode(DtoaStorage::STORAGE_SOURCE)?>;
    var kStatus = <?=Json::encode(array_slice(DtoaStorage::STORAGE_STATUS,1,2,true))?>;
    var kStatusColor = <?=Json::encode(array_slice(DtoaStorage::STORAGE_STATUS_COLOR,1,2,true))?>;
    var kStatus_this = <?=Json::encode(array_slice(array_keys(DtoaStorage::STORAGE_STATUS),1,2))?>;
    //console.log(JSON.stringify(kStatus_this));
    var m = meTables({
        title: "入库审批",
        number: false,
        pk: "k_id",
        params:{'g_id':'<?=Yii::$app->session['g_id']?>', 'k_status||in':JSON.stringify(kStatus_this),'next_admin_id':'<?=Yii::$app->user->identity->id?>', 'k_type':<?=$k_type?>},
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
                            if(data==0){
                                $(td).html('');
                            }else{
                                $(td).html(agreement[data]);
                            }
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
                        title: "入库来源",
                        data: "k_source",
                        value: storage_source,
                        <?php
                        if($k_type==1){?>
                        search: {type: "select"},
                        <?php }?>
                        createdCell: function (td, data) {
                            $(td).html(storage_source[data]);
                        },
                        sortable: false
                    },
                    {
                        title: "入库状态",
                        data: "k_status",
                        value: kStatus,
                        edit: {type: "select", required: true, number: true},
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
                        title: "进场日期",
                        data: "arrival_date",
                        sortable: false,
                    },
					{
						title: "入库备注",
						data: "k_info",
						edit: {type: "text", rangeLength: "[2, 255]"},
						sortable: false
					},
					{
						title: "总金额",
						data: "total_price",
                        createdCell: function (td, data) {
                            $(td).html(parseFloat(data));
                        },
						edit: {type: "text", required: true,readonly:"true", value:0.00},
						sortable: false
					},
					{
						title: "创建者",
						data: "creator",
						edit: {type: "text", required: true, rangeLength: "[2, 255]",
                            value:'<?=Yii::$app->user->identity->name?>'},
						sortable: false
					},
					{
						title: "创建时间",
						data: "created_at",
                        edit: {type: "text",readonly:"true",value:'<?=date('Y-m-d H:i:s',time())?>'},
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
                    title: "查看审批入库",
                    className: "btn-success",
                    cClass: "me-table-view",
                    icon: "fa fa-search-plus",
                    sClass: "blue",
                    "min-icon": "fa-search-plus",
                },
                <?php
                if($access==1){?>
                more: {
                    title: "审批入库",
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
         $("#search-k_status").val(1).trigger('change');
         $('#search-s_id').chosen().trigger('chosen:updated');
     });

    $(document).on("click", ".me-table-view-show-table", function () {
        // 当前点击按钮所在的行
        var row = $(this).data("row");
        // 获取当前行的所有数据信息
        var data = m.table.data()[row];
        // 自定义处理逻辑
        //console.log(data);
        window.parent.addIframe(GetRandomNum(1000,10000),'/approval-storage/view?id='+data['k_id'],'查看审批入库');
    });

    $(document).on("click", ".me-table-more-show-table", function () {
        // 当前点击按钮所在的行
        var row = $(this).data("row");
        // 获取当前行的所有数据信息
        var data = m.table.data()[row];
        // 自定义处理逻辑
        //console.log(data);
        window.parent.addIframe(GetRandomNum(1000,10000),'/approval-storage/update?id='+data['k_id'],'审批入库');
    });
</script>
<?php $this->endBlock(); ?>