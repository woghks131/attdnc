<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
		<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
		<title>근태 관리 > 회원가입</title>
		
		<link rel="stylesheet" type="text/css" href="/css/register.css?20221211" />
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
		
	    <!-- JavaScript -->
	    <script language="javascript" type="text/javascript">
	    
	    	$(document).ready(function(){
	    		
	    	});
	    	
	    </script>
	</head>  
	<body style="position :relative; overflow-y: scroll;">
		<div class="bg_top"></div> 
		<div class="bg_bottom"></div>
		<div id="register_contents" align="center">
			<img src="/images/login/title_main_white.png" />
			
			<div>
				<table>
					<tr>
						<td class="register_label nessesary"><label>이름</label></td>
						<td>
							<input class="register_input" maxlength="5" type="text"></input>
						</td>
						<td></td>
					</tr>
					<tr class="text_lamp">
						<td colspan="3">이름은 한글만 입력 가능합니다.</td>
					</tr>
					<tr>
						<td class="register_label nessesary"><label>아이디</label></td>
						<td>
							<input class="register_input" maxlength="12" type="text"></input>
						</td>
						<td class="chkId">중복확인</td>
					</tr>
					<tr class="text_lamp">
						<td colspan="3">아이디 중복검사를 해주세요.</td>
					</tr>
					<tr>
						<td class="register_label nessesary"><label>비밀번호</label></td>
						<td>
							<input class="register_input" maxlength="12" type="password"></input>
						</td>
						<td ></td>
					</tr>
					<tr class="text_lamp">
						<td colspan="3">영소문자와 숫자의 조합으로 8~12글자</td>
					</tr>
					<tr>
						<td class="register_label nessesary"><label>비밀번호 확인</label></td>
						<td>
							<input class="register_input" maxlength="12" type="password"></input>
						</td>
						<td></td>
					</tr>
					<tr class="text_lamp">
						<td colspan="3">비밀번호가 일치하지 않습니다.</td>
					</tr>
					<tr >
						<td class="selectable_open" colspan="3"><img src="/images/register/img_open.png"/></td>
					</tr>
					<tr>
						<td class="register_label sel"><label>부서</label></td>
						<td>
							<input class="register_input" maxlength="12" type="text"></input>
						</td>
						<td></td>
					</tr>
					<tr class="text_lamp">
						<td colspan="3"></td>
					</tr>
					<tr>
						<td class="register_label sel"><label>직책</label></td>
						<td>
							<input class="register_input" maxlength="12" type="text"></input>
						</td>
						<td></td>
					</tr>
					<tr class="text_lamp">
						<td colspan="3"></td>
					</tr>
					<tr>
						<td class="register_label sel"><label>닉네임</label></td>
						<td>
							<input class="register_input" maxlength="12" type="text"></input>
						</td>
						<td></td>
					</tr>
					<tr class="text_lamp">
						<td colspan="3"></td>
					</tr>
					<tr>
						<td class="register_label sel"><label>입사일 </label></td>
						<td>
							<input class="register_input" maxlength="12" type="text"></input>
						</td>
						<td></td>
					</tr>
					<tr class="text_lamp">
						<td colspan="3"></td>
					</tr>
					<tr>
						<td class="register_label sel"><label>생년월일</label></td>
						<td>
							<input class="register_input" maxlength="12" type="text"></input>
						</td>
						<td></td>
					</tr>
					<tr class="text_lamp">
						<td colspan="3"></td>
					</tr>
					<tr>
						<td class="register_label sel"><label>성별 </label></td>
						<td>
							<input class="register_input" maxlength="12" type="text"></input>
						</td>
						<td></td>
					</tr>
					<tr class="text_lamp">
						<td colspan="3"></td>
					</tr>
					<tr>
						<td class="register_label sel"><label>휴대폰번호</label></td>
						<td>
							<input class="register_input" maxlength="12" type="text"></input>
						</td>
						<td></td>
					</tr>
					<tr class="text_lamp">
						<td colspan="3"></td>
					</tr>
					<tr >
						<td class="selectable_open" colspan="3"><img src="/images/register/img_open.png"/></td>
					</tr>
				</table>
				<br/>
				
				<table>
					<tr>
						<td class="register_label nessesary">E-Mail</td>
						<td colspan="2"><input class="register_input"> @</input></td>
						<td colspan="2"><input class="register_input email"></input></td>
					</tr>
					<tr class="text_lamp">
						<td colspan="5">직접입력</td>
					</tr>
					<tr>
						<td colspan="3"></td>
						<td class="btn_chk">중복확인</td>
						<td class="btn_send">인증번호 발송</td>
					</tr>
				</table>
			</div>
		</div>
	</body>
</html>