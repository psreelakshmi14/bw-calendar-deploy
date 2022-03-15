<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@ include file="/docs/header.jsp" %>

<page>addEvent</page>

<bw:emitText name="calForm" property="addingEvent" tagName="creating"/>

<%@ include file="/docs/event/eventForm.jsp" %>

<%@ include file="/docs/footer.jsp" %>

</bedework>
