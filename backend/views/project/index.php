<?php

use backend\models\DtoaItems;
use jinxing\admin\models\Admin;
use jinxing\admin\widgets\MeTable;
use yii\helpers\Json;
use backend\models\DtoaProject;
use yii\web\ForbiddenHttpException;

// 定义标题和面包屑信息
$this->title = '工程管理';
if($access==0){
    $this->title = $this->title.'（只读权限）';
}
?>
<?php if(!empty($closeallpage)){?>
    <script>parent.closeallpage();</script>
<?php } ?>
<?=MeTable::widget()?>
<?php $this->beginBlock('javascript') ?>
<style>
    .btn-group>button.btn{
        margin-right: 10px !important;
    }
</style>
<script type="text/javascript">
    var gStatus = <?=Json::encode(DtoaProject::PROJECT_STATUS)?>,
        gStatusColor = <?=Json::encode(DtoaProject::PROJECT_STATUS_COLOR)?>;
    var m = meTables({
        title: "工程管理",
        number: false,
        pk: "g_id",
        table: {
            columns: [
                
					{
						title: "工程ID",
						data: "g_id",
						edit: {type: "hidden"},
						sortable: false
					},
					{
						title: "工程编号",
						data: "g_no",
						edit: {type: "text", required: true,readonly:"true",value:'<?=DtoaProject::getno()?>'},
						sortable: false
					},
					{
						title: "工程名",
						data: "g_name",
                        search: {type: "text"},
						edit: {type: "text", required: true, rangeLength: "[2, 255]"},
						sortable: false
					},
					{
						title: "创建者",
						data: "creator",
						edit: {type: "text", required: true,readonly:"true", rangeLength: "[2, 50]",value:'<?=Yii::$app->user->identity->name?>'},
						sortable: false
					},
                    {
                        title: "创建者ID",
                        data: "creator_id",
                        edit: {type: "text", required: true,readonly:"true", number: true,value:'<?=Yii::$app->user->identity->id?>'},
                        hide:true,
                        sortable: false
                    },
					{
						title: "工程状态",
						data: "g_status",
                        value: gStatus,
                        edit: {type: "radio", default: 1, required: true, number: true},
						search: {type: "select"},
						sortable: false,
                        createdCell: function (td, data) {
                            $(td).html(MeTables.valuesString(gStatus, gStatusColor, data));
                        }
					},
					{
						title: "创建时间",
						data: "created_at",
                        edit: {type: "text",readonly:"true",value:'<?=date('Y-m-d H:i:s',time())?>'},
						sortable: false
					}
            ]       
        },
        buttons: {
            deleteAll:null,
            updateAll:null,
            create:null,
            <?php
            if($access==1){?>
            add: {
                "data-func": "add",
                text: "添加",
                icon: "ace-icon fa fa-plus-circle blue",
                className: "btn btn-white btn-primary btn-bold",
            },
            <?php }?>
        },
        operations: {
            width:'250px',
            buttons: {
                delete:null,
                update:null,
                see:null,
                view: {
                    title: "查看工程",
                    className: "btn-success",
                    cClass: "me-table-view",
                    icon: "fa-search-plus",
                    sClass: "green",
                    "min-icon": "fa-search-plus"
                },
                grantview: {
                    title: "查看工程授权",
                    className: "btn-success",
                    cClass: "me-table-grantview",
                    icon: "fa-child",
                    sClass: "green",
                    "min-icon": "fa-child"
                },
                <?php
                if($access==1){?>
                // 添加自定义的按钮
                edit: {
                    title: "更新工程",
                    className: "btn-info",
                    cClass: "me-table-edit",
                    icon: "fa-pencil-square-o",
                    sClass: "green",
                    "min-icon": "fa-pencil-square-o"
                },
                del: {
                    show: function (rows) {
                        return rows.g_status == 0;
                    },
                    title: "删除工程",
                    className: "btn-danger",
                    cClass: "me-table-delete",
                    icon: "fa-trash-o",
                    sClass: "red",
                    "min-icon": "fa-trash-o"
                },
                more: {
                    title: "工程授权",
                    className: "btn-warning",
                    cClass: "me-table-grant",
                    icon: "fa fa-group",
                    sClass: "blue",
                    "min-icon": "fa-search-group"
                }
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
    $.extend(m, {

    });

     $(function(){
         m.init();
     });

    $(document).on("click", ".me-table-view-show-table", function () {
        // 当前点击按钮所在的行
        var row = $(this).data("row");
        // 获取当前行的所有数据信息
        var data = m.table.data()[row];
        // 自定义处理逻辑
        //console.log(data);
        window.parent.addIframe(GetRandomNum(1000,10000),'/project/view?id='+data['g_id'],'查看工程');
    });

    $(document).on("click", ".me-table-grantview-show-table", function () {
        // 当前点击按钮所在的行
        var row = $(this).data("row");
        // 获取当前行的所有数据信息
        var data = m.table.data()[row];
        // 自定义处理逻辑
        //console.log(data);
        window.parent.addIframe(GetRandomNum(1000,10000),'/project-grant/view?id='+data['g_id'],'查看工程授权');
    });

   /* $(document).on("click", ".me-table-del-show-table", function () {

    });*/

    $(document).on("click", ".me-table-edit-show-table", function () {
        // 当前点击按钮所在的行
        var row = $(this).data("row");
        // 获取当前行的所有数据信息
        var data = m.table.data()[row];
        // 自定义处理逻辑
        //console.log(data);
        window.parent.addIframe(GetRandomNum(1000,10000),'/project/update?id='+data['g_id'],'更新工程');
    });

    $(document).on("click", ".me-table-grant-show-table", function () {
        // 当前点击按钮所在的行
        var row = $(this).data("row");
        // 获取当前行的所有数据信息
        var data = m.table.data()[row];
        // 自定义处理逻辑
        //console.log(data);
        if(data['g_status']>1){
            window.parent.addIframe(GetRandomNum(1000,10000),'/project-grant/view?id='+data['g_id'],'查看工程授权');
        }else{
            window.parent.addIframe(GetRandomNum(1000,10000),'/project-grant/update?id='+data['g_id'],'更新工程授权');
        }
    });

    $(document).on("click", "#show-table-add", function () {
        parent.addIframe(GetRandomNum(1000,100000),'/project/create','添加工程');
    });
</script>
<?php $this->endBlock(); ?>