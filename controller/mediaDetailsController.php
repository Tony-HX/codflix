<?php

require_once( 'model/media.php' );

/***************************
* ----- LOAD DETAILS PAGE -----
***************************/

function mediaDetailsPage() {

  $id = isset( $_GET['media'] ) ? $_GET['media'] : null;
  $info = Media::getMediaDetails( $id );

  require('view/mediaDetailsView.php');

}