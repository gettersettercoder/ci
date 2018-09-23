
var user = function(){
    
    var add = function(){
    	
    	
    	
    	$(document).on('click','#frmSubmit',function(){
    			//var formId = $(this).closest('form').attr('id');
    			addProcess('frm',SITE_URL,2500);
    	});
    }
   
    var addRegister  = function(){
    	$(document).on('click','#frmSubmit',function(){

    		addProcess('frm',$controllerName+'/choose_plan',7000);
    	
	});
    }
    
    var choosePlan = function(){
    	$('body').removeClass('cyan');
    }

    var personalInfo = function(){
    	$(document).on('click','#photoDone',function(){
    		if($("#flImage").val() != ''){
    			$("#appendFileName").text($("#flImage").val());	
    		}
    		
    	});
    	$(document).on('click','#frmSubmit',function(){
			//var formId = $(this).closest('form').attr('id');
    		
    		addProcessWithFile('frm',SITE_URL+'university/create',3500);
    	/*setTimeout(function(){
    			window.location.href = $controllerName+'/choose_plan';
    		},6000);*/
	});
    	
    }
    return {
        init: function (){
        	add();
        	
        },
        register: function (){
        	
        	
        	
        	addRegister();
        	
        },
        choose_plan: function (){
        	
        	choosePlan();
        	
        },
        personal_info: function (){
        	
        	
        	getMap();
        	personalInfo();
        	
        },
        
        add_init : function (){

        	handleAddEditTraining();
        },
    }
    
}();