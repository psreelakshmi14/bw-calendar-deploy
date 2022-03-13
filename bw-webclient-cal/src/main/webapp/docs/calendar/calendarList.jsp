<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='struts-html' prefix='html' %>
<%@ taglib uri='bedework' prefix='bw' %>
<html:xhtml/>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>calendarList</page>

<%@include file="/docs/calendar/emitCalendars.jsp"%>

<%@include file="/docs/footer.jsp"%>
</bedework>
