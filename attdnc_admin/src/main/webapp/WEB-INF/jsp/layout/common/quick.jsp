<%@ page pageEncoding="UTF-8"%>
			<div class="quick">
				<div class="quick_in">
					<p>빠른메뉴</p>
					<ul class="menu" id="qmenu">
						<c:if test="${sessionScope.g_userType == '1'}">
							<li><a href="/cjs/pg/adj/baseinfo/memberManage/listMemberShop.fo?PROG_CD=pay_baseInfo_listMemberShop">가맹점관리</a></li>
							<li><a href="/cjs/pg/adj/shopInfo/shopContract/list.fo?PROG_CD=pay_shopInfo_shopContractlist">가맹점 계약현황</a></li>
						</c:if>
						<c:if test="${sessionScope.g_userType == '2'}">
							<li><a href="/cjs/pg/adj/tradeApproval/trMaster/listTrMaster.fo?PROG_CD=pay_tradeApproval_listTrMaster">거래내역조회(전체)</a></li>
							<li><a href="/cjs/pg/adj/tradeStats/dayTradeStats/listDayTrade.fo?PROG_CD=pay_tradeStats_listDayTrade">일별거래통계</a></li>
						</c:if>
					</ul>
				</div>
			</div><!-- // quick -->

<script type="text/javascript">
$(function(){ 
	var menu;
	var user = '';
// 	$.get("/cjs/pg/adj/common/qmenu/select.fo",
// 		{},
// 		function(data) {
// 			if (data.rs != undefined) {
// 				menu = data.rs.data;
// 				for (i=0; i<7; i++) {
// 					if(menu[i]!= null){
// 						$("#qmenu").append('<li><a href="'+menu[i].LNK +'">'+menu[i].MENU_NM+'</a></li>');
// 					} else {
// 						$("#qmenu").append('<li><a href="/cjs/pg/adj/shopInfo/qMenuManage/list.fo"><span><em>빠른메뉴 추가하기</em></span></a></li>');
// 					}
// 				}
// 			}
// 		}
// 	);
});
</script>