<?php

namespace backend\controllers;

use backend\models\DtoaCategory;
use backend\models\DtoaMaterial;
use backend\models\DtoaCart;
use backend\models\DtoaPreCart;
use backend\models\DtoaPay;
use backend\models\DtoaStorage;
use backend\models\DtoaStorageCart;
use backend\models\DtoaSupplier;
use backend\models\DtoaTicketCart;
use backend\models\DtoaPlan;
use backend\models\DtoaPrePlan;
use backend\models\DtoaAgreement;
use backend\models\DtoaProject;
use jinxing\admin\helpers\Helper;
use jinxing\admin\models\AdminUser;
use Yii;
use yii\helpers\ArrayHelper;
use yii\web\NotFoundHttpException;

/**
 * Class CategoryController 材料分类 执行操作控制器
 * @package backend\controllers
 */
class AjaxController extends Controller
{
    public $enableCsrfValidation = false;
    public function actionGetdata()
    {
        bcscale(3);
        $data=[];
        $msg='非法请求';
        $post=Yii::$app->request->post();
        if(!empty($post)){
            switch($post['module']) {
                case 'material-add': //材料添加时返回材料编号和分类
                    $cate=DtoaCategory::find()->andWhere(['pid'=>$post['cid']])->asArray()->one();
                    if(empty($cate)){
                        $cate=DtoaCategory::find()->andWhere(['cid'=>$post['cid']])->asArray()->one();
                        $c_no=DtoaMaterial::getno($post['cid'],$cate['cate_no']);
                        $data=['c_no'=>$c_no,'cate_name'=>$cate['cname'],'cate_no'=>$cate['cate_no']];
                        $error=false;
                        $msg='';
                    }else{
                        $error=true;
                        $msg='此分类下有子类别，不可直接在父类别上添加材料';
                    }
                    break;
                case 'material-merge':  //合并到此材料
                    $merge_id=$post['merge_id'];
                    $target=$this->findModel('backend\models\DtoaMaterial',$merge_id);
                    //$target=DtoaMaterial::findOne($merge_id);
                    if(empty($target)){
                        $error=true;
                        $msg='合并目标材料不存在！';
                    }else{
                        $merge_id_arr=explode(',',$post['merge_id_arr']);
                        if(in_array($merge_id,$merge_id_arr)){
                            ArrayHelper::removeValue($merge_id_arr, $merge_id);
                        }
                        if(!empty($merge_id_arr)){
                            $set_arr=[
                                'c_id'=>$target->c_id
                            ];
                            $where_arr=['in', 'c_id', $merge_id_arr];
                            //更新材料
                            DtoaCart::updateAll($set_arr,$where_arr);
                            DtoaStorageCart::updateAll($set_arr,$where_arr);
                            DtoaTicketCart::updateAll($set_arr,$where_arr);
                            //删除材料
                            DtoaMaterial::deleteAll(['c_id' => $merge_id_arr]);
                        }
                        $error=false;
                        $msg='';
                        $data['cid']=$target->cid;
                    }
                    break;
                case 'material-move':   //移动到此分类
                    $move_id=$post['move_id'];
                    $target=$this->findModel('backend\models\DtoaCategory',$move_id);
                    if(empty($target)){
                        $error=true;
                        $msg='移动目标分类不存在！';
                    }else{
                        $child=DtoaCategory::find()->andWhere(['pid'=>$target->cid])->asArray()->one();
                        if(!empty($child)){
                            $error=true;
                            $msg='移动目标分类不是末级分类！';
                        }else{
                            $move_id_arr=explode(',',$post['move_id_arr']);
                            foreach($move_id_arr as $c_id){
                                $material=$this->findModel('backend\models\DtoaMaterial',$c_id);
                                $material->c_no=DtoaMaterial::getno($target->cid,$target->cate_no);
                                $material->cid=$target->cid;
                                $material->cate_name=$target->cname;
                                $material->cate_no=$target->cate_no;
                                $material->save();
                            }

                            $error=false;
                            $msg='';
                            $data['cid']=$target->cid;
                        }
                    }
                    break;
                case 'material-select'://材料选择
                    $id_arr=array_unique($post['id_arr']);
                    $data=DtoaMaterial::find()->andWhere(['in', 'c_id', $id_arr])->asArray()->all();
                    if(empty($data)){
                        $error=true;
                        $msg='添加材料可能已经删除';
                    }else{
                        $error=false;
                        $msg='';
                    }
                    break;
                case 'plan-get':
                    $data=DtoaCart::find()->select(['dtoa_cart.*','m.c_no','m.c_name','m.size','m.quality','m.num'])->andWhere(['j_id'=>$post['j_id']])->andWhere(['c_status'=>0])->join('INNER JOIN', ['m' => 'dtoa_material'], 'm.c_id = dtoa_cart.c_id')->asArray()->all();
                    $error=false;
                    $msg='';
                    break;
                case 'plan-select':
                    $id_arr=array_unique($post['id_arr']);
                    $data=DtoaCart::find()->select(['dtoa_cart.*','m.c_no','m.c_name','m.size','m.quality','m.num'])->andWhere(['in', 'jc_id', $id_arr])->join('INNER JOIN', ['m' => 'dtoa_material'], 'm.c_id = dtoa_cart.c_id')->asArray()->all();
                    if(empty($data)){
                        $error=true;
                        $msg='添加材料可能已经删除';
                    }else{
                        $plan=DtoaPlan::find()->select(['j_no'])->indexBy('j_id')->column();
                        foreach ($data as $k => $v) {
                            $data[$k]['j_no']=$plan[$v['j_id']];
                        }
                        $error=false;
                        $msg='';
                    }
                    break;
                case 'agreement-get':
                    $agreement=DtoaAgreement::find()->select(['h_id'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['s_id'=>$post['s_id']])->andWhere(['>=','h_status', 2])->asArray()->all();
                    //检查合同 是否完成入库
                    if(!empty($agreement)){
                        foreach ($agreement as $a) {
                            $count = DtoaCart::find()->andWhere(['h_id'=>$a['h_id']])->andWhere(['c_status'=>0])->count();
                            $agreement_model = DtoaAgreement::findOne($a['h_id']);
                            if($count==0){  //都已入库
                                $agreement_model->h_status=3;
                            }else{
                                $agreement_model->h_status=2;
                            }
                            $agreement_model->save();
                        }
                    }
                    $data=DtoaAgreement::find()->select(['h_id','h_name'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->andWhere(['s_id'=>$post['s_id']])->andWhere(['h_status'=>2])->asArray()->all();
                    $error=false;
                    $msg='';
                    break;
                case 'agreement-material-get':
                    if(!empty($post['chancel_storage'])){
                        $ticket=DtoaTicketCart::find()->andWhere(['k_id'=>$post['k_id']])->asArray()->one();
                        if(!empty($ticket)){//填写了入库商砼小票
                            $cart_model = DtoaCart::findOne($ticket['jc_id']);
                            if($cart_model->j_num>0){//如果限制材料数量，更新DtoaCart，未入库数量=+加上入库的材料数量
                                $surplus_num=bcadd($cart_model->surplus_num,$ticket['pour_num']);
                                if($surplus_num > $cart_model->j_num){
                                    $surplus_num=$cart_model->j_num;
                                }
                                $cart_model->surplus_num=floatval($surplus_num);
                                $cart_model->c_status=0;
                                $cart_model->save();
                            }
                            DtoaTicketCart::deleteAll(['k_id' => $post['k_id']]);// 删除dtoa_ticket_cart
                            $storage = DtoaStorage::findOne($post['k_id']);
                            $storage->total_price=0;
                            $storage->save();
                        }
                    }
                    $data=DtoaCart::find()->select(['dtoa_cart.*','m.c_no','m.c_name','m.size','m.quality','m.num'])->andWhere(['h_id'=>$post['h_id']])->andWhere(['c_status'=>0])->join('INNER JOIN', ['m' => 'dtoa_material'], 'm.c_id = dtoa_cart.c_id')->asArray()->all();
                    $error=false;
                    $msg='';
                    break;
                case 'agreement-select':
                    $id_arr=array_unique($post['id_arr']);
                    $data=DtoaCart::find()->select(['dtoa_cart.*','m.c_no','m.c_name','m.size','m.quality','m.num'])->andWhere(['in', 'jc_id', $id_arr])->join('INNER JOIN', ['m' => 'dtoa_material'], 'm.c_id = dtoa_cart.c_id')->asArray()->all();
                    if(empty($data)){
                        $error=true;
                        $msg='添加材料可能已经删除';
                    }else{
                        $agreement=DtoaAgreement::find()->select(['h_no'])->indexBy('h_id')->column();
                        foreach ($data as $k => $v) {
                            $data[$k]['h_no']=$agreement[$v['h_id']];
                        }
                        $error=false;
                        $msg='';
                    }
                    break;
                case 'supplier-select':
                    $id_arr=array_unique($post['id_arr']);
                    $data=DtoaSupplier::find()->andWhere(['in', 's_id', $id_arr])->asArray()->all();
                    if(empty($data)){
                        $error=true;
                        $msg='供应商可能已经删除';
                    }else{
                        $error=false;
                        $msg='';
                    }
                    break;
                case 'agreement-storage-select':
                    $id_arr=array_unique($post['id_arr']);
                    $data=DtoaAgreement::find()->andWhere(['in', 'h_id', $id_arr])->asArray()->all();
                    $project=DtoaProject::find()->select(['g_name'])->indexBy('g_id')->column();
                    $supplier=DtoaSupplier::find()->select(['s_name'])->indexBy('s_id')->column();
                    if(empty($data)){
                        $error=true;
                        $msg='供应商可能已经删除';
                    }else{
                        foreach ($data as $k => $v) {
                            $data[$k]['g_name']=$project[$v['g_id']];
                            $data[$k]['s_name']=$supplier[$v['s_id']];
                        }
                        $error=false;
                        $msg='';
                    }
                    break;
                case 'get-parent-cid':
                    return 0;
                    break;
                case 'storage-get': //入库材料查询结果获取
                    //查询 当前工程 已入库 k_status>0  材料入库k_type=1 数据
                    $query=DtoaStorage::find()->select(['k_id'])->andWhere(['k_type'=>1])->andWhere(['>','k_status',0])
                        ->andWhere(['g_id'=>Yii::$app->session['g_id']]);
                    if(!empty($post['o_vals'])){
                        $id_arr=explode(',',$post['o_vals']);
                        if($post['search_object']=='供应商'){  //$s_id_arr
                            $query=$query->andWhere(['in', 's_id', $id_arr]);
                        }
                        if($post['search_object']=='合同'){  //$s_id_arr
                            $query=$query->andWhere(['in', 'h_id', $id_arr]);
                        }
                    }
                    if(!empty($post['start_date'])){
                        $query=$query->andWhere(['>=', 'created_at', $post['start_date'].' 00:00:00']);
                    }
                    if(!empty($post['end_date'])){
                        $query=$query->andWhere(['<=', 'created_at', $post['end_date'].' 23:59:59']);
                    }
                    //var_dump($query->createCommand()->getRawSql());
                    $storage =$query->asArray()->all();
                    if(!empty($storage)){
                        $k_id_arr=array_column($storage,'k_id');
                        $select_arr=[
                            'dtoa_storage_cart.sc_id',
                            'dtoa_storage_cart.k_id',
                            'dtoa_storage_cart.h_id',
                            'dtoa_storage_cart.c_id',
                            'dtoa_storage_cart.j_real_num',
                            'dtoa_storage_cart.j_real_price',
                            'dtoa_storage_cart.one_price',
                            'm.c_name','m.size','m.num',
                            's.h_id','s.s_id','s.g_id','s.k_no',
                        ];
                        $cart_query=DtoaStorageCart::find()->select($select_arr);
                        if(!empty($post['m_vals'])){
                            $c_id_arr=explode(',',$post['m_vals']);
                            $cart_query=$cart_query->andWhere(['in', 'dtoa_storage_cart.c_id', $c_id_arr]);
                        }
                        $cart_query=$cart_query->andWhere(['in', 'dtoa_storage_cart.k_id', $k_id_arr]);
                        $cart_query=$cart_query->join('INNER JOIN', ['m' => 'dtoa_material'], 'm.c_id = dtoa_storage_cart.c_id');
                        $cart_query=$cart_query->join('INNER JOIN', ['s' => 'dtoa_storage'], 's.k_id = dtoa_storage_cart.k_id');
                        //var_dump($cart_query->createCommand()->getRawSql());
                        $data = $cart_query->asArray()->all();
                    }else{
                        $data=[];
                    }
                    if(empty($data)){
                        $error=true;
                        $msg='没有查询到数据';
                    }else{
                        $bigdata=[];
                        $project=DtoaProject::find()->select(['g_name'])->indexBy('g_id')->column();
                        $supplier=DtoaSupplier::find()->select(['s_name'])->indexBy('s_id')->column();
                        $agreement=DtoaAgreement::find()->select(['h_name'])->indexBy('h_id')->column();
                        foreach ($data as $k => $cart) {
                            if(empty($cart['h_id'])){
                                $h_name='';
                            }else{
                                $h_name=$agreement[$cart['h_id']];
                            }
                            $s_id=$cart['s_id'];
                            $s_name=$supplier[$s_id];
                            $g_name=$project[$cart['g_id']];
                            if(empty($bigdata[$s_id])){
                                $bigdata[$s_id]=['s_name'=>$s_name];
                                $bigdata[$s_id]['total_price']=0;
                            }
                            $bigdata[$s_id]['sub'][]=array_merge($cart,['g_name'=>$g_name,'k_no'=>$cart['k_no'],'h_name'=>$h_name]);
                            $bigdata[$s_id]['total_price']=bcadd($bigdata[$s_id]['total_price'],$cart['one_price']);
                        }
                        $data=$bigdata;
                        $error=false;
                        $msg='';
                    }
                    break;
                case 'print-get': //打印数据获取
                    $user=AdminUser::find()->andWhere(['status' => AdminUser::STATUS_ACTIVE])->select(['name'])->indexBy('id')->column();
                    $project=DtoaProject::find()->select(['g_name'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->indexBy('g_id')->column();
                    $supplier=DtoaSupplier::find()->select(['s_name'])->indexBy('s_id')->column();
                    $category=DtoaCategory::find()->select(['cname'])->indexBy('cid')->column();
                    $agreement=DtoaAgreement::find()->select(['h_name'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->indexBy('h_id')->column();
                    if($post['view']=='plan'){
                        $model=DtoaPlan::find()->andWhere(['j_id'=>$post['id']])->asArray()->one();
                        $head=[
                            'j_no' => '计划编号',
                            'j_name' => '计划名',
                            'g_id' => '工程',
                            's_id' => '供应商',
                            'j_status' => '计划状态',
                            'next_admin_id' => '审批人',
                            'total_price' => '总金额(元)',
                            'need_date' => '需用日期',
                            'approval_time' => '审批时间',
                            'j_info' => '计划备注',
                            'creator' => '创建者',
                            'created_at' => '创建时间',
                        ];
                        $status_arr=DtoaPlan::PLAN_STATUS;
                        $cart_head=[
                            'c_no' => '材料编号',
                            'c_name' => '材料名',
                            'size' => '规格型号',
                            'num' => '单位',
                            'j_num' => '采购数量',
                            'j_price' => '采购单价',
                            'mul_price' => '采购金额',
                        ];
                        $cart=DtoaCart::find()->select(['dtoa_cart.*','m.c_no','m.c_name','m.size','m.quality','m.num'])->andWhere(['j_id'=>$model['j_id']])
                            ->join('INNER JOIN', ['m' => 'dtoa_material'], 'm.c_id = dtoa_cart.c_id')->orderBy('jc_id')
                            ->asArray()->all();
                    }

                    if($post['view']=='preplan'){
                        $model=DtoaPrePlan::find()->andWhere(['j_id'=>$post['id']])->asArray()->one();
                        $head=[
                            'j_no' => '意向单编号',
                            'j_name' => '意向单名',
                            'g_id' => '工程',
                            's_id' => '供应商',
                            'j_status' => '意向单状态',
                            'next_admin_id' => '审批人',
                            'total_price' => '总金额(元)',
                            'need_date' => '需用日期',
                            'approval_time' => '审批时间',
                            'j_info' => '计划备注',
                            'creator' => '创建者',
                            'created_at' => '创建时间',
                        ];
                        $status_arr=DtoaPrePlan::PLAN_STATUS;
                        $cart_head=[
                            'c_no' => '材料编号',
                            'c_name' => '材料名',
                            'size' => '规格型号',
                            'num' => '单位',
                            'j_num' => '采购数量',
                            'j_price' => '采购单价',
                            'mul_price' => '采购金额',
                        ];
                        $cart=DtoaPreCart::find()->select(['dtoa_precart.*','m.c_no','m.c_name','m.size','m.quality','m.num'])->andWhere(['j_id'=>$model['j_id']])
                            ->join('INNER JOIN', ['m' => 'dtoa_material'], 'm.c_id = dtoa_precart.c_id')->orderBy('jc_id')
                            ->asArray()->all();
                    }

                    if($post['view']=='agreement'){
                        $model=DtoaAgreement::find()->andWhere(['h_id'=>$post['id']])->asArray()->one();
                        $head=[
                            'h_no' => '合同编号',
                            'h_name' => '合同名',
                            'h_type' => '合同类型',
                            'g_id' => '工程',
                            's_id' => '供应商',
                            'h_status' => '合同状态',
                            'total_price' => '总金额',
                            'next_admin_id' => '审批人',
                            'need_date' => '生效日期',
                            'approval_time' => '审批时间',
                            'h_info' => '合同备注',
                            'creator' => '创建者',
                            'created_at' => '创建时间',
                        ];
                        $status_arr=DtoaAgreement::AGREEMENT_STATUS;
                        if($model['h_type']==2){
                            $cart_head=[
                                'c_no' => '材料编号',
                                'c_name' => '材料名',
                                'size' => '规格型号',
                                'num' => '单位',
                                'j_num' => '采购数量',
                                'j_price' => '采购单价',
                                'lease_time' => '租赁时间',
                                'lease_time_unit' => '租赁时间单位',
                                'mul_price' => '采购金额',
                            ];
                        }else{
                            $cart_head=[
                                'c_no' => '材料编号',
                                'c_name' => '材料名',
                                'size' => '规格型号',
                                'num' => '单位',
                                'j_num' => '采购数量',
                                'j_price' => '采购单价',
                                'mul_price' => '采购金额',
                            ];
                        }
                        $cart=DtoaCart::find()->select(['dtoa_cart.*','m.c_no','m.c_name','m.size','m.quality','m.num'])->andWhere(['h_id'=>$model['h_id']])
                            ->join('INNER JOIN', ['m' => 'dtoa_material'], 'm.c_id = dtoa_cart.c_id')->orderBy('jc_id')
                            ->asArray()->all();
                    }

                    if($post['view']=='storage'){
                        $model=DtoaStorage::find()->andWhere(['k_id'=>$post['id']])->asArray()->one();
                        $head=[
                            'k_no' => '入库单号',
                            'g_id' => '工程',
                            's_id' => '供应商',
                            'h_id' => '合同',
                            'k_type' => '入库类型',
                            'k_source' => '入库来源',
                            'cid' => '材料分类',
                            'k_status' => '入库状态',
                            'total_price' => '总金额',
                            'next_admin_id' => '审批人',
                            'approval_time' => '审批时间',
                            'arrival_date' => '进场日期',
                            'k_info' => '入库备注',
                            'creator' => '创建者',
                            'created_at' => '入库时间',
                        ];
                        $status_arr=DtoaStorage::STORAGE_STATUS;
                        if($model['k_type']==3){
                            $cart_head=[
                                'c_no' => '材料编号',
                                'c_name' => '材料名',
                                'size' => '规格型号',
                                'num' => '单位',
                                'j_no' => '计划编号',
                                'h_no' => '合同编号',
                                'j_real_num' => '入库数量',
                                'real_time' => '租赁时间',
                                'lease_time_unit' => '租赁时间单位',
                                'j_real_price' => '入库单价',
                                'mul_price' => '入库金额',
                            ];
                        }else{
                            $cart_head=[
                                'c_no' => '材料编号',
                                'c_name' => '材料名',
                                'size' => '规格型号',
                                'num' => '单位',
                                'j_no' => '计划编号',
                                'h_no' => '合同编号',
                                'j_real_num' => '入库数量',
                                'j_real_price' => '入库单价',
                                'mul_price' => '入库金额',
                            ];
                        }
                        $cart=DtoaStorageCart::find()->select(['dtoa_storage_cart.*','m.c_no','m.c_name','m.size','m.quality','m.num'])
                            ->andWhere(['k_id'=>$model['k_id']])
                            ->join('INNER JOIN', ['m' => 'dtoa_material'], 'm.c_id = dtoa_storage_cart.c_id')->orderBy('sc_id')
                            ->asArray()->all();
                    }

                    if($post['view']=='checkout'){
                        $model=DtoaStorage::find()->andWhere(['k_id'=>$post['id']])->asArray()->one();
                        $head=[
                            'k_no' => '出库单号',
                            'g_id' => '工程',
                            's_id' => '供应商',
                            'c_status' => '出库状态',
                            'total_price' => '总金额',
                            'checkout_time' => '出库时间',
                            'c_info' => '出库备注',
                        ];
                        $status_arr=DtoaStorage::CHECKOUT_STATUS;
                        $cart_head=[
                            'c_no' => '材料编号',
                            'c_name' => '材料名',
                            'size' => '规格型号',
                            'num' => '单位',
                            'j_no' => '计划编号',
                            'h_no' => '合同编号',
                            'j_real_num' => '出库数量',
                            'j_real_price' => '出库单价',
                            'mul_price' => '出库金额',
                        ];
                        $cart=DtoaStorageCart::find()->select(['dtoa_storage_cart.*','m.c_no','m.c_name','m.size','m.quality','m.num'])
                            ->andWhere(['k_id'=>$model['k_id']])
                            ->join('INNER JOIN', ['m' => 'dtoa_material'], 'm.c_id = dtoa_storage_cart.c_id')->orderBy('sc_id')
                            ->asArray()->all();
                    }

                    if($post['view']=='storage-ticket'){
                        $model=DtoaStorage::find()->andWhere(['k_id'=>$post['id']])->asArray()->one();
                        $head=[
                            'k_no' => '入库单号',
                            'g_id' => '工程',
                            's_id' => '供应商',
                            'h_id' => '合同',
                            'k_type' => '入库类型',
                            'k_source' => '入库来源',
                            'k_status' => '入库状态',
                            'total_price' => '总金额',
                            'next_admin_id' => '审批人',
                            'approval_time' => '审批时间',
                            'arrival_date' => '进场日期',
                            'k_info' => '入库备注',
                            'creator' => '创建者',
                            'created_at' => '入库时间',
                        ];
                        $status_arr=DtoaStorage::STORAGE_STATUS;
                        $cart_head=[
                            'c_no' => '材料编号',
                            'c_name' => '材料名',
                            'size' => '规格型号',
                            'num' => '单位',
                            'pour_num' => '浇筑方量',
                            'j_price' => '商砼单价',
                            'mul_price' => '入库金额',
                            'use_style' => '浇筑方式',
                            'use_date' => '浇筑日期',
                            'hc_grade' => '强度等级',
                            'ticket_num' => '小票张数',
                            'use_place' => '施工部位',
                        ];
                        $cart=DtoaTicketCart::find()->select(['dtoa_ticket_cart.*','m.c_no','m.c_name','m.size','m.quality','m.num'])
                            ->andWhere(['k_id'=>$model['k_id']])
                            ->join('INNER JOIN', ['m' => 'dtoa_material'], 'm.c_id = dtoa_ticket_cart.c_id')
                            ->asArray()->all();
                    }

                    if($post['view']=='pay'){
                        $model=DtoaPay::find()->andWhere(['p_id'=>$post['id']])->asArray()->one();
                        if($model['has_print']==0){
                            $pay=DtoaPay::findOne($model['p_id']);
                            $pay->has_print=1;
                            $pay->save();
                        }
                        $head=[
                            'p_no' => '结算单号',
                            'g_id' => '工程',
                            's_id' => '供应商',
                            'p_status' => '结算状态',
                            'total_price' => '总金额',
                            'next_admin_id' => '审批人',
                            'approval_time' => '审批时间',
                            'p_info' => '结算备注',
                            'creator' => '创建者',
                            'created_at' => '创建时间',
                        ];
                        $status_arr=DtoaPay::PAY_STATUS;
                        $cart_head=[
                            'k_no' => '入库单号',
                            'h_id' => '合同',
                            'k_type' => '入库类型',
                            'k_source' => '入库来源',
                            'storage_time' => '入库时间',
                            'total_price' => '总金额',
                            'storage_cart' => '入库明细',
                        ];
                        $cart=DtoaStorage::find()->andWhere(['in', 'k_id', json_decode($model['p_data'],true)])->asArray()->all();
                    }

                    foreach ($head as $attribute => $value) {
                        if($attribute=='g_id'){
                            $model['g_id']=$project[$model['g_id']];
                        }
                        if($attribute=='s_id'){
                            $model['s_id']=empty($model['s_id'])?'':$supplier[$model['s_id']];
                        }
                        if($attribute=='h_id'){
                            $model['h_id']=empty($model['h_id'])?'':$agreement[$model['h_id']];
                        }
                        if($attribute=='h_type'){
                            $model['h_type']=empty($model['h_type'])?'':DtoaAgreement::AGREEMENT_TYPE[$model['h_type']];
                        }
                        if($attribute=='k_type'){
                            $model['k_type']=DtoaStorage::STORAGE_TYPE[$model['k_type']];
                        }
                        if($attribute=='cid'){
                            $model['cid']=empty($model['cid'])?'':$category[$model['cid']];
                        }
                        if(in_array($attribute,['next_admin_id','creator_id'])){
                            $model[$attribute]=$user[$model[$attribute]];
                        }
                        if(in_array($attribute,['j_status','h_status','c_status','k_status','p_status'])){
                            $model[$attribute]=$status_arr[$model[$attribute]];
                        }
                    }

                    foreach ($cart as $k => $c) {
                        foreach ($cart_head as $cart_key => $cart_name) {
                            if($cart_key=='mul_price'){
                                if($post['view']=='storage'){
                                    $cart[$k]['mul_price']=$c['one_price'];
                                }elseif($post['view']=='checkout'){
                                    $cart[$k]['mul_price']=bcmul($c['j_real_num'],$c['j_real_price']);
                                }elseif($post['view']=='storage-ticket'){
                                    $cart[$k]['mul_price']=bcmul($c['pour_num'],$c['j_price']);
                                }else{
                                    $cart[$k]['mul_price']=bcmul($c['j_num'],$c['j_price']);
                                }
                            }
                            if($cart_key=='h_id'){
                                $cart[$k]['h_id']=empty($c['h_id'])?'':$agreement[$c['h_id']];
                            }
                            if($cart_key=='k_type'){
                                $cart[$k]['k_type']=DtoaStorage::STORAGE_TYPE[$c['k_type']];
                            }
                            if($cart_key=='storage_time'){
                                $cart[$k]['storage_time']=$c['created_at'];
                            }
                            if($cart_key=='storage_cart'){
                                if($cart[$k]['k_type']=='商砼小票入库'){
                                    $storage_cart_head=[
                                        'c_name' => '材料名',
                                        'size' => '规格型号',
                                        'num' => '单位',
                                        'pour_num' => '浇筑方量',
                                        'j_price' => '商砼单价',
                                        'mul_price' => '入库金额',
                                        'use_style' => '浇筑方式',
                                        'use_date' => '浇筑日期',
                                        'use_place' => '施工部位',
                                    ];
                                    $storage_cart=DtoaTicketCart::find()->select(['dtoa_ticket_cart.*','m.c_no','m.c_name','m.size','m.quality','m.num'])
                                        ->andWhere(['k_id'=>$c['k_id']])
                                        ->join('INNER JOIN', ['m' => 'dtoa_material'], 'm.c_id = dtoa_ticket_cart.c_id')
                                        ->asArray()->all();
                                    foreach ($storage_cart as $k2 => $storagecart) {
                                        $storage_cart[$k2]['mul_price']=bcmul($storagecart['pour_num'], $storagecart['j_price']);
                                    }
                                }else{
                                    if($c['k_type']==3){
                                        $storage_cart_head=[
                                            'c_no' => '材料编号',
                                            'c_name' => '材料名',
                                            'size' => '规格型号',
                                            'num' => '单位',
                                            'h_no' => '合同编号',
                                            'j_real_num' => '入库数量',
                                            'real_time' => '租赁时间',
                                            'lease_time_unit' => '租赁时间单位',
                                            'j_real_price' => '入库单价',
                                            'mul_price' => '入库金额',
                                        ];
                                    }else{
                                        $storage_cart_head=[
                                            'c_no' => '材料编号',
                                            'c_name' => '材料名',
                                            'size' => '规格型号',
                                            'num' => '单位',
                                            'j_no' => '计划编号',
                                            'h_no' => '合同编号',
                                            'j_real_num' => '入库数量',
                                            'j_real_price' => '入库单价',
                                            'mul_price' => '入库金额',
                                        ];
                                    }
                                    $storage_cart=DtoaStorageCart::find()->select(['dtoa_storage_cart.*','m.c_no','m.c_name','m.size','m.quality','m.num'])
                                        ->andWhere(['k_id'=>$c['k_id']])
                                        ->join('INNER JOIN', ['m' => 'dtoa_material'], 'm.c_id = dtoa_storage_cart.c_id')->orderBy('sc_id')
                                        ->asArray()->all();
                                    foreach ($storage_cart as $k2 => $storagecart) {
                                        $storage_cart[$k2]['real_time']=empty(floatval($storagecart['real_time']))?'':floatval($storagecart['real_time']);
                                        $storage_cart[$k2]['mul_price']=$storagecart['one_price'];
                                    }
                                }
                                $cart[$k]['storage_cart']=$storage_cart;
                            }
                            if(in_array($cart_key,['total_price','j_num','j_price','mul_price','j_real_num','j_real_price','pour_num','lease_time'])){
                                if($cart_key=='j_num'||$cart_key=='lease_time'){
                                    $cart[$k][$cart_key]=empty(floatval($cart[$k][$cart_key]))?'':floatval($cart[$k][$cart_key]);
                                }else{
                                    $cart[$k][$cart_key]=floatval($cart[$k][$cart_key]);
                                }
                            }
                        }
                    }

                    foreach ($head as $k_name => $k_title) {
                        $head_arr[]=['k_name'=>$k_name,'k_title'=>$k_title];
                    }
                    foreach ($cart_head as $k_name => $k_title) {
                        $cart_head_arr[]=['k_name'=>$k_name,'k_title'=>$k_title];
                    }
                    if(empty($storage_cart_head)){
                        $storage_cart_head_arr=[];
                    }else{
                        foreach ($storage_cart_head as $k_name => $k_title) {
                            $storage_cart_head_arr[]=['k_name'=>$k_name,'k_title'=>$k_title];
                        }
                    }
                    //$model->total_price=floatval($model->total_price);

                    $data=['head'=>$head_arr,'model'=>$model,'cart_head'=>$cart_head_arr,'cart'=>$cart,'storage_cart_head'=>$storage_cart_head_arr];
                    $error=false;
                    $msg='';
                    break;
            }
        }else{
            $error=true;
        }
        return json_encode(['error'=>$error,'msg'=>$msg,'data'=>$data]);
    }

    protected function findModel($classname,$id)
    {
        if (($model = $classname::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('请求页面不存在.');
    }
}
