<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<c:set var="curcal" value="${calForm.calendar}"/>
<currentCalendar>
  <bw:emitCollection name="curcal" indent="  " full="true" noTag="true" />

  <c:if test="${!calForm.addingCalendar}">
    <bw:emitCurrentPrivs name="curcal" property="currentAccess" />
    <bw:emitAcl name="curcal" property="currentAccess" />
  </c:if>
</currentCalendar>
