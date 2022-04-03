<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
  <page>groupWidget</page>

  <logic:iterate id="appvar" name="calForm" property="appVars">
    <appvar>
      <bw:emitText name="appvar" property="key" />
      <bw:emitText name="appvar" property="value" />
    </appvar>
  </logic:iterate>
  <bw:emitMsgErr name="calForm" property="msg"
                 tagName="message" indent="  "/>
  <bw:emitMsgErr name="calForm" property="err"
                 tagName="error" indent="  "/>

  <c:set var="presentationState" value="${bw_presentationstate}" />
  <bw:emitText name="presentationState" property="appRoot" tagName="appRoot" />

  <%-- List of groups  --%>
  <groups>
    <c:if test="${not empty sessionScope.bw_admin_groups}" >
      <logic:iterate id="adminGroup" name="bw_admin_groups" scope="session" >
        <group>
          <bw:emitText name="adminGroup"
                       property="ownerHref" tagName="eventOwner"/>
          <bw:emitText name="adminGroup" property="account" tagName="name"/>
          <bw:emitText name="adminGroup"
                       property="description"/>
          <logic:iterate id="ancestorGroup" name="adminGroup" property="groups" >
            <memberof>
              <bw:emitText name="ancestorGroup"
                           property="account" tagName="name"/>
            </memberof>
          </logic:iterate>
        </group>
      </logic:iterate>
    </c:if>
  </groups>
</bedework>

