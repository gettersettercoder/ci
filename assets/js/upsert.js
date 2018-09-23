	var addProcess = function(formId = 'frm',redirectURL = '',messageTimeout=3000){
			
			var formId = $('#'+formId);
			var formData = formId.serialize();
			$('#frmSubmit').attr('disabled','disabled');
			var getValidationResponse = formId.parsley().validate();
			//var getValidationResponse = true;
			
			if(getValidationResponse){
    			var formAction = formId.attr('action');
    			
    			
    			ajaxCall(formAction,formData,function(response){
    				console.log(response);
    				$('#frmSubmit').removeAttr('disabled');
    				if(response.status == SUCCESS_CODE){
						$('input,select,textarea').val('');
						
					}
    				
    				
    				
    				message(response.status,response.message,messageTimeout);
    				if(redirectURL != '' && response.status == SUCCESS_CODE){
    					messageTimeout = messageTimeout+10;
    					
    					setTimeout(function(){
    						window.location.href = redirectURL;
    					},messageTimeout);
    				}
    					
    			});
    			
    			return false;
    		}
    		
    		$('#frmSubmit').removeAttr('disabled');
    		return false;
    }
		
	
	var addProcessWithFile = function(formId = 'frm',redirectURL = '',messageTimeout=3000){
		
		var formId = $('#'+formId);
		
		 
		  formData = new FormData($(formId)[0]);
		  
		  					if(typeof $("#flImage").val() != 'undefined' && $("#flImage").val() != ''){
		  		
		  					  var blob = dataURLtoBlob(canvas.toDataURL('image/png'));
							  
		  					  formData.append("flFile", blob);
		  					}
		$('#frmSubmit').attr('disabled','disabled');
		
		//var getValidationResponse = formId.parsley().validate();
		var getValidationResponse = true;
		if(getValidationResponse){
			var formAction = formId.attr('action');
			
			
			 $.ajax({
		    	 	url: formAction,
		    	    type: "POST",
		    	    data: formData,
		    	    contentType: false,
		    	    cache: false,
		    	    processData: false,
		    	    success: function (result) {
		        	//return result;
		    	    	response = JSON.parse(result);
		    	    	if(response.status == SUCCESS_CODE){
							$('input,select,textarea').val('');
						}	
						message(response.status,response.message,messageTimeout);
						if(redirectURL != '' && response.status == SUCCESS_CODE){
							messageTimeout = messageTimeout+10;
							setTimeout(function(){
								window.location.href = redirectURL;
							},messageTimeout);
						}
		            
		    	    }
		    });
			
			$('#frmSubmit').removeAttr('disabled');
			return false;
		}
		
		$('#frmSubmit').removeAttr('disabled');
		return false;
}
	
	var editProces = function(){
		
	}
	
	var showProces = function(){
		
	}
	
$(document).on('click','.deleteData',function(){
	var dataId = $(this).attr('data-id');
	var thisIs = $(this);
	ajaxCall($controllerName+'/delete',{id:dataId},function(response){
		if(response.status == SUCCESS_CODE){
			thisIs.closest('tr').remove();
		}
		message(response.status,response.message,3000);
		return false;
	});
});
