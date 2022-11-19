/*
 * Front UI 스크립트
 * 
 * @File   : front.js
 * @Author : 현지혜
 * @Date   : 2013-09-11
 */

$(function() {
	
	//등록 가맹점 설정 select 
	$(".my_info > .select > a").click(function() {		
		$(".my_info > .select > ul").slideToggle(0);	
	});
	
	//레프트 메뉴
	//var $lnb_li = $(".left_menu > ul > li");
	//var $gnb_li = $(".gnb > ul > li");
	//$li.click(function() {	
		//$li.removeClass("on");
		//$(this).addClass("on");	
	//});
	
	
	//테이블 선택
//	var $table = $(".table > tbody > tr");	
//	$table.click(function() {		
//		$table.removeClass("on");
//		$(this).addClass("on");	
//	});
	
	//비밀번호 암호화
	/* $(document).ready(function() {
		$("#password").valid();		
	}); */
	
	//그룹관리 선택
	var $group = $(".group_area > ul > li");	
	$group.click(function() {		
		$group.removeClass("on");
		$(this).addClass("on");	
	});
	
	//그룹관리 테이블 선택
	var $table = $(".group_area > table > tbody > tr");	
	$table.click(function() {		
		$table.removeClass("on");
		$(this).addClass("on");	
	});
	
	//팝업-우편번호 찾기 탭
/*	$(".pop_wrapper.post .post_area:not("+$(".pop_wrapper.post .tab a.on").attr("href")+")").hide();
	$(".pop_wrapper.post .tab a").click(function(){
		$(".pop_wrapper.post .tab a").removeClass("on");
		$(this).addClass("on");
		$(".pop_wrapper.post .post_area").hide();
		$($(this).attr("href")).show();
		return false;
	});*/
		
	//기간 버튼
	var $li = $(".box_area .date .btn a");
	$li.click(function() {	
		$li.removeClass("on");
		$(this).addClass("on");	
	});
	
	// 숫자 제외하고 모든 문자 삭제.
    $.fn.removeText = function(_v){
        //console.log("removeText: 숫자 제거 합니다.");
        if (typeof(_v)==="undefined")
        {
            $(this).each(function(){
                this.value = this.value.replace(/[^0-9]/g,'');
            });
        }
        else
        {
            return _v.replace(/[^0-9]/g,'');
        }
    };
     
    // php의 number_format과 같은 효과.
    $.fn.numberFormat = function(_v){
        this.proc = function(_v){
            var tmp = '',
                number = '',
                cutlen = 3,
                comma = ','
                i = 0,
                len = _v.length,
                mod = (len % cutlen),
                k = cutlen - mod;
                 
            for (i; i < len; i++)
            {
                number = number + _v.charAt(i);
                if (i < len - 1)
                {
                    k++;
                    if ((k % cutlen) == 0)
                    {
                        number = number + comma;
                        k = 0;
                    }
                }
            }
            return number;
        };
         
        var proc = this.proc;
        if (typeof(_v)==="undefined")
        {
            $(this).each(function(){
                this.value = proc($(this).removeText(this.value));
            });
        }
        else
        {
            return proc(_v);
        }
    };
     
    // 위 두개의 합성.
    // 콤마 불필요시 numberFormat 부분을 주석처리.
    $.fn.onlyNumber = function (p) {
        $(this).each(function(i) {
            $(this).css({'text-align':'right'});
             
            this.value = $(this).removeText(this.value);
            //this.value = $(this).numberFormat(this.value);
             
            $(this).bind('keypress keyup',function(e){
                this.value = $(this).removeText(this.value);
               // this.value = $(this).numberFormat(this.value);
            });
        });
    };
	
}); //function() END


