<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='https://bedework.org/jsp/taglib/bedework' prefix='bw' %>

<bw:emitText name="calForm" property="addingEvent"
             tagName="creating"/>
<bw:emitText name="calForm" property="hour24" /><%--
    Values: true, false - Flag if we are using 24 hour time --%>
<bw:emitText name="bwauthpars" property="maxInstances" />
<bw:emitText name="bwauthpars" property="maxYears" />
<bw:emitText name="bwconfig" property="registrationsExternal"/>
<bw:emitCurrentPrivs name="calForm" property="eventInfo.currentAccess" />

<c:set var="event" value="${calForm.event}" scope="request"  />
<c:set var="eventDuration" value="${calForm.eventDuration}" scope="request"  />
<c:set var="calInfo" value="${moduleState.calInfo}" />

<%-- formElements sections take advantage of Struts' form processing features. --%>
<formElements>
  <bw:emitText name="calForm" property="event.uid"
               tagName="guid"/>
  <bw:emitText name="calForm" property="event.recurrenceId"
               tagName="recurrenceId"/>

  <c:if test="${!calForm.addingEvent}">
    <bw:emitText name="calForm" property="event.creatorHref"
                 tagName="creator"/>
    <bw:emitText name="calForm" property="event.ownerHref" tagName="owner"/>
    <bw:emitText name="calForm" property="event.name" tagName="name"/>
  </c:if>
  <bw:emitText name="calForm" property="eventRegAdminToken"/>

  <bw:form action="event/update" >
    <bw:textField name="calForm" property="summary"
                  size="40" styleId="iTitle" styleClass="edit"
                  tagName="title" />
    <bw:checkbox property="event.deleted"
                 tagName="deleted" />
    <calendar>
      <%-- Output the event's calendar information --%>
      <bw:emitContainer name="calForm" property="event"
                        indent="        "/>
    </calendar>
    <bw:checkbox property="eventStartDate.dateOnly"
                 tagName="allDay" />
    <bw:checkbox property="eventStartDate.storeUTC"
                 tagName="storeUTC" />
    <bw:checkbox property="eventStartDate.floating"
                 tagName="floating" />
    <start>
      <bw:emitText name="calForm" property="eventStartDate.rfc3339DateTime"
                   tagName="rfc3339DateTime"/>
      <bw:textField property="eventStartDate.year" size="4"
                    tagName="yearText" />
      <bw:selectDateTime name="calForm"
                         property="eventStartDate"
                         indent="      "
                         yearVals="${calInfo.yearVals}"/>
      <bw:emitText name="calForm" property="eventStartDate.tzid"
                   tagName="tzid"/>
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
    <bw:emitText name="bwauthpars" property="maxPublicDescriptionLength"
                 tagName="descLength"/>
    <bw:emitText name="calForm" property="event.status"
                 tagName="status"/>
    <bw:textField property="event.cost" size="30"
                  styleId="iCost" styleClass="edit"
                  tagName="cost" />
    <bw:textField name="event" property="link"
                  styleId="iLink" styleClass="edit"
                  tagName="link" />
    <location>
      <c:if test="${not empty sessionScope.bw_preferred_locations_list}">
        <preferred>
          <c:set var="preferredLocations"
                 value="${bw_preferred_locations_list}" />
          <bw:selectLocation name="calForm"
                             property="prefLocationId"
                             locs="preferredLocations"
                             indent="    "/>
        </preferred>
      </c:if>
      <all>
        <c:set var="locations"
               value="${bw_locations_list}" />
        <bw:selectLocation name="calForm"
                           property="allLocationId"
                           locs="locations"
                           indent="    "/>
      </all>
      <c:if test="${bwconfig.autoCreateLocations}">
        <bw:textField size="30" property="location.address.value"
                      styleId="iLocation" styleClass="edit"
                      tagName="address" />
        <bw:textField property="location.link" size="30"
                      styleId="iLocLink" styleClass="edit"
                      tagName="link" />
      </c:if>
    </location>

    <c:if test="${globals.suggestionEnabled}" >
      <suggestTo>
        <c:if test="${not empty sessionScope.bw_preferred_admin_groups}">
          <preferred>
            <c:forEach var="group"
                       items="${sessionScope.bw_preferred_admin_groups}">
              <group>
                <bw:emitText name="group" property="account"
                             tagName="name"/>
                <bw:emitText name="group" property="principalRef"
                             tagName="href"/>
                <bw:emitText name="group" property="description" />
              </group>
            </c:forEach>
          </preferred>
        </c:if>
        <c:if test="${not empty sessionScope.bw_suite_admin_groups}">
          <all>
            <c:forEach var="group"
                           items="${sessionScope.bw_suite_admin_groups}">
              <group>
                <bw:emitText name="group" property="account"
                             tagName="name"/>
                <bw:emitText name="group" property="principalRef"
                             tagName="href"/>
                <bw:emitText name="group" property="description" />
              </group>
            </c:forEach>
          </all>
        </c:if>
      </suggestTo>
    </c:if>

    <categories>
      <c:if test="${not empty sessionScope.bw_preferred_categories_list}">
        <bw:emitCategories name="bw_preferred_categories_list" scope="session"
                           tagName="preferred" indent="  "/>
      </c:if>
      <bw:emitCategories name="bw_categories_list" scope="session"
                         tagName="all" indent="    "/>
      <bw:emitCategories name="event"  property="categories"
                         tagName="current" indent="    "/>
    </categories>

    <!-- Subscriptions are calendar aliases (and folders) associated with
         calendar suites.  Administrators set the collection of subscriptions in which
         they'd like the event to appear based on their access to a calendar suite.
         The back end then tags the events with categories to assure that the events
         appear under a given subscription.  -->
    <subscriptions>
      <!-- need to iterate over all calsuites to which a user has access.
           For now, we'll return just the current one to get things going. -->
      <calsuite>
        <bw:emitText name="globals" property="currentCalSuite.name" tagName="name" />
        <calendars>
          <c:if test="${not empty sessionScope.bw_user_collection_list}">
            <c:set var="calendar" value="${bw_user_collection_list}"
                   scope="session" />
            <c:set var="fullTree" value="true" scope="request"/>
            <c:set var="stopDescentAtAliases" value="false"
                   scope="request"/>
            <%@include file="/docs/calendar/emitCalendar.jsp"%>
          </c:if>
        </calendars>
      </calsuite>
    </subscriptions>

    <%--<bw:emitText name="calForm" property="event.trashable" tagName="trashable"/>--%>
    <bw:emitText name="calForm" property="event.recurringEntity" tagName="recurringEntity"/>

    <bw:emitRrules name="calForm" property="rruleComponents"
                   indent="    " />

    <c:if test="${not empty event.rdates}">
      <bw:emitRexdates name="event" property="rdates" indent="    " />
    </c:if>

    <c:if test="${not empty event.exdates}">
      <bw:emitRexdates name="event" property="exdates" indent="    " />
    </c:if>

    <contact>
      <c:if test="${not empty sessionScope.bw_preferred_contacts_list}">
        <c:set var="preferredContacts"
               value="${bw_preferred_contacts_list}"/>
        <preferred>
          <bw:selectContact name="calForm"
                            property="prefContactId"
                            contacts="preferredContacts"
                            indent="    "/>
        </preferred>
      </c:if>
      <all>
        <c:set var="contacts" value="${bw_contacts_list}"/>
        <bw:selectContact name="calForm"
                          property="allContactId"
                          contacts="contacts"
                          indent="    "/>
      </all>
      <c:if test="${bwconfig.autoCreateContacts}">
        <%@include file="/docs/contact/modContactCommon.jsp"%>
      </c:if>
    </contact>

    <c:if test="${not empty event.comments}">
      <comments>
        <c:forEach var="comment" items="${event.comments}" >
          <bw:emitText name="comment" property="value"/>
        </c:forEach>
      </comments>
    </c:if>

    <bw:emitXprops name="calForm" property="event.xproperties"/>

    <!-- these are the values that may be submitted to the update action -->
    <submitButtons>
      <button type="add">addEvent</button>
      <button type="update">updateEvent</button>
      <button type="cancel">cancelled</button>
      <button type="copy">copy</button>
      <button type="delete">delete</button>
    </submitButtons>
  </bw:form>
