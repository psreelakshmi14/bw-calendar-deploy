<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>


<%
try {
%>

<c:set var="event" value="${calForm.event}"/>
<c:set var="calInfo" value="${moduleState.calInfo}" />
<formElements>
  <subscriptionId></subscriptionId>
  <bw:emitText name="event" property="uid"
               tagName="guid"/>
  <bw:emitText name="event" property="recurrenceId"/>

  <bw:form action="event/editEvent">
    <bw:emitText name="event" property="scheduleMethod"
                 tagName="scheduleMethod" />
    <bw:emitText name="event" property="entityType"
                 tagName="entityType"/>

    <bw:textField name="calForm" property="summary"
                  tagName="title" />
    <!-- current event's calendar -->
    <bw:emitContainer name="calForm" property="event"
                      indent="    " tagName="calendar" />
    <!-- user's writable calendars -->
    <calendars>
      <c:set var="addContentCalendarCollections"
             value="${bw_addcontent_collection_list}" />
      <bw:selectCollection name="calForm"
                           property="calendarId"
                           cols="addContentCalendarCollections"
                           indent="    "/>
    </calendars>
    <bw:checkbox property="eventStartDate.dateOnly"
                 tagName="allDay" />
    <bw:checkbox property="eventStartDate.storeUTC"
                 tagName="storeUTC" />
    <bw:checkbox property="eventStartDate.floating"
                 tagName="floating" />
    <start>
      <bw:emitText name="calForm" property="eventStartDate.rfc3339DateTime"
                   tagName="rfc3339DateTime"/>
      <bw:emitText name="calForm" property="eventStartDate.hour"
                   tagName="temphour"/>
      <bw:textField property="eventStartDate.year" size="4"
                    tagName="yearText" />
      <bw:selectDateTime name="calForm"
                         property="eventStartDate"
                         indent="      "
                         yearVals="${calInfo.yearVals}"/>
      <bw:emitText name="calForm" property="eventStartDate.tzid" tagName="tzid"/>
    </start>
    <end>
      <bw:emitText name="calForm" property="eventEndDate.rfc3339DateTime"
                   tagName="rfc3339DateTime"/>
      <bw:emitText name="calForm" property="eventEndType"
                   tagName="type"/>
      <dateTime>
        <bw:textField property="eventEndDate.year" size="4"
                      tagName="yearText" />
        <bw:selectDateTime name="calForm"
                           property="eventEndDate"
                           indent="      "
                           yearVals="${calInfo.yearVals}"/>
        <bw:emitText name="calForm" property="eventEndDate.tzid" tagName="tzid"/>
      </dateTime>
      <duration>
        <bw:textField property="eventDuration.daysStr" size="2"
                      tagName="days" />
        <bw:textField property="eventDuration.hoursStr" size="2"
                      tagName="hours" />
        <bw:textField property="eventDuration.minutesStr" size="2"
                      tagName="minutes" />
        <bw:textField property="eventDuration.weeksStr" size="2"
                      tagName="weeks" />
      </duration>
    </end>
    <desc><textarea><c:out value='${calForm.description}'/></textarea></desc>
    <bw:emitText name="event" property="status"/>
    <bw:emitText name="event" property="transparency"/>
    <bw:textField name="event" property="link"
                  tagName="link" />
    <c:set var="locations"
           value="${bw_locations_list}" />
    <location>
      <locationmenu>
        <bw:selectLocation name="calForm"
                           property="locationUid"
                           locs="locations"
                           indent="    "/>
      </locationmenu>
      <bw:textField property="locationAddress.value"
                    tagName="locationtext" />
    </location>

    <categories>
      <bw:emitCategories name="bw_categories_list" scope="session"
                         tagName="all" indent="  " full="false"/>
      <bw:emitCategories name="event"  property="categories"
                         tagName="current" indent="    " full="false"/>
    </categories>

    <c:if test="${not empty event.percentComplete}">
      <bw:emitText name="event" property="percentComplete"/>
    </c:if>

    <%--<bw:emitText name="event" property="trashable"/>--%>
    <bw:emitText name="event" property="recurringEntity"/>

    <bw:emitRrules name="calForm" property="rruleComponents"
                   indent="    " />

    <c:if test="${not empty event.rdates}">
      <bw:emitRexdates name="event" property="rdates" indent="    " />
    </c:if>

    <c:if test="${not empty event.exdates}">
      <bw:emitRexdates name="event" property="exdates" indent="    " />
    </c:if>

    <%@ include file="/docs/schedule/emitEventProperties.jsp" %>

    <bw:emitXprops name="event" property="xproperties"/>

  </bw:form>
</formElements>

<editableAccess>
  <c:if test="${not empty calForm.curEventFmt}">
    <c:set var="eventFormatter" value="${calForm.curEventFmt}"/>
    <bw:emitText name="eventFormatter" property="xmlAccess" tagName="access"
                 filter="no"/>
  </c:if>
</editableAccess>

<%
} catch (Throwable t) {
  t.printStackTrace();
}
%>

