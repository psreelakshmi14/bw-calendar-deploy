<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
  <page>groupWidget</page>

  <c:forEach var="appvar" items="${calForm.appVars}">
    <appvar>
      <bw:emitText name="appvar" property="key" />
      <bw:emitText name="appvar" property="value" />
    </appvar>
  </c:forEach>
  <bw:emitMsgErr name="calForm" property="msg"
                 tagName="message" indent="  "/>
  <bw:emitMsgErr name="calForm" property="err"
                 tagName="error" indent="  "/>

  <c:set var="presentationState" value="${bw_presentationstate}" />
  <bw:emitText name="presentationState" property="appRoot" tagName="appRoot" />

  <%-- List of groups  --%>
  <groups>
    <c:if test="${not empty sessionScope.bw_admin_groups}" >
      <c:forEach var="adminGroup" items="${sessionScope.bw_admin_groups}" >
        <group>
          <bw:emitText name="adminGroup"
                       property="ownerHref" tagName="eventOwner"/>
          <bw:emitText name="adminGroup" property="account" tagName="name"/>
          <bw:emitText name="adminGroup"
                       property="description"/>
          <c:forEach var="ancestorGroup" items="${adminGroup.groups}" >
            <memberof>
              <bw:emitText name="ancestorGroup"
                           property="account" tagName="name"/>
            </memberof>
          </c:forEach>
        </group>
      </c:forEach>
    </c:if>
  </groups>
</bedework>

