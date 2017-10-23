<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="X-UA-Compatible" content="requiresActiveX=true" />
<title>문화관광해설사 관리시스템</title>
<link href="common/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="common/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="common/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="common/js/ui.js"></script>
<jsp:useBean id="now" class="java.util.Date" />

<!-- // jQuery UI CSS파일 --> 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />


<script type="text/javascript">

	$(document).ready(function() {
		
		$.datepicker.regional['ko'] = {
	            closeText: '닫기',
	            prevText: '이전달',
	            nextText: '다음달',
	            currentText: '오늘',
	            monthNames: ['1월','2월','3월','4월','5월','6월',
	            '7월','8월','9월','10월','11월','12월'],
	            monthNamesShort: ['1월','2월','3월','4월','5월','6월',
	            '7월','8월','9월','10월','11월','12월'],
	            dayNames: ['일','월','화','수','목','금','토'],
	            dayNamesShort: ['일','월','화','수','목','금','토'],
	            dayNamesMin: ['일','월','화','수','목','금','토'],
	            buttonImageOnly: false,
	            weekHeader: 'Wk',
	            dateFormat: 'yy-mm-dd',
	            firstDay: 0,
	            isRTL: false,
	            duration:200,
	            showAnim:'show',
	            showMonthAfterYear: true
	          //  minDate: +0
	    };
	      $.datepicker.setDefaults($.datepicker.regional['ko']);
		
		$( '#rgst_dt' ).datepicker({
			changeYear:true, //년 셀렉트 박스 유무
			changeMonth:true,//달력 셀ㄹ렉트 박스 유무
			showButtonPanel:true,//달력 아래 받기 버튼 오늘 가기 버튼 출력
			dateFormat:"yy-mm-dd"
		});
		
		var newDate = new Date();
		var yy = newDate.getFullYear();
		var mm = newDate.getMonth()+1;
		var dd = newDate.getDate();
		var toDay = yy + "-" + mm + "-" + dd;
		
		
	});

	function email_select() {
		var e = document.getElementById("email2");
		var em = e.options[e.selectedIndex].value;
		
		if( em == "" || em == null) {
			document.getElementById("div_email").style.display = "inline";
			$('#email3').val("");
		} else {
			document.getElementById("div_email").style.display = "none";
		}
			
	}

	
	
	function readURL(input) {

		var  str_dotlocation,str_ext,str_low;
		str_value  = $('#stdt_img').val();
		str_low   = str_value.toLowerCase(str_value);
		str_dotlocation = str_low.lastIndexOf(".");
		str_ext   = str_low.substring(str_dotlocation+1);

		if (str_ext != "png" && str_ext != "jpg" && str_ext != "gif" && str_ext != "jpeg") {
		     alert("파일 형식이 맞지 않습니다.\n png,jpg,gif,jpeg 만\n 업로드가 가능합니다!");
		  	 $('#stdt_img').val('');
		     return;
		}
		
		var ua = window.navigator.userAgent
	      var msie = ua.indexOf ( "MSIE " )

	      if ( msie > 0 )      // If Internet Explorer, return version number
	         console.long( "test : " + parseInt (ua.substring (msie+5, ua.indexOf (".", msie ))) );
		
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();

	        reader.onload = function (e) {
	            $('#img_view').attr('src', e.target.result);
	        }

	        reader.readAsDataURL(input.files[0]);
	        
	        document.getElementById("img_view").height = "110";
	        //$('#img_view2').css("visibility","hidden");
	    }
	}
	
	function act_change() {
		var yn =  $(':radio[name="act_yn"]:checked').val();
		if(yn == "Y") {
			document.getElementById("act_prt").style.display = "none";
		}
		else {
			document.getElementById("act_prt").style.display = "inline-block";
		}
	} 
	
	function number_filter(str_value){
		return str_value.replace(/[^0-9]/gi, ""); 
	}
	
</script>

<style type="text/css">

