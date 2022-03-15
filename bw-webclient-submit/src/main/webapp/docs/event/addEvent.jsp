<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@ include file="/docs/header.jsp" %>

<page>addEvent</page>

<bw:emitText name="calForm" property="addingEvent" tagName="creating"/>

<%@ include file="/docs/event/eventForm.jsp" %>

<%@ include file="/docs/footer.jsp" %>

</bedework>
