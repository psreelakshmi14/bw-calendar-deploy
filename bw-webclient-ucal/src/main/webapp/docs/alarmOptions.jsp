<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-html' prefix='html' %>
<%@ taglib uri='bwhtml' prefix='bwhtml' %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@ include file="header.jsp" %>

<%
try {
%>

<page>alarmOptions</page>

<alarmoptionsform>
  <bwhtml:form action="alarm/setAlarm">
    <alarmdate>
      <bw:selectDate name="calForm"
                     property="eventState.triggerDateTime"
                     indent="      "
                     notag="true"/>
    </alarmdate>
    <alarmtime>
      <bw:selectTime name="calForm"
                     property="eventState.triggerDateTime"
                     indent="      "
                     notag="true"/>
    </alarmtime>
    <alarmTriggerSelectorDate>
      <html:radio name="calForm" property="alarmTriggerByDate"
                   value="true" />
    </alarmTriggerSelectorDate>
    <alarmTriggerSelectorDuration>
      <html:radio name="calForm" property="alarmTriggerByDate"
                      value="false" />
    </alarmTriggerSelectorDuration>
    <alarmduration>
      <c:set var="td" value="${calForm.eventState.triggerDuration}" />
      <days><html:text size="5" maxlength="5" name="td" property="daysStr"/></days>
      <hours><html:text size="3" maxlength="3" name="td" property="hoursStr"/></hours>
      <minutes><html:text size="3" maxlength="3" name="td" property="minutesStr"/></minutes>
      <seconds><html:text size="3" maxlength="3" name="td" property="secondsStr"/></seconds>
      <weeks><html:text size="3" maxlength="3" name="td" property="weeksStr"/></weeks>
    </alarmduration>
    <alarmDurationBefore>
      <html:radio name="calForm" property="eventState.triggerDuration.negative"
                      value="true" />
    </alarmDurationBefore>
    <alarmDurationAfter>
      <html:radio name="calForm" property="eventState.triggerDuration.negative"
                      value="false" />
    </alarmDurationAfter>
    <alarmDurationRelStart>
      <html:radio name="calForm" property="eventState.alarmRelStart"
                      value="true" />
    </alarmDurationRelStart>
    <alarmDurationRelEnd>
      <html:radio name="calForm" property="eventState.alarmRelStart"
                      value="false" />
    </alarmDurationRelEnd>
    <email><html:text name="calForm" property="eventState.email"/></email>
    <subject><html:text name="calForm" property="eventState.subject" /></subject>
  </bwhtml:form>
</alarmoptionsform>

<%
} catch (Throwable t) {
  t.printStackTrace();
}
%>

<%@ include file="footer.jsp" %>

</bedework>
