<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Project */

$this->title = Yii::t('app', 'Update Project: ' . $model->g_id, [
    'nameAttribute' => '' . $model->g_id,
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Projects'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->g_id, 'url' => ['view', 'id' => $model->g_id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="project-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
