<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

  <bw:emitText name="notificationInfo" property="changed" />
  <logic:iterate id="notification" name="notificationInfo" property="notifications" >
    <notification>
      <bw:emitText name="notification" property="name" />
      <bw:emitText name="notification" property="type" />
      <bw:emitText name="notification" property="xmlFragment"
                   tagName="message" filter="false" />
      <c:if test="${not empty notification.resourcesInfo}" >
        <logic:iterate id="resourceInfo"
                       name="notification" property="resourcesInfo" >
          <resource>
            <bw:emitText name="resourceInfo" property="href" />
            <bw:emitText name="resourceInfo" property="created" />
            <bw:emitText name="resourceInfo" property="deleted" />
            <c:if test="${not empty resourceInfo.summary}" >
              <bw:emitText name="resourceInfo" property="summary" />
            </c:if>
            <c:if test="${not empty resourceInfo.formattedStart}" >
              <c:set var="fdt" value="${resourceInfo.formattedStart.formatted}" />
              <bw:emitText name="fdt" property="dayName" />
              <bw:emitText name="resourceInfo" property="formattedStart.dateType"
                           tagName="allday" /><%--
        Value: true/false --%>
              <%-- Whatever else is needed --%>
            </c:if>
          </resource>
        </logic:iterate>
      </c:if>
    </notification>
  </logic:iterate>

