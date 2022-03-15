<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<%
try {
%>
  <%-- Generates standard calendar values for use in the client for forms, etc --%>

  <c:set var="calInfo" value="${moduleState.calInfo}" />
  <c:set var="forLabels" value="${moduleState.eventDates.forLabels}" />

<daylabels>
    <logic:iterate id="dayLabel" name="calInfo" property="dayLabels">
      <bw:emitText name="dayLabel" tagName="val"/>
    </logic:iterate>
  </daylabels>
  <dayvalues>
    <logic:iterate id="dayVal" name="calInfo" property="dayVals">
      <bw:emitText name="dayVal" tagName="val"/>
    </logic:iterate>
    <bw:emitText name="moduleState" property="viewStartDate.day"
                 tagName="start"/>
  </dayvalues>
  <daynames>
    <logic:iterate id="dayName" name="calInfo" property="dayNamesAdjusted">
      <bw:emitText name="dayName" tagName="val"/>
    </logic:iterate>
  </daynames>
  <shortdaynames>
    <logic:iterate id="shortDayName" name="calInfo" property="shortDayNamesAdjusted">
      <bw:emitText name="shortDayName" tagName="val"/>
    </logic:iterate>
  </shortdaynames>
  <recurdayvals>
    <logic:iterate id="recurDayName" name="calInfo" property="recurDayNamesAdjusted">
      <bw:emitText name="recurDayName" tagName="val"/>
    </logic:iterate>
  </recurdayvals>
  <monthlabels>
    <logic:iterate id="monthLabel" name="calInfo" property="monthLabels">
      <bw:emitText name="monthLabel" tagName="val"/>
    </logic:iterate>
  </monthlabels>
  <monthvalues>
    <logic:iterate id="monthVal" name="calInfo" property="monthVals">
      <bw:emitText name="monthVal" tagName="val"/>
    </logic:iterate>
    <bw:emitText name="moduleState"
                 property="viewStartDate.month"
                 tagName="start"/>
  </monthvalues>
  <yearvalues>
    <logic:iterate id="yearVals" name="calForm" property="yearVals">
      <bw:emitText name="yearVals" tagName="val"/>
    </logic:iterate>
    <bw:emitText name="moduleState"
                 property="viewStartDate.year"
                 tagName="start"/>
  </yearvalues>
  <hourlabels>
    <logic:iterate id="hourLabel" name="forLabels" property="hourLabels">
      <bw:emitText name="hourLabel" tagName="val"/>
    </logic:iterate>
  </hourlabels>
  <hourvalues>
    <logic:iterate id="hourVal" name="forLabels" property="hourVals">
      <bw:emitText name="hourVal" tagName="val"/>
    </logic:iterate>
    <bw:emitText name="moduleState"
                 property="viewStartDate.hour"
                 tagName="start"/>
  </hourvalues>
  <minvalues>
    <logic:iterate id="minuteVals" name="forLabels" property="minuteLabels">
      <bw:emitText name="minuteVals" tagName="val"/>
    </logic:iterate>
    <bw:emitText name="moduleState"
                 property="viewStartDate.minute"
                 tagName="start"/>
<%--    <logic:iterate id="minuteVals" name="forLabels" property="minuteLabels">
 --%>
  </minvalues>
  <ampmvalues>
    <logic:iterate id="ampmVals" name="forLabels"
                   property="ampmLabels">
      <bw:emitText name="ampmVals" tagName="val"/>
    </logic:iterate>
    <bw:emitText name="moduleState"
                 property="viewStartDate.ampm"
                 tagName="start"/>
  </ampmvalues>
<%
} catch (final Throwable t) {
  t.printStackTrace();
}
%>

<%-- Required to force write in portal-struts bridge --%>
<% pageContext.getOut().flush(); %>

