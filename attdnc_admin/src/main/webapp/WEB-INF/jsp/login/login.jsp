<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<%@ include file="/WEB-INF/jsp/layout/common/loginhead.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	    <meta http-equiv="X-UA-Compatible" content="IE=8" />
	    <meta name="viewport" content="device-width, initial-scale=1"></meta>
	    <!-- JavaScript -->
	    <script language="javascript" type="text/javascript">
	    
	    	$(document).ready(function(){
	    		
	    		$("#btnReg").click(function() {
	    			login();
	    		});
	    	});
	    	function login() {
	    		var userId = $("#userId").val();
	    		var passwd = $("#passwd").val();
	    		
	    		var isChecked = $("#idSave").is(":checked");
	    		$("#idSave").val(isChecked);
	    		$("#empid").val(document.getElementById('userId').value);
	    		
	    		var pw = passwd == "" ? "" : getSha512(passwd);
	    		var params = {
	    			USER_ID : userId,
	    			USER_PW : pw,
	    			idSave : isChecked
	    		};
	    		
	    		
	    		request("./reqLogin.do", params,
	    			function callback(response, status) {
	    				
	    				if("000" == response.RES_CD) {
	    					if(response.ADM_PW == null){
	    						alert("비밀번호 설정이 되어있지 않아 비밀번호 설정 페이지로 이동합니다.");
	    						showProductDialog(response);
	    						
	    					}else{
	    						
	    						location.href = './indexFrame.do';
	    					}
	    					
	    					
	    				} else {
	    					alert(response.RES_MSG + "(" + response.RES_CD + ")");	
	    				}
	    			},
	    			function error(request, status) {
	    				alert(status);
	    			}
	    		);
	    	}
	    	function enterkey() {
	            if (window.event.keyCode == 13) {
	                 // 엔터키가 눌렸을 때 실행할 내용
	                 login();
	            }
	    	}
	
	
	    </script>
	</head>  
	<body style=" position :relative;">
		<div class="login_top"></div> 
		<div class="login_bottom"></div>
		<div id="login_contents" align="center">
			<table class="login_tb">
				<tr align="center">
					<td><img src="/images/login/title_main_white.png" /></td>
				</tr>
				<tr align="center">
					<td align="center">
						<table class="login_tb_2">
							<tr>
								<td style="text-align: left;">아이디</td>	
								<td style="float: left;" colspan="2"><input class="login_input" type="text" id="userId" name="userId"></input></td>
								<td class="btn_login" rowspan="2">로그인</td>
							</tr>
							<tr>
								<td style="text-align: left;">비밀번호</td>
								<td style="float: left;" colspan="2"><input class="login_input" onkeyup="enterkey()" type="password" id="passwd" name="passwd"></input></td>
							</tr>
							<tr align="center">  
								<td align="center">
									<br/> 
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<br/>
			<table class="link">
				<tr>
				<td class="link id">
					아이디 찾기
				</td>
				<td class="link pw">
					비밀번호 찾기
				</td>
				<td class="link reg">
					회원가입
				</td>
				</tr>
			</table>
		</div>
	</body>
</html>