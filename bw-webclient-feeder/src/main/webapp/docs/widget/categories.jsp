<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
  <page>categoryWidget</page>

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

  <%-- List of categories  --%>
  <categories>
    <logic:present name="bw_categories_list" scope="session">
      <logic:iterate id="category" name="bw_categories_list"
                     scope="session">
        <%@include file="/docs/category/emitCategory.jsp"%>
      </logic:iterate>
    </logic:present>
  </categories>
</bedework>

