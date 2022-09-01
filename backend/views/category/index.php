<?php

use backend\models\DtoaCategory;
use backend\models\DtoaItems;
use jinxing\admin\models\Admin;
use jinxing\admin\widgets\MeTable;
use yii\helpers\Json;
use yii\web\ForbiddenHttpException;

// 定义标题和面包屑信息
$this->title = '材料分类';
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
$cate_type_arr = DtoaCategory::find()->select(['cate_type'])->groupBy('cate_type')->asArray()->all();
$cate_type_arr = array_column($cate_type_arr, 'cate_type');
$cate_type_arr=array_combine($cate_type_arr,$cate_type_arr);
?>
<?=MeTable::widget()?>
<?php $this->beginBlock('javascript') ?>

<script type="text/javascript">
    var cate_arr = <?=Json::encode($cate_arr)?>;
    var cate_json = <?=Json::encode($cate_json)?>;
    var cate_type_arr = <?=Json::encode($cate_type_arr)?>;
    var m = meTables({
        title: "材料分类",
        number: false,
        pk: "cid",
        table: {
            columns: [
                
					{
						title: "分类ID",
                        defaultOrder: "asc",
						data: "cid",
						edit: {type: "hidden"},
						sortable: false
					},
                    {
                        title: "分类名",
                        data: "cname",
                        edit: {type: "text", required: true, rangeLength: "[2, 255]"},
                        search: {type: "text"},
                        sortable: false
                    },
                    {
                        title: "分类编码",
                        data: "cate_no",
                        search: {type: "text"},
                        sortable: false
                    },
                    {
                        title: "分类类型",
                        data: "cate_type",
                        value: cate_type_arr,
                        edit: {type: "select", required: true,prompt:'请选择分类类型'},
                        search: {type: "select"},
                        sortable: false
                    },
                    {
                        title: "上级分类",
                        data: "pid",
                        value: cate_json,
                        edit: {type: "select", required: true, number: true,sort:false, id: "select-pid",prompt:'请选择上级分类'},
                        search: {type: "select",sort:false},
                        createdCell: function (td, data) {
                            $(td).html(cate_arr[data]);
                        },
                        sortable: false
                    },
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
     });
</script>
<?php $this->endBlock(); ?>
