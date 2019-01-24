<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 테스트용 계정 설정부분. 계정을 사용할 필요가 있을 때 아래 설정된 계정을 사용하세요. --%>
<%--
<% session.setAttribute("user_id", "user1");%>
 --%>
 
<% session.setAttribute("user_id","user1"); %> 
<% session.setAttribute("user_grade","gold"); %>
<%--
관리자 계정은 admin으로 고정하겠습니다.
--%>

<%-- ========================세션 계정 설정안내
테스트 계정은 두개입니다. 세션 파라미터 이름으로 "id" 세션  값으로 user1과 admin 이 있습니다.
관리자 계정을 필요로 할 경우 admin 주석을 풀고 user1 계정을 주석처리한 후 사용하시고
일반 계정이 default로 설정되어있습니다.
--%>

<%-- =======================여기 부분을 수정하여 각자 필요한 경로로 이동하세요 --%>
<%--<jsp:forward page="./minho_in.kk" /> --%>
<jsp:forward page="./main.hh" />
<%--
=============index.jsp 파일의 경로를 수정하여 작업하는 페이지로 이동하여 테스트 할 수 있습니다.

=============jsp 파일 작업 안내사항
src > main > webapp > jsp > 자신의 폴더
에 생성해주세요. 자신의 폴더 이하에서는 어떠한 폴더를 만들어도 괜찮습니다.

web.xml, root-context.xml, servlet-context.xml 파일은 수정할 필요가 없습니다.
문제가 발생할 경우 저를 불러주세요.

============================Oracle 계정
Oracle 계정은 새로 생성하여 통일하고 사용하도록 하겠습니다.
계정명 auction
비밀번호 1234

오라클 계정을 생성하는 방법입니다.
1. cmd 창을 켠다.
2. sqlplus system/1234
	입력하여 관리자로 접속한다.
3. 아래 쿼리를 순서대로 입력한다.

	1)
create user auction identified by 1234;
	2)
grant connect, resource, dba to auction;

===================sql 파일을 사용하기 전에 Data Source Explorer 설정을 해야합니다.
위에서 하는 계정생성 과정을 마친 후 진행하시기 바랍니다.

=====================STS에서 sql을 사용하기 위한 설정 방법은 다음과 같습니다.
1. Data Source Explorer 탭에서 Database Connections 를 마우스 오른쪽으로 클릭하여 New.. 를 선택합니다.
2. Oracle 을 선택하고 next를 눌립니다.
3. Drivers 탭 오른쪽에 있는 작은 나침반 모양을 클릭합니다.
4. 새로 뜬 창에서 Oracle thin driver 11 을 클릭하고 
5. JAR List 탭을 클릭하여 Clear All을 클릭합니다.
6. Add JAR/Zip을 클릭합니다.
7. 새로 팝업된 창에서 
	(아래 경로는 oracle db가 설치된 경로에 따라 조금씩 다를 수 있습니다. 찾기 어려우면 저를 부르세요.)
	C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib
	으로 이동하여 ojdbc6.jar 를 클릭하고 확인을 누릅니다.
8. properties 탭을 클릭하여 이동합니다.
9. Database Name 옆에 db라고 적힌 부분을 클릭하고 xe로 수정합니다.
10. Password 를 1234 로 입력합니다.
11. User Id를 auction 으로 입력합니다.
12. 이후 OK를 눌려 작은 팝업창인 Details 창으로 돌아옵니다.
13. Database Instance에서 Service Name 을 xe로 수정합니다.
	Host를 server 에서 localhost로 수정합니다.
14. 이후 Test Connection 버튼을 클릭하여 test ping success가 뜨는지 확인합니다.
15. 이후 finish를 눌려 sql파일 실행 설정을 마칩니다.

--%>

