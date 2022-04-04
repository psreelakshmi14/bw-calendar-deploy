<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

<%--  Generate events --%>
<c:set var="detailView" value="true" scope="request"/>
<events>
  <c:set var="sres" value="${bw_search_result}" />
  <c:set var="params" value="${bw_search_params}" />

  <c:if test="${not empty requestScope.bw_search_list}">
    <c:forEach var="sre" items="${requestScope.bw_search_list}">
      <c:if test="${sre.docType == 'event'}">
          <c:set var="eventFormatter" value="${sre.entity}"
                 scope="request"  />
        <%@include file="/docs/event/emitEvent.jsp"%>
      </c:if>
    </c:forEach>
  </c:if>
</events>


