<?php ob_start(); ?>

<div> 
<P>Contactez-nous!</P>
</div>

<?php $content = ob_get_clean(); ?>
<?php require('dashboard.php'); ?>