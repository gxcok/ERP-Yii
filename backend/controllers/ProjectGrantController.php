<?php

namespace backend\controllers;
use jinxing\admin\models\Admin;
use jinxing\admin\models\AdminUser;
use Yii;
use backend\models\DtoaProject;
use backend\models\DtoaItems;
use backend\models\DtoaApprovalGroup;
use yii\helpers\ArrayHelper;
use yii\web\ForbiddenHttpException;

/**
 * Class ProjectController 工程管理 执行操作控制器
 * @package backend\controllers
 */
class ProjectGrantController extends Controller
{
    protected $pk = 'g_id';

    protected $sort = 'g_id';

    /**
     * @var string 定义使用的model
     */
    public $modelClass = 'backend\models\DtoaProject';

    public function getExportHandleParams()
    {
        $array['g_status'] = function ($value) {
            return DtoaProject::PROJECT_STATUS[$value];
        };

        return $array;
    }

    public function actionUpdate()
    {
        $access = $this->get_access(1);
        if($access!=1){
            throw new ForbiddenHttpException('您没有执行此操作的权限');
        }
        $g_id=Yii::$app->request->get('id');
        $project=DtoaProject::findOne($g_id);
        if($project['g_status']>1){ //工程只读 or 禁用
            return $this->redirect(['view', 'id' => $g_id]);
        }
        $data=$userdata=[];
        $item_group_arr=DtoaApprovalGroup::find()->select('uid_arr')->andWhere(['g_id'=>$g_id])->indexBy('item_id')->column();
        $user=AdminUser::find()->select(['id','name','department'])->andWhere(['status' => AdminUser::STATUS_ACTIVE])->andWhere(['!=', 'id', Admin::SUPER_ADMIN_ID])->asArray()->all();
        foreach ($user as $u) {
            $userdata[$u['id']]=$u;
        }

        if(!empty($item_group_arr)){
            foreach ($item_group_arr as $item_id => $uid_arr) {
                //var_dump($item_id);
                $uid_arr=json_decode($uid_arr,true);
                foreach ($uid_arr as $k => $uidarr) {   //$k=0 查看 $k=1 修改
                    if(!empty($uidarr)){
                        //var_dump($user_arr);
                        foreach ($uidarr as $uid) {
                            $data[$item_id][$k][]=$userdata[$uid];
                        }
                    }
                }
            }
        }
        return $this->renderPartial('update', [
            'project' => $project,
            'data' => $data,
        ]);
    }

    public function actionLoaditems()
    {
        $post=Yii::$app->request->post();
        $g_id=$post['g_id'];
        $itemsdata=$userdata=[];
        $item_group_arr=DtoaApprovalGroup::find()->select('uid_arr')->andWhere(['g_id'=>$g_id])->indexBy('item_id')->column();
        if(!empty($item_group_arr)){
            foreach ($item_group_arr as $item_id => $uid_arr) {
                $uid_arr=json_decode($uid_arr,true);
                foreach ($uid_arr as $k => $uidarr) {   //$k=0 查看 $k=1 修改
                    if(!empty($uidarr)){
                        //var_dump($user_arr);
                        foreach ($uidarr as $uid) {
                            $itemsdata[$item_id][$k][]=$uid;
                        }
                    }
                }
            }
        }
        return json_encode($itemsdata);
    }

    public function actionSave()
    {
        $access = $this->get_access(1);
        if($access!=1){
            throw new ForbiddenHttpException('您没有执行此操作的权限');
        }
        $post=Yii::$app->request->post();
        $item_group_arr=json_decode($post['item_arr'],true);
        $user_item_arr=[];
        $msg='';
        $error=false;
        $group_arr = DtoaProject::PROJECT_ITEMS;
        foreach ($group_arr as $item_id => $v) {
            if(empty($item_group_arr[$item_id])){   //该权限没有安排人或者删除了安排的人
                $item=DtoaApprovalGroup::find()->select(['q_id'])->andWhere(['g_id'=>$post['g_id']])->andWhere(['item_id'=>$item_id])->asArray()->one();
                if(!empty($item['q_id'])){
                    DtoaApprovalGroup::findOne($item['q_id'])->delete();
                }
            }else{
                $item_arr=$item_group_arr[$item_id];
                //以审批权限为记录来添加或更新
                $groupmodel = $this->findModel($post['g_id'],$item_id,0,'approval_group');
                $groupmodel->g_id = $post['g_id'];
                $groupmodel->item_id = $item_id;
                $groupmodel->uid_arr = json_encode($item_arr);
                if(!$groupmodel->save()){
                    $error=true;
                    $msg=$msg.' '.$groupmodel->getErrors();
                }
                /*if(in_array($item_id,array_keys(DtoaProject::PROJECT_APPROVAL_ITEMS))){
                }*/
                if(!empty($item_arr[0])){
                    foreach ($item_arr[0] as $uid) {
                        if(empty($user_item_arr[$uid])){
                            $user_item_arr[$uid]=[];
                        }
                        $user_item_arr[$uid][0][]=$item_id;
                    }
                }
                if(!empty($item_arr[1])){
                    foreach ($item_arr[1] as $uid) {
                        if(empty($user_item_arr[$uid])){
                            $user_item_arr[$uid]=[];
                        }
                        $user_item_arr[$uid][1][]=$item_id;
                    }
                }
            }
        }
        $all_user=AdminUser::find()->select(['id'])->andWhere(['status' => AdminUser::STATUS_ACTIVE])->andWhere(['!=', 'id', Admin::SUPER_ADMIN_ID])->indexBy('id')->column();
        foreach ($all_user as $uid => $v) {
            if(empty($user_item_arr[$uid])){    //此用户删除了所有权限
                $user=DtoaItems::find()->select(['i_id'])->andWhere(['g_id'=>$post['g_id']])->andWhere(['uid'=>$uid])->asArray()->one();
                if(!empty($user['i_id'])){
                    DtoaItems::findOne($user['i_id'])->delete();
                }
            }else{
                //以用户为记录来添加或更新
                $itemsmodel = $this->findModel($post['g_id'],0,$uid,'items');
                $itemsmodel->g_id = $post['g_id'];
                $itemsmodel->uid = $uid;
                $itemsmodel->item_arr = json_encode($user_item_arr[$uid]);
                if(!$itemsmodel->save()){
                    $error=true;
                    $msg=$msg.' '.$itemsmodel->getErrors();
                }
            }
        }

        $projectmodel = DtoaProject::findOne($post['g_id']);
        if(!empty($post['g_status'])){
            $projectmodel->g_status = $post['g_status'];
        }
        $projectmodel->uid_arr=json_encode(array_keys($user_item_arr));
        if(!$projectmodel->save()){
            $error=true;
            $msg=$msg.' '.$projectmodel->getErrors();
        }
        if(!$error){
            $msg='权限添加/更新成功！';
        }else{
            $msg='权限添加/更新失败:'.$msg;
        }
        $json=json_encode(['error'=>$error,'msg'=>$msg]);
        return $json;
    }

