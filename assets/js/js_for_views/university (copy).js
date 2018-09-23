var infrastructureDatatables = null;
var university = function(){
    
    /*handle ajax datatable 
     * this method contain the table with ajax
     */
   
    var handleDataTable = function(){
        traningDatatables = getDataTable('#training_table', $controllerName +'/manageTraining/', {
            dataTable: { }
        });
    }
    
    
    var add = function(){
    	
    	
    	getMap();
    	    	
    	$(document).on('click','#submitBtn',function(){
    		
    		//
    		if($('#infrastructureForm').parsley().validate()){
    			var formAction = $('#universityAddForm').attr('action');
    			var allInputs = $('#universityAddForm').serialize();
    			ajaxCall($controllerName+'/add',allInputs,function(response){
    					message(response.status,response.message);
    					if(response.status == SUCCESS_CODE){
    						$('input').val('');	
    					}
    					
    					
    			});
    			
    			
    			return false;
    		}
    		return false;
    	});
    	
    }
    
    return {
        init: function (){
        	
        	add();
        },
        add_init : function (){
//            var editor = CKEDITOR.replace('txtHTML');
//            editor.resize( '100%', '650' )    
            handleAddEditTraining();
        },
    }
    
}();