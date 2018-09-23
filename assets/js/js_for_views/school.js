var school = function(){

	var formSubmit = function(){

		$(document).on('submit', 'form', function(e){

			e.preventDefault();

			var data = $('form').serialize();
			var action = $('form').attr('action');

			ajaxCall(action, data, function(response){
				var result = JSON.parse(response);
				message(result.status,result.message);
			});

		});

	}
    
	return {
		init: function (){
			formSubmit();
		},
	}

}();
