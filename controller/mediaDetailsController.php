<?php

require_once( 'model/media.php' );

/***************************
* ----- LOAD DETAILS PAGE -----
***************************/

function mediaDetailsPage() {

  $id = isset( $_GET['media'] ) ? $_GET['media'] : null;
  $details = Media::getMediaDetails( $id );

  $season_id = isset( $_GET['season'] ) ? $_GET['season'] : null;
  $episode_id = isset( $_GET['episode'] ) ? $_GET['episode'] : null;

  if($episode_id !== null){
    $detailEpisode = Media::detailEpisode($episode_id);
  }


  if($details[0]['type'] == 'série'){
      $episodes = Media::detailSeason($id, $season_id);
      $tabSeason = Media::getNbSeason($id);
      $nbSeason = $tabSeason[0][0];
  }
  require('view/mediaDetailsView.php');

}