<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../../inc/header.jsp"%>
<%@ include file="../../inc/sidebar.jsp"%>
<%@ include file="../../inc/nav.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>
    <script>
    var pageStatus = "";
	    $(document).ready(function() {
	    	
	    	updateSelectedCheckboxCount();
	    	
	        // 수정 버튼 누를 시 (updateButton)
	        $("#updateButton").click(function(){
	            var selectedCheckbox = $("input[name='selectedQcId']:checked");

	            // 체크된 체크박스가 하나인 경우에만 수정 기능 작동
	            if(selectedCheckbox.length === 1) {
	                var empId = selectedCheckbox.val();
	                var row = selectedCheckbox.closest("tr");
	                
	                // input type의 name 값 지정
                	var cellNames = [
                		"rec_num",
                		"qc_num",
                		"ma_num",
                		"ma_name",
                		"update_emp_id",
                		"update_date",
                		"qc_cnt",
                		"rec_cnt",
                		"df_cnt",
                		"qc_yn"
                	];

	                // 각 셀을 수정 가능한 텍스트 입력 필드로 변경
	                row.find("td:not(:first-child)").each(function(index){
	                	
	                	var cellValue = $(this).text();
	                	var cellType = index === 5? "date" : "text";
	                	var cellReadonly = [0,1,2,3,7].includes(index) ? "readonly='readonly'" : "";
	                	var cellName = cellNames[index];
	                	var cellContent;

	                    if (index === 9 ) { // 검수상태 (qc_yn) 열인 경우에만 드롭다운으로 변경
	                        cellContent = '<td>' +
	                            '<select name="' + cellName + '">' +
	                            '<option value="대기" ' + (cellValue === '대기' ? 'selected' : '') + '>대기</option>' +
	                            '<option value="진행중" ' + (cellValue === '진행중' ? 'selected' : '') + '>진행중</option>' +
	                            '<option value="완료" ' + (cellValue === '완료' ? 'selected' : '') + '>완료</option>' +
	                            '</select>' +
	                            '</td>';
	                    }else if (index === 4){
	                    	cellContent = '<td><input type="'+ cellType +  '" name="' + cellName + '" value="' + ${sessionScope.emp_id} + '"' + cellReadonly + '></td>';
	                    }else {
	                    	cellContent = '<td><input type="'+  cellType + '" name="' + cellName + '" value="' + cellValue + '"' + cellReadonly + '></td>';
	                    }

	                    $(this).html(cellContent);

	                    // 버튼 활성화
	                    $("#updateButton").attr("disabled", "disabled");
	                    
						$("#cancleButton").removeAttr("disabled");
	                    $("#submitButton").removeAttr("disabled");
	                    
	                    pageStatus = "update";
	                });
	                
	            }else if (selectedCheckbox.length === 0){
	                alert("수정할 행을 선택해주세요!");
	            }else {
	                alert("수정은 하나의 행만 가능합니다!");
	            }
	        });
	        
            // 취소 버튼 누를 시 
			$("#cancleButton").click(function(){
	        
	    	// 수정버튼 취소
			if(pageStatus == "update"){
				
				$(".table-materialQualityList tr").each(function() {
					var row = $(this);
				
				// 폼 초기화(기존내용으로)
				// 가져가서 쓰는 경우 폼에 이름 지정해줘야해요

				
					// 각 셀의 값을 원래 상태로 되돌림
				row.find("td:not(:first-child)").each(function(index) {
					var cellValue = $(this).find("input").val();
					var cellValueSelect = $(this).find("select").val();
					$(this).html(cellValue);
					$(this).html(cellValueSelect);
				});
				
				
				// selected 클래스를 없앰 (css 없애기)
				$(".table-materialQualityList tr").removeClass("selected");
				
				
				// 추가버튼, 수정버튼 활성화, 취소버튼 비활성화
				$("#updateButton").removeAttr("disabled");
				
				$("#cancleButton").attr("disabled", "disabled");
				$("#submitButton").attr("disabled", "disabled");
				
				
				pageStatus = "";
				
				});
				
				} // if(update)문
				
			updateSelectedCheckboxCount();
		
		}); // 취소버튼
		
    	// <th> 쪽 체크박스 클릭 시 해당 열의 <td> 부분의 행들을 선택하고 배경색 지정
        $(".table-materialQualityList th input[type='checkbox']").click(function() {
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
        $(".table-materialQualityList td input[type='checkbox']").click(function() {
            var checkbox = $(this);
            var isChecked = checkbox.prop('checked');
            checkbox.closest('tr').toggleClass('selected', isChecked);
        });
        



		// 체크박스 선택 시 체크박스의 개수 구하기
        updateSelectedCheckboxCount();

        // <th> 쪽 체크박스 클릭 시 해당 열의 <td> 부분의 행들을 선택하고 배경색 지정
        $(".table-materialQualityList th input[type='checkbox']").click(function() {
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
                    $(this).toggleClass('selected', isChecked);
                }
            });

            updateSelectedCheckboxCount();
        });

        // <td> 쪽 체크박스 클릭 시 행 선택
        $(".table-materialQualityList td input[type='checkbox']").click(function() {
            var checkbox = $(this);
            var isChecked = checkbox.prop('checked');
            checkbox.closest('tr').toggleClass('selected', isChecked);

            updateSelectedCheckboxCount(); 
        });

        function updateSelectedCheckboxCount() {
            var totalCheckboxes = $(".table-materialQualityList td input[type='checkbox']").length;
            var selectedCheckboxes = $(".table-materialQualityList td input[type='checkbox']:checked").length;
            $("#selectedCheckboxCount").text("전체 ("+selectedCheckboxes + '/' + totalCheckboxes+")");
        }  // 체크박스 선택 시 체크박스 개수 구하기
        
        
	     }); 
    </script>
    
    <style>
		.selected { 
             background-color: #b3ccff; 
         } 
	</style>
