<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<%--  Generate events --%>
<c:set var="detailView" value="true" scope="request"/>
<events>
  <c:if test="${not empty requestScope.bw_search_result}">
    <c:set var="sres" value="${bw_search_result}" />
    <c:set var="params" value="${bw_search_params}" />
    <bw:emitText name="params" property="status" />
    <bw:emitText name="params" property="message" />
    <bw:emitText name="params" property="curOffset" />
    <bw:emitText name="params" property="pageSize" />
    <c:if test="${not empty params.fromDate}">
      <bw:emitText name="params" property="fromDate" />
    </c:if>
    <c:if test="${not empty params.toDate}">
      <bw:emitText name="params" property="toDate" />
    </c:if>
    <c:if test="${not empty params.formattedStart.formatted.dayName}">
      <bw:emitText name="params" property="formattedStart.formatted.dayName"
                   tagName="searchStartDayName"/>
    </c:if>

    <paged>true</paged>
    <bw:emitText name="sres" property="found" tagName="resultSize" />

    <c:if test="${not empty requestScope.bw_search_list}">
      <logic:iterate id="sre" name="bw_search_list" scope="request">
        <logic:equal name="sre" property="docType" value="event">
          <c:set var="eventFormatter" value="${sre.entity}"
                 scope="request"  />
          <%@include file="/docs/event/emitEvent.jsp"%>
        </logic:equal>
      </logic:iterate>
    </c:if>
  </c:if>
</events>
