<?php

namespace backend\controllers;

use backend\models\DtoaAgreement;
use backend\models\DtoaPreCart;
use backend\models\DtoaPrePlan;
use jinxing\admin\models\AdminUser;
use Yii;
use yii\helpers\Url;
use yii\web\Controller;
use backend\models\DtoaProject;
use backend\models\DtoaCategory;
use backend\models\DtoaCart;
use backend\models\DtoaPlan;
use backend\models\DtoaSupplier;
use backend\models\DtoaStorage;
use backend\models\DtoaStorageCart;
use backend\models\DtoaTicketCart;
use backend\models\DtoaPay;
use PHPExcel;
/**
 * Site controller
 */
class SiteController extends Controller
{
    public function actionIndex()
    {
        return $this->redirect(Url::toRoute('admin/default'));
    }

    public function actionExport()
    {
        bcscale(3);
        $post=Yii::$app->request->post();
        if(!empty($post)){
            /*set_time_limit(0);
            ob_start();*/
            $user=AdminUser::find()->andWhere(['status' => AdminUser::STATUS_ACTIVE])->select(['name'])->indexBy('id')->column();
            $project=DtoaProject::find()->select(['g_name'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->indexBy('g_id')->column();
            $supplier=DtoaSupplier::find()->select(['s_name'])->indexBy('s_id')->column();
            $category=DtoaCategory::find()->select(['cname'])->indexBy('cid')->column();
            $agreement=DtoaAgreement::find()->select(['h_name'])->andWhere(['g_id'=>Yii::$app->session['g_id']])->indexBy('h_id')->column();
            $objPHPExcel = new PHPExcel();
            $objPHPExcel->setActiveSheetIndex(0);
            $filename=$post['title'].' '.date('Y-m-d',time());
            //$filename=date('Y-m-d',time());
            //$encoded_filename = rawurlencode($filename);
            if($post['module']=='plan'){
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
                $cart_title='计划材料列表';
                $cart_head=[
                    'c_no' => '材料编号',
                    'c_name' => '材料名',
                    'size' => '规格型号',
                    'num' => '单位',
                    'j_num' => '采购数量',
                    'j_price' => '采购单价',
                    'mul_price' => '采购金额',
                    'jc_info' => '采购备注',
                    'created_at' => '创建时间',
                ];
                $cart=DtoaCart::find()->select(['dtoa_cart.*','m.c_no','m.c_name','m.size','m.quality','m.num'])->andWhere(['j_id'=>$model['j_id']])
                    ->join('INNER JOIN', ['m' => 'dtoa_material'], 'm.c_id = dtoa_cart.c_id')->orderBy('jc_id')
                    ->asArray()->all();
            }

            if($post['module']=='preplan'){
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
                $cart_title='意向单材料列表';
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

            if($post['module']=='agreement'){
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
                $cart_title='合同材料列表';
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
                        'jc_info' => '采购备注',
                        'created_at' => '创建时间',
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
                        'jc_info' => '采购备注',
                        'created_at' => '创建时间',
                    ];
                }
                $cart=DtoaCart::find()->select(['dtoa_cart.*','m.c_no','m.c_name','m.size','m.quality','m.num'])->andWhere(['h_id'=>$model['h_id']])
                    ->join('INNER JOIN', ['m' => 'dtoa_material'], 'm.c_id = dtoa_cart.c_id')->orderBy('jc_id')
                    ->asArray()->all();
            }

            if($post['module']=='storage'){
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
                $cart_title='入库材料列表';
                if($model['k_type']==3 && $model['k_source']=='合同入库'){
                    $cart_head=[
                        'c_no' => '材料编号',
                        'c_name' => '材料名',
                        'size' => '规格型号',
                        'num' => '单位',
                        'h_no' => '合同编号',
                        'j_real_num' => '入库数量',
                        'real_time' => '入库租赁时间',
                        'lease_time_unit' => '租赁时间单位',
                        'j_real_price' => '入库单价',
                        'mul_price' => '入库金额',
                        'jc_info' => '采购备注',
                        'created_at' => '创建时间',
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
                        'jc_info' => '采购备注',
                        'created_at' => '创建时间',
                    ];
                }
                $cart=DtoaStorageCart::find()->select(['dtoa_storage_cart.*','m.c_no','m.c_name','m.size','m.quality','m.num'])
                    ->andWhere(['k_id'=>$model['k_id']])
                    ->join('INNER JOIN', ['m' => 'dtoa_material'], 'm.c_id = dtoa_storage_cart.c_id')->orderBy('sc_id')
                    ->asArray()->all();
            }

            if($post['module']=='storage-ticket'){
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
                $cart_title='入库商砼';
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
                    'jc_info' => '采购备注',
                    'created_at' => '创建时间',
                ];
                $cart=DtoaTicketCart::find()->select(['dtoa_ticket_cart.*','m.c_no','m.c_name','m.size','m.quality','m.num'])
                    ->andWhere(['k_id'=>$model['k_id']])
                    ->join('INNER JOIN', ['m' => 'dtoa_material'], 'm.c_id = dtoa_ticket_cart.c_id')
                    ->asArray()->all();
            }

            if($post['module']=='pay'){
                $model=DtoaPay::find()->andWhere(['p_id'=>$post['id']])->asArray()->one();
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
                $cart_title='结算入库单列表';
                $cart_head=[
                    'k_no' => '入库单号',
                    'g_id' => '工程',
                    's_id' => '供应商',
                    'h_id' => '合同',
                    'k_type' => '入库类型',
                    'k_source' => '入库来源',
                    'total_price' => '总金额',
                    'creator' => '创建者',
                    'created_at' => '入库时间',
                ];
                if($model['k_type']==3 && $model['k_source']=='合同入库'){
                    $cart_storage_head=[
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
                        'jc_info' => '备注',
                        'created_at' => '创建时间',
                    ];
                }else{
                    $cart_storage_head=[
                        'c_no' => '材料编号',
                        'c_name' => '材料名',
                        'size' => '规格型号',
                        'num' => '单位',
                        'j_no' => '计划编号',
                        'h_no' => '合同编号',
                        'j_real_num' => '入库数量',
                        'j_real_price' => '入库单价',
                        'mul_price' => '入库金额',
                        'jc_info' => '采购备注',
                        'created_at' => '创建时间',
                    ];
                }
                $cart_storage_ticket_head=[
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
                    'jc_info' => '采购备注',
                    'created_at' => '创建时间',
                ];
                $cart=DtoaStorage::find()->andWhere(['in', 'k_id', json_decode($model['p_data'],true)])->asArray()->all();
            }

            // 确定第一行信息
            $letter  = 'A';
            $letters = [];
            //$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setWidth(22);
            foreach ($head as $attribute => $value) {
                $objPHPExcel->getActiveSheet()->getColumnDimension($letter)->setAutoSize(true);
                $letters[$letter] = $attribute;
                $objPHPExcel->getActiveSheet()->setCellValue($letter . '1', $value);
                $val=$model[$attribute];
                if($attribute=='g_id'){
                    $val=$project[$val];
                }
                if($attribute=='s_id'){
                    $val=empty($supplier[$val])?'':$supplier[$val];
                }
                if($attribute=='h_id'){
                    $val=empty($agreement[$val])?'':$agreement[$val];
                }
                if($attribute=='h_type'){
                    $val=DtoaAgreement::AGREEMENT_TYPE[$val];
                }
                if($attribute=='k_type'){
                    $val=DtoaStorage::STORAGE_TYPE[$val];
                }
                if($attribute=='cid'){
                    $val=empty($category[$val])?'':$category[$val];
                }
                if(in_array($attribute,['next_admin_id','creator_id'])){
                    $val=$user[$val];
                }
                if(in_array($attribute,['j_status','h_status','k_status','p_status'])){
                    $val=$status_arr[$val];
                }
                $objPHPExcel->getActiveSheet()->setCellValue($letter . '2', $val);
                $letter++;
            }

            $objPHPExcel->getActiveSheet()->setCellValue('A4', $cart_title);
            $letter  = 'A';
            foreach ($cart_head as $cart_key => $cart_name) {
                $objPHPExcel->getActiveSheet()->setCellValue($letter . '5', $cart_name);
                $letter++;
            }
            $n=6;
            foreach ($cart as $k => $c) {
                $letter  = 'A';
                foreach ($cart_head as $cart_key => $cart_name) {
                    if($cart_key=='mul_price'){
                        if($post['module']=='storage'){
                            $val=$c['one_price'];
                        }elseif($post['module']=='storage-ticket'){
                            $val=bcmul($c['pour_num'],$c['j_price']);
                        }else{
                            $val=bcmul($c['j_num'],$c['j_price']);
                            if(!empty($c['lease_time'])){
                                $val=bcmul($val,$c['lease_time']);
                            }
                        }
                    }else{
                        $val=$c[$cart_key];
                    }
                    if($cart_key=='j_num'){
                        $val=empty($c[$cart_key])?'':$c[$cart_key];
                    }
                    if($cart_key=='lease_time'){
                        $val=empty($c[$cart_key])?'':$c[$cart_key];
                    }
                    if($cart_key=='real_time'){
                        $val=empty($c[$cart_key])?'':$c[$cart_key];
                    }
                    if($post['module']=='pay'){
                        if($cart_key=='g_id'){
                            $val=$project[$val];
                        }
                        if($cart_key=='s_id'){
                            $val=empty($val)?'':$supplier[$val];
                        }
                        if($cart_key=='h_id'){
                            $val=empty($val)?'':$agreement[$val];
                        }
                        if($cart_key=='k_type'){
                            $val=DtoaStorage::STORAGE_TYPE[$val];
                        }
                    }
                    $objPHPExcel->getActiveSheet()->setCellValue($letter . $n, $val);
                    $letter++;
                }
                $n++;
                if($post['module']=='pay'){
                    if($c['k_type']==2){
                        $cart2=DtoaTicketCart::find()->select(['dtoa_ticket_cart.*','m.c_no','m.c_name','m.size','m.quality','m.num'])
                            ->andWhere(['k_id'=>$c['k_id']])
                            ->join('INNER JOIN', ['m' => 'dtoa_material'], 'm.c_id = dtoa_ticket_cart.c_id')
                            ->asArray()->all();
                        $letter2  = 'A';
                        foreach ($cart_storage_ticket_head as $cart_key => $cart_name) {
                            $objPHPExcel->getActiveSheet()->setCellValue($letter2 . $n, $cart_name);
                            $letter2++;
                        }
                        $n++;
                        foreach ($cart2 as $k2 => $c2) {
                            $letter3  = 'A';
                            foreach ($cart_storage_ticket_head as $cart_key => $cart_name) {
                                if($cart_key=='mul_price'){
                                    $val=bcmul($c2['pour_num'],$c2['j_price']);
                                }else{
                                    $val=$c2[$cart_key];
                                }
                                $objPHPExcel->getActiveSheet()->setCellValue($letter3 . $n, $val);
                                $letter3++;
                            }
                            $n++;
                        }
                    }else{
                        $cart2=DtoaStorageCart::find()->select(['dtoa_storage_cart.*','m.c_no','m.c_name','m.size','m.quality','m.num'])
                            ->andWhere(['k_id'=>$c['k_id']])
                            ->join('INNER JOIN', ['m' => 'dtoa_material'], 'm.c_id = dtoa_storage_cart.c_id')->orderBy('sc_id')
                            ->asArray()->all();
                        $letter2  = 'A';
                        foreach ($cart_storage_head as $cart_key => $cart_name) {
                            $objPHPExcel->getActiveSheet()->setCellValue($letter2 . $n, $cart_name);
                            $letter2++;
                        }
                        $n++;
                        foreach ($cart2 as $k2 => $c2) {
                            $letter3  = 'A';
                            foreach ($cart_storage_head as $cart_key => $cart_name) {
                                if($cart_key=='mul_price'){
                                    $val=$c2['one_price'];
                                }else{
                                    if($cart_key=='real_time'){
                                        $val=empty($c2[$cart_key])?'':$c2[$cart_key];
                                    }else{
                                        $val=$c2[$cart_key];
                                    }
                                }
                                $objPHPExcel->getActiveSheet()->setCellValue($letter3 . $n, $val);
                                $letter3++;
                            }
                            $n++;
                        }
                    }
                }
            }
            header("Content-type:application/vnd.ms-excel");
           //header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
            header('Content-Disposition: attachment;filename="' . $filename . '.xlsx"');
            header('Cache-Control: max-age=0');
            // 直接输出文件
            $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
            $objWriter->save('php://output');
        }
    }

