<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@ include file="/docs/header.jsp" %>

<%
try {
%>

<page>attendeesList</page>
<attendees>
  <c:if test="${not empty calForm.attendees}">
    <c:forEach var="att" items="${calForm.attendees.attendees}">
	    <attendee>
	      <bw:emitText name="att" property="attendeeUri"/>
        <bw:emitText name="att" property="partstat"/>
        <bw:emitText name="att" property="cn"/>
        <bw:emitText name="att" property="role"/>
	    <attendee>
    </c:forEach>
  </c:if>
</attendees>

<%
} catch (Throwable t) {
  t.printStackTrace();
}
%>

<%@ include file="/docs/footer.jsp" %>

</bedework>
