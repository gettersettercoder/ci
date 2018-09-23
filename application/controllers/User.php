<?php
defined ( 'BASEPATH' ) or exit ( 'No direct script access allowed' );
/**
 *
 * @author shakti
 *         This controller handel user login,registration,forget password etc. before login
 *         Model => user_model
 *        
 *        
 */
class User extends MY_Controller {
	public function __construct() {
		parent::__construct ();
		
		$this->controller = $this->myvalues->userDetails ['controller'];
		$this->url = SITE_URL . $this->controller;
		$this->load->model ( $this->myvalues->userDetails ['model'], 'this_model' );
	}
	
	/**
	 * setRules()
	 * This method check server side validation
	 */
	function setRules() {
		$this->rules [] = [ 
				
				"field" => "txtUsername",
				"label" => "txtUsername",
				"rules" => "trim|xss_clean|required|valid_email",
				"errors" => [ 
						'required' => "please enter email address",
						'valid_email' => "please enter a valid email address" 
				] 
		]
		;
		
		$this->rules [] = [ 
				
				"field" => "pwdPassword",
				"label" => "pwdPassword",
				"rules" => "trim|xss_clean|required|min_length[6]",
				"errors" => [ 
						'required' => "Please enter password",
						'min_length' => "password length must be greater then 6" 
				] 
		];
	}
	
	/**
	 * setRules()
	 * This method check server side validation while reset password link genrated
	 */
	function setRulesForgotPassword() {
		$this->rules [] = [ 
				
				"field" => "txtUsername",
				"label" => "txtUsername",
				"rules" => "trim|required|valid_email",
				"errors" => [ 
						'required' => "please enter email address",
						'valid_email' => "please enter a valid email address" 
				] 
		];
	}
	
	/**
	 * setRules()
	 * This method check server side validation while reset password link genrated
	 */
	function setRulesChangePassword() {
		$this->rules [] = [ 
				
				"field" => "pwdPassword",
				"label" => "pwdPassword",
				"rules" => "trim|required|min_length[6]",
				"errors" => [ 
						'required' => "Please enter password",
						'min_length' => "password length must be greater then 6" 
				] 
		];
		
		$this->rules [] = [ 
				
				"field" => "pwdConfirmPassword",
				"label" => "pwdConfirmPassword",
				"rules" => "trim|matches[pwdPassword]",
				"errors" => [ 
						'required' => "Please enter Confirm password",
						'matches' => "Confirm password should be equal to password" 
				] 
		];
	}
	
	/**
	 * index
	 * landing page open login page.
	 */
	public function index() {
		$data ['controllerName'] = $this->controller;
		$data ['heading'] = NULL;
		$data ['js'] = [ 
				'parsley.min',
				'login' 
		];
		$data ['init'] = [ 
				'user.init()' 
		];
		$data ['title'] = APP_NAME;
			/* check login form data */
			if ($this->input->post ()) {
				
				$this->filterAjaxrequest ();
				$this->setRules ();
				$this->validateData ( $this->rules );
				$response = $this->this_model->authenticateUser ( $this->input->post () );
				apiResponse ( $response );
			} else {
				
				$this->loadView ( $this->controller . '/login', $data );
			}
		
	}
	public function checkRedirectCases() {
		switch ($this->completed_step) {
			
			case 0 :
				redirect ( $this->url . '/choose_plan' );
				break;
			case 1 :
				redirect ( $this->url . '/free_demo' );
				break;
			case 2 :
				redirect (SITE_URL.$this->myvalues->universityDetails['controller'].'/create');
				break;
			default :
				echo 'choose new';
		}
	}
	/**
	 * forgetPassword()
	 * this is use to load a view for forget password
	 */
	public function forgetPassword() {
		$data ['controllerName'] = $this->controller;
		$data ['heading'] = NULL;
		$data ['css'] = [ 
				'login' 
		];
		$data ['js'] = [ 
				'common',
				'login' 
		];
		$data ['formAction'] = $this->url . '/forgetPassword';
		/* if user request to login with username and password */
		if ($this->input->post ()) {
			
			$this->setRulesForgotPassword ();
			$this->validateData ( $this->rules );
			
			/* after verify validation this conditon will exicute */
			$response = $this->this_model->genrateForgotPasswordLink ();
			
			apiResponse ( $response );
		}
		
		$this->loadView ( $this->controller . '/forgot_password_view', $data );
	}
	
