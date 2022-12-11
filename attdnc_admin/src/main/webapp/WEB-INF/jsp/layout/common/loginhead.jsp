<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>근태 관리</title>

<jsp:useBean id="now" class="java.util.Date"/>
<%-- <fmt:formatDate value="${now}" pattern="yyyyMMddHHmmss" var="now"/>  --%>

<link rel="stylesheet" type="text/css" href="/css/login.css?20221211" />
<link rel="stylesheet" type="text/css" href="/css/common.css" />
<link rel="stylesheet" type="text/css" href="/css/import.css" />
<script type="text/javascript" src="/js/jquery/jquery.js"></script>
<script type="text/javascript" src="/js/jquery.form.min.js"></script>
<script type="text/javascript" src="/js/sha256.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/sha512.min.js"></script>
<link rel="stylesheet" href="/js/jquery/jquery-ui.css" /> 
<link rel="stylesheet" href="/js/jquery/jquery-ui.css" /> 
<script src="/js/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="/js/jquery/plugins/jquery.blockUI.js"></script>
<script src="/js/jquery/front.js"></script>
<script type="text/javascript">
$(function() { 
	$( "#datepicker, #datepicker1, #datepicker2, #datepicker3").datepicker({
		dateFormat: 'yy-mm-dd',
		prevText: '이전 달',
		nextText: '다음 달',
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNames: ['일','월','화','수','목','금','토'],
		dayNamesShort: ['일','월','화','수','목','금','토'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		showMonthAfterYear: true,
		yearSuffix: '년'
	});
});	
</script>

