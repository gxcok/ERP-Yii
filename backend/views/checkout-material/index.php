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
$this->title = '材料出库';
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
        .btn-group>button.btn{
            margin-right: 5px !important;
        }
        #search_s_id_chosen span,ul.chosen-results li{text-align: left !important;}
    </style>
<?php $this->beginBlock('javascript') ?>
    <link href="/css/chosen.css" rel="stylesheet">
    <script src="/js/chosen.jquery.js"></script>
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
    var cStatus = <?=Json::encode(DtoaStorage::CHECKOUT_STATUS)?>;
    var cStatusColor = <?=Json::encode(DtoaStorage::CHECKOUT_STATUS_COLOR)?>;
    var m = meTables({
        title: "出库操作",
        number: false,
        pk: "k_id",
        params:{'g_id':'<?=Yii::$app->session['g_id']?>','k_type':1,'k_status':'>=2'},
        table: {
            columns: [
					{
						title: "出库ID",
						data: "k_id",
						sortable: false
					},
					{
						title: "出库单号",
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
                        title: "入库状态",
                        data: "k_status",
                        value: kStatus,
                        createdCell: function (td, data) {
                            $(td).html(MeTables.valuesString(kStatus, kStatusColor, data));
                        },
                        sortable: false
                    },
                    {
                        title: "出库状态",
                        data: "c_status",
                        value: cStatus,
                        search: {type: "select"},
                        createdCell: function (td, data) {
                            $(td).html(MeTables.valuesString(cStatus, cStatusColor, data));
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
                        title: "总金额",
                        data: "total_price",
                        createdCell: function (td, data) {
                            $(td).html(parseFloat(data));
                        },
                        sortable: false
                    },
                    {
                        title: "创建者",
                        data: "creator",
                        sortable: false
                    },
					{
						title: "出库备注",
						data: "k_info",
						sortable: false
					},
					{
						title: "出库时间",
						data: "checkout_time",
						sortable: false,
					}
            ]       
        },
        buttons: {
            create:null,
            updateAll:null,
            deleteAll:null,
            export:null,
        },
        operations: {
            buttons: {
                see:null,
                delete:null,
                update:null,
                // 添加自定义的按钮
                <?php
                if($access==1){?>
                more: {
                    title: "材料出库",
                    className: "btn-warning",
                    cClass: "me-table-more",
                    icon: "fa fa-pencil",
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

    $(document).on("click", ".me-table-more-show-table", function () {
        // 当前点击按钮所在的行
        var row = $(this).data("row");
        // 获取当前行的所有数据信息
        var data = m.table.data()[row];
        // 自定义处理逻辑
        //console.log(data);
        parent.addIframe(GetRandomNum(1000,100000),'/checkout-material/update?id='+data['k_id'],'材料出库');
    });

</script>
<?php $this->endBlock(); ?>