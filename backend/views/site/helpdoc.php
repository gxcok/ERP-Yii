<?php
use jinxing\admin\AdminAsset;
use yii\helpers\Html;
use yii\helpers\ArrayHelper;
use yii\helpers\Json;
AdminAsset::register($this);
$this->context->layout = false;
list(, $url) = Yii::$app->assetManager->publish((new AdminAsset())->sourcePath);
// 定义标题和面包屑信息
$this->title = '帮助文档';
bcscale(3);
?>
<?php $this->beginPage() ?>
    <!DOCTYPE html>
    <html lang="<?= Yii::$app->language ?>">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta charset="<?= Yii::$app->charset ?>"/>
        <title><?=Yii::$app->name.Html::encode($this->title) ?></title>
        <meta name="description" content="3 styles with inline editable feature" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
        <?= Html::csrfMetaTags() ?>
        <?php $this->head(); ?>
        <!-- ace styles -->
        <link rel="stylesheet" href="<?=$url?>/css/ace.min.css" id="main-ace-style" />
        <!--[if lte IE 9]>
        <link rel="stylesheet" href="<?=$url?>/css/ace-part2.min.css" />
        <![endif]-->
        <!--[if lte IE 9]>
        <link rel="stylesheet" href="<?=$url?>/css/ace-ie.min.css" />
        <![endif]-->
        <!-- inline styles related to this page -->
        <!-- ace settings handler -->
        <script src="<?=$url?>/js/ace-extra.min.js"></script>
        <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->
        <!--[if lte IE 8]>
        <script src="<?=$url?>/js/html5shiv.min.js"></script>
        <script src="<?=$url?>/js/respond.min.js"></script>
        <![endif]-->
        <link rel="stylesheet" href="/css/font-awesome.min.css"/>
        <link rel="stylesheet" href="/css/ace.min.css"/>
        <style>
            .main-content{margin: 0;}
            .module_box{width:100%;height:700px;display:block;}
            .main_box{float: left;height:630px;width:70%;padding:15px;border:2px silver solid; border-left:none;
                margin-top:0;overflow-y:scroll;background-color: #FAFAFA;}
            .module_ul{float: left;width:200px;height:630px;padding:0;margin:0 0 15px 15px;font-size: 14px;}
            .module_box h3{margin: 0;line-height: 35px;font-size: 16px;text-indent: 20px;}
            .module_ul li{height: 30px;line-height: 30px;border:2px silver solid;border-bottom:none;list-style: none;
                background-color:#e1e1e1;}
            .module_ul li:last-child{border-bottom:2px silver solid;}
            .module_ul li a{text-indent: 10px;display: block;height: 30px;cursor: pointer;color:#0C0C0C;}
            li.subli a{text-indent: 20px;}
            .main_box h4 a{text-align:center;display:block;height: 30px;line-height: 30px;color: #1a1a1a;background-color:silver;color: #fff !important;}
            li.select_li{border-right: none;background-color:#629b58;}
            li.select_li a{color: #fff !important;}
            .contentbox{display: block;}
        </style>
    </head>

    <body class="no-skin">
    <?php $this->beginBody() ?>
    <!-- /section:basics/navbar.layout -->
    <div class="main-container" id="main-container">
        <!--主要内容信息-->
        <div class="main-content">
            <div class="page-content">
                <!--主要内容信息-->
                <div class="page-content-area">
                    <div class="page-header">
                        <h1><?=$this->title?></h1>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="module_box">
                                <ul class="module_ul">
                                    <li class="select_li"><a href="#m0" style="color: #1a1a1a;">网站模块</a></li>
                                    <li><a href="#m1">用户管理</a></li>
                                    <li><a href="#m2">系统赋权</a></li>
                                    <li><a href="#m3">工程管理</a></li>
                                    <li><a href="#m4">资料库</a></li>
                                    <li class="subli"><a href="#m41">材料字典</a></li>
                                    <li class="subli"><a href="#m42">材料分类</a></li>
                                    <li class="subli"><a href="#m43">材料库</a></li>
                                    <li class="subli"><a href="#m44">供应商</a></li>
                                    <li><a href="#m5">材料计划</a></li>
                                    <li><a href="#m6">合同列表</a></li>
                                    <li><a href="#m7">计划审批</a></li>
                                    <li><a href="#m8">合同审批</a></li>
                                    <li><a href="#m9">入库列表</a></li>
                                    <li class="subli"><a href="#m91">材料入库</a></li>
                                    <li class="subli"><a href="#m92">商砼小票入库</a></li>
                                    <li class="subli"><a href="#m93">租赁入库</a></li>
                                    <li class="subli"><a href="#m94">入库材料查询</a></li>
                                    <li><a href="#m10">入库审批</a></li>
                                    <li><a href="#m11">入库结算</a></li>
                                    <li><a href="#m12">结算审批</a></li>
                                </ul>
                                <div class="main_box">
                                    <h4><a name="m0">所有网站模块</h4></a>
                                    <h4><a name="m1">用户管理</h4></a>
                                    <div class="contentbox">
                                        <table class="table table-bordered table-condensed table-responsive text-nowrap">
                                            <thead>
                                            <tr>
                                                <th width="300">权限控制</th>
                                                <th width="400">可访问</th>
                                                <th>可操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>无，默认所有人登录即可访问</td>
                                                <td>超级管理员：访问所有用户；其他用户：只能访问自己</td>
                                                <td>（超管）添加、查看、修改、删除（不能删除自己）</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <h4><a name="m2">系统赋权</h4></a>
                                    <div class="contentbox">
                                        <table class="table table-bordered table-condensed table-responsive text-nowrap">
                                            <thead>
                                            <tr>
                                                <th width="300">权限控制</th>
                                                <th width="400">可访问</th>
                                                <th>可操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>无，默认只能超级管理员访问</td>
                                                <td>超级管理员</td>
                                                <td>设置系统共用模块人员权限</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <h4><a name="m3">工程管理</h4></a>
                                    <div class="contentbox">
                                        <table class="table table-bordered table-condensed table-responsive text-nowrap">
                                            <thead>
                                            <tr>
                                                <th width="300">权限控制</th>
                                                <th width="400">可访问</th>
                                                <th>可操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>有，[系统赋权]-工程管理：设置人员 访问</td>
                                                <td>超级管理员 设置人员</td>
                                                <td>添加工程、查看[工程/工程授权]、修改[工程/工程授权]</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <h4><a name="m4">资料库</h4></a>
                                    <div class="contentbox">
                                        <table class="table table-bordered table-condensed table-responsive text-nowrap">
                                            <thead>
                                            <tr>
                                                <th width="300">权限控制</th>
                                                <th width="400">可访问</th>
                                                <th>可操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>有，[系统赋权]-资料库管理：设置人员 访问</td>
                                                <td>超级管理员 设置人员</td>
                                                <td>添加、查看、搜索、修改[材料/材料分类]</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <h4><a name="m41">材料字典</h4></a>
                                    <div class="contentbox">
                                        <table class="table table-bordered table-condensed table-responsive">
                                            <thead>
                                            <tr>
                                                <th>说明</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>材料合并：合并前必须先添加想合并的目标材料A，再勾选想合并的材料，然后填上目标材料A的ID提交合并即可</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <h4><a name="m42">材料分类</h4></a>
                                    <div class="contentbox">

                                    </div>
                                    <h4><a name="m43">材料库</h4></a>
                                    <div class="contentbox">

                                    </div>
                                    <h4><a name="m44">供应商</h4></a>
                                    <div class="contentbox">

                                    </div>
                                    <h4><a name="m5">材料计划</h4></a>
                                    <div class="contentbox">
                                        <table class="table table-bordered table-condensed table-responsive text-nowrap">
                                            <thead>
                                            <tr>
                                                <th width="300">权限控制</th>
                                                <th width="400">可访问</th>
                                                <th>可操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>有，[工程管理]-工程赋权：设置人员 访问</td>
                                                <td>超级管理员 设置人员</td>
                                                <td>添加、查看、搜索、修改</td>
                                            </tr>
                                            </tbody>
                                        </table>

                                        <table class="table table-bordered table-condensed table-responsive">
                                            <thead>
                                            <tr>
                                                <th>计划状态</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>
                                                    <b>正在筹备：</b>随时可修改；<b>等待审批：</b>不可修改；<b>审批通过：</b>不可修改
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <h4><a name="m6">合同列表</h4></a>
                                    <div class="contentbox">
                                        <table class="table table-bordered table-condensed table-responsive text-nowrap">
                                            <thead>
                                            <tr>
                                                <th width="300">权限控制</th>
                                                <th width="400">可访问</th>
                                                <th>可操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>有，[工程管理]-工程赋权：设置人员 访问</td>
                                                <td>超级管理员 设置人员</td>
                                                <td>添加、查看、搜索、修改</td>
                                            </tr>
                                            </tbody>
                                        </table>

                                        <table class="table table-bordered table-condensed table-responsive">
                                            <thead>
                                            <tr>
                                                <th>合同状态</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td><b>正在筹备：</b>随时可修改；<b>等待审批：</b>不可修改；<b>审批通过：</b>不可修改</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <h4><a name="m7">计划审批</h4></a>
                                    <div class="contentbox">
                                        <table class="table table-bordered table-condensed table-responsive text-nowrap">
                                            <thead>
                                            <tr>
                                                <th width="300">权限控制</th>
                                                <th width="400">可访问</th>
                                                <th>可操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>有，[工程管理]-工程赋权：设置人员 访问</td>
                                                <td>超级管理员 设置人员</td>
                                                <td>查看、搜索、审批</td>
                                            </tr>
                                            </tbody>
                                        </table>

                                        <table class="table table-bordered table-condensed table-responsive">
                                            <thead>
                                            <tr>
                                                <th>审批操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td><b>通过：</b>下个审批人可审批，最后审批人通过则 计划状态 = 审批通过；<br>
                                                    <b>拒绝：</b>退回重新可修改，计划状态 = 正在筹备
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <h4><a name="m8">合同审批</h4></a>
                                    <div class="contentbox">
                                        <table class="table table-bordered table-condensed table-responsive text-nowrap">
                                            <thead>
                                            <tr>
                                                <th width="300">权限控制</th>
                                                <th width="400">可访问</th>
                                                <th>可操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>有，[工程管理]-工程赋权：设置人员 访问</td>
                                                <td>超级管理员 设置人员</td>
                                                <td>查看、搜索、审批</td>
                                            </tr>
                                            </tbody>
                                        </table>

                                        <table class="table table-bordered table-condensed table-responsive">
                                            <thead>
                                            <tr>
                                                <th>审批操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td><b>通过：</b>下个审批人可审批，最后审批人通过则 合同状态 = 审批通过,通过之后还可以审批拒绝；<br>
                                                    <b>拒绝：</b>退回重新可修改，合同状态 = 正在筹备
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <h4><a name="m9">入库列表</h4></a>
                                    <div class="contentbox">
                                        <table class="table table-bordered table-condensed table-responsive text-nowrap">
                                            <thead>
                                            <tr>
                                                <th width="300">权限控制</th>
                                                <th width="400">可访问</th>
                                                <th>可操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>有，[工程管理]-工程赋权：设置人员 访问</td>
                                                <td>超级管理员 设置人员</td>
                                                <td>添加、查看、搜索、修改</td>
                                            </tr>
                                            </tbody>
                                        </table>

                                        <table class="table table-bordered table-condensed table-responsive">
                                            <thead>
                                            <tr>
                                                <th>入库状态</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td><b>正在入库：</b>随时可修改；<b>已入库：</b>不可修改；<b>审批通过：</b>不可修改，可入结算
                                                    <b>开始结算：</b>不可修改，正在结算审批 <b>完成结算：</b>不可修改，结算审批通过</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <h4><a name="m91">材料入库</h4></a>
                                    <div class="contentbox">
                                        <table class="table table-bordered table-condensed table-responsive">
                                            <thead>
                                            <tr>
                                                <th>入库来源</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td><b>计划入库：</b>可能同种材料多次入库，材料入库数量、单价超出计划标红，入库数量相等则自动完成入库，入库数量 <
                                                    计划数，也可手动勾选完成入库，完成入库的材料之后就不能再入库，可见下图实例<br>
                                                    <b>合同入库：</b>单价锁定不能改，合同可能有不限数量的材料<br>
                                                    <b>直接入库：</b>材料数量、单价不限制<br>
                                                    <img src="/images/storage.jpg">
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <h4><a name="m92">商砼小票入库</h4></a>
                                    <div class="contentbox">
                                        <table class="table table-bordered table-condensed table-responsive">
                                            <thead>
                                            <tr>
                                                <th>说明</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>商砼小票一次只能入库一种商砼，先选供应商，再选此供应商合同，再选合同商砼入库，合同商砼数量有限制时最多只能添加未入库数量</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <h4><a name="m93">租赁入库</h4></a>
                                    <div class="contentbox">

                                    </div>
                                    <h4><a name="m94">入库材料查询</h4></a>
                                    <div class="contentbox">

                                    </div>
                                    <h4><a name="m10">入库审批</h4></a>
                                    <div class="contentbox">
                                        <table class="table table-bordered table-condensed table-responsive text-nowrap">
                                            <thead>
                                            <tr>
                                                <th width="300">权限控制</th>
                                                <th width="400">可访问</th>
                                                <th>可操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>有，[工程管理]-工程赋权：设置人员 访问</td>
                                                <td>超级管理员 设置人员</td>
                                                <td>查看、搜索、审批</td>
                                            </tr>
                                            </tbody>
                                        </table>

                                        <table class="table table-bordered table-condensed table-responsive">
                                            <thead>
                                            <tr>
                                                <th>审批操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td><b>通过：</b>下个审批人可审批，最后审批人通过则 入库状态 = 审批通过；<br>
                                                    <b>拒绝：</b>退回重新可修改，入库状态 = 正在入库
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <h4><a name="m11">入库结算</h4></a>
                                    <div class="contentbox">
                                        <table class="table table-bordered table-condensed table-responsive text-nowrap">
                                            <thead>
                                            <tr>
                                                <th width="300">权限控制</th>
                                                <th width="400">可访问</th>
                                                <th>可操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>有，[工程管理]-工程赋权：设置人员 访问</td>
                                                <td>超级管理员 设置人员</td>
                                                <td>添加、查看</td>
                                            </tr>
                                            </tbody>
                                        </table>

                                        <table class="table table-bordered table-condensed table-responsive">
                                            <thead>
                                            <tr>
                                                <th>结算状态</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td><b>已入结算：</b>不可修改，进入结算审批；<b>完成结算：</b>不可修改，可退回；</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <h4><a name="m12">结算审批</h4></a>
                                    <div class="contentbox">
                                        <table class="table table-bordered table-condensed table-responsive text-nowrap">
                                            <thead>
                                            <tr>
                                                <th width="300">权限控制</th>
                                                <th width="400">可访问</th>
                                                <th>可操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>有，[工程管理]-工程赋权：设置人员 访问</td>
                                                <td>超级管理员 设置人员</td>
                                                <td>查看、搜索、审批</td>
                                            </tr>
                                            </tbody>
                                        </table>

                                        <table class="table table-bordered table-condensed table-responsive">
                                            <thead>
                                            <tr>
                                                <th>审批操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td><b>通过：</b>下个审批人可审批，最后审批人通过则 结算状态 = 完成结算；<br>
                                                    <b>拒绝(退回重新开始结算)：</b>删除结算单，入库状态 = 审批通过，可重新开始结算
                                                    <b>拒绝(退回重新开始入库)：</b>删除结算单，入库状态 = 正在入库
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <style>
            ::-webkit-scrollbar-track {
                background-color: #F5F5F5;
            }
            ::-webkit-scrollbar {
                width: 15px;
                background-color: #F5F5F5;
            }
            ::-webkit-scrollbar-thumb {
                background-color: #bbd4e5;
            }
        </style>
    </div>
    <!-- 公共的JS文件 -->
    <!-- basic scripts -->
    <!--[if !IE]> -->
    <script type="text/javascript">
        window.jQuery || document.write("<script src='<?=$url?>/js/jquery.min.js'>"+"<"+"/script>");
    </script>
    <!-- <![endif]-->
    <!--[if IE]>
    <script type="text/javascript">
        window.jQuery || document.write("<script src='<?=$url?>/js/jquery1x.min.js'>"+"<"+"/script>");
    </script>
    <![endif]-->
    <script type="text/javascript">
        try {
            window.parent.removeOverlay();
        } catch (e) {}
        if('ontouchstart' in document.documentElement) document.write("<script src='<?=$url?>/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
    </script>
    <script src="<?=$url?>/js/bootstrap.min.js"></script>
    <script src="/layer/layer.js"></script><script src="/js/common.js"></script>
    <script type="text/javascript">
        function validBrowser(){
            var u_agent = navigator.userAgent;
            var Browser = {};
            if(u_agent.indexOf('Firefox')>-1){
                Browser.name='Firefox';
            }else if(u_agent.indexOf('Chrome')>-1){
                Browser.name='Chrome';
            }else if(u_agent.indexOf('Trident')>-1&&u_agent.indexOf('rv:11')>-1){
                Browser.name='IE';
                Browser.version='11';
            }else if(u_agent.indexOf('MSIE')>-1&&u_agent.indexOf('Trident')>-1){
                Browser.name='IE';
                Browser.version='8-10';
            }else if(u_agent.indexOf('MSIE')>-1){
                Browser.name='IE';
                Browser.version='6-7';
            }else if(u_agent.indexOf('Opera')>-1){
                Browser.name='Opera';
            }else{
                Browser.name='Unknown';
                Browser.userAgent=u_agent;
            }
            return Browser;
        }

        $(function () {
            Browser = validBrowser();

            $(".module_ul li").on('click','a',function() {
                $(".module_ul li").removeClass("select_li");
                $(this).parent("li").addClass("select_li");
            });
        });
    </script>
    <!-- page specific plugin scripts -->
    <!--[if lte IE 8]>
    <script src="<?=$url?>/js/excanvas.min.js"></script>
    <![endif]-->
    <?php $this->endBody() ?>
    <?=$this->blocks['javascript']?>
    </body>
    </html>
<?php $this->endPage() ?>