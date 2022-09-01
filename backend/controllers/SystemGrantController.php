<?php

namespace backend\controllers;
use jinxing\admin\models\Admin;
use jinxing\admin\models\AdminUser;
use Yii;
use backend\models\DtoaProject;
use backend\models\DtoaItems;
use backend\models\Authassignment;
use backend\models\DtoaApprovalGroup;
use yii\helpers\ArrayHelper;
use yii\web\NotFoundHttpException;

/**
 * Class ProjectController 工程管理 执行操作控制器
 * @package backend\controllers
 */
class SystemGrantController extends Controller
{
    protected $pk = 'g_id';

    protected $sort = 'g_id';

    /**
     * @var string 定义使用的model
     */
    public $modelClass = 'backend\models\DtoaProject';

    public function actionUpdate()
    {
        $data=[];
        $item_group_arr=DtoaApprovalGroup::find()->select('uid_arr')->andWhere(['g_id'=>0])->indexBy('item_id')->column();
        $user=AdminUser::find()->select(['id','name','department'])->andWhere(['status' => AdminUser::STATUS_ACTIVE])->andWhere(['!=', 'id', Admin::SUPER_ADMIN_ID])->asArray()->all();
        foreach ($user as $u) {
            $userdata[$u['id']]=$u;
        }
        if(!empty($item_group_arr)){
            foreach ($item_group_arr as $item_id => $uid_arr) {
                $uid_arr=json_decode($uid_arr,true);
                foreach ($uid_arr as $k => $uidarr) {   //$k=0 查看 $k=1 修改
                    if(!empty($uidarr)){
                        foreach ($uidarr as $uid) {
                            if(!empty($userdata[$uid])){
                                $data[$item_id][$k][]=$userdata[$uid];
                            }
                        }
                    }
                }
            }
        }
        return $this->renderPartial('update', [
            'data' => $data,
        ]);
    }

    public function actionSave()
    {
        $user_item_arr=[];
        $msg='';
        $error=false;
        if(Yii::$app->request->post()){
            $item_arr=Yii::$app->request->post()['item_arr'];
            $item_arr=json_decode($item_arr,true);
            unset($item_arr[0]);
            //var_dump($item_arr);
            $group_arr = DtoaProject::SYSTEM_ITEMS;
            foreach ($group_arr as $item_id => $v) {
                if(empty($item_arr[$item_id])){     //该权限没有用户或者删除了安排的用户
                    $item=DtoaApprovalGroup::find()->select(['q_id'])->andWhere(['g_id'=>0])->andWhere(['item_id'=>$item_id])->asArray()->one();
                    if(!empty($item['q_id'])){
                        DtoaApprovalGroup::findOne($item['q_id'])->delete();
                    }
                }else{
                    $item=$item_arr[$item_id];
                    $groupmodel = $this->findModel(0,$item_id,0,'approval_group');
                    $groupmodel->g_id = 0;
                    $groupmodel->item_id = $item_id;
                    $groupmodel->uid_arr = json_encode($item);
                    if(!$groupmodel->save()){
                        $error=true;
                        $msg=$msg.' '.$groupmodel->getErrors();
                    }
                    if(!empty($item[0])){
                        foreach ($item[0] as $uid) {
                            if(empty($user_item_arr[$uid])){
                                $user_item_arr[$uid]=[];
                            }
                            $user_item_arr[$uid][0][]=$item_id;
                        }
                    }
                    if(!empty($item[1])){
                        foreach ($item[1] as $uid) {
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
                    $user=DtoaItems::find()->select(['i_id'])->andWhere(['g_id'=>0])->andWhere(['uid'=>$uid])->asArray()->one();
                    if(!empty($user['i_id'])){
                        DtoaItems::findOne($user['i_id'])->delete();
                    }
                }else{
                    //以用户为记录来添加或更新
                    $itemsmodel = $this->findModel(0,0,$uid,'items');
                    $itemsmodel->g_id = 0;
                    $itemsmodel->uid = $uid;
                    $itemsmodel->item_arr = json_encode($user_item_arr[$uid]);
                    if(!$itemsmodel->save()){
                        $error=true;
                        $msg=$msg.' '.$itemsmodel->getErrors();
                    }
                }
            }

            if(!$error){
                $msg='权限添加/更新成功！';
            }else{
                $msg='权限添加/更新失败:'.$msg;
            }
            $json=json_encode(['error'=>$error,'msg'=>$msg]);
            return $json;
        }
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

        throw new NotFoundHttpException('请求页面不存在.');
    }
}