<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
  <bw:emitMsgErr name="org.bedework.client.messageobj" scope="session"
                 tagName="message" indent="  "/>
  <bw:emitMsgErr name="org.bedework.client.errorobj" scope="session"
                 tagName="error" indent="  "/>

  <c:set var="presentationState" value="${bw_presentationstate}" />
  <bw:emitText name="presentationState" property="appRoot" tagName="appRoot" />

  <page>attendeeWidget</page>

<%
try {
%>
  <c:if test="${not empty calForm.attendees.attendees}">
    <attendees>
    <c:forEach var="att" items="${calForm.attendees.attendees}">
	    <attendee>
	      <bw:emitText name="att" property="attendeeUri"/>
        <bw:emitText name="att" property="partstat"/>
        <bw:emitText name="att" property="cn"/>
        <bw:emitText name="att" property="cuType"/>
        <bw:emitText name="att" property="role"/>
        <bw:emitText name="att" property="delegatedFrom"/>
        <bw:emitText name="att" property="delegatedTo"/>
        <bw:emitText name="att" property="dir"/>
        <bw:emitText name="att" property="language"/>
        <bw:emitText name="att" property="rsvp"/>
        <bw:emitText name="att" property="sentBy"/>
	    </attendee>
    </c:forEach>
    </attendees>
  </c:if>
  <c:if test="${empty calForm.attendees.attendees}">
    <attendees>
    </attendees>
  </c:if>

<%
} catch (Throwable t) {
  t.printStackTrace();
}
%>
</bedework>
