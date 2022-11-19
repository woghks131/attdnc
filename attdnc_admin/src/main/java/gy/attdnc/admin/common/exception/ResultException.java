package gy.attdnc.admin.common.exception;

import gy.attdnc.admin.common.util.StatusInfo;


public class ResultException extends Exception {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1491812381600822759L;

	private String code = "999";
	
	public ResultException(String message) {
		super(message);
	}
	
	public ResultException(String code, String message) {
		super(message);
		setCode(code);
	}
	
	public ResultException(StatusInfo statusInfo) {
		super(statusInfo.getMessage());
		setCode(statusInfo.getCode());
	}
	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
}
