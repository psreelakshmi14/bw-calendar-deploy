<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<%--  Generate events --%>
<c:set var="detailView" value="true" scope="request"/>
<events>
  <c:set var="sres" value="${bw_search_result}" />
  <c:set var="params" value="${bw_search_params}" />

  <c:if test="${not empty requestScope.bw_search_list}">
    <logic:iterate id="sre" name="bw_search_list" scope="request">
      <logic:equal name="sre" property="docType" value="event">
          <c:set var="eventFormatter" value="${sre.entity}"
                 scope="request"  />
        <%@include file="/docs/event/emitEvent.jsp"%>
      </logic:equal>
    </logic:iterate>
  </c:if>
</events>


