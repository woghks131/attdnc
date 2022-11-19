package gy.attdnc.admin.common.util;

public enum StatusInfo {
	SUCCESS("000", "성공"),
	REGISTED_USER("001", "이미 가입된 고객입니다."),
	INVALID_AUTH_ID("900", "인증 ID가 입력되지 않았습니다."),
	INVALID_AUTH_DIV("901", "인증 유형이 입력되지 않았습니다."),
	NOT_EXIST_USER("902", "가입되지 않은 고객입니다."),
	INVALID_USER_NO("903", "사용자번호가 입력되지 않았습니다."),
	NOT_EXIST_VERSION_INFO("904", "버전정보가 없습니다."),
	INVALID_PAGE_INFO("905", "페이지 정보가 잘못되었습니다."),
	INVALID_CONTENT("906", "내용이 입력되지 않았습니다."),
	ERROR_DELETE("907", "삭제를 실패했습니다."),
	ERROR_INSERT("908", "등록을 실패했습니다."),
	ERROR_UPDATE("909", "수정을 실패했습니다."),
	INVALID_USER_PW_CONFIRM("910", "현재 비밀번호가 일치하지 않습니다"),
	UNKNOWN_ERROR("999", "알 수 없는 에러가 발생하였습니다."), 
	LOGIN_FAIL("800", "아이디가 없거나 비밀번호가 일치하지 않습니다."),
	INVALID_APP_VER("801", "앱 버전 형태가 유효하지 않습니다. (ex) 1.0.0"),
	DUPLICATE_USER_ID("802", "이미 등록된 ID 이거나, 사용이 불가능한 ID입니다."),
	SAME_AS_BEFORE_USER_PW("803", "기존 비밀번호와 변경 비밀번호가 같습니다."),
	DUPLICATE_PRD_CD("804", "이미 등록된 상품 코드이거나, 관리자가 승인 대기중인 상품 코드 입니다."),
	NOMATCH_DONGLE("805", "동글일련번호 와 변환된 주소값의 개수가 일치하지 않습니다."),
	DUPLICATE_AUTH_CD("806","이미 등록된 인증코드 입니다."),
	;
	
	private String code;
	private String message;
	
	StatusInfo(String code, String message) {
		this.code = code;
		this.message = message;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