.user-photo {
  /* width: 500px; */
  /* border: 1px solid #333; */
  padding: 10px;
  height:100%;
  width:100%
}
.select-wrapper > img {
  background: url(image/user_cover.png) no-repeat;
  background-size: cover;
  display: block;
  position: absolute;
  width: 90%;
  height: 100%;
}
#stdt_img {
  width: 100%;
  height: 100%;
  opacity: 0;
  filter: alpha(opacity=0); /* IE 5-7 */
  cursor:pointer;
}
</style>

</head>
<body>
<div id="wrapper">
	
<form id="mainform" name="mainform" method="post" enctype="multipart/form-data">
	
	<div id="container" class="colum1"><!-- 왼쪽에 사용자 정보가 있을 경우 클래스 colum2 삽입 -->

		<div class="contents">

			<div class="shadow-box">				

				<h3>기본 정보 <span style="font-size:10px">(*는 필수입력사항입니다.)</span> </h3>

				<table class="talbe-view">
					<colgroup>
						<col style="width:10%" />
						<col style="width:40%" />
						<col style="width:10%" />
						<col style="width:40%" />
					</colgroup>
					<tbody>
						<tr>
							<th rowspan="2">소속<span>*</span></th>
							<td>
								<select class="formSelect" id="srch_sido_cd" name="srch_sido_cd" style="width:150px;" title="소속 시도 선택" >
									<option value="">시도</option>
								</select>
							</td>
							<th rowspan="2">해설사 등록일<span>*</span></th>
							<td rowspan="2">
								<input type="text" id="rgst_dt" name="rgst_dt" placeholder="날짜 선택"  class="calendar" title="해설사 등록일"/>
							</td>
						</tr>
						<tr>
							<td>
								<select class="formSelect" style="width:150px;" title="소속 구군선택">
									<option value="">구군</option>
								</select>
							</td>
						</tr>
					</tbody>
				</table>
				<table class="talbe-view">
					<colgroup>
						<col style="width:10%" />
						<col style="width:30%" />
						<col style="width:10%" />
						<col style="width:30%" />
						<col style="width:20%" />
					</colgroup>
					<tbody>
						<tr>
							<th rowspan="2">성명<span>*</span></th>
							<td rowspan="2">
								<div class="item-block">
									<input type="text" name="name" id="name" value="" title="성명"/>
								</div>
							</td>
							<th rowspan="2">영문</th>
							<td style="border-right:1px solid #dcdcdc">
								<div class="item-block">
									<input type="text" name="eng_name" id="eng_name" value="" placeholder="성" title="영문 성"/>
								</div>
							</td>
							<td rowspan="5" style="border-bottom:0px">
								<div id="div_img" class="user-photo">
									<span class="select-wrapper">
										<img id="img_view" alt="" />
										<input type="file" id="stdt_img" name="stdt_img" onchange="readURL(this)" title="사진선택"/>
									</span>
								</div>		
							</td>
						</tr>
						<tr>
							<td style="border-right:1px solid #dcdcdc">
								<div class="item-block">
									<input type="text" name="eng_name2" id="eng_name2" value="" placeholder="이름" title="영문 이름" />
								</div>
							</td>
						</tr>
						<tr>
							<th>성별<span>*</span></th>
							<td>
								<div class="pos-relative"><input type="radio" name="gender" id="rd1" value="M" /><label for="rd1">남성</label></div>
								<div class="pos-relative"><input type="radio" name="gender" id="rd2" value="F" /><label for="rd2">여성</label></div>
							</td>
							<th>이메일<span>*</span></th>
							<td style="border-right:1px solid #dcdcdc">
								<div class="email-block">
									<input type="text" name="email1" id="email1" value="" title="이메일 아이디" style="width:110px"/>
									<span class="txt-symbol">@</span>
									<!-- <input type="text" name="email2" id="email2" value="" title="이메일 도메인" /> -->
									<select class="formSelect phone-num" style="width:100px" name="email2" id="email2" title="이메일 도메인 선택" onchange="email_select()">
										<option value="">직접입력</option>
										<option value="naver.com">naver.com</option>
										<option value="nate.com">nate.com</option>
										<option value="empal.com">empal.com</option>
										<option value="daum.net">daum.net</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="google.com">google.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="hotmail.com">hotmail.com</option>
									</select>
									<div id="div_email"  style="display:inline;">
										<input type="text" id="email3" name="email3" style="width:110px" title="이메일 도메인 직접 입력"/>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th rowspan="2">생년월일<span>*</span></th>
							<td rowspan="2">
								<input type="text" name="birth_dt_yy" id="birth_dt_yy" value="" title="생일 년도" class="id-num" style="width:50px"/><span style="margin:0px 15px 0 5px">년</span>
								<select class="formSelect" style="width:50px" title="월" name="birth_dt_mm" id="birth_dt_mm">
									<option value="01">1</option><option value="02">2</option><option value="03">3</option><option value="04">4</option>
									<option value="05">5</option><option value="06">6</option><option value="07">7</option><option value="08">8</option>
									<option value="09">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>
								</select><span style="margin:0px 15px 0 5px"> 월 </span>
								<select class="formSelect" style="width:50px" title="일" name="birth_dt_dd" id="birth_dt_dd">
									<option value="01">1</option><option value="02">2</option><option value="03">3</option><option value="04">4</option><option value="05">5</option>
									<option value="06">6</option><option value="07">7</option><option value="08">8</option><option value="09">9</option><option value="10">10</option>
									<option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option>
									<option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option>
									<option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option>
									<option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option>
									<option value="31">31</option>
								</select><span style="margin:0px 15px 0 5px"> 일 </span>
							</td>
							<th>자택전화</th>
							<td style="border-right:1px solid #dcdcdc">
								<div class="phone-block">
									<input type="text" id="ph1" name="ph1" value="" title="전화번호 국번" class="row-input" onkeyup="this.value=number_filter(this.value);" maxlength="4"/>
									<span class="txt-symbol">-</span>
									<input type="text" id="ph2" name="ph2" value="" title="전화번호 앞 3~4 자리" class="row-input" onkeyup="this.value=number_filter(this.value);" maxlength="4"/>
									<span class="txt-symbol">-</span>
									<input type="text" id="ph3" name="ph3" value="" title="전화번호 뒤 4 자리" class="row-input" onkeyup="this.value=number_filter(this.value);" maxlength="4"/>
								</div>
							</td>
						</tr>
						<tr>
							<th>휴대전화<span>*</span></th>
							<td style="border-right:1px solid #dcdcdc">
								<div class="phone-block">
									<select class="formSelect phone-num" style="width:60px" title="휴대전화 앞 자리" id="hp1" name="hp1">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="019">019</option>
									</select>
									<span class="txt-symbol">-</span>
									<input type="text" id="hp2" name="hp2" value="" title="휴대전화 중간 4 자리" class="row-input" onkeyup="this.value=number_filter(this.value);" maxlength="4"/>
									<span class="txt-symbol">-</span>
									<input type="text" id="hp3" name="hp3" value="" title="휴대전화 뒤 4 자리" class="row-input" onkeyup="this.value=number_filter(this.value);" maxlength="4"/>
								</div>
							</td>
							<!-- <td>
								<span class="btn-table">
									<input type="file" id="stdt_img" name="stdt_img" onchange="readURL(this)" title="사진선택"/>
								</span>
							</td> -->
						</tr>
					</tbody>
				</table>
				
				
				<div class="btn-block text-center mt20">
					<a href="javascript:;" class="btn-blue"><span>내역 등록</span></a>
					<a href="javascript:;" class="btn-orange"><span>리스트</span></a>
				</div>

			</div><!-- // shadow-box -->

		</div><!--// contents -->
	</div><!--// container -->
</form>
</div>


</body>
</html>

