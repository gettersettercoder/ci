

function message(type,messages,time=4000){
	if(type == SUCCESS_CODE){
		var type = 'green';
	}
if(type == ERROR_CODE){
	var type = 'red';
	}

	Materialize.toast(messages,time,type);
	

}

function ajaxCall(url, data, callback) {

    $.ajax({
    	 	url: url,
    	    type: "POST",
    	    data: data,
    	    async:true,
    	    success: function (result) {
        	//return result;
    	    
    	    callback(JSON.parse(result));
            
    	    }
    });
}

/* Init common ajax datatable method */

function getDataTable(tableID, ajaxPath, extraOption) {
   
    if (typeof extraOption === 'undefined') {
        extraOption = {};
    }
    
    var grid = new DataTable();
    var options = {
        src: $(tableID),
        onSuccess: function (grid, response) {
            // grid: grid object
            // response: json object of server side ajax response
            // execute some code after table records loaded
        },
        onError: function (grid) {
            // execute some code on network or other general error
        },
        onDataLoad: function (grid) {
            // execute some code on ajax data load
        },
        loadingMessage: 'Loading...',
        dataTable: {// here you can define a typical datatable settings from
					// http://datatables.net/usage/options
            responsive: false,
            // Uncomment below line("dom" parameter) to fix the dropdown
			// overflow issue in the datatable cells. The default datatable
			// layout
            // setup uses scrollable div(table-scrollable) with overflow:auto to
			// enable vertical scroll(see: assets/global/scripts/datatable.js).
            // So when dropdowns used the scrollable div should be removed.
            // "dom": "<'row'<'col-md-8 col-sm-12'pli><'col-md-4
			// col-sm-12'f<'table-group-actions pull-right'>>r>t<'row'<'col-md-8
			// col-sm-12'pli><'col-md-4 col-sm-12'>>",
            "bStateSave": false, // save datatable state(pagination, sort,
									// etc) in cookie.

            "lengthMenu": [
                [10, 20, 50, 100, 150, -1],
                [10, 20, 50, 100, 150, "All"] // change per page values here
            ],
            "pageLength": 10, // default record count per page
            // "ajax": {
            // "url": ajaxPath, // ajax source
            // },
            "order": [
                [0, "desc"]
            ],// set first column as a default sort by asc
            
            "language": {
                "infoFiltered": "",
            },
            
        }
    };
    options = $.extend(true, options, extraOption);
    if ('ajax' in options.dataTable == false) {
        options.dataTable.ajax = {"url": ajaxPath};
    }
    grid.init(options);

    grid.setAjaxParam("customActionType", "group_action");
    // grid.getDataTable().ajax.reload();
    grid.clearAjaxParams();
    return grid;
}


$(document).on('submit','form',function(){
	$(this).find(':input[type=submit]').prop('disabled', true);
});

//jQuery(document).ajaxStart(function(){ $('.cs-loader').css("display", "block"); });
$(function() {
    $('.modal').modal();
    $('#modal3').modal('open');
    $('#modal3').modal('close');
  });

function loadView(url){
	
	
	$("#content").load(url+' #content',function(response){
		console.log(1);
		$("#content").html(response);
		var obj = { title: 'add', Url: url};
	        history.pushState(obj, obj.Title, obj.Url);
	});
}
