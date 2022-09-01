<?php

namespace backend\controllers;



/**
 * Class DtoaApprovalGroupController 工程授权 执行操作控制器
 * @package backend\controllers
 */
class ApprovalGroupController extends Controller
{
    protected $pk = 'q_id';
    
    /**
     * @var string 定义使用的model
     */
    public $modelClass = 'backend\models\DtoaApprovalGroup';
}
