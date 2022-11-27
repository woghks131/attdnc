<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=8" />

<!-- CSS Style Sheet import -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/frameset/left_menu.css" />
<title>left</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery-3.4.1.min.js"></script>

<script type="text/javascript">




	var selectSubMenuId = "rptRealMsgRst";
	$(document).ready(function(){
		var selectMainMenuId =  "left_contents1";
		var loginAuth = '${loginInfo.AUTH_CD}';
		if(loginAuth == "S" || loginAuth == "O" ){
			selectMainMenuId = "left_contents1";
		}else if(loginAuth == "N"){ 
			selectMainMenuId = "left_contents2"; 
			
		}else{
			selectMainMenuId = "left_contents3";
		}     
		    
		$("#"+selectMainMenuId).css({background:  "#4184d6"});
		$("#"+selectSubMenuId).css({"border-left":  "5px solid #09c"});
		
		$("#left_menu ul ul").slideUp();
		if(!$("#"+selectMainMenuId).next().is(":visible"))
		{
			$("#"+selectMainMenuId).next().slideDown();
		}
		
		$("#left_menu div").hover(
				function(){
					$(this).css({background :  "#4184d6"});
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
		
		parent.mainFrame.location = "${pageContext.request.contextPath}/dashBoard/dashBoard.do?";
	});
	
	function setLogOut()
	{
		if(confirm('로그아웃 하시겠습니까?')){
			parent.mainFrame.location = '${pageContext.request.contextPath}/logout.do?';
		}
	}
	
	function dashBoard(){
		parent.mainFrame.location = "${pageContext.request.contextPath}/dashBoard/dashBoard.do?";
	}
</script>

</head>

<body>
	<c:set var="now" value="<%=new java.util.Date() %>"/>
	<div id="left_all">
		<div class="left">
			<div class="left_title"><img src="${pageContext.request.contextPath}/images/left_menu/left_title2.png" style="cu"  onclick="javascript:dashBoard();"/></div>
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
			
							<c:if test='${loginInfo.AUTH_CD == "S"}'>
							
								<div id="left_contents1">
									<table class="table01">
										<tr style="display: block;">
										<td><img class="01" src="${pageContext.request.contextPath}/images/left_menu/icon01_2.png"/></td>
										<td class="td01" style="font-size: 15px;">기준정보 관리</td>
										</tr>
									</table>
								</div>
								<ul>
									<li><a id="accountManage" href="${pageContext.request.contextPath}/baseInfo/accountManage.do" target="mainFrame">사용자 관리</a></li>
									<li><a id="orgManage" href="${pageContext.request.contextPath}/baseInfo/orgManage.do" target="mainFrame">기관 관리</a></li>
									<li><a id="opcoManage" href="${pageContext.request.contextPath}/baseInfo/opcoManage.do" target="mainFrame">운영사 관리</a></li>
									<li><a id="neonBoxManage" href="${pageContext.request.contextPath}/baseInfo/neonBoxManage.do" target="mainFrame">네온박스 관리</a></li>
									<li><a id="neonBoxModelManage" href="${pageContext.request.contextPath}/baseInfo/neonBoxModelManage.do" target="mainFrame">네온박스 모델 관리</a></li>
									<li><a id="dongleManage" href="${pageContext.request.contextPath}/baseInfo/dongleManage.do" target="mainFrame">네온박스 동글 관리</a></li>
									<li><a id="authManage" href="${pageContext.request.contextPath}/baseInfo/authManage.do" target="mainFrame">추가인증 관리</a></li>
									<li><a id="opBoxManage" href="${pageContext.request.contextPath}/baseInfo/opBoxManage.do" target="mainFrame">운영자 네온박스 관리</a></li>
								</ul>				
							</c:if>
							<c:if test='${loginInfo.AUTH_CD == "O"}'>
							
								<div id="left_contents1">
									<table class="table01">
										<tr style="display: block;">
										<td><img class="01" src="${pageContext.request.contextPath}/images/left_menu/icon01_2.png"/></td>
										<td class="td01" style="font-size: 15px;">기준정보 관리</td>
										</tr>
									</table>
								</div>
								<ul>
									<li><a id="opBoxManage" href="${pageContext.request.contextPath}/baseInfo/opBoxManage.do" target="mainFrame">운영자 네온박스 관리</a></li>
								</ul>				
							</c:if> 
						</li>    
				<c:if test='${loginInfo.AUTH_CD == "M" || loginInfo.AUTH_CD == "S" || loginInfo.AUTH_CD == "N"  }'>	
					<li>
						<div id="left_contents2">
							<table class="table01" style="display: block;">
								<tr>
								<td><img class="01" src="${pageContext.request.contextPath}/images/left_menu/icon04_2.png"/></td>
								<td class="td01" style="font-size: 15px;">기관 정보</td>
								</tr>
							</table>
						</div>
						<ul>
							<li><a id="orgInfo" href="${pageContext.request.contextPath}/org/orgInfo.do?" target="mainFrame">기관 정보</a></li>
							<li><a id="productManage" href="${pageContext.request.contextPath}/org/productManage.do?" target="mainFrame">물품 관리</a></li>
							
							<c:if test='${loginInfo.AUTH_CD == "M" || loginInfo.AUTH_CD == "S" }'>	
								<li><a id="opcAdmManage" href="${pageContext.request.contextPath}/org/opcAdmManage.do?" target="mainFrame">운영사 운영자 관리</a></li>
								<li><a id="orgAuthManage" href="${pageContext.request.contextPath}/org/orgAuthManage.do?" target="mainFrame">추가인증요청 관리</a></li>
							</c:if>
						</ul>				
					</li>
				</c:if>	
					
					
					
					<li>
						<div id="left_contents3">
							<table class="table01" style="display: block;">
								<tr>
								<td><img class="01" src="${pageContext.request.contextPath}/images/left_menu/icon01_2.png"/></td>
								<td class="td01" style="font-size: 15px;">보급 관리</td>
								</tr>
							</table>
						</div>
						<ul>
							<li><a id="supplyManage" href="${pageContext.request.contextPath}/supply/supplyManage.do?" target="mainFrame">보급내역 조회</a></li>
							<li><a id="supplyStatDaily" href="${pageContext.request.contextPath}/supply/supplyStatDaily.do?" target="mainFrame">일별 보급 통계</a></li>
							<li><a id="supplyStatPrd" href="${pageContext.request.contextPath}/supply/supplyStatPrd.do?" target="mainFrame">물품별 보급 통계</a></li>
						</ul>				
					</li>
					
					<c:if test='${loginInfo.AUTH_CD == "S"}'>
						<li>
							<div id="left_contents4">
								<table class="table01" style="display: block;">
									<tr>
									<td><img class="01" src="${pageContext.request.contextPath}/images/left_menu/icon01_2.png"/></td>
									<td class="td01" style="font-size: 15px;">회원 관리</td>
									</tr>
								</table>
							</div>
							<ul>
								<li><a id="segmentReg" href="${pageContext.request.contextPath}/user/userManage.do" target="mainFrame">회원 관리</a></li>
								<li><a id="campaignReg" href="${pageContext.request.contextPath}/user/qnaManage.do" target="mainFrame">1:1 문의</a></li>
							</ul>				
						</li>
						<li>
							<div id="left_contents5">
								<table class="table01" style="display: block;">
									<tr>
									<td><img class="01" src="${pageContext.request.contextPath}/images/left_menu/icon01_2.png"/></td>
									<td class="td01" style="font-size: 15px;">앱 관리</td>
									</tr>
								</table>
							</div>
							<ul>
								<li><a id="segmentReg" href="${pageContext.request.contextPath}/app/noticeManage.do" target="mainFrame">공지사항 관리</a></li>
								<li><a id="campaignReg" href="${pageContext.request.contextPath}/app/faqManage.do" target="mainFrame">FAQ</a></li>
								<li><a id="campaignRun" href="${pageContext.request.contextPath}/app/versionManage.do" target="mainFrame">앱버전 관리</a></li>
							</ul>				
						</li>	
					</c:if>
				</ul>						
			</div>
		</div>
		<div class="left_bottom"></div>
	</div>
</body>
</html>