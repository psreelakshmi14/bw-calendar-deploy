<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>modSchedulingPrefs</page>
<c:set var="userPrefs" value="${calForm.userPreferences}"/>
<schPrefs>
  <bw:emitText name="userPrefs" property="ownerHref"
               tagName="user"/>
  <%--inbox>
    <bw:emitAcl name="inBoxInfo" property="currentAccess" />
  </inbox --%>
  <bw:emitText name="userPrefs" property="scheduleAutoRespond"/>
  <bw:emitText name="userPrefs" property="scheduleAutoCancelAction"/>
  <bw:emitText name="userPrefs" property="scheduleDoubleBook"/>
  <bw:emitText name="userPrefs" property="scheduleAutoProcessResponses"/>
</schPrefs>

<%@include file="/docs/footer.jsp"%>


</bedework>
