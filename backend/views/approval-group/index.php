<?php

use jinxing\admin\widgets\MeTable;
// 定义标题和面包屑信息
$this->title = '工程授权';
?>
<?=MeTable::widget()?>
<?php $this->beginBlock('javascript') ?>
<script type="text/javascript">
    var m = meTables({
        title: "工程授权",
        number: false,
        pk: "q_id",
        table: {
            columns: [
                
					{
						title: "q_id",
						data: "q_id",
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
						title: "各审批组数组 [4=>[用户ID],9=>[用户ID],11=>[用户ID]]",
						data: "approval_arr",
						edit: {type: "text"},
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