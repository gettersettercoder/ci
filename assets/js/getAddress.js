function getMap(myId = "txtAddress"){
	
	var places = new google.maps.places.Autocomplete(document.getElementById(myId));
	document.getElementById(myId).placeholder='';
	
	google.maps.event.addListener(places, 'place_changed', function () {
		
		var place = places.getPlace();
		var address = place.formatted_address;
	
		$("#txtZipcode, #txtState, #txtCountry, #txtCity").removeAttr('readonly');
		$("#txtZipcode, #txtState, #txtCountry, #txtCity").val('');
	
		for (var i = 0; i < place.address_components.length; i++) {
		
			for (var j = 0; j < place.address_components[i].types.length; j++) {
		    	  
				if (place.address_components[i].types[j] == "postal_code") {
					$("#txtZipcode").val(place.address_components[i].long_name);
					$("#txtZipcode").attr('readonly','readonly').focus();
				}
				
				if (place.address_components[i].types[j] == "administrative_area_level_1") {	
					$("#txtState").val(place.address_components[i].long_name);
					$("#txtState").attr('readonly','readonly').focus();
				}    
				
				if (place.address_components[i].types[j] == "country") {
					$("#txtCountry").val(place.address_components[i].long_name);
					$("#txtCountry").attr('readonly','readonly').focus();
				}
				
				if (place.address_components[i].types[j] == "locality") {
					$("#txtCity").val(place.address_components[i].long_name);
					$("#txtCity").attr('readonly','readonly').focus();
				}
				
			}
		
		}
		   
	});
}