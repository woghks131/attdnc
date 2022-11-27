<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<!-- CSS Style Sheet import -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/frameset/top_menu.css" />
<script type="text/javascript">
	//홈으로 이동
	function goRootHome()
	{
		var url = '${pageContext.request.contextPath}/indexFrame.do';
		parent.location.href = url;
	}
	
	// 로그아웃
	function setLogOut()
	{
		if(confirm('로그아웃 하시겠습니까?')){
			var dataURL     = '${pageContext.request.contextPath}/jsp/login/login_excute.jsp?command=logout';
			window.location = dataURL;
		}
	}
</script>
<title>top</title>
</head>
<body>
	<div id="top_all">
		<div>
			<table class="top_tb" cellspacing="0">
				<tr>
					<td class="td01">- [${loginInfo.ADM_NM}] 님 안녕하세요 ^^</td>
				</tr>		
			</table>
		</div>	
	</div>
</body>
</html>