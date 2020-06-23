<?php ob_start(); ?>

<div> 
    <h2>Détails</h2>
    <h1><?php echo($info[0]['title'])?></h1>
    <p>Genre: <?php echo($info[0]['type'])?><?php echo($info[0]['genre_id'])?></p>
    <p>Date de sortie: <?php echo($info[0]['release_date'])?></p>
    <p><?php echo($info[0]['summary'])?></p>
    
</div>

<?php $content = ob_get_clean(); ?>
<?php require('dashboard.php'); ?>