<?php ob_start(); ?>
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 

<h2>Détails</h2>

<div> 
    <?php if($details[0]['type'] == 'série' && !isset($detailEpisode)){?>

        <select name="season" onchange="location = this.value;">

        <?php 
        $i=1;
        if($season_id == null){ 

        echo('<option selected value="index.php?media='. $details[0]["id"] .'">Tout</option>');
            
        while($i <= $nbSeason){
            echo('<option value="index.php?media='. $details[0]["id"] .'&season='.$i.'">Saison '.$i.'</option>');
            $i++;
        }

        }else{ 

        echo('<option value="index.php?media='. $details[0]["id"] .'">Tout</option>');

        while($i <= $nbSeason){

            if($season_id == $i ){
                echo('<option selected value="index.php?media='. $details[0]["id"] .'&season='.$i.'">Saison '.$i.'</option>');
            }else{
                echo('<option value="index.php?media='. $details[0]["id"] .'&season='.$i.'">Saison '.$i.'</option>');
            }

            $i++;
        }

        }
        ?>

        </select>

        <?php foreach( $episodes as $episode ):?>
                   
                <div class="title"><?= 's' . $episode['season'] . 'e' . $episode['episode'] . ' ' . '<b>'. $episode['episode_title'] . '</b>' . ' ' . '<br>' . $episode['episode_summary'] . '<a href="' . $episode['episode_url'] . '"><div>Visionner</div></a>' ; ?></div>
            
        <?php endforeach; ?>

    <?php } ?>
</div>

<div class='details'> 
    <div id='infos'>               
        <h1><?php echo($details[0]['title'])?></h1>   
        <p>Catégorie: <?php echo($details[0]['type'])?><?php echo($details[0]['genre_id'])?></p>
        <p>Date de sortie: <?php echo($details[0]['release_date'])?></p>
        <p><?php echo($details[0]['summary'])?></p>
    </div>
    
    <img id='poster' src="<?php echo($details[0]['poster_url'])?>">   
</div>



<?php $content = ob_get_clean(); ?>
<?php require('dashboard.php'); ?>