var tooltip=function(){
	var id = 'tt';
	var top = 3;
	var left = 3;
	var maxw = 300;
	var speed = 10;
	var timer = 20;
	var endalpha = 95;
	var alpha = 0;
	var tt,t,c,b,h;
	var ie = document.all ? true : false;
	return{
		show:function(v,w){
			if(tt == null){
				tt = document.createElement('div');
				tt.setAttribute('id',id);
				t = document.createElement('div');
				t.setAttribute('id',id + 'top');
				c = document.createElement('div');
				c.setAttribute('id',id + 'cont');
				b = document.createElement('div');
				b.setAttribute('id',id + 'bot');
				tt.appendChild(t);
				tt.appendChild(c);
				tt.appendChild(b);
				document.body.appendChild(tt);
				tt.style.opacity = 0;
				tt.style.filter = 'alpha(opacity=0)';
				document.onmousemove = this.pos;
			}
			tt.style.display = 'block';
			c.innerHTML = v;
			tt.style.width = w ? w + 'px' : 'auto';
			if(!w && ie){
				t.style.display = 'none';
				b.style.display = 'none';
				tt.style.width = tt.offsetWidth;
				t.style.display = 'block';
				b.style.display = 'block';
			}
			if(tt.offsetWidth > maxw){tt.style.width = maxw + 'px'}
			h = parseInt(tt.offsetHeight) + top;
			clearInterval(tt.timer);
			tt.timer = setInterval(function(){tooltip.fade(1)},timer);
		},
		pos:function(e){
			var u = ie ? event.clientY + document.documentElement.scrollTop : e.pageY;
			var l = ie ? event.clientX + document.documentElement.scrollLeft : e.pageX;
			tt.style.top = (u - h) + 'px';
			tt.style.left = (l + left) + 'px';
		},
		fade:function(d){
			var a = alpha;
			if((a != endalpha && d == 1) || (a != 0 && d == -1)){
				var i = speed;
				if(endalpha - a < speed && d == 1){
					i = endalpha - a;
				}else if(alpha < speed && d == -1){
					i = a;
				}
				alpha = a + (i * d);
				tt.style.opacity = alpha * .01;
				tt.style.filter = 'alpha(opacity=' + alpha + ')';
			}else{
				clearInterval(tt.timer);
				if(d == -1){tt.style.display = 'none'}
			}
		},
		hide:function(){
			clearInterval(tt.timer);
			tt.timer = setInterval(function(){tooltip.fade(-1)},timer);
		}
	};
}();

function Loadingbar(){
	$.blockUI({
		message: '<img src="/images/ajax-loader.gif" />',
		//메세지(로딩이미지를 감싸고 있는 box)영역에 대한 css
        css: {
        	//top: getLoaderTop(o), //FrameOne2.0a 에서는 로딩이미지의 수직위치를 center정렬 하는 것만 기본으로 제공하기 때문에 주석처리한다.
        	centerX: true,
        	centerY: true,
       	    border: 'none',
       	    backgroundColor: 'transparent',
       	    opacity: 1 //로딩이미지 자체는 온전히 보여야 한다.
       	},        
        //오버레이영역에 대한 css
	    overlayCSS:  { 
	        opacity: 0,	//오버레이가 덮지 않는 것 처럼 보이면서 block한다. 
	        cursor: 'wait' //오버레이영역의 커서 모양 
	    }
	});
}

function closeLoadingbar(){
	$.unblockUI();
}

function blurTrim(obj){
	var value = obj.value;
	obj.value = $.trim(value);
}

function checkDate(from, to){
	var FORMAT = "-";
	
	var start_dt = from.split(FORMAT);
	var end_dt = to.split(FORMAT);
	
	start_dt[1] = (Number(start_dt[1]) - 1) + "";
	end_dt[1] = (Number(end_dt[1]) - 1) + "";
	
	var from_dt = new Date(start_dt[0], start_dt[1], start_dt[2]);
	var end_dt = new Date(end_dt[0], end_dt[1], end_dt[2]);
	var diffDay = (end_dt.getTime() - from_dt.getTime()) / 1000 / 60 / 60 / 24;
	
	if(from_dt > end_dt){
		alert("시작일자가 종료일자보다 큽니다.");
		return false;
	}
	
	return true;
}

function calculateDate1(dateType, addDate) {
	var date = new Date();
	
	if (dateType == 'm') {
		date.setMonth(date.getMonth() + addDate);
	} else if (dateType == 'd') {
		date.setDate(date.getDate() + addDate);
	}
	return date; 
}

function calculateDate2(dateType, addDate) {
	var date = new Date();
	date.setDate(date.getDate() + -1);
	if (dateType == 'm') {
		date.setMonth(date.getMonth() + addDate);
	} else if (dateType == 'd') {
		date.setDate(date.getDate() + addDate);
	}
	return date;
}

function setSearchDate1(idx) {//오늘기준
	
	var startDates = new Array();
	startDates[0] = calculateDate1('d', 0);  
	startDates[1] = calculateDate1('d', - 7);
	startDates[2] = calculateDate1('m', - 1);
	startDates[3] = calculateDate1('m', - 2);
	startDates[4] = calculateDate1('m', - 3);
	
	var $datepicker1 =  $("#datepicker1");
	var $datepicker2 =  $("#datepicker2");
	var $dateButton = $('span.dateButton > a');
	
	$dateButton.removeClass('on').eq(idx).addClass('on');
	$datepicker2.val($.datepicker.formatDate($.datepicker.ATOM,  calculateDate1('d', 0)));
	
	for (var i = 0; i < startDates.length; i++) {
		if (idx == i) {
			$datepicker1.val($.datepicker.formatDate($.datepicker.ATOM, startDates[i]));
		}
	}
}

