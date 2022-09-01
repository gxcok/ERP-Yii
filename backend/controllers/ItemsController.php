<?php

namespace backend\controllers;



/**
 * Class ItemsController 工程用户对应权限 执行操作控制器
 * @package backend\controllers
 */
class ItemsController extends Controller
{
    protected $pk = 'i_id';
    
    /**
     * @var string 定义使用的model
     */
    public $modelClass = 'backend\models\DtoaItems';
}
