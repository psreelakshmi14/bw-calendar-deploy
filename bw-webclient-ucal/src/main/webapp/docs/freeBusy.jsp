<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

<freebusy>
  <c:if test="${not empty calForm.formattedFreeBusy}" >
    <c:set var="freeBusyObj" value="${calForm.formattedFreeBusy}" />
    <bw:emitText name="freeBusyObj" property="account" tagName="who" />
    <bw:emitText name="freeBusyObj" property="start.dtval" tagName="start" />
    <bw:emitText name="freeBusyObj" property="end.dtval" tagName="end" />
    <c:forEach var="day" items="${freeBusyObj.days}" >
      <day>
        <bw:emitText name="day" property="dateString" />
        <c:forEach var="fbperiod" items="${day.periods}" >
          <period>
            <bw:emitText name="fbperiod" property="type" tagName="fbtype" />
            <bw:emitText name="fbperiod" property="startTime" tagName="start" />
            <bw:emitText name="fbperiod" property="minutesLength" tagName="length" />
            <bw:emitText name="fbperiod" property="numBusy" />
            <bw:emitText name="fbperiod" property="numTentative" />
          </period>
        </c:forEach>
      </day>
    </c:forEach>
  </c:if>
  <c:if test="${not empty calForm.fbResponses}" >
    <c:set var="fbresps" value="${calForm.fbResponses}" />
    <c:if test="${not empty fbresps.responses}" >
      <c:forEach var="resp" items="${fbresps.responses}" >
        <fbattendee>
          <bw:emitText name="resp" property="respCode" />
          <bw:emitText name="resp" property="recipient" />
        </fbattendee>
      </c:forEach>
    </c:if>
  </c:if>
</freebusy>

