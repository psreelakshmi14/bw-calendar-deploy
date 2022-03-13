<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='struts-html' prefix='html' %>
<%@ taglib uri='bedework' prefix='bw' %>
<html:xhtml/>

<subscriptionStatus>
  <logic:present name="bw_subscription_status" scope="session">
    <c:set var="sstatus" value="${bw_subscription_status}"
           scope="request" />
    <bw:emitText name="sstatus" property="requestStatus" />
    <logic:present name="sstatus" property="subscriptionStatus" >
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
        <logic:present name="ss" property="endAConnector" >
          <c:set var="connector" value="${ss.endAConnector}"
                 scope="request" />
          <bw:emitText name="connector" property="connectorId" />
          <c:set var="properties" value="${connector.properties}"
                 scope="request" />
          <%@ include file="/docs/synchProperties.jsp" %>
        </logic:present>
      </endA>
      <endB>
        <logic:present name="ss" property="endBConnector" >
          <c:set var="connector" value="${ss.endBConnector}"
                 scope="request" />
          <bw:emitText name="connector" property="connectorId" />
          <c:set var="properties" value="${connector.properties}"
                 scope="request" />
          <%@ include file="/docs/synchProperties.jsp" %>
        </logic:present>
      </endB>
      <properties>

      </properties>
    </logic:present>
  </logic:present>
</subscriptionStatus>
