<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=8" />

<!-- CSS Style Sheet import -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/frameset/left_menu.css" />
<title>left</title>

<script type="text/javascript">
	var selectMainMenuId = "left_contents1";
	var selectSubMenuId = "rptRealMsgRst";
	$(document).ready(function(){
		//$("#"+selectMainMenuId).css({background:  "#4184d6"});
		//$("#"+selectSubMenuId).css({"border-left":  "5px solid #09c"});
		
		/* $("#left_menu ul ul").slideUp();
		if(!$("#"+selectMainMenuId).next().is(":visible"))
		{
			$("#"+selectMainMenuId).next().slideDown();
		} */
		
		$("#left_menu div").hover(
				function(){
					$(this).css({background:  "#4184d6"});
				},
				function(){
					if($(this).attr("id") != selectMainMenuId){
						$(this).css({background: "#32323a"});
					}
				}		
		);
		
		$("#left_menu ul ul li a").hover(
				function(){
					$(this).css({"border-left":  "5px solid #09c"});
				},
				function(){
					if($(this).attr("id") != selectSubMenuId){
						$(this).css({"border-left": "0px"});
					}
				}		
		);
		
		$("#left_menu div").click(function(){
			$("#left_menu div").css({background : "#32323a"});
			$(this).css({background : "#4184d6"});
			
			selectMainMenuId = $(this).attr("id");
			
			$("#left_menu ul ul").slideUp();
			if(!$(this).next().is(":visible"))
			{
				$(this).next().slideDown();
			}
		});
		
		$("#left_menu ul ul li a").click(function(){
			$("#left_menu ul ul li a").css({"border-left":  "0px"});
			$(this).css({"border-left" : "5px solid #09c"});
			selectSubMenuId = $(this).attr("id");
		});
		
		//parent.mainFrame.location = "${pageContext.request.contextPath}/org/orgInfo.do";
	});
	
	function setLogOut()
	{
		if(confirm('로그아웃 하시겠습니까?')){
			var dataURL     = '${pageContext.request.contextPath}/logout.do';
			
			$.ajax({
			    type : "POST"
			    , async : true
			    , url : dataURL
			    , timeout : 30000
			    , cache : false
			    , contentType: "application/json; charset=UTF-8"
			    , error : function(request, status, error) {
// 			    	if(request.status == '401') {
// 				    	parent.location.href = "<c:out value="${pageContext.request.contextPath}" />/leftFrame.do";
// 			    	}else{
			    		alert("로그아웃에 실패하였습니다. ("+request.status+")");
// 			    	}
			    }
			    , success : function(response, status, request) {
			   		alert("정상적으로 로그아웃 되었습니다.");
			   		parent.location.href = '${pageContext.request.contextPath}/index.do';
			    }
			});	
		}
	}
</script>

</head>
<body>
<div id="lnb">
	<c:set var="now" value="<%=new java.util.Date() %>"/>
	<div id="left_all">
		<div class="left">
			<div class="left_title"><img src="${pageContext.request.contextPath}/images/left_menu/left_title2.png"/></div>
			<div class="left_btn">
				<div class="btn01">
				접속시간 : <fmt:formatDate value="${now }" pattern="yyyy-MM-dd a hh시 mm분"/>	
				</div>
				<div class="btn02">
				<img src="${pageContext.request.contextPath}/images/left_menu/left_logout.png" onclick="javascript:setLogOut();"/>
				</div>
			</div>
			<div id="left_menu">
				<ul class="left_space">
					<li>
						<div id="left_contents1">
							<table class="table01">
								<tr style="display: block;">
								<td><img class="01" src="${pageContext.request.contextPath}/images/left_menu/icon01_2.png"/></td>
								<td class="td01" style="font-size: 15px;">큰메뉴1</td>
								</tr>
							</table>
						</div>
						<ul>
							<li><a id="rptRealMsgRst" href="${pageContext.request.contextPath}/menu1.do" target="mainFrame">메뉴1</a></li>
							<li><a id="messageType" href="${pageContext.request.contextPath}/menu2.do" target="mainFrame">메뉴2</a></li>
						</ul>				
					</li>
				</ul>						
			</div>
		</div>
		<div class="left_bottom"></div>
	</div>
</div><!-- // lnb -->
</body>
<c:if test='${loginInfo.AUTH_CD == "A" || loginInfo.AUTH_CD == "SA"}'>
	<jsp:include page="./lnb-script.jsp"></jsp:include>
</c:if>