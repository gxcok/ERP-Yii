<?php

use jinxing\admin\widgets\MeTable;
// 定义标题和面包屑信息
$this->title = '工程用户对应权限';
?>
<?=MeTable::widget()?>
<?php $this->beginBlock('javascript') ?>
<script type="text/javascript">
    var m = meTables({
        title: "工程用户对应权限",
        number: false,
        pk: "i_id",
        table: {
            columns: [
                
					{
						title: "i_id",
						data: "i_id",
						edit: {type: "hidden"},
						sortable: false
					},
					{
						title: "工程ID",
						data: "g_id",
						edit: {type: "text", required: true, number: true},
						sortable: false
					},
					{
						title: "用户ID",
						data: "u_id",
						edit: {type: "text", required: true, number: true},
						sortable: false
					},
					{
						title: "权限数组",
						data: "item_arr",
						edit: {type: "text", required: true, rangeLength: "[2, 255]"},
						sortable: false
					}
            ]       
        }
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