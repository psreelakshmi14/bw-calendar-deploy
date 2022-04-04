<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

<c:set var="curcal" value="${calForm.calendar}"/>
<currentCalendar>
  <bw:emitText name="curcal" property="name" />
  <bw:emitText name="curcal" property="path" />
  <bw:emitText name="curcal" property="encodedPath" />
  <bw:emitText name="curcal" property="calType" />
  <bw:emitText name="curcal" property="summary" />
  <bw:emitText name="curcal" property="description" tagName="desc" />
  <bw:emitText name="curcal" property="calendarCollection" />
  <c:if test="${!calForm.addingCalendar}">
    <bw:emitCurrentPrivs name="curcal" property="currentAccess" />
    <bw:emitAcl name="curcal" property="currentAccess" />
  </c:if>
</currentCalendar>
