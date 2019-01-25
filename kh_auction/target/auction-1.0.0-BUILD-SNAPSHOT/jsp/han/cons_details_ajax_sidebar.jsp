<h3>물품 감정 필요 여부</h3><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

     <div class="sidebar blog-sidebar">
         <div class="sidebar-item  recent">
          <c:if test="${cons.cons_result1 =='accept' and not empty cons.cons_go_date}">
              <c:if test="${user_id==cons_id}">
               <h3>감정 날짜 선택</h3>
               <table style="width:100%;"><tr>
                <td style="width:33%;"><button style="width:100%;" class="btn btn-info">이전</button></td>
                <td style="width:34%;"><button style="width:100%;" class="btn btn-info">현재</button></td>
                <td><button style="width:100%;" class="btn btn-info">다음</button></td>
               </tr></table><br>
                <table style="width:100%;">
                	<tr><td colspan="7" style="text-align:center;font-size:20px;">2019년 1월</td></tr>
                	<tr>
                		<td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td>
                	</tr>
                	<tr>
                		<td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td>
                	</tr>
                	<tr>
                		<td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td>
                	</tr>
                	<tr>
                		<td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td>
                	</tr>
                	<tr>
                		<td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td>
                	</tr>
                	<tr>
                		<td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td><td style="font-size:30px;">1</td>
                	</tr>
                </table><br>
               <div style="text-align:center;">
                                           <input type="text" style="width:20%" readOnly>년 <input type="text" style="width:20%" readOnly>월 <input type="text" style="width:20%" readOnly>일<hr>
               <input type="radio" value="dispatch" name="appraise" value="dispatch" id="dispatch"><label for="dispatch">파견</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <input type="radio" value="visit" name="appraise" value="visit" id="visit"><label for="visit">방문</label>
               <br>
               <input type="number" min="10" max="17" style="width:20%;">시 ~ <input type="number" max="18" style="width:20%;">시 사이
               </div><hr>
               <input type="text" placeholder="요청 사항을 입력해주세요." style="width:100%;height:100px;overflow:auto;">
               <br>
               <button style="width:100%;" class="btn btn-lg btn-success">감정 신청</button>
              </c:if>
              <c:if test="${user_id != cons_id}">
              	<h3>위탁 절차를 진행중입니다.</h3>
              </c:if>
          </c:if>
          <c:if test="${cons.cons_result1 =='yet'}">
          	<c:if test="${user_grade !='master' and user_grade != 'admin' }">
           	<h3>작성 내용을 검토중입니다.</h3>
           	<p>등록하신 내용을 바탕으로 경매 물품에 대해 검토하는 중입니다. 이 과정은 며칠이 걸릴 수 있습니다.</p>
          	</c:if>
          	<c:if test="${user_grade =='master' or user_grade == 'admin' }">
           	<h3>물품 감정 필요 여부</h3>
           	<button style="width:49%;" class="btn btn-lg btn-success">승인</button>
              	<button style="width:49%;" class="btn btn-lg btn-danger">취소</button>
          	</c:if>
          </c:if>
          <c:if test="${cons.cons_result1 =='deny'}">
          	<h3>감정을 진행할 수 없습니다.</h3>
          </c:if>
         </div>
         <div class="sidebar-item categories">
             <h3>감정결과</h3>
             <c:if test="${cons.cons_ant_price ne 0}">
              <table style="width:100%;">
               <tr><td style="height:50px;">감정가 : <input type="number" id="values_" value="${cons.cons_ant_price}" style="font-size:30px;border:0;" readOnly></td></tr>
               <tr><td style="height:30px;text-align:center;font-size:20px;">한글 숫자값</td></tr>
               <tr><td colspan="2" style="text-align:center;">감정가 설명</td></tr>
               <tr><td colspan="2"><p>${cons.cons_ans}</p></td></tr>
              </table>
              <c:if test="${user_grade == 'master' or user_grade =='admin'}">
              	<button style="width:100%" class="btn btn-lg btn-warning">감정가 수정</button>
              </c:if>
             </c:if>
             <c:if test="${cons.cons_ant_price==0}">
             	<c:if test="${user_grade != 'master' and user_grade !='admin'}">
               <table style="width:100%;">
                <tr><td style="height:50px;">감정가 : 
                	<input type="number" id="values_" value="<c:if test="${cons.cons_result1 != 'yet' }"> 0 </c:if>"
                		style="font-size:30px; border:0; readOnly">
                </td></tr>
                <tr><td style="height:30px;text-align:center;font-size:20px;">
					미정
				</td></tr>
                     <tr><td colspan="2" style="text-align:center;">감정가 설명</td></tr>
                <tr><td colspan="2">
                	<c:out value="${cons.cons_result1 == 'yet'?'아직 감정을 진행중입니다.': cons.cons_ans }"/>
                </td></tr>
               </table>
              </c:if>
              <c:if test="${user_grade == 'master' or user_grade =='admin'}">
               <table style="width:100%;">
                <tr><td style="height:50px;">감정가 : <input type="number" id="values_" value="" style="font-size:30px; border:0;width:100%"></td></tr>
                <tr><td style="height:30px;text-align:center;font-size:20px;">한글 숫자값(널마스터)</td></tr>
                <tr><td colspan="2" style="text-align:center;">감정가 설명</td></tr>
                <tr><td colspan="2"><textarea rows="10" style="width:100%;"></textarea></td></tr>
               </table>
               <button style="width:100%" class="btn btn-lg btn-success">감정가 입력</button>
              </c:if>
             </c:if>
         </div>
         <div class="sidebar-item tag-cloud">
             <h3>안내사항</h3>
             <p>
             <span>위탁에 대한 안내사항 </span><br>
              - 위탁을 취소할 경우 출장 감정비를 지불할 수 있습니다.
              - 위탁을 승인할 경우 정기 경매로 진행이 되며 낙찰 금액의 10%를 수수로 공제한 후 낙찰금을 받으실 수 있습니다.
              - 샬라샬라~~~~~~~~~~~~~~~~~~~~~~~~~
             </p>
         </div>
         <c:if test="${cons.cons_result2 =='accept' and cons.cons_commit == 'no' and user_id == cons_id}">
          <div class="sidebar-item popular">
              <h3>nth 정기 경매에 등록합니다.</h3>
              <p>시작가:1000000000(디폴트 = 추정가의 70% 시작)</p>
              <p>한글 숫자 표시</p>
              <p>단위:1000000000(디폴트 = 시작가의 1%, 천원 이하 버림, 큰자리만 남김.)</p>
              <p>한글 숫자 표시</p>
              <button style="width:50%;" class="btn btn-lg btn-success">위탁 경매 승인</button>
              <button style="width:50%;" class="btn btn-lg btn-danger">위탁 경매 취소</button>
          </div>
         </c:if>
         <c:if test="${cons.cons_result2 =='accept' and cons.cons_commit == 'yes'}">
          <div class="sidebar-item popular">
              <h3>nth 정기 경매에 등록하였습니다.</h3>
              <p>시작가:1000000000</p>
              <p>한글 숫자 표시</p>
              <p>단위:1000000000</p>
              <p>한글 숫자 표시</p>
              <button style="width:100%;" class="btn btn-lg btn-success" disabled>등록 완료</button>
          </div>
         </c:if>
     </div>