function setSearchDate2(idx) {//어제기준
	var startDates = new Array();
	startDates[0] = calculateDate2('d', 0);
	startDates[1] = calculateDate2('d', - 7);
	startDates[2] = calculateDate2('m', - 1);
	startDates[3] = calculateDate2('m', - 2);
	startDates[4] = calculateDate2('m', - 3);
	
	var $datepicker1 =  $("#datepicker1");
	var $datepicker2 =  $("#datepicker2");
	var $dateButton = $('span.dateButton > a');
	
	$dateButton.removeClass('on').eq(idx).addClass('on');
	$datepicker2.val($.datepicker.formatDate($.datepicker.ATOM,  calculateDate2('d', 0)));
	
	for (var i = 0; i < startDates.length; i++) {
		if (idx == i) {
			$datepicker1.val($.datepicker.formatDate($.datepicker.ATOM, startDates[i]));
		}
	}
}

function memGrpChange(grpId, memId) {
  	$.post("/cjs/pg/adj/common/login/memGrpChange.fo", 
  			{"MEMBER_GRP_ID":grpId},
  		  	 function(resp) {
				if (resp.rs != undefined) {
					var strHtml = "";
					var res = resp.rs.data;
					strHtml = strHtml + "<option value=''>전체</option>";
					for(var i=0; i<res.length; i++){
						if($.trim(res[i].MEMBER_ID) == $.trim(memId))
							strHtml = strHtml + "<option value='"+res[i].MEMBER_ID+"' selected='selected'>"+res[i].MEMBER_NM+" ["+$.trim(res[i].MEMBER_ID)+"]"+"</option>";
						else
							strHtml = strHtml + "<option value='"+res[i].MEMBER_ID+"'>"+res[i].MEMBER_NM+" ["+$.trim(res[i].MEMBER_ID)+"]"+"</option>";
					}
					$("#MEMBER_CHG option").remove();
					$("#MEMBER_CHG").append(strHtml);
				}
  	}).done(function(){
  		if($("#PAY_GRP_CHG").length > 0){
  	  		memPayGrp(grpId, memId);
  	  	}
  	});
  	
}

function memPayGrp(grpId, memId){
	$.post("/cjs/pg/adj/common/login/memPayGrp.fo", 
  			{"MEMBER_ID":memId,"MEMBER_GRP_ID":grpId},
  		  	 function(resp) {
				if (resp.rs != undefined) {
					var strHtml = "";
					var res = resp.rs.data;
					strHtml = strHtml + "<option value=''>전체</option>";
					for(var i=0; i<res.length; i++){
							strHtml = strHtml + "<option value='"+res[i].PAY_GRP_ID+"'>"+res[i].PAY_GRP_NM +"</option>";
					}
					$("#PAY_GRP_CHG option").remove();
					$("#PAY_GRP_CHG").append(strHtml);
				}
  	}).done(function(){
  		memPayGrpSel();
  	});
	
}

function cashMemGrpChange(grpId, memId) {
  	$.post("/cjs/pg/cash/biz/business/cashMemGrpChange.fo", 
  			{"MEMBER_GRP_ID":grpId},
  		  	 function(resp) {
				if (resp.rs != undefined) {
					var strHtml = "";
					var res = resp.rs.data;
					
					for(var i=0; i<res.length; i++){
						if($.trim(res[i].MEMBER_ID) == $.trim(memId))
							strHtml = strHtml + "<option value='"+res[i].MEMBER_ID+"' selected='selected'>"+res[i].MEMBER_NM+" ["+$.trim(res[i].MEMBER_ID)+"]"+"</option>";
						else
							strHtml = strHtml + "<option value='"+res[i].MEMBER_ID+"'>"+res[i].MEMBER_NM+" ["+$.trim(res[i].MEMBER_ID)+"]"+"</option>";
					}
					$("#MEMBER_CHG option").remove();
					$("#MEMBER_CHG").append(strHtml);
				}
  	});

}

function numObj(obj){
	if(event.keyCode >= 48 && event.keyCode <= 57){
	}
	else{
		event.returnValue = false
	}
}