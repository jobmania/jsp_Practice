# jsp_Practice!
JSP, sevlet 기반 게시판 서비스 제작.


사용 도구, 라이브러리 : MYSQL, Tomcat Server(9버젼), 부트스트랩
OPEN API : 네이버 클라우드 Static Map, Geocoding 


## 순수 JSP, Servlet만을 사용해서 게시판 기능

### MVC2패턴을 적용
- Servlet은 요청과 응답만 처리, Error 발생 시 error catch
- model 단은 db와 연결 및 서비스 로직 처리 (조회, 생성, 수정, 삭제)
- view 단은 화면 뷰에 담당하는 로직만 수행 (ex, 페이지네이션, 동적화면구성)
- 🎇WEB-INF 내에 VIEW 파일을 구성하여 VIEW에 대한 직접적인 접근 X. -> 왜 WHY? 예외접근시 동적화면 구성시 필요한 정보 또는 로직수행시 필요정보 누락 가능성. 
- 사용자의 예외적인 접근 에 대해선 Exception 처리를 통해 Error페이지 조회


### 상세 정보
[JSP Sevlet 구조  게시판 리뷰 사이트.pdf](https://github.com/jobmania/jsp_Practice/files/11167419/JSP.Sevlet.pdf)



### ERD 변경이유
동일한 작업이 저장되는 열이 중복된다고 판단 각 게시판의 리뷰TABLE을 합치고, 외래 키를 통해 구분. 

#### ERD_1차

![jsp_erd](https://user-images.githubusercontent.com/108961843/227095351-310d8e54-4c70-4ae7-83bc-7ca2c1666471.png)

#### ERD_2차
![FinalErd](https://user-images.githubusercontent.com/108961843/229397631-600d6146-fa7e-40bd-b09a-04613c213b20.png)



톰캣 라이브러리 추가
+ jstl
+ mysql


## 다이어그램 제작 사이트
https://www.draw.io/
## 무료 아이콘 사이트
https://www.flaticon.com/kr/
