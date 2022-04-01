<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<subscriptionStatus>
  <c:if test="${not empty sessionScope.bw_subscription_status}">
    <c:set var="sstatus" value="${bw_subscription_status}"
           scope="request" />
    <bw:emitText name="sstatus" property="requestStatus" />
    <c:if test="${not empty sstatus.subscriptionStatus}" >
      <c:set var="ss" value="${sstatus.subscriptionStatus}"
             scope="request" />
      <bw:emitText name="ss" property="subscriptionId" />
      <bw:emitText name="ss" property="principalHref" />
      <bw:emitText name="ss" property="direction" />
      <bw:emitText name="ss" property="master" />
      <bw:emitText name="ss" property="lastRefresh" />
      <bw:emitText name="ss" property="errorCt" />
      <bw:emitText name="ss" property="missingTarget" />
      <endA>
        <c:if test="${not empty ss.endAConnector}" >
          <c:set var="connector" value="${ss.endAConnector}"
                 scope="request" />
          <bw:emitText name="connector" property="connectorId" />
          <c:set var="properties" value="${connector.properties}"
                 scope="request" />
          <%@ include file="/docs/synchProperties.jsp" %>
        </c:if>
      </endA>
      <endB>
        <c:if test="${not empty ss.endBConnector}" >
          <c:set var="connector" value="${ss.endBConnector}"
                 scope="request" />
          <bw:emitText name="connector" property="connectorId" />
          <c:set var="properties" value="${connector.properties}"
                 scope="request" />
          <%@ include file="/docs/synchProperties.jsp" %>
        </c:if>
      </endB>
      <properties>

      </properties>
    </c:if>
  </c:if>
</subscriptionStatus>
