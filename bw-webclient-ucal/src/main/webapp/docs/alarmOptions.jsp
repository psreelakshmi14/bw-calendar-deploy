<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
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
      <input type="radio" name="alarmTriggerByDate"
             id="alarmTriggerByDate"
             value="true"
        ${calForm.alarmTriggerByDate?'checked':''}>
    </alarmTriggerSelectorDate>
    <alarmTriggerSelectorDuration>
      <input type="radio" name="alarmTriggerByDate"
             id="alarmTriggerByDate"
             value="false"
        ${!calForm.alarmTriggerByDate?'checked':''}>
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
      <input type="radio" name="eventState.triggerDuration.negative"
             id="eventState.triggerDuration.negative"
             value="true"
        ${calForm.eventState.triggerDuration.negative?'checked':''}>
    </alarmDurationBefore>
    <alarmDurationAfter>
      <input type="radio" name="eventState.triggerDuration.negative"
             id="eventState.triggerDuration.negative"
             value="false"
        ${!calForm.eventState.triggerDuration.negative?'checked':''}>
    </alarmDurationAfter>
    <alarmDurationRelStart>
      <input type="radio" name="eventState.alarmRelStart"
             id="eventState.alarmRelStart"
             value="true"
        ${calForm.eventState.alarmRelStart?'checked':''}>
    </alarmDurationRelStart>
    <alarmDurationRelEnd>
      <input type="radio" name="eventState.alarmRelStart"
             id="eventState.alarmRelStart"
             value="false"
        ${!calForm.eventState.alarmRelStart?'checked':''}>
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
