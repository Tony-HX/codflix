<?php ob_start(); ?>

<div> 
<P>LES DETAILS</P>
</div>

<?php $content = ob_get_clean(); ?>
<?php require('mediaListView.php'); ?>