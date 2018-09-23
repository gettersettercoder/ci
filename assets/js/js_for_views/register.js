$(window).load(function(){
	getMap();
	$("#txtUserame").focus();
});

$(document).ready(function(){
	$("#registerForm").removeAttr('action');
	$("#mybody").show();
});

function addvalidation()
{

	var txtUserame			= $("#txtUserame").val();
	var txtEmail 			= $("#txtEmail").val();
	var txtMobile 			= $("#txtMobile").val();
	var txtAnotherMobile 	= $("#txtAnotherMobile").val();
	var txtAddress 			= $("#txtAddress").val();
	var txtCountry 			= $("#txtCountry").val();
	var txtState 			= $("#txtState").val();
	var txtCity 			= $("#txtCity").val();
	var txtZipcode 			= $("#txtZipcode").val();
	var pwdPassword 		= $("#pwdPassword").val();
	var pwdConfPasssword 	= $("#pwdConfPasssword").val();
	
	var emailRegex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	
	if(txtUserame.trim()=='')
	{
		$("#txtUserame").css('border','1px solid #DD7A6E');
		$("#txtUserame").attr('placeholder','College name cannot be blank.');	
		$("#txtUserame").focus();
		return false;
	} else {
		$("#txtUserame").css('border','1px solid #FFFFFF');
	}

	if(txtEmail.trim()=='')
	{
		$("#txtEmail").css('border','1px solid #DD7A6E');
		$("#txtEmail").attr('placeholder','Email cannot be blank');
		$("#txtEmail").focus();
		return false;
	} else if(!emailRegex.test(txtEmail)) {
		$("#txtEmail").css('border','1px solid #DD7A6E');
		$("#txtEmail").attr('placeholder','Incorrect email address');
		$("#txtEmail").focus();
		return false;
	} else {
		$("#txtEmail").css('border','1px solid #FFFFFF');
	}

	if(txtMobile.trim()=='')
	{
		$("#txtMobile").css('border','1px solid #DD7A6E');
		$("#txtMobile").attr('placeholder','Mobile number cannot be blank');
		$("#txtMobile").focus();
		return false;
	} else if(txtMobile.length != 10){
		$("#txtMobile").css('border','1px solid #DD7A6E');
		$("#txtMobile").attr('placeholder','Please enter correct mobile number');
		$("#txtMobile").focus();
		return false;
	} else {
		$("#txtMobile").css('border','1px solid #FFFFFF');
	}

	if(txtAnotherMobile.trim()=='')
	{
		$("#txtAnotherMobile").css('border','1px solid #DD7A6E');
		$("#txtAnotherMobile").attr('placeholder','Optional mobile cannot be blank');
		$("#txtAnotherMobile").focus();
		return false;		
	} else if(txtAnotherMobile.length != 10){
		$("#txtAnotherMobile").css('border','1px solid #DD7A6E');
		$("#txtAnotherMobile").attr('placeholder','Please enter correct mobile number');
		$("#txtAnotherMobile").focus();
		return false;
	} else {
		$("#txtAnotherMobile").css('border','1px solid #FFFFFF');
	}

	if(txtAddress.trim()=='')
	{
		$("#txtAddress").css('border','1px solid #DD7A6E');
		$("#txtAddress").attr('placeholder','Address cannot be blank');
		$("#txtAddress").focus();
		return false;		
	} else {
		$("#txtAddress").css('border','1px solid #FFFFFF');
	}

	if(txtCountry.trim()=='')
	{
		$("#txtCountry").css('border','1px solid #DD7A6E');
		$("#txtCountry").attr('placeholder','Country cannot be blank');
		$("#txtCountry").focus();
		return false;		
	} else {
		$("#txtCountry").css('border','1px solid #FFFFFF');
	}

	if(txtState.trim()=='')
	{
		$("#txtState").css('border','1px solid #DD7A6E');
		$("#txtState").attr('placeholder','State cannot be blank');
		$("#txtState").focus();
		return false;		
	} else {
		$("#txtState").css('border','1px solid #FFFFFF');
	}

	if(txtCity.trim()=='')
	{
		$("#txtCity").css('border','1px solid #DD7A6E');
		$("#txtCity").attr('placeholder','City cannot be blank');
		$("#txtCity").focus();
		return false;		
	} else {
		$("#txtCity").css('border','1px solid #FFFFFF');
	}

	if(txtZipcode.trim()=='')
	{
		$("#txtZipcode").css('border','1px solid #DD7A6E');
		$("#txtZipcode").attr('placeholder','Zipcode cannot be blank');
		$("#txtZipcode").focus();
		return false;		
	} else {
		$("#txtZipcode").css('border','1px solid #FFFFFF');
	}

	if(pwdPassword.trim()=='')
	{
		$("#pwdPassword").css('border','1px solid #DD7A6E');
		$("#pwdPassword").attr('placeholder','Password cannot be blank');
		$("#pwdPassword").focus();
		return false;		
	} else {
		$("#pwdPassword").css('border','1px solid #FFFFFF');
	}

	if(pwdConfPasssword.trim()=='')
	{
		$("#pwdConfPasssword").css('border','1px solid #DD7A6E');
		$("#pwdConfPasssword").attr('placeholder','Confirm password cannot be blank');
		$("#pwdConfPasssword").focus();
		return false;
	} else if(pwdPassword != pwdConfPasssword) {
		$("#pwdConfPasssword").css('border','1px solid #DD7A6E');
		$("#pwdConfPasssword").attr('placeholder','Password does not match');
		$("#pwdConfPasssword").focus();
		return false;
	} else  {
		$("#pwdConfPasssword").css('border','1px solid #FFFFFF');
	}
	
	return true;
	
}


$(document).on('click','#register',function(){

	validationResponse = addvalidation();
	if(validationResponse){
		var data = $('#registerForm').serialize();
		$.ajax({
			url: SITE_URL+'user/register',
			type: 'post',
			data: data,
			success: function(response){
				console.log(response);
				alert(response.message);
			}
		});
	}
	
});