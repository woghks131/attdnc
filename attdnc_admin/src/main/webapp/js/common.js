var IS_DEBUG_MODE = true;

var RES_SUCCESS = "000";

function request(url, params, callback, error) {
	if(params == null) {
		params = {};
	}
	logd("request:"+JSON.stringify(params));
	$.ajax({
		url:url,
		data:JSON.stringify(params),
		dataType:"json",
		contentType : "application/json; charset=utf-8",
		method:"post", 
		success:function(response, status){
			logd("RESPONSE : " + JSON.stringify(response));
			callback(response, status);
		},
		error:function(request, status) {
			loge("error:"+request);
			error(request, status);
		}
	});
}

function requestForm($form, callback, error) {
	logd("REQUEST : requestForm");
	$form.ajaxForm({
		dataType:"json",//결과
		success:function(response, status){
			logd("RESPONSE : " + JSON.stringify(response));
			callback(response, status);
		}, error:function(request, status){
			loge("error:"+request);
			error(request, status);
		}
	}).submit();
}

function logd(log) {
	if(IS_DEBUG_MODE) {
		console.debug(log);
	}
}

function loge(log) {
//	console.error(log);
}

function movePage(page) {
	var pageInput = document.createElement("input");
	pageInput.setAttribute("name", "PAGE");
	pageInput.setAttribute("type", "hidden");
	pageInput.setAttribute("value", page);
	searchForm.appendChild(pageInput);
	searchForm.submit();
}

function getSha512(text) { 
	var sign = hex_sha512(text); 
	return sign;
  
}



$(document).ready(function() {
	$(document).on('input', '.only_number', function(e){
//			this.value = this.value.replace(/[^\d\.\-]/g,'');
		this.value = this.value.replace(/[^\d]/g,'');
	});
});