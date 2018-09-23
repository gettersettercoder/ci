	var addProcess = function(formId = 'frm',redirectURL = '',messageTimeout=3000){
			
			var formId = $('#'+formId);
			
			 
			  formData = new FormData($(formId)[0]);
			  
			  					if(typeof $("#flImage").val() != 'undefined' && $("#flImage").val() != ''){
			  		
			  					  var blob = dataURLtoBlob(canvas.toDataURL('image/png'));
								  
			  					  formData.append("flFile", blob);
			  					}
			$('#frmSubmit').attr('disabled','disabled');
			
    		if(formId.parsley().validate()){
    			var formAction = formId.attr('action');
    			
    			ajaxCall(formAction,formData,function(response){
    				console.log(response);
    				if(response.status == SUCCESS_CODE){
						$('input,select,textarea').val('');
					}
    				message(response.status,response.message,messageTimeout);
    				if(redirectURL != ''){
    					messageTimeout = messageTimeout+10;
    					setTimeout(function(){
    						window.location.href = redirectURL;
    					},messageTimeout);
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
	
	var removeProces = function(){
		
	}
	var showProces = function(){
		
	}
	