</formElements>

<suggestions>
  <c:forEach var="suggestion" items="${event.suggested}">
    <suggestion>
      <bw:emitText name="suggestion" property="status" />
      <bw:emitText name="suggestion" property="groupHref" />
      <bw:emitText name="suggestion" property="suggestedByHref" />
    </suggestion>
  </c:forEach>
</suggestions>

<timezones>
  <c:forEach var="tz" items="${globals.timeZoneNames}">
    <timezone>
      <bw:emitText name="tz" property="name" filter="true"/>
      <bw:emitText name="tz" property="id" filter="true"/>
    </timezone>
  </c:forEach>
</timezones>

<shortdaynames>
  <c:forEach var="shortDayName" items="${calInfo.shortDayNamesAdjusted}">
    <bw:emitText name="shortDayName" tagName="val"/>
  </c:forEach>
</shortdaynames>
<recurdayvals>
  <c:forEach var="recurDayName" items="${calInfo.recurDayNamesAdjusted}">
    <bw:emitText name="recurDayName" tagName="val"/>
  </c:forEach>
</recurdayvals>
<monthlabels>
  <c:forEach var="monthLabel" items="${calInfo.monthLabels}">
    <bw:emitText name="monthLabel" tagName="val"/>
  </c:forEach>
</monthlabels>
<monthvalues>
  <c:forEach var="monthVal" items="${calInfo.monthVals}">
    <bw:emitText name="monthVal" tagName="val"/>
  </c:forEach>
  <bw:emitText name="moduleState" property="viewStartDate.month"
               tagName="start"/>
</monthvalues>
