<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
		$(document).ready(function() {
			// 버튼 클릭 시 행 추가
			$("#addRowButton").click(function() {
				var newRow = '<tr>' +
					'<td><input type="checkbox"></td>' +
					'<td><input type="text" name="emp_pic"></td>' +
					'<td><input type="text" name="emp_id" disabled="disabled" value="자동으로 부여"></td>' +
					'<td><input type="text" name="emp_name"></td>' +
					
					'<td>' +
						'<select name="emp_gender">' +
						'<option value="남">남</option>' +
						'<option value="여">여</option>' +
						'</select>' +
					'</td>' +
					
					'<td><input type="date" name="emp_birth"></td>' +
					
					'<td>' +
					'<select name="emp_dept">' +
					'<option value="인사">인사</option>' +
					'<option value="영업">영업</option>' +
					'<option value="생산">생산</option>' +
					'<option value="자재">자재</option>' +
					'<option value="품질">품질</option>' +
					'</select>' +
					'</td>' +
					
					'<td>' +
					'<select name="emp_rank">' +
					'<option value="팀장">팀장</option>' +
					'<option value="대리">대리</option>' +
					'<option value="사원">사원</option>' +
					'</select>' +
					'</td>' +
					
					'<td><input type="text" name="emp_auth" disabled="disabled" value="자동으로 부여"></td>' +
					'<td><input type="text" name="emp_state" value="재직" readonly="readonly"></td>' +
					'<td><input type="text" name="emp_tel"></td>' +
					'<td><input type="date" name="emp_hire_date"></td>' +
					'<td><input type="date" name="emp_rsgnt_date" disabled="disabled"></td>' +
					'<td><input type="date" name="emp_statr_leave_date" disabled="disabled"></td>' +
					'</tr>';
				
				// 첫번째 자식<tr> 뒤에서 부터 행을 추가함
				$(".table-employeeList tr:nth-child(1)").after(newRow);
				
			}); // 여기까지 추가 버튼
			
			
    		
			// <th> 쪽 체크박스 클릭 시 해당 열의 <td> 부분의 행들을 선택하고 배경색 지정
			$(".table-employeeList th input[type='checkbox']").click(function() {
				var checkbox = $(this);
				var isChecked = checkbox.prop('checked');
				var columnIndex = checkbox.parent().index() + 1; // 체크박스의 열 인덱스
				var table = checkbox.closest('table');
				var rows = table.find('tr');
				
				// <td> 부분의 행들을 선택하고 배경색 지정
				rows.each(function() {
					var checkboxTd = $(this).find('td:nth-child(' + columnIndex + ') input[type="checkbox"]');
					if (checkboxTd.length > 0) {
						checkboxTd.prop('checked', isChecked);
						if (isChecked) {
							$(this).addClass('selected');
						} else {
							$(this).removeClass('selected');
						}
					}
				});
			});

            // <td> 쪽 체크박스 클릭 시 행 선택
			$(".table-employeeList td input[type='checkbox']").click(function() {
				var checkbox = $(this);
				var isChecked = checkbox.prop('checked');
				checkbox.closest('tr').toggleClass('selected', isChecked);
			});
			
			
			
			
		}); // AJAX
		
		
		
    </script>
    <style>
        .selected {
            background-color: #b3ccff;
        }
    </style>

</head>
<body>

	<h1>사원조회</h1>
	
	<!-- 검색칸 -->
	<form action="" method="GET">
	사원번호 <input type="text" name="emp_id">
	이름 <input type="text" name="emp_name">
	부서
		<select name="emp_dept">
			<option>전체</option>
			<option>인사</option>
			<option>영업</option>
			<option>생산</option>
			<option>자재</option>
			<option>품질</option>
		</select>
	직급
		<select name="emp_rank">
			<option>전체</option>
			<option>팀장</option>
			<option>대리</option>
			<option>사원</option>
		</select>
	상태
		<select name="emp_state">
			<option>전체</option>
			<option>재직</option>
			<option>휴직</option>
			<option>퇴직</option>
		</select>
		
		<input type="submit" value="조회">
	</form>
	<!-- 검색칸 -->
	
	
	<form>
	
	<input type="button" id="addRowButton" value="추가">
	<input type="button" id="" value="취소">
	<input type="button" id="" value="수정">
	<input type="submit" id="deleteEmployeeButton" value="삭제" formaction="deleteEmployee" formmethod="post">
	
	<input type="submit" value="저장" formaction="regEmployee" formmethod="post">

	<table class="table-employeeList" border="1">
		<tr>
			<th><input type="checkbox"></th>
			<th>사진</th>
			<th>사원번호</th>
			<th>이름</th>
			<th>성별</th>
			<th>생년월일</th>
			<th>부서</th>
			<th>직급</th>
			<th>권한</th>
			<th>상태</th>
			<th>전화번호</th>
			<th>입사날짜</th>
			<th>퇴사날짜</th>
			<th>휴직날짜</th>
		</tr>
		
		
		
		<c:forEach var="employeeList" items="${employeeList }">
		<tr>
			<td><input type="checkbox" name="selectedEmpId" value="${employeeList.emp_id}"></td>
			<td>사진</td>
			<td>${employeeList.emp_id }</td>
			<td>${employeeList.emp_name }</td>
			<td>${employeeList.emp_gender }</td>
			
			<td>${fn:substring(employeeList.emp_birth, 0, 10)}</td>
			
			<td>${employeeList.emp_dept }</td>
			<td>${employeeList.emp_rank }</td>
			<td>${employeeList.emp_auth }</td>
			<td>${employeeList.emp_state }</td>
			<td>${employeeList.emp_tel }</td>
			
			<td>${fn:substring(employeeList.emp_hire_date, 0, 10) }</td>
			<td>${fn:substring(employeeList.emp_rsgnt_date, 0, 10) }</td>
			<td>${fn:substring(employeeList.emp_start_leave_date, 0, 10) }</td>
		</tr>
		</c:forEach>
	</table>
	
	</form>


</body>
</html>