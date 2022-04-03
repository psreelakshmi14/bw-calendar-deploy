<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<%-- Load the header common to all pages --%>
<bedework>
<%@ include file="/docs/header.jsp" %>

<%-- the <page> element allows us to branch in our XSLT based on what page
    (what "state") we are in.  The value is hard coded into the top-level
    JSP pages for the calendar.  It has four possible values:

      1. eventscalendar - the event calendar tree from which we build our
                          day, week, month, and year views (main.jsp)
      2. event          - a single event (see eventMore.jsp)
      3. calendars      - the listing of calendars (see calendars.jsp)
      4. other          - an arbitrary page (see showPage.jsp)
--%>
<page>eventscalendar</page>

<%-- The events listing in a calendar tree --%>
<eventscalendar>
  <c:set var="curTimeView" value="${moduleState.curTimeView}"/>
  <c:set var="timeInfo" value="${curTimeView.timePeriodInfo}"/>
  <c:forEach var="yearInfo" items="${timeInfo}" >
    <year>
      <bw:emitText name="yearInfo" property="year"
                   tagName="value"/>
      <c:forEach var="monthInfo" items="${yearInfo.entries}" >
        <month>
          <bw:emitText name="monthInfo" property="month"
                       tagName="value"/>
          <bw:emitText name="monthInfo" property="monthName"
                       tagName="longname"/>
          <bw:emitText name="monthInfo" property="monthName"
                       tagName="shortname"/>
          <c:forEach var="weekInfo" items="${monthInfo.entries}" >
            <week>
              <bw:emitText name="weekInfo" property="weekOfYear"
                           tagName="value"/>
              <c:forEach var="dayInfo" items="${weekInfo.entries}" >
                <day>
                  <bw:emitText name="dayInfo" property="filler"/>
                  <%/* Fillers currently have no information */%>
                  <c:if test="${dayInfo.filler == false}">
                    <bw:emitText name="dayInfo" property="dayOfMonth"
                                 tagName="value"/>
                    <bw:emitText name="dayInfo" property="dayName"
                                 tagName="name"/>
                    <bw:emitText name="dayInfo" property="date"/>
                    <bw:emitText name="dayInfo" property="dateLong"
                                 tagName="longdate"/>
                    <bw:emitText name="dayInfo" property="dateShort"
                                 tagName="shortdate"/>
                    <%-- Do not produce events if we are in the year view
                    <c:if test="${calForm.curTimeView.showData}">
                                 --%>
                    <c:if test="${curTimeView.showData}">
                      <c:forEach var="eventFmt" items="${dayInfo.events}">
                        <c:set var="eventFormatter" value="${eventFmt}"
                               scope="request" />
                        <jsp:include page="/docs/event/emitEvent.jsp" />
                      </c:forEach>
                    </c:if>
                  </c:if>
                </day>
              </c:forEach>
            </week>
          </c:forEach>
        </month>
      </c:forEach>
    </year>
  </c:forEach>
</eventscalendar>

<%@ include file="/docs/footer.jsp" %>

</bedework>