</head>
<body>
		<h2>품질현황(자재) 조회</h2>
		<form method="get">
		
			품질검사코드 <input type="text" name="qc_num">
			품질검사여부
				<select name="qc_yn">
					<option>전체</option>
					<option>대기</option>
					<option>진행중</option>
					<option>완료</option>
				</select>
			<div>
				<label>검수일자</label>
				<input type="date" name="startDate">
					~
				<input type="date" name="endDate">
			</div>
			<input type="submit" value="조회">
		</form>
		
		<h2>품질현황(자재) 목록</h2>
		
			<form id="materialQualityList">
			<span id="selectedCheckboxCount">0</span>

			<input type="button" id="cancleButton" value="취소" disabled="disabled">
			<input type="button" id="updateButton" value="수정">
			<input type="submit" id="submitButton" value="저장" formaction="updateMaterialQuality" formmethod="post" disabled="disabled">
			
			<table class="table-materialQualityList" border="1">
				<tr>
					<th><input type="checkbox"></th>
					<th>입고코드</th>
					<th>품질검사코드</th>
					<th>자재코드</th>
					<th>자재명</th>
					<th>검수자</th>
					<th>검수일자</th>
					<th>검수량</th>
					<th>입고량</th>
					<th>불량수량</th>
					<th>검수상태</th>
				</tr>
				<c:forEach var="mq" items="${materialQualityList}" varStatus="status">
					<tr>
						<td><input type="checkbox" name="selectedQcId" value="${mq.qc_id}"></td>
						<td>${mq.rec_num}</td>
						<td>${mq.qc_num}</td>
						<td>${mq.ma_num}</td>
						<td>${mq.ma_name}</td>
						<td>${mq.emp_name}</td>
						<td>
							<c:if test="${!empty vo.update_date}">${fn:substring(vo.update_date, 0, 10)}</c:if>
							<c:if test="${empty vo.update_date}">${fn:substring(vo.qc_date, 0, 10)}</c:if>
						</td>
						<td>${mq.qc_cnt}</td>
						<td>${mq.rec_cnt}</td>
						<td>${mq.df_cnt}</td>
						<td>${mq.qc_yn}</td>
					</tr>
				</c:forEach>
			</table>
		</form>
		
			<!-- 페이지 이동 버튼 -->
	
			<nav aria-label="Page navigation example">
		  		<ul class="pagination justify-content-center pagination-sm">
		  		
		  			<c:if test="${pm.prev }">
					<li class="page-item">
						<a class="page-link" href="/production/quality/materialQualitylist?page=${pm.startPage-1 }&qc_num=${qc_num}&startDate=${startDate}&endDate=${endDate}&qc_yn=${qc_yn}" aria-label="Previous">
		       			<span aria-hidden="true">&laquo;</span>
		      			</a>
		    		</li>
		    		</c:if>
		    		
		    		<c:forEach begin="${pm.startPage }" end="${pm.endPage }" step="1" var="idx">
		    		<li 
		    			<c:out value="${pm.pageVO.page == idx ? 'class=page-item active': 'class=page-item'}" />
		    		>
		    				<a class="page-link" href="/production/quality/materialQualitylist?page=${idx}&qc_num=${qc_num}&startDate=${startDate}&endDate=${endDate}&qc_yn=${qc_yn}">${idx }</a>
		    		</li>
		    		</c:forEach>
					
					<c:if test="${pm.next && pm.endPage > 0}">
					<li class="page-item">
		      			<a class="page-link" href="/production/quality/materialQualitylist?page=${pm.endPage+1 }&qc_num=${qc_num}&startDate=${startDate}&endDate=${endDate}&qc_yn=${qc_yn}" aria-label="Next">
		        		<span aria-hidden="true">&raquo;</span>
		      			</a>
		    		</li>
		    		</c:if>
		    		
		  		</ul>
			</nav>
			
			<!-- 페이지 이동 버튼 -->
		
</body>
</html>
<%@ include file="../../inc/footer.jsp"%>