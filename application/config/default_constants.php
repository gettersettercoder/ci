<?php
defined('BASEPATH') or exit('No direct script access allowed');

define('APP_NAME', 'Digisims');

$siteUrl = 'http://'.$_SERVER['HTTP_HOST'].'/appurl/';
defined('SITE_URL')      OR define('SITE_URL', $siteUrl); // lowest 
defined('ASSETS')      OR define('ASSETS', $siteUrl.'assets/'); // lowest 
defined('JS_FILE')      OR define('JS_FILE', $siteUrl.'assets/js/'); // lowest 
defined('CSS_FILE')      OR define('CSS_FILE', $siteUrl.'assets/css/'); // lowest 
defined('IMAGES')      OR define('IMAGES', $siteUrl.'assets/images/'); // lowest 
defined('SITE_TITLE') OR define('SITE_TITLE','collegeapp');

define("DEFAULT_ERROR_MESSAGE", 'Oops! Something went wrong! Help us improve your experience by sending an error report');
define("SERVER_DOWN", 'sorry we are a bit overloaded right now please try again latter');


define('DATE_TIME',date('Y-m-d h:i:s'));
define('DATE',date('Y-m-d'));
define('TIME',date('h:i:s'));


define('ERROR_CODE','danger');
define('SUCCESS_CODE','success');
define('AUTHENTICATION_FAIL','2');

define('IP',$_SERVER['REMOTE_ADDR']);





