<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link rel="stylesheet" as="style" crossorigin 
    href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css" />
    
    <style type="text/css">
        * {
            font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo", "Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", sans-serif;
        }
    </style>
<link rel="icon" href="/resources/img/faviconn.svg" type="image/x-icon">
<link href="/resources/img/favicon.ico" rel="icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
<link href="/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="/resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/style.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var url = window.location.href;
		var useYn = new URLSearchParams(new URL(url).search).get("use_yn");
		
		if(useYn === "Y") {
			$("h4").html("가동 중지 하시겠습니까?");
			$("p").html("현재 라인은 가동 중입니다.<br>중지 사유를 입력하세요.");
			$("input[name='ls_yn']").val("중지");
		} else if(useYn === "N") {
			$("h4").html("다시 가동 하시겠습니까?");
			$("p").html("현재 라인은 점검 중입니다.<br>가동 사유를 입력하세요.");
			$("input[name='ls_yn']").val("가동");
		}
		
		$(".submitButton").click(function() {
			// 서버에 저장할 데이터 전송을 위한 ajax
			var formValue = $("form[name='modifyForm']").serialize();
			var rsns = $("input[name='ls_rsns']").val();
		
// 			alert(rsns);
		
			if(rsns == "" || rsns == null) {
				alert('사유를 입력하세요!');
				$("input[name='ls_rsns']").focus();
				return;
			}
			
			$.ajax({
				url : "${contextPath}/production/line/modifyPopup",
				type : "POST",
				data : formValue,
				success : function() {
					
					Swal.fire({
						
						title: '변경 완료되었습니다!',
						icon: 'success',
						confirmButtonColor: '#3085d6'
						
					}).then((result) => {
						if(result.isConfirmed) {
							opener.location.reload();
							self.close();
						}
					});
					
				
// 					alert("변경 완료되었습니다.");
// 					opener.location.reload();
// 					self.close();
				},
				error : function() {
					alert("변경 실패했습니다!");
				}
			});
		});
	});
</script>

<body>


<div class="bg-light text-center rounded p-4 m-3">
	<form name="modifyForm">
		<h4></h4>
		<p></p>
		<input type="text" name="ls_rsns" class="form-control">
		<input type="hidden" name="ls_yn" value="">
		<input type="hidden" name="line_id" value="${param.line_id}">
		<input type="hidden" name="use_yn" value="${param.use_yn}">
		<input type="hidden" name="emp_id" value="${sessionScope.emp_id}">
		<button type="button" class="submitButton btn btn-outline-success m-2">확인</button>
		<button type="button" class="btn btn-outline-danger m-2" onclick="window.close();">취소</button>
	</form>
</div>

</body>
</html>