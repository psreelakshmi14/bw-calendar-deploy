<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<c:if test="${not empty calForm.rruleComponents}">
  <logic:iterate  id="rrc" name="calForm" property="rruleComponents">
    <recurrence>
      <bw:emitText name="rrc" property="rule"/>

      <bw:emitText name="rrc" property="freq"/>
      <c:if test="${not empty rrc.until}">
        <bw:emitText name="rrc" property="until"/>
      </c:if>
      <bw:emitText name="rrc" property="count"/>
      <bw:emitText name="rrc" property="interval"/>
      <%-- bySecond --%>
      <%-- byMinue --%>
      <%-- byHour --%>
      <c:if test="${not empty rrc.byDay}">
        <byday>
          <logic:iterate  id="posdays" name="rrc" property="byDay">
            <c:out value='<pos val="${posdays.pos}">'
                   escapeXml="false"/>
            <logic:iterate  id="day" name="posdays" property="days">
              <bw:emitText name="day" />
            </logic:iterate>
            </pos>
          </logic:iterate>
        </byday>
      </c:if>

      <c:if test="${not empty rrc.byMonthDay}">
        <bymonthday>
          <logic:iterate  id="val" name="rrc" property="byMonthDay">
            <bw:emitText name="val" />
          </logic:iterate>
        </bymonthday>
      </c:if>

      <c:if test="${not empty rrc.byYearDay}">
        <byyearday>
          <logic:iterate  id="val" name="rrc" property="byYearDay">
            <bw:emitText name="val" />
          </logic:iterate>
        </byyearday>
      </c:if>

      <c:if test="${not empty rrc.byWeekNo}">
        <byweekno>
          <logic:iterate  id="val" name="rrc" property="byWeekNo">
            <bw:emitText name="val" />
          </logic:iterate>
        </byweekno>
      </c:if>

      <c:if test="${not empty rrc.byMonth}">
        <bymonth>
          <logic:iterate  id="val" name="rrc" property="byMonth">
            <bw:emitText name="val" />
          </logic:iterate>
        </bymonth>
      </c:if>

      <c:if test="${not empty rrc.bySetPos}">
        <bysetpos>
          <logic:iterate  id="val" name="rrc" property="bySetPos">
            <bw:emitText name="val" />
          </logic:iterate>
        </bysetpos>
      </c:if>

      <c:if test="${not empty rrc.wkst}">
        <bw:emitText name="rrc" property="wkst"/>
      </c:if>
    </recurrence>
  </logic:iterate>
</c:if>

<c:set var="event" value="${calForm.event}" scope="request"  />
<c:if test="${not empty event.rdates}">
  <bw:emitRexdates name="event" property="rdates" indent="    " />
</c:if>

<c:if test="${not empty event.exdates}">
  <bw:emitRexdates name="event" property="exdates" indent="    " />
</c:if>
