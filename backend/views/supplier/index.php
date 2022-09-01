<?php

use backend\models\DtoaItems;
use backend\models\DtoaProject;
use jinxing\admin\models\Admin;
use jinxing\admin\widgets\MeTable;
use yii\web\ForbiddenHttpException;

// 定义标题和面包屑信息
$this->title = '供应商';
if(Yii::$app->user->identity->id==Admin::SUPER_ADMIN_ID){
    $access = 1;
}else{
    $item_name=DtoaProject::SYSTEM_ITEMS[2];
    $item_arr=DtoaItems::find()->andWhere(['g_id'=>0])->andWhere(['uid'=>Yii::$app->user->identity->id])->asArray()->one();
    if(empty($item_arr)){
        throw new ForbiddenHttpException('您没有['.$item_name.']-[查看/编辑]权限');
    }else{
        $item_arr=json_decode($item_arr['item_arr'],true);
        $has_access = false ;
        $access = 0;  //权限 0:查看 1：修改
        if(!empty($item_arr[0])){
            if(in_array(2,$item_arr[0])){
                $has_access=true;
            }
        }
        if(!empty($item_arr[1])){
            if(in_array(2,$item_arr[1])){
                $has_access=true;
                $access=1;
            }
        }
        if(!$has_access){
            throw new ForbiddenHttpException('您没有['.$item_name.']-[查看/编辑]权限');
        }
    }
    if($access==0){
        $this->title = $this->title.'（只读权限）';
    }
}
?>
<?=MeTable::widget()?>
<?php $this->beginBlock('javascript') ?>
<script type="text/javascript">
    var m = meTables({
        title: "供应商",
        number: false,
        pk: "s_id",
        table: {
            columns: [
                
					{
						title: "供应商ID",
						data: "s_id",
						edit: {type: "hidden"},
						sortable: false
					},
					{
						title: "供应商名",
						data: "s_name",
						edit: {type: "text", required: true, rangeLength: "[2, 255]"},
						search: {type: "text"},
						sortable: false
					},
					{
						title: "供应商联系人",
						data: "s_contact",
						edit: {type: "text", rangeLength: "[2, 50]"},
						search: {type: "text"},
						sortable: false
					},
                    {
                        title: "供应商电话",
                        data: "s_tel",
                        edit: {type: "text", rangeLength: "[2, 50]"},
                        search: {type: "text"},
                        sortable: false
                    },
					{
						title: "供应商备注",
						data: "s_info",
						edit: {type: "text", rangeLength: "[2, 255]"},
						sortable: false
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
     });
</script>
<?php $this->endBlock(); ?>