<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko" >
<head>
	<tiles:insertAttribute name="head" />
	<script>var tilesName = '<tiles:getAsString name="tiles-name"/>';</script>
</head>
<body>
	<div id="wrapper">
	
		<div>
		<tiles:insertAttribute name="lnb" />
		</div>
		<div id="container">
<%-- 			<tiles:insertAttribute name="quick" /> --%>
			
			<div id="header">	
				<tiles:insertAttribute name="header" />
			</div><!-- // header -->
			
			<div id="cnt_area">
				
				<div class="cnt_area_in">
					<tiles:insertAttribute name="contents"/>
				</div><!-- // cnt_area_in -->
				
				<tiles:insertAttribute name="footer" />

			</div><!-- // cnt_area -->

		</div><!-- // container -->
		
	</div><!-- // wrapper -->
</body>
</html>