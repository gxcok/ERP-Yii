建筑工程ERP管理系统

### 简介
系统基于yii2高级版本开发，后台模板使用的ace admin。
对于数据表的CURL操作都有封装，且所有操作都有权限控制。
基于建筑工程ERP管理需求，不同工程项目配置不同的员工和权限、审批流程，WEB可视化操作，简单方便。 
#### 特点
* 使用RBAC权限管理，所有操作基于权限控制
* 视图使用JS控制，数据显示使用的jquery.DataTables
* 基于数据表的增、删、改、查都有封装，添加新的数据表操作方便
### 安装要求
* PHP >= 5.4
* MySQL
### 安装
1. /common/config/main-local.php配置好数据库后,erp_yii.sql导入数据表结构
2. 根据yii2框架配置项目目录xxx.com/backend/web,设置rewrite：
```
   location / {
       try_files $uri $uri/ /index.php$is_args$args;
   }
```   
* 后台默认超级管理员账号：super 密码：123456

### 使用说明
### 8.1. 使用的扩展包 [jinxing/yii2-admin](https://packagist.org/packages/jinxing/yii2-admin)
### 8.2. [常见问题解答](https://mylovegy.github.io/yii2-admin/?page=faq)
### 8.3. [控制器使用说明](https://mylovegy.github.io/yii2-admin/?page=controller)
### 8.4. [meTables使用说明](https://mylovegy.github.io/yii2-admin/?page=me-table)
### 8.5. [模块配置说明](https://mylovegy.github.io/yii2-admin/?page=module)

### 预览
1. 登录页
![登录页](https://www.faxwo.com/ERP-Yii/docs/images/docs-1.png)
2. 数据显示
![数据显示](https://www.faxwo.com/ERP-Yii/docs/images/docs-2-1.png)
![数据显示](https://www.faxwo.com/ERP-Yii/docs/images/docs-2-2.png)
3. 权限分配
![数据显示](https://www.faxwo.com/ERP-Yii/docs/images/docs-3-1.png)
4. 材料库管理
![数据显示](https://www.faxwo.com/ERP-Yii/docs/images/docs-4-1.png)
目录结构
-------------------

```
common
    config/              contains shared configurations
    mail/                contains view files for e-mails
    models/              contains model classes used in both backend and frontend
console
    config/              contains console configurations
    controllers/         contains console controllers (commands)
    migrations/          contains database migrations
    models/              contains console-specific model classes
    runtime/             contains files generated during runtime
backend
    assets/              contains application assets such as JavaScript and CSS
    config/              contains backend configurations
    controllers/         contains Web controller classes
    models/              contains backend-specific model classes
    runtime/             contains files generated during runtime
    views/               contains view files for the Web application
    web/                 contains the entry script and Web resources
frontend
    assets/              contains application assets such as JavaScript and CSS
    config/              contains frontend configurations
    controllers/         contains Web controller classes
    models/              contains frontend-specific model classes
    runtime/             contains files generated during runtime
    views/               contains view files for the Web application
    web/                 contains the entry script and Web resources
    widgets/             contains frontend widgets
vendor/                  contains dependent 3rd-party packages
environments/            contains environment-based overrides
tests                    contains various tests for the advanced application
    codeception/         contains tests developed with Codeception PHP Testing Framework
```