	/**
	 * changePassword
	 * This method is use for change password once verify the token if token is valid then provide access to change password
	 *
	 * @param string $token        	
	 */
	public function changePassword($token) {
		
		/* check token is valid or not model */
		$tokenResponse = $this->this_model->checkUserToken ( $token );
		
		if ($tokenResponse === true) {
			
			$data ['controllerName'] = $this->controller;
			$data ['heading'] = 'Change password';
			$data ['formAction'] = $this->url . '/changePassword/' . $token;
			$data ['css'] = [ 
					'login' 
			];
			$data ['js'] = [ 
					'common',
					'login' 
			];
			
			/* if user request to login with username and password */
			if ($this->input->post ()) {
				$this->setRulesChangePassword ();
				$validation = $this->validateDataWeb ( $this->rules );
				
				/* after verify validation this conditon will exicute */
				if ($validation) {
					$response = $this->this_model->updateUserPassword ( $token );
					$this->session->set_flashdata ( $response [0], $response [1] );
					redirect ( SITE_URL );
				}
			}
			
			$this->loadView ( $this->controller . '/change_password_view', $data );
		} else {
			
			$this->session->set_flashdata ( $tokenResponse [0], $tokenResponse [1] );
			// $this->utility->setFlashMessage ( $tokenResponse [0], $tokenResponse [1] );
			redirect ( SITE_URL );
		}
	}
	
	/**
	 * verifyAccount
	 * This method verfiy verification link which we sent registration time
	 *
	 * @param string $getToken
	 *        	is token
	 *        	
	 * @return return to view after checking certen conditions
	 */
	public function verifyAccount($getToken = null) {
		
		/* check if we are getting token or not */
		if ($getToken) {
			
			$response = $this->this_model->verifyUserByToken ( $getToken );
			
			if (! $response) {
				$this->utility->setFlashMessage ( 'danger', 'Sorry! Invalid link' );
			} else {
				$this->utility->setFlashMessage ( 'success', 'Thank you!  you have successfull verfied your email address' );
			}
		} else {
			$this->utility->setFlashMessage ( 'danger', DEFAULT_MESSAGE );
		}
		
		redirect ( SITE_URL );
	}
	public function register() {
		
		$data ['controllerName'] = $this->url;
		$data ['formAction'] = $this->url . '/register';
		$data ['heading'] = NULL;
		$data ['js'] = [ 
				'parsley.min',
				'login' 
		];
		$data ['init'] = [ 
				'user.register()' 
		];
		
		if (($this->input->post ()) && ($this->input->is_ajax_request ())) {

			
			$this->registerValidate ();
			$this->validateData ( $this->rules );
			$registerResponse = $this->this_model->registerUser ();
			apiResponse ( $registerResponse );
		} else {
			$this->loadView ( $this->controller . '/register', $data );
		}
	}
	
