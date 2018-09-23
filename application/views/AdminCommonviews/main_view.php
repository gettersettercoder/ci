<?php header('Access-Control-Allow-Origin: *'); ?>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><?php echo @$title; ?></title>
    <link href="<?php echo CSS_FILE; ?>materialize.css" type="text/css" rel="stylesheet"/>
    <!-- jQuery Library -->
    <script type="text/javascript" src="<?php echo JS_FILE; ?>jquery.min.js"></script>
    <!--materialize js-->
    <script type="text/javascript" src="<?php echo JS_FILE; ?>materialize.min.js"></script>
    <link href="<?php echo CSS_FILE; ?>style.css" type="text/css" rel="stylesheet"/>
    <link href="<?php echo CSS_FILE; ?>custom.css" type="text/css" rel="stylesheet"/>
    <!-- CSS for Overlay Menu (Layout Full Screen)-->
    <link href="<?php echo CSS_FILE; ?>style-fullscreen.css" type="text/css" rel="stylesheet">
    <!-- Custome CSS-->
    <link href="<?php echo CSS_FILE; ?>flag-icon.min.css" type="text/css" rel="stylesheet">
    <!-- INCLUDED PLUGIN CSS ON THIS PAGE -->
    <link href="<?php echo CSS_FILE; ?>perfect-scrollbar.css" type="text/css" rel="stylesheet">
    <?php
if (isset ( $css )) {
	
	foreach ( $css as $allCss ) {
		
		if (filter_var ( $allCss, FILTER_VALIDATE_URL ) === FALSE) {
			?>
            <link rel="stylesheet" type="text/css" href="<?php echo CSS_FILE.$allCss.'.css'; ?>"/>
	
	<?php } else { ?>
            <link rel="stylesheet" type="text/css" href="<?php echo $allCss; ?>"/>
	
	<?php
		}
	}
}
?><script>
const IMAGES = '<?php echo IMAGES; ?>';
const SITE_TITLE = '<?php echo SITE_TITLE; ?>';
const $controllerName = '<?php echo $controllerName; ?>';
const ERROR_CODE = '<?php echo ERROR_CODE; ?>';
const SUCCESS_CODE = '<?php echo SUCCESS_CODE; ?>'
  </script>
</head>
  <body class="loaded" style="">
    <!-- Start Page Loading -->
    
    <!-- End Page Loading -->
    <!-- //////////////////////////////////////////////////////////////////////////// -->
    <!-- START HEADER -->
    <?php echo $header; ?>
    <!-- END HEADER -->
    <!-- //////////////////////////////////////////////////////////////////////////// -->
    <!-- START MAIN -->
    <div id="main">
      <!-- START WRAPPER -->
      <div class="wrapper">
        <!-- START LEFT SIDEBAR NAV-->
        <aside id="left-sidebar-nav">
		<?php echo $navbar; ?>
        </aside>
        <!-- END LEFT SIDEBAR NAV-->
        <!-- //////////////////////////////////////////////////////////////////////////// -->
        <!-- START CONTENT -->
        <section id="content">
			<?php 
  		echo $mainView;  
	?>
        </section>
        <!-- END CONTENT -->
        <!-- //////////////////////////////////////////////////////////////////////////// -->
        <!-- START RIGHT SIDEBAR NAV-->
        <aside id="right-sidebar-nav">
        <?php 
        echo $notification;
        ?>  
        </aside>
        <!-- END RIGHT SIDEBAR NAV-->
      </div>
      <!-- END WRAPPER -->
    </div>
   
    <!-- END MAIN -->
    <!-- //////////////////////////////////////////////////////////////////////////// -->
    <!-- START FOOTER -->
    <?php echo $footer; ?>
    <!-- END FOOTER -->
   </body>
    <!-- ================================================
    Scripts
    ================================================ -->
    
    <!--scrollbar-->
    <script type="text/javascript" src="<?php echo JS_FILE; ?>perfect-scrollbar.min.js"></script>
    <!--plugins.js - Some Specific JS codes for Plugin Settings-->
    <script type="text/javascript" src="<?php echo JS_FILE; ?>plugins.js"></script>
    <!--custom-script.js - Add your own theme custom JS-->
    <script src="<?=JS_FILE.'common.js'?>"></script>
<?php
if (isset ( $js )) {
	
	foreach ( $js as $alljs ) {
		
		if (filter_var ( $alljs, FILTER_VALIDATE_URL ) === FALSE) {
			
			if (file_exists ( 'assets/js/js_for_views/' . $alljs . '.js' )) {
				$path = JS_FILE . 'js_for_views/' . $alljs . '.js';
			} else {
				$path = JS_FILE . $alljs . '.js';
			}
			
			?>
	<script type="text/javascript" src="<?php echo $path; ?>"></script>
	
	
	<?php
		} else {
			
			?>
	
	<script type="text/javascript" src="<?php echo $alljs; ?>"></script>
	<?php
		}
	}
}

?>

<script src="<?=JS_FILE.'upsert.js'?>"></script>
<script>
    jQuery(document).ready(function () {

        
        <?php
								if (isset ( $init )) {
									foreach ( $init as $value ) {
										echo $value . ';';
									}
								}
								?>
								
							    	
 });

</script>
    
  
	
</html>