<?php

require_once( 'controller/homeController.php' );
require_once( 'controller/loginController.php' );
require_once( 'controller/signupController.php' );
require_once( 'controller/mediaController.php' );
require_once( 'controller/contactController.php' );
require_once( 'controller/mediaDetailsController.php' );
require_once( 'controller/profileController.php' );

/**************************
* ----- HANDLE ACTION -----
***************************/

if ( isset( $_GET['action'] ) ):

  switch( $_GET['action']):

    case 'login':

      if ( !empty( $_POST ) ) login( $_POST );
      else loginPage();

    break;

    case 'signup':

      signupPage();

    break;

    case 'logout':

      logout();

    break;

    case 'contact':

      contactPage();

    break;

    case 'profile':

      profilePage();

    break;

  endswitch;
  
 //the <a> tag has a 'media' value that's actually the movie's id in its href, when we make a positive check on it we trigger details page for that id
elseif ( isset( $_GET['media'] ) ): 

    mediaDetailsPage();

else:

  $user_id = isset( $_SESSION['user_id'] ) ? $_SESSION['user_id'] : false;

  if( $user_id ):
    mediaPage();
  else:
    homePage();
  endif;

endif;
