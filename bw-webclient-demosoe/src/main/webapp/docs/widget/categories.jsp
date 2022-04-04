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

  <bw:emitMsgErr name="calForm" property="msg"
                 tagName="message" indent="    "/>
  <bw:emitMsgErr name="calForm" property="err"
                 tagName="error" indent="    "/>

  <c:set var="presentationState" value="${bw_presentationstate}" />
  <bw:emitText name="presentationState" property="appRoot" tagName="appRoot" />

  <%-- List of categories  --%>
  <bw:emitCategories name="bw_categories_list" scope="session"
                     tagName="categories" indent="  "/>
</bedework>