    public function actionView()
    {
        $access = $this->get_access(1);
        $g_id=Yii::$app->request->get('id');
        $project=DtoaProject::findOne($g_id);
        $data=$userdata=[];
        $item_group_arr=DtoaApprovalGroup::find()->select('uid_arr')->andWhere(['g_id'=>$g_id])->indexBy('item_id')->column();
        $user=AdminUser::find()->select(['id','name','department'])->andWhere(['status' => AdminUser::STATUS_ACTIVE])->andWhere(['!=', 'id', Admin::SUPER_ADMIN_ID])->asArray()->all();
        foreach ($user as $u) {
            $userdata[$u['id']]=$u;
        }

        if(!empty($item_group_arr)){
            foreach ($item_group_arr as $item_id => $uid_arr) {
                //var_dump($item_id);
                $uid_arr=json_decode($uid_arr,true);
                foreach ($uid_arr as $k => $uidarr) {   //$k=0 查看 $k=1 修改
                    if(!empty($uidarr)){
                        //var_dump($user_arr);
                        foreach ($uidarr as $uid) {
                            $data[$item_id][$k][]=$userdata[$uid];
                        }
                    }
                }
            }
        }
        return $this->renderPartial('view', [
            'project' => $project,
            'data' => $data,
            'access' => $access,
        ]);
    }

    protected function findModel($g_id,$item_id,$uid,$table)
    {
        if($table=='items'){
            $item=DtoaItems::find()->andWhere(['g_id'=>$g_id])->andWhere(['uid'=>$uid])->asArray()->one();
            if(empty($item)){
                $itemsmodel = new DtoaItems();
            }else{
                $itemsmodel = DtoaItems::find()->andWhere(['g_id'=>$g_id])->andWhere(['uid'=>$uid])->one();
            }
            return $itemsmodel;
        }
        if($table=='approval_group'){
            $group=DtoaApprovalGroup::find()->andWhere(['g_id'=>$g_id])->andWhere(['item_id'=>$item_id])->asArray()->one();
            if(empty($group)){
                $groupmodel = new DtoaApprovalGroup();
            }else{
                $groupmodel = DtoaApprovalGroup::find()->andWhere(['g_id'=>$g_id])->andWhere(['item_id'=>$item_id])->one();
            }
            return $groupmodel;
        }
    }

    protected function get_access($item_id,$g_id=0){
        if(Yii::$app->user->identity->id==Admin::SUPER_ADMIN_ID){
            return 1;
        }
        if($g_id==0){
            $item_name=DtoaProject::SYSTEM_ITEMS[$item_id];
        }else{
            $item_name=DtoaProject::PROJECT_ITEMS[$item_id];
        }
        $item_arr=DtoaItems::find()->andWhere(['g_id'=>$g_id])->andWhere(['uid'=>Yii::$app->user->identity->id])->asArray()->one();
        if(empty($item_arr)){
            throw new ForbiddenHttpException('您没有['.$item_name.']-[查看/编辑]权限');
        }else{
            $item_arr=json_decode($item_arr['item_arr'],true);
            $has_access = false ;
            $access = 0;  //权限 0:查看 1：修改
            if(!empty($item_arr[0])){
                if(in_array($item_id,$item_arr[0])){
                    $has_access=true;
                }
            }
            if(!empty($item_arr[1])){
                if(in_array($item_id,$item_arr[1])){
                    $has_access=true;
                    $access=1;
                }
            }
            if(!$has_access){
                throw new ForbiddenHttpException('您没有['.$item_name.']-[查看/编辑]权限');
            }
            return $access;
        }
    }
}