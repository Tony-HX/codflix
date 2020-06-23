<?php

require_once( 'model/media.php' );

/***************************
* ----- LOAD HOME PAGE -----
***************************/

function mediaDetailsPage() {

  $search = isset( $_GET['titl'] ) ? $_GET['titl'] : null;
  $medias = Media::filterMedias( $search );

  require('view/mediaDetailsView.php');

}