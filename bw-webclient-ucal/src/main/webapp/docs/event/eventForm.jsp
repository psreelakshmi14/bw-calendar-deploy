<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-html' prefix='html' %>
<%@ taglib uri='bwhtml' prefix='bwhtml' %>
<%@ taglib uri='bedework' prefix='bw' %>


<%
try {
%>

<c:set var="event" value="${calForm.event}"/>
<formElements>
  <subscriptionId></subscriptionId>
  <bw:emitText name="event" property="uid"
               tagName="guid"/>
  <bw:emitText name="event" property="recurrenceId"/>

  <bwhtml:form action="event/editEvent">
    <bw:emitText name="event" property="scheduleMethod"
                 tagName="scheduleMethod" />
    <bw:emitText name="event" property="entityType"
                 tagName="entityType"/>

    <title>
      <html:text name="calForm" property="summary"/>
    </title>
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
    <allDay><html:checkbox property="eventStartDate.dateOnly"/></allDay>
    <storeUTC><html:checkbox property="eventStartDate.storeUTC"/></storeUTC>
    <floating><html:checkbox property="eventStartDate.floating"/></floating>
    <start>
      <bw:emitText name="calForm" property="eventStartDate.rfc3339DateTime"
                   tagName="rfc3339DateTime"/>
      <bw:emitText name="calForm" property="eventStartDate.hour"
                   tagName="temphour"/>
      <yearText>
        <html:text property="eventStartDate.year" size="4"/>
      </yearText>
      <bw:selectDateTime name="calForm"
                         property="eventStartDate"
                         indent="      "/>
      <bw:emitText name="calForm" property="eventStartDate.tzid" tagName="tzid"/>
    </start>
    <end>
      <bw:emitText name="calForm" property="eventEndDate.rfc3339DateTime"
                   tagName="rfc3339DateTime"/>
      <bw:emitText name="calForm" property="eventEndType"
                   tagName="type"/>
      <dateTime>
        <yearText>
          <html:text property="eventEndDate.year" size="4"/>
        </yearText>
        <bw:selectDateTime name="calForm"
                           property="eventEndDate"
                           indent="      "/>
        <bw:emitText name="calForm" property="eventEndDate.tzid" tagName="tzid"/>
      </dateTime>
      <duration>
        <days><html:text property="eventDuration.daysStr" size="2" /></days>
        <hours><html:text property="eventDuration.hoursStr" size="2" /></hours>
        <minutes><html:text property="eventDuration.minutesStr" size="2" /></minutes>
        <weeks><html:text property="eventDuration.weeksStr" size="2" /></weeks>
      </duration>
    </end>
    <desc><html:textarea property="description"></html:textarea></desc>
    <bw:emitText name="event" property="status"/>
    <bw:emitText name="event" property="transparency"/>
    <link><html:text name="event" property="link"/></link>
    <c:set var="locations"
           value="${bw_locations_list}" />
    <location>
      <locationmenu>
        <html:select property="locationUid">
          <html:optionsCollection name="locations"
                                  label="address.value"
                                  value="uid"/>
        </html:select>
      </locationmenu>
      <locationtext><html:text property="locationAddress.value" /></locationtext>
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

  </bwhtml:form>
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

