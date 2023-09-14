# ModernHome
- 조립식 가구를 패키징하고 납품하는 MES 서비스
- http://c7d2301t4.itwillbs.com/employee/login

<br><br>

## 제작 기간 & 참여 인원
- 2023.05.31 ~ 2023.07.13 (44일)
- 7인 팀 프로젝트

<br><br>

## 사용 기술
```Back-end```
- Java 11
- Spring Framework 4.3
- MySQL 8.0
- MyBatis
 
```Front-end```
- JavaScript
- jQuery

<br><br>

## ERD
![ERD](https://github.com/leesr94/ModernHome/assets/131628924/0c6c7b22-46f9-48a8-aafb-d45c815f4d4d)

<br><br>

## 전체 흐름
![흐름도](https://github.com/leesr94/ModernHome/assets/131628924/ab7a8c82-c67a-42b3-84ec-a366b7aaa0b5)
1. Controller : 공통 URI를 설계 후, 기능별로 URI을 추가로 설계. 또한 각 URI 별로 호출 방식(GET/POST)에 따라 사용하는 메서드를 달리함.
2. Service : DAO와 Controller를 연결
3. DAO : DB와 연결함. 객체와 SQL문을 매핑하여 데이터를 객체화

<br><br>

## 담당 업무
1. 작업지시
    - 특정 수주에 대한 작업지시 작성 및 수정
    - 작업에 대한 유효성 검사를 통해 올바른 데이터만 입력 가능하도록 제한
    - 지시코드 자동 넘버링
2. 생산실적
    - 작업지시상태에 따라 생산실적 등록 제한
    - 실적코드 자동 넘버링
3. 불량
    - 품질검사 시, 등록된 지시에 대해 유효성을 따져 값 입력 제한
    - 수리 가능 여부를 따져 수리/폐기 처리를 통해 자재 재고 반영
    - 불량코드 자동 넘버링

<br><br>

## 트러블슈팅
<details>
  <summary>팝업창에서 POST 방식 데이터 전송</summary>
  <div>
    • Ajax를 이용하여 form 데이터를 전송하여 처리
    
  		$.ajax({
  			url : "${contextPath}/production/instruct/add",
  			type : "POST",
  			data : formValue,
  			success : function() {
   				alert("작업지시서 작성이 완료되었습니다.");
   				opener.location.reload();
   				self.close();
  			},
  			error : function() {
  				alert("작업지시서 작성이 실패했습니다!");
  			}
  		});
    
  </div>
</details>

<details>
  <summary>특정 값 변경 시 연관된 다른 데이터 값 변경</summary>
  <div markdown="1">
    • mapper.xml에서 insert/update 구문에 selectKey를 사용하여 반영

    <update id="modifyInstrMrState" parameterType="WijoinVO">
      <selectKey keyProperty="work_state" resultType="WijoinVO" order="BEFORE">
        SELECT IF((SELECT count(work_id) FROM material_release WHERE work_id = #{work_id}) = (SELECT count(mr_state) FROM material_release WHERE work_id = #{work_id} AND mr_state = '출고완료'), '진행중', '대기') AS work_state
      </selectKey>
      UPDATE work_instr SET work_state = #{work_state} WHERE work_id = #{work_id}
	</update>
  </div>
</details>
