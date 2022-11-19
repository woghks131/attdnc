<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
$(function() {
	$("#ul_grp_list li a").click(function() {
		var params = {MCT_NO : $(this).data("mct-no")};
		
		request("../changeMerchant.do", params,
			function callback(response, status) {
				
				if("000" == response.RES_CD) {
					location.reload();
				} else {
					alert(response.RES_MSG + "(" + response.RES_CD + ")");	
				}
			},
			function error(request, status) {
				alert(status);
			}
		);
	});
});
</script>