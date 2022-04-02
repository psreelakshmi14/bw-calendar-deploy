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

  <logic:iterate id="msg" name="calForm" property="msg.msgList">
    <message>
      <bw:emitText name="msg" property="msgId"
                   tagName="id"/>
      <logic:iterate id="param" name="msg" property="params" >
        <bw:emitText name="param" />
      </logic:iterate>
    </message>
  </logic:iterate>

  <logic:iterate id="errBean" name="calForm" property="err.msgList">
    <error>
      <bw:emitText name="errBean" property="msgId"
                   tagName="id"/>
      <logic:iterate id="param" name="errBean" property="params" >
        <bw:emitText name="param" />
      </logic:iterate>
    </error>
  </logic:iterate>

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

