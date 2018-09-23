
var university = function(){
    
   var create = function(){
    	$('body').removeClass('cyan');
    	ajaxCall($controllerName+'/lists','',function(response){
    		$('input.autocomplete').autocomplete({
        	    data:response,
        	    limit: 20, // The max amount of results that can be shown at once. Default: Infinity.
        	    onAutocomplete: function(val) {
        		  console.log(val);
        	  // Callback function when value is autcompleted.
        	},
        	minLength: 1, // The minimum length of the input for the autocomplete to start. Default: 1.
        	});	
    	});
    	
    	$(document).on('click','#frmSubmit',function(){
    		
    		addProcess('frm',SITE_URL+'university/create',4000);
    		setTimeout(function(){
    			window.location.href = SITE_URL+'/admin/dashboard'
    		},4010)
    		
    	});
    	
    }

   
    return {
        init: function (){
        	create();
        	
        },
    }
    
}();