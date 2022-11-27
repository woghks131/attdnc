<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>근태관리</title>

<jsp:useBean id="now" class="java.util.Date"/>
<fmt:formatDate value="${now}" pattern="yyyyMMddHHmmss" var="now"/> 
 
<link rel="stylesheet" type="text/css" href="/css/base.css?${now}" />
<link rel="stylesheet" type="text/css" href="/css/site.css?${now}" />
<link rel="stylesheet" type="text/css" href="/css/validationEngine.jquery.css" />
<link rel="stylesheet" type="text/css" href="/css/login.css?${now}" />
<link rel="stylesheet" type="text/css" href="/css/Default.css?${now}" />
<link rel="stylesheet" type="text/css" href="/css/common.css?${now}" />
<link rel="stylesheet" type="text/css" href="/css/import.css?${now}" />

	<!-- CSS Style Sheet import -->
 
<script type="text/javascript" src="/js/jquery/jquery-3.4.1.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.js"></script>
<script type="text/javascript" src="/js/jquery.form.min.js?${now}"></script>
<script type="text/javascript" src="/js/sha256.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/sha512.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/js/jquery/jquery-ui.css" /> 
<link rel="stylesheet" href="/js/jquery/jquery-ui.css" /> 
<script src="/js/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="/js/jquery/plugins/jquery.blockUI.js"></script>
<script src="/js/jquery/front.js"></script>
<script type="text/javascript">
</script>

