<?php ob_start(); ?>

<div> 

<h1>Historique</h1>

</div>

<?php $content = ob_get_clean(); ?>
<?php require('dashboard.php'); ?>