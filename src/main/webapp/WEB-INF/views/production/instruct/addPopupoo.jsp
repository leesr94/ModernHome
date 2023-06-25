<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<link href="/resources/img/favicon.ico" rel="icon">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
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
		$("tr").click(function() {
			var oo_id = $(this).find("td:eq(0)").text();
			var oo_num = $(this).find("td:eq(1)").text();
			
			console.log(oo_id);
			console.log(oo_num);
			
			var urlVal = "?oo_id=" + oo_id + "&oo_num=" + oo_num;
			opener.location.href += urlVal;
			window.close();
		});
	});
</script>

<body>
	
<%-- 	${onumList} <hr> --%>
	
	<table border="1">
		<tr>
			<th colspan="2">수주번호</th>
		</tr>
		<c:forEach var="onum" items="${onumList}">
			<tr>
				<td>${onum.oo_id}</td>
				<td>${onum.oo_num}</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>