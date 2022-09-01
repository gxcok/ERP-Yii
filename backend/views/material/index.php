<?php

use backend\models\DtoaCategory;
use backend\models\DtoaItems;
use backend\models\DtoaMaterial;
use jinxing\admin\models\Admin;
use jinxing\admin\widgets\MeTable;
use yii\helpers\Json;
use yii\web\ForbiddenHttpException;

// 定义标题和面包屑信息
$this->title = '材料库';
if($access==0){
    $this->title = $this->title.'（只读权限）';
}

$data=DtoaCategory::find()->select(['cid','pid','cname'])->asArray()->all();
$cate_arr=DtoaCategory::find()->select(['cname'])->indexBy('cid')->column();
$cate_arr[0]='顶级分类';
$cate_json[]=['value'=>'0','title'=>'顶级分类'];
function get_cate($tree,$rootId=0,$level=1){
    foreach($tree as $leaf) {
        if($leaf['pid'] == $rootId) {
            $cate_json[]=['value'=>$leaf['cid'],'title'=>str_repeat('—',$level-1).'->'.$leaf['cname']];
            foreach($tree as $l) {
                if($l['pid'] == $leaf['cid']) {
                    $cate_json=array_merge($cate_json,get_cate($tree, $leaf['cid'], $level + 1));
                    break;
                }
            }
        }
    }
    return $cate_json;
}
$cate_json=array_merge($cate_json,get_cate($data));
//var_dump($cate_arr);
//var_dump($cate_json);
?>
<?=MeTable::widget()?>
<?php $this->beginBlock('javascript') ?>
<script type="text/javascript">
    var cate_arr = <?=Json::encode($cate_arr)?>;
    var cate_json = <?=Json::encode($cate_json)?>;
    //console.log(cate_arr,cate_json);
    var m = meTables({
        title: "材料库",
        number: false,
        pk: "c_id",
        table: {
            columns: [
                
					{
						title: "材料ID",
						data: "c_id",
						edit: {type: "hidden"},
						sortable: false
					},
					{
						title: "材料编号",
						data: "c_no",
						edit: {type: "text", required: true,readonly:"true",id:"create_c_no"},
						sortable: false
					},
					{
						title: "材料名",
						data: "c_name",
						edit: {type: "text", required: true, rangeLength: "[2, 255]"},
						search: {type: "text"},
						sortable: false
					},
					{
						title: "材料分类ID",
						data: "cid",
                        value: cate_json,
						edit: {type: "select", required: true, number: true,sort:false,id:"create_cid"},
                        search: {type: "select",sort:false},
						sortable: false
					},
                    {
                        title: "材料分类编码",
                        data: "cate_no",
                        edit: {type: "text", required: true,readonly:"true", number: true,id:"create_cate_no"},
                        search: {type: "text"},
                        sortable: false
                    },
                    {
                        title: "材料分类名",
                        data: "cate_name",
                        edit: {type: "hidden", required: true, rangeLength: "[2, 255]",id:"create_cate_name"},
                        search: {type: "text"},
                        sortable: false
                    },
					{
						title: "计量单位",
						data: "num",
						edit: {type: "text", required: true, rangeLength: "[0, 100]",value:'个'},
						sortable: false
					},
					{
						title: "规格型号",
						data: "size",
						edit: {type: "text", rangeLength: "[0, 255]"},
                        search: {type: "text"},
						sortable: false
					},
                    {
                        title: "材质",
                        data: "quality",
                        edit: {type: "text", rangeLength: "[0, 255]"},
                        sortable: false
                    },
					{
						title: "材料备注",
						data: "c_info",
						edit: {type: "text", rangeLength: "[0, 255]"},
						sortable: false
					},
					{
						title: "创建者ID",
						data: "creator_id",
                        edit: {type: "hidden", required: true,readonly:"true", number: true,value:'<?=Yii::$app->user->identity->id?>'},
                        hide:true,
						sortable: false
					},
					{
						title: "创建者",
						data: "creator",
                        edit: {type: "hidden", required: true,readonly:"true", rangeLength: "[2, 50]",value:'<?=Yii::$app->user->identity->name?>'},
						sortable: false
					},
					{
						title: "创建时间",
						data: "created_at",
						sortable: false,
                        edit: {type: "hidden",readonly:"true",value:'<?=date('Y-m-d H:i:s',time())?>'},
					}
            ]       
        },
        buttons: {
            deleteAll:null,
            updateAll:null,
            <?php
            if($access==0){?>
            create:null,
            <?php }?>
        },
        operations: {
            buttons: {
                <?php
                if($access==0){?>
                delete: null,
                update: null,
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

         $("#create_cid").bind('change',function(){
             $.ajax({
                 type: "POST",
                 url: "/ajax/getdata",
                 data: {'module':'material-add','cid':$(this).val()},
                 success: function (data) {
                     data=JSON.parse(data);
                     //console.log(data);
                     if(data.error){
                         layer.msg(data.msg, {icon: 6});
                         $("#create_c_no").val('');
                         $("#create_cate_name").val('');
                         $("#create_cate_no").val('');
                     }else{
                         $("#create_c_no").val(data.data.c_no);
                         $("#create_cate_name").val(data.data.cate_name);
                         $("#create_cate_no").val(data.data.cate_no);
                         //layer.msg(data.msg, {icon: 6});
                         //parent.location.reload();
                     }
                 }
             });
         });
     });
</script>
<?php $this->endBlock(); ?>