var setting = function(){

	var changePassword = function(){
		$(document).on('submit', '#password-update-form', function(e){
			e.preventDefault();
			var data = $(this).serialize();
			ajaxCall(SITE_URL+$controllerName+'/change_password', data, function(response){
				var result = JSON.parse(response);
				message(result.status,result.message);
			});
		});
	}

	var changeEmail = function(){
		$(document).on('submit', '#email-update-form', function(e){
			e.preventDefault();
			var data = $(this).serialize();
			ajaxCall(SITE_URL+$controllerName+'/change_email', data, function(response){
				var result = JSON.parse(response);
				message(result.status,result.message)
			});
		});
	}

	return {
		init: function() {
			changePassword();
			changeEmail();
		}
	}

}();