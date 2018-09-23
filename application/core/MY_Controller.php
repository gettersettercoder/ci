<?php

/**
 * MY_Controller
 * This is our main controller which will extend by all controller in project we are 
 * setting session and everything here so we can change it latter
 * created at: 19-12-2016 5:17 PM
 * */
class MY_Controller extends CI_Controller {
	public $Usersession;
	public $userId;
	public $userName;
	public $userEmail;
	public $type;
	public $image;
	public $test;
	public $access;
	public function __construct() {
		parent::__construct ();
		require_once APPPATH . 'config/tablenames_constants.php';
		require_once APPPATH . 'config/default_constants.php';
		if ($this->session->userdata ( 'userdata' )) {
			
			// dd($this->session->userdata ( 'userdata' ));exit;
			$this->Usersession = $this->session->userdata ( 'userdata' );
			$this->userId = $this->Usersession->id;
			$this->type = $this->Usersession->user_type;
			$this->userName = $this->Usersession->username;
			$this->userEmail = $this->Usersession->email;
			$this->packageId = $this->Usersession->package_id;
			$this->mobile = $this->Usersession->mobile;
			$this->anotherMobile = $this->Usersession->another_mobile;
			$this->imageUrl = $this->Usersession->image_url;
			$this->completed_step = $this->Usersession->completed_step;
			if (($this->router->fetch_class () == $this->myvalues->userDetails ['controller']) && ($this->router->fetch_method () != 'logout'))
				$this->redirection ( $this->type );
		} else {
			
			if ($this->session->userdata ( 'tempUserdata' )) {
				
				$this->Usersession = $this->session->userdata ( 'tempUserdata' );
				$this->userId = $this->Usersession ['user_id'];
				$this->completed_step = $this->Usersession['completed_step'];
				$this->userEmail = $this->Usersession ['email'];
				$this->mobile = $this->Usersession ['mobile'];
			}
			
			// redirect ( SITE_URL );
		}
		
		if ($this->session->userdata ( 'language' )) {
			$this->lang->load ( $this->session->userdata ( 'language' ), $this->session->userdata ( 'language' ) );
		} else {
			$this->lang->load ( 'english', 'english' );
		}
	}
	public function redirection($response) {
		
		if (($response == '1') && ($this->router->fetch_class () != $this->myvalues->dashboardDetails ['controller'])) {
			redirect ( SITE_URL . 'admin/' . $this->myvalues->dashboardDetails ['controller'] );
		}
	}
	/**
	 * loadView
	 *
	 * This method load view for our project
	 *
	 * @param string $viewName
	 *        	is view name which is individual file
	 * @param array $data
	 *        	is view data
	 */
	public function loadView($viewName, $data) {
		
		
		if ($this->session->userdata ( 'userdata' )) {
			
			$path = 'AdminCommonviews/1';
			$data ['header'] = $this->load->view ( $path . '/header', $data, true );
			$data ['footer'] = $this->load->view ( $path . '/footer', $data, true );
			$data ['navbar'] = $this->load->view ( $path . '/navbar', $data, true );
			$data ['notification'] = $this->load->view ( $path . '/notification', $data, true );
			$data ['mainView'] = $this->load->view ( $viewName, $data, true );
			$this->load->view ( $path . '/main_view', $data );
		} else {
			$path = 'frontCommonViews';
			$data ['header'] = $this->load->view ( $path . '/header', $data, true );
			$data ['footer'] = $this->load->view ( $path . '/footer', $data, true );
			$data ['mainView'] = $this->load->view ( $viewName, $data, true );
			$this->load->view ( $path . '/main_view', $data );
		}
	}
	public function validateData($rules, $data = []) {
		
		/*
		 * $this->load->library('form_validation'); $this->form_validation->set_rules('txtUsername', 'course_code', 'trim|xss_clean|required'); $this->form_validation->set_rules('pwdPassword', 'name', 'xss_clean|min_length[8]|required'); if ($this->form_validation->run() == TRUE) { echo validation_errors(); } else { echo validation_errors(); } die;
		 */
		$this->load->library ( 'form_validation' );
		// $this->form_validation->set_error_delimiters('', '');
		$this->form_validation->set_rules ( $rules );
		
		$this->form_validation->run ();
		
		if ($this->form_validation->run () == FALSE) {
			$response = [ 
					"status" => ERROR_CODE,
					"message" => validation_errors () 
			];
			
			die ( json_encode ( $response ) );
		}
	}
	public function validateDataWeb($rules, $data = []) {
		$this->load->library ( 'form_validation', $config );
		$this->form_validation->set_rules ( $rules );
		$this->form_validation->set_error_delimiters ( '<span class="help-inline text-danger" style = "color:red;">', '</span>' );
		
		if (count ( $data ) > 0)
			$this->form_validation->set_data ( $data );
		return ($this->form_validation->run ());
	}
	
	/**
	 * checkInt
	 * This method is check a value which is encoded is integer or not
	 *
	 * @param $value is
	 *        	the value which we want to check integer or not
	 *        	
	 * @return $ids either return to child class or redirect to request URI
	 */
	public function checkInt($value) {
		$ids = $this->utility->decode ( $value );
		echo $ids;
		die ();
		
		if (! ctype_digit ( $ids )) {
			
			$response ['status'] = ERROR_CODE;
			$response ['message'] = $this->lang->line ( 'operation_error' );
			apiResponse ( $response );
			die ();
		} else {
			
			return $ids;
		}
	}
	
	/**
	 * this method filter ajax request
	 */
	public function filterAjaxrequest() {
		if ($this->input->post () && $this->input->is_ajax_request ()) {
			return true;
		} else {
			
			$data ['status'] = ERROR_CODE;
			$data ['message'] = 'This is not valid request to our code';
			$data ['data'] = null;
			
			echo json_encode ( $data );
			die ();
		}
	}
}

?>
