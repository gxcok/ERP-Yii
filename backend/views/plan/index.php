<?php
use backend\models\DtoaPlan;
use backend\models\DtoaProject;
use backend\models\DtoaSupplier;
use backend\models\DtoaCart;
use jinxing\admin\models\Admin;
use jinxing\admin\models\AdminUser;
use jinxing\admin\widgets\MeTable;
use yii\helpers\Json;
use yii\helpers\Url;
use jinxing\admin\helpers\Helper;
use yii\web\ForbiddenHttpException;

// 定义标题和面包屑信息
$this->title = '材料计划';
$project=DtoaProject::find()->select(['g_name'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->indexBy('g_id')->column();
foreach ($project as $k => $p) {
    $project[$k]=Helper::str_cut($p, 15);
}
$supplier=DtoaSupplier::find()->select(['s_name'])->indexBy('s_id')->column();

$user=AdminUser::find()->andWhere(['status' => AdminUser::STATUS_ACTIVE])->select(['name'])->indexBy('id')->column();

if($access==0){
    $this->title = $this->title.'（只读权限）';
}
$plan=DtoaPlan::find()->select(['j_id'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['>=','j_status',2])->asArray()->all();
//检查计划 是否完成入库
if(!empty($plan)){
    foreach ($plan as $p) {
        $count = DtoaCart::find()->andWhere(['j_id'=>$p['j_id']])->andWhere(['c_status'=>0])->count();
        $plan_model = DtoaPlan::findOne($p['j_id']);
        if($count==0){  //都已入库
            $plan_model->j_status=3;
        }else{
            $plan_model->j_status=2;
        }
        $plan_model->save();
    }
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
<script src="/js/jquery-migrate-1.4.1.min.js"></script>
<script src="/js/jquery.jqprint-0.3.js"></script>
<script src="/js/chosen.jquery.js"></script>
<script src="/js/common.js"></script>
<script type="text/javascript">
    var user = <?=Json::encode($user)?>;
    var project = <?=Json::encode($project)?>;
    var supplier = <?=Json::encode($supplier)?>;
    var jStatus = <?=Json::encode(DtoaPlan::PLAN_STATUS)?>;

    var jStatusColor = <?=Json::encode(DtoaPlan::PLAN_STATUS_COLOR)?>;
    //console.log($.type(JSON.stringify(jStatus_this)));

    var m = meTables({
        title: "材料计划",
        number: false,
        pk: "j_id",
        params:{'g_id':'<?=Yii::$app->session['g_id']?>'},
        table: {
            columns: [
					{
						title: "计划ID",
						data: "j_id",
						sortable: false
					},
                    {
                        title: "工程",
                        data: "g_id",
                        createdCell: function (td, data) {
                            $(td).html(project[data]);
                        },
                        sortable: false,
                        visible: false,
                        //export: false
                    },
                    {
                        title: "计划编号",
                        data: "j_no",
                        sortable: false
                    },
                    {
                        title: "计划名",
                        data: "j_name",
                        createdCell: function (td, data) {
                            $(td).html(strCut(data,15));
                        },
                        search: {type: "text"},
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
						title: "计划状态",
						data: "j_status",
                        value: jStatus,
						search: {type: "select"},
                        createdCell: function (td, data) {
                            $(td).html(MeTables.valuesString(jStatus, jStatusColor, data));
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
                        title: "需用日期",
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
						title: "计划备注",
						data: "j_info",
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
            updateAll:null,
            deleteAll:null,
            create:null,
            <?php if($access==1){?>
            add: {
                "data-func": "add",
                text: "添加",
                icon: "ace-icon fa fa-plus-circle blue",
                className: "btn btn-white btn-primary btn-bold",
            },
            <?php }?>
            /*print: {
                "data-func": "print",
                text: "打印",
                icon: "ace-icon fa fa-plus-circle glyphicon",
                className: "btn btn-white btn-warning btn-bold",
            },*/
        },
        operations: {
            buttons: {
                see:null,
                delete:null,
                update:null,
                view: {
                    title: "查看计划详情",
                    className: "btn-success",
                    cClass: "me-table-view",
                    icon: "fa fa-search-plus",
                    sClass: "blue",
                    "min-icon": "fa-search-plus",
                },
                <?php
                if($access==1){?>
                more: {
                    title: "更新计划",
                    className: "btn-warning",
                    cClass: "me-table-more",
                    icon: "fa fa-pencil",
                    sClass: "blue",
                    "min-icon": "fa-search-plus",
                },
                del: {
                    show: function (rows) {
                        return rows.j_status == 0;
                    },
                    title: "删除计划",
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

     $(function(){
         m.init();
         $('#search-s_id').chosen().trigger('chosen:updated');
     });
    $(document).on("click", "#show-table-add", function () {
        parent.addIframe(GetRandomNum(1000,100000),'/plan/create','添加材料计划');
    });

    $(document).on("click", ".me-table-more-show-table", function () {
        // 当前点击按钮所在的行
        var row = $(this).data("row");
        // 获取当前行的所有数据信息
        var data = m.table.data()[row];
        // 自定义处理逻辑
        //console.log(data);
        parent.addIframe(GetRandomNum(1000,100000),'/plan/update?id='+data['j_id'],'更新材料计划');
    });
    $(document).on("click", ".me-table-view-show-table", function () {
        // 当前点击按钮所在的行
        var row = $(this).data("row");
        // 获取当前行的所有数据信息
        var data = m.table.data()[row];
        // 自定义处理逻辑
        parent.addIframe(GetRandomNum(1000,100000),'/plan/view?id='+data['j_id'],'查看材料计划');
    });
</script>
<?php $this->endBlock(); ?>