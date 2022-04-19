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
      <bw:textField size="5" maxlength="5"
                    name="td" property="daysStr"
                    tagName="days" />
      <bw:textField size="3" maxlength="3"
                    name="td" property="hoursStr"
                    tagName="hours" />
      <bw:textField size="3" maxlength="3"
                    name="td" property="minutesStr"
                    tagName="minutes" />
      <bw:textField size="3" maxlength="3"
                    name="td" property="secondsStr"
                    tagName="seconds" />
      <bw:textField size="3" maxlength="3"
                    name="td" property="weeksStr"
                    tagName="weeks" />
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
    <bw:textField name="calForm" property="eventState.email"
                  tagName="email" />
    <bw:textField name="calForm" property="eventState.subject"
                  tagName="subject" />
  </bwhtml:form>
</alarmoptionsform>

<%
} catch (Throwable t) {
  t.printStackTrace();
}
%>

<%@ include file="footer.jsp" %>

</bedework>