	/**
	 * choose_plan
	 * this method load subscription plan after registration proceess
	 *
	 * @param string $planId        	
	 */
	public function choose_plan() {
		
		$this->Main_model->updateRegistrationStep ( '0' );
		$data ['controllerName'] = $this->url;
		$data ['fromAction'] = $this->url . '/choose_plan';
		$data ['heading'] = NULL;
		$data ['js'] = [ 
				'login',
				'https://checkout.razorpay.com/v1/checkout.js',
				'choose_plan' 
		];
		$data ['init'] = [ 
				'user.choose_plan()' 
		];
		$data ['getPackges'] = $this->this_model->getActivePackages ();
		
		$this->loadView ( $this->controller . '/choose_plan_view', $data );
	}
	/**
	 * this function will only call when user pay to website for subscription
	 */
	public function payments() {
		if ($this->input->post () && $this->input->is_ajax_request ()) {
			$response = $this->this_model->savePaymentInfo ( $this->input->post () );
			apiResponse ( $response );
		}
	}
	/**
	 * free_demo
	 * if user not ready to paid plan and choose for demo we are calling this method and
	 * updating free trail expiration date and skiping payment methods
	 */
	public function free_demo() {
		$response = $this->this_model->updateFreeTrailExpirationDate ();
		if ($response) {
			$this->Main_model->updateRegistrationStep ( 2 );
			redirect ( $this->url . '/personal_info' );
		} else {
			$this->utility->setFlashMessage ( 'danger', DEFAULT_ERROR_MESSAGE );
			echo '404 redirect';
			die ();
		}
	}
	public function personal_info() {
		if (($this->input->post ()) && ($this->input->is_ajax_request ())) {
			$this->personal_infoValidate ();
			$this->validateData ( $this->rules );
			$registerResponse = $this->this_model->savePersonalInfo ( $this->input->post () );
			apiResponse ( $registerResponse );
		}
		$this->Main_model->updateRegistrationStep ( '1' );
		$data ['controllerName'] = $this->url;
		$data ['formAction'] = $this->url . '/personal_info';
		$data ['heading'] = NULL;
		$data ['css'] = [ 
				'jquery.Jcrop.min' 
		];
		$data ['js'] = [ 
				'parsley.min',
				'jquery.Jcrop.min',
				'croper',
				'login',
				'http://maps.googleapis.com/maps/api/js?libraries=places&key=' . MAP_KEY,
				'getAddress' 
		];
		$data ['init'] = [ 
				'user.personal_info()' 
		];
		$this->loadView ( $this->controller . '/personal_info_view', $data );
	}
	public function personal_infoValidate() {
		$this->rules [] = [ 
				'field' => 'txtAddress',
				'label' => 'Address',
				'rules' => 'trim|required',
				'errors' => [ 
						'required' => 'Please enter address detail.' 
				] 
		];
		$this->rules [] = [ 
				'field' => 'txtCountry',
				'label' => 'txtCountry',
				'rules' => 'trim|required',
				'errors' => [ 
						'required' => 'Please enter country name' 
				] 
		];
		
		$this->rules [] = [ 
				'field' => 'txtState',
				'label' => 'txtState',
				'rules' => 'trim|required',
				'errors' => [ 
						'required' => 'Please enter State name' 
				] 
		];
		
		$this->rules [] = [ 
				'field' => 'txtCity',
				'label' => 'txtCity',
				'rules' => 'trim|required',
				'errors' => [ 
						'required' => 'Please enter City name' 
				] 
		];
		
		$this->rules [] = [ 
				'field' => 'txtZipcode',
				'label' => 'txtZipcode',
				'rules' => 'trim|required',
				'errors' => [ 
						'required' => 'Please enter Zipcode name' 
				] 
		];
	}
	public function university() {
		$result = $this->Main_model->updateRegistrationStep ( 4 );
	}
	public function registerValidate() {
		$this->rules [] = [ 
				'field' => 'txtOrganization',
				'label' => 'Name',
				'rules' => 'trim|required',
				'errors' => [ 
						'required' => 'Please enter your organization name' 
				] 
		];
		
		$this->rules [] = [ 
				'field' => 'txtEmail',
				'label' => 'email',
				'rules' => 'trim|required|valid_email|is_unique[' . TABLE_USER . '.email]',
				'errors' => [ 
						'required' => 'Please enter email address.',
						'valid_email' => 'Please enter valid email address.',
						'is_unique' => 'This email is already registered.' 
				] 
		];
		
		$this->rules [] = [ 
				'field' => 'txtMobile',
				'label' => 'Mobile',
				'rules' => 'trim|required|min_length[10]|max_length[10]|is_unique[' . TABLE_USER . '.mobile]|is_unique[' . TABLE_USER . '.another_mobile]',
				'errors' => [ 
						'required' => 'Please enter mobile number.',
						'min_length' => 'Please enter valid mobile number.',
						'max_length' => 'Please enter valid mobile number.',
						'is_unique' => 'This mobile is already registered.' 
				] 
		];
		
		$this->rules [] = [ 
				'field' => 'txtAnotherMobile',
				'label' => 'Another Mobile',
				'rules' => 'trim|required|min_length[10]|max_length[10]|is_unique[' . TABLE_USER . '.mobile]|is_unique[' . TABLE_USER . '.another_mobile]',
				'errors' => [ 
						'required' => 'Please enter mobile number.',
						'min_length' => 'Please enter valid mobile number.',
						'max_length' => 'Please enter valid mobile number.',
						'is_unique' => 'This mobile is already registered.' 
				] 
		];
		
		/*
		 * $this->rules[] = [ 'field' => 'txtAddress', 'label' => 'Address', 'rules' => 'trim|required', 'errors' => [ 'required' => 'Please enter address detail.' ] ];
		 */
		
		$this->rules [] = [ 
				'field' => 'pwdPassword',
				'label' => 'Password',
				'rules' => 'trim|required',
				'errors' => [ 
						'required' => 'Please enter password.' 
				] 
		];
		
		$this->rules [] = [ 
				'field' => 'pwdConfPasssword',
				'label' => 'Confirm Password',
				'rules' => 'trim|required',
				'errors' => [ 
						'required' => 'Please enter confirm password.' 
				] 
		];
	}
	public function verify($token) {
		
		$response = $this->this_model->verifyUser ( $token );
		message($response);
		redirect ( SITE_URL );
	}
	public function error_redirect() {
		$data ['heading'] = '404 : Page Not Found';
		$data ['message'] = 'The page you requested was not found.';
		$this->load->view ( 'errors/html/error_404', $data );
	}
	function setting() {
		$data ['controllerName'] = $this->controller;
		
		$data ['js'] = [ 
				'parsley.min',
				'setting' 
		];
		
		$data ['init'] = [ 
				'setting.init()' 
		];
		
		$this->loadView ( $this->controller . '/setting_view', $data );
	}
	private function changePasswordRules() {
		$user_id = $this->userId;
		
		$this->rules [] = [ 
				"field" => "pwdOldPassword",
				"label" => "Old Password",
				"rules" => "trim|required|callback_password_matches[$user_id]",
				"errors" => [ 
						"required" => $this->lang->line ( 'required_error' ) 
				] 
		];
		
		$this->rules [] = [ 
				"field" => "pwdNewPassword",
				"label" => "New Password",
				"rules" => "trim|required",
				"errors" => [ 
						"required" => $this->lang->line ( 'required_error' ) 
				] 
		];
		
		$this->rules [] = [ 
				"field" => "pwdConfPassword",
				"label" => "Confirm Password",
				"rules" => "trim|required|matches[pwdNewPassword]",
				"errors" => [ 
						"required" => $this->lang->line ( 'required_error' ),
						"matches" => $this->lang->line ( 'conf_password_error' ) 
				] 
		];
	}
	public function password_matches($password, $user_id) {
		$user = $this->main_model->getUserDetails ( [ 
				"id" => $user_id,
				"password" => md5 ( $password ) 
		] );
		
		if (empty ( $user )) {
			$this->form_validation->set_message ( 'password_matches', 'The password you supplied does not match your existing password.' );
			return false;
		} else {
			return true;
		}
	}
	public function change_password() {
		if ($this->input->post ()) {
			$this->filterAjaxrequest ();
			$this->changePasswordRules ();
			$this->validateData ( $this->rules );
			$response = $this->this_model->changePassword ( $this->input->post () );
			apiResponse ( $response );
		} else {
			$this->loadView ( $this->controller . '/setting_view', $data );
		}
	}
	public function changeEmailRules() {
		$this->rules [] = [ 
				"field" => "txtEmail",
				"label" => "txtEmail",
				"rules" => "trim|required|valid_email",
				"errors" => [ 
						"required" => $this->lang->line ( 'required_error' ),
						"valid_email" => $this->lang->line ( 'email_valid_error' ) 
				] 
		];
	}
	public function change_email() {
		if ($this->input->post ()) {
			$this->filterAjaxrequest ();
			$this->changeEmailRules ();
			$this->validateData ( $this->rules );
			$response = $this->this_model->changeEmail ( $this->input->post () );
			apiResponse ( $response );
		} else {
			$this->loadView ( $this->controller . '/setting_view', $data );
		}
	}
	public function logout() {
		$this->this_model->clearHistory ();
		redirect ( SITE_URL );
	}
}
