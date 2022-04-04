<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@ include file="/docs/header.jsp" %>

<%
try {
%>

<page>searchResult</page>

<searchResults>
  <bw:emitText name="moduleState" property="query"/>
  <bw:emitText name="moduleState" property="searchLimits"/>
  <c:if test="${empty requestScope.bw_search_result}">
    <resultSize>0</resultSize>
  </c:if>

  <c:if test="${not empty requestScope.bw_search_result}">
    <c:set var="sres" value="${bw_search_result}"/>
    <bw:emitText name="sres" property="found" tagName="resultSize" />
    <c:forEach var="sre" items="${requestScope.bw_search_list}">
      <searchResult>
        <bw:emitText name="sre" property="score" />
        <c:if test="${sre.docType == 'event'}">
          <c:set var="eventFmt" value="${sre.entity}" scope="request"  />
          <c:set var="eventInfo" value="${eventFmt.eventInfo}"
                 scope="request"  />
          <c:set var="event" value="${eventFmt.event}"
                 scope="request"  />
          <%@ include file="/docs/event/emitEventCommon.jsp" %>
        </c:if>
      </searchResult>
    </c:forEach>
  </c:if>

</searchResults>

<%
} catch (Throwable t) {
  t.printStackTrace();
}
%>

<%@ include file="/docs/footer.jsp" %>

</bedework>