    public function actionHelpdoc()
    {
        //检查one_price汇总和total_price对比
        //计划 total_price>0
        $plan=DtoaPlan::find()->select(['j_id','total_price'])->andWhere(['>', 'total_price', 0])->asArray()->all();
        foreach ($plan as $pl){
            $one_total=DtoaCart::find()->select(['one_total'=>'SUM(one_price)'])->andWhere(['j_id' => $pl['j_id']])->asArray()->one()['one_total'];
            //var_dump($pl['j_id'],floatval($pl['total_price']),floatval($one_total));
            if($pl['total_price']<>$one_total){
                var_dump($pl['j_id'],floatval($pl['total_price']),floatval($one_total));
            }
        }

        //合同
        $agreement=DtoaAgreement::find()->select(['h_id','total_price'])->asArray()->all();
        foreach ($agreement as $ag){
            $one_total=DtoaCart::find()->select(['one_total'=>'SUM(one_price)'])->andWhere(['h_id' => $ag['h_id']])->asArray()->one()['one_total'];
            //var_dump($ag['h_id'],floatval($ag['total_price']),floatval($one_total));
            if($ag['total_price']<>$one_total){
                var_dump($ag['h_id'],floatval($ag['total_price']),floatval($one_total));
            }
        }

        //入库
        $storage=DtoaStorage::find()->select(['k_id','h_id','k_type','k_source','total_price'])->asArray()->all();
        foreach ($storage as $st){
            //商砼
            if($st['k_type']==2){
                $one=DtoaTicketCart::find()->select(['pour_num','j_price'])->andWhere(['k_id' => $st['k_id']])->asArray()->one();
                $one_total=bcmul($one['pour_num'],$one['j_price'],3);
                //var_dump($st['h_id'],floatval($st['total_price']),floatval($one_total));
                if($st['total_price']<>$one_total){
                    var_dump($st['k_id'],floatval($st['total_price']),floatval($one_total));
                }
            }else{
                $one_total=DtoaStorageCart::find()->select(['one_total'=>'SUM(one_price)'])->andWhere(['k_id' => $st['k_id']])->asArray()->one()['one_total'];
                //var_dump($st['h_id'],floatval($st['total_price']),floatval($one_total));
                if($st['total_price']<>$one_total){
                    var_dump($st['k_id'],floatval($st['total_price']),floatval($one_total));
                }
            }
        }

        //结算
        $pay=DtoaPay::find()->select(['p_id','p_data','total_price'])->asArray()->all();
        foreach ($pay as $pa){
           //var_dump(json_decode($pa['p_data'],true));
            $one_total=DtoaStorage::find()->select(['one_total'=>'SUM(total_price)'])->andWhere(['in', 'k_id',json_decode($pa['p_data'],true)])->asArray()->one()['one_total'];
            //var_dump($pa['p_id'],floatval($pa['total_price']),floatval($one_total));
            if($pa['total_price']<>$one_total){
                var_dump($pa['p_id'],floatval($pa['total_price']),floatval($one_total));
            }
        }
        return $this->render('helpdoc',[]);
    }
}
