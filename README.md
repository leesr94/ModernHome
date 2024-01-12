# ModernHome
![modernhome](https://github.com/leesr94/ModernHome/assets/131628924/31e2a81d-4bd8-4925-9bf0-3b5f240366ea)
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
![ERD](https://github.com/leesr94/ModernHome/assets/131628924/7a50d67d-00b0-4315-b56d-fa129ff96b24)

<br><br>

## 흐름도
1. 데이터 흐름도
  - Controller : 공통 URI를 설계 후, 기능별로 URI을 추가로 설계. 또한 각 URI 별로 호출 방식(GET/POST)에 따라 사용하는 메서드를 달리함.
  - Service : DAO와 Controller를 연결
  - DAO : DB와 연결함. 객체와 SQL문을 매핑하여 데이터를 객체화
<br>

2. 부서별 플로우차트  
![플로우차트](https://github.com/leesr94/ModernHome/assets/131628924/4aca8e82-beb4-4d8a-8e1c-78605b8d9405)

<br><br>

## 담당 업무
1. DB 설계
    - 프로젝트의 전반적인 DB 설계
    - 테이블 간의 관계 재설정 및 유지보수
2. 플로우 설정
    - 각 데이터의 흐름에 따라 페어별(부서별) 순서 설정
3. 프로젝트 스케줄링
    - 회의록, 페어별 개발 진행도 등의 지속적인 기록
    - 팀장과 함께 진행도에 따른 스케줄 설정과 페어 조정
<br>

![기능](https://github.com/leesr94/ModernHome/assets/131628924/58f98d07-6928-4420-b779-b12d1596a9c6)

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
