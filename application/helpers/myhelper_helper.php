<?php
function dd($array) {
	echo "<pre>";
	print_r ( $array );
	echo "</pre>";
}


 function encode($value)
{
	$CI = & get_instance();
	$ids = $CI->utility->encode ( $value );
	return $ids;
}

 function decode($value)
{
	$CI = & get_instance();
	$ids = $CI->utility->decode ( $value );
	return $ids;
}

function data(){
	
	$entityBody = file_get_contents('php://input');
	$entityBody = json_decode($entityBody,true);
	return $entityBody;
}
function otp(){
	return rand(10000,99999);
}
function update_delete($id,$url,$view=true){
	
	return '<div class = "hiper"><a class="btn-floating">
                <i class="material-icons deleteData" data-id = "'.$id.'">delete_forever</i>
              </a><a class="btn-floating" href = "'.$url.'/edit/'.$id.'">
                <i class="material-icons updateData">edit</i>
              </a>
               </a><a class="btn-floating">
                <i class="material-icons viewData" data-id = "'.$id.'">remove_red_eye</i>
              </a> 		
               </div>';
}
function token(){
	return md5(bin2hex(openssl_random_pseudo_bytes(32)).time());
	
}
function checkInt($value){
	$CI = & get_instance();
	$ids = $CI->utility->decode ( $value );
	
	
	if (! ctype_digit ( $ids )) {

		echo $ids;
		die;
		redirect(SITE_URL.'logout');
		die;
			
	} else {
			
		return $ids;
	}
}

function jd($array){
	if(is_array($array)){
		$response = json_encode($array,true);
	}else{
		$response = json_encode(['response' => $array],true);
	}
	
	echo $response;
	die;
	
}
function validUrlEmail($str = 'url')
{
	if($str == 'url'){
		return (filter_var($str, FILTER_VALIDATE_URL) !== FALSE);
	}else{
		return (filter_var($str, FILTER_VALIDATE_EMAIL) !== FALSE);
	}	
}

function apiResponse($data){
	
		
	
	/* check valid referal url */
	//if($referer == FRONTEND_URL){
	
	  
		echo json_encode($data,true);
	/*}else{
		$data = ['status' => ERROR_CODE,'message' => DEFAULT_ERROR_MESSAGE];
		echo json_encode($data,true);
	}*/

	die;
}

function local_time($date = "",$formate = 'd-m-Y h:i:s'){
	if($date){
		return date($formate,strtotime($date));
	}else{
		return date($formate);
	}
}

function UTC_time($date = "",$formate = 'd-m-Y h:i:s'){
	localtime($date,$formate);
}




/*Commonly upload all type of file*/

function upload_file($file, $image_name, $path)
{
    $CI = &get_instance();

    $return['error'] = '';
	$config['upload_path'] = $path;
    $config['allowed_types'] = '*';
    $config['file_name'] = $image_name;

    $CI->load->library('upload', $config);
    $CI->upload->initialize($config);

    if (!$CI->upload->do_upload(key($file))) {
    	apiResponse([ERROR_CODE,$CI->upload->display_errors()]);
    } else {
        $result = $CI->upload->data();
        $return['data'] = $result;
    }

    return $return;
}
