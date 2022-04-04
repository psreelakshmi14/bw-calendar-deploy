<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

<%--  Generate events --%>
<c:set var="detailView" value="true" scope="request"/>
<events>
  <bw:emitText name="calForm" property="eventRegAdminToken"/>
  <c:if test="${not empty requestScope.bw_search_result}">
    <c:set var="sres" value="${bw_search_result}" />
    <c:if test="${not empty requestScope.bw_search_params}" >
      <c:set var="params" value="${bw_search_params}" />
      <bw:emitText name="params" property="curOffset" />
      <bw:emitText name="params" property="pageSize" />
      <c:if test="${not empty params.toDate}">
        <bw:emitText name="params" property="toDate.dtval" />
      </c:if>
    </c:if>
    <c:if test="${empty requestScope.bw_search_params}" >
      <curOffset>0</curOffset>
      <pageSize>0</pageSize>
      <toDate.dtval>19530315</toDate.dtval>
    </c:if>

    <paged>true</paged>
    <bw:emitText name="sres" property="found" tagName="resultSize" />

    <c:if test="${not empty requestScope.bw_search_list}">
      <c:forEach var="sre" items="${requestScope.bw_search_list}">
        <c:if test="${sre.docType == 'event'}">
          <c:set var="eventFormatter" value="${sre.entity}"
                 scope="request"  />
          <%@include file="/docs/event/emitEvent.jsp"%>
        </c:if>
      </c:forEach>
    </c:if>
  </c:if>
</events>
