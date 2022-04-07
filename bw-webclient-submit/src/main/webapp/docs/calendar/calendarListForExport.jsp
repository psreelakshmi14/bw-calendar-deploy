<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-html' prefix='html' %>
<%@ taglib uri='bwhtml' prefix='bwhtml' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>calendarListForExport</page>

<%-- list the public calendars; we can get subscriptions and myCalendars
     from the header xml --%>

<calendars>
  <c:set var="calendar" value="${bw_public_collection_list}" scope="session"/>
  <%@include file="/docs/calendar/emitCalendar.jsp"%>
</calendars>

<formElements>
  <bwhtml:form action="event/editEvent">
    <start>
      <month>
        <html:select property="eventStartDate.month">
          <html:options labelProperty="eventStartDate.monthLabels"
                        property="eventStartDate.monthVals"/>
        </html:select>
      </month>
      <day>
        <html:select property="eventStartDate.day">
          <html:options labelProperty="eventStartDate.dayLabels"
                        property="eventStartDate.dayVals"/>
        </html:select>
      </day>
      <yearText>
        <html:text property="eventStartDate.year" size="4"/>
      </yearText>
    </start>
    <end>
      <month>
        <html:select property="eventEndDate.month">
            <html:options labelProperty="eventEndDate.monthLabels"
                          property="eventEndDate.monthVals"/>
        </html:select>
      </month>
      <day>
        <html:select property="eventEndDate.day">
          <html:options labelProperty="eventEndDate.dayLabels"
                        property="eventEndDate.dayVals"/>
        </html:select>
      </day>
      <yearText>
        <html:text property="eventEndDate.year" size="4"/>
      </yearText>
    </end>
  </bwhtml:form>
</formElements>

<%@include file="/docs/footer.jsp"%>
</bedework>
