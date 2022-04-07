<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-html' prefix='html' %>
<%@ taglib uri='bwhtml' prefix='bwhtml' %>
<%@ taglib uri='bedework' prefix='bw' %>

<bw:emitText name="calForm" property="addingEvent"
             tagName="creating"/>
<bw:emitText name="calForm" property="hour24" /><%--
    Values: true, false - Flag if we are using 24 hour time --%>
<bw:emitText name="calForm" property="authpars.maxInstances" />
<bw:emitText name="calForm" property="authpars.maxYears" />
<bw:emitText name="calForm" property="config.registrationsExternal"
             tagName="registrationsExternal"/>
<bw:emitCurrentPrivs name="calForm" property="eventInfo.currentAccess" />

<c:set var="event" value="${calForm.event}" scope="request"  />

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

  <bwhtml:form action="event/update" >
    <title><html:text property="summary" size="40" styleId="iTitle" styleClass="edit"/></title>
    <deleted><html:checkbox property="event.deleted" /></deleted>
    <calendar>
      <c:if test="${not empty calForm.preferredCalendars}">
        <%-- all publishing calendars a user has previously used. --%>
        <preferred>
          <html:select property="prefCalendarId">
              <html:optionsCollection property="preferredCalendars"
                                        label="path"
                                        value="path"/>
          </html:select>
        </preferred>
      </c:if>
      <%-- all publishing calendars to which user has write access;
           in single calendar model, there will be only one. --%>
      <all>
        <c:set var="addContentCalendarCollections"
               value="${bw_addcontent_collection_list}" />
        <html:select property="calendarId">
          <html:optionsCollection name="addContentCalendarCollections"
                                  label="path"
                                  value="path"/>
        </html:select>
      </all>
      <%-- Output the event's calendar information --%>
      <bw:emitContainer name="calForm" property="event"
                        indent="        "/>
    </calendar>
    <allDay><html:checkbox property="eventStartDate.dateOnly"/></allDay>
    <storeUTC><html:checkbox property="eventStartDate.storeUTC"/></storeUTC>
    <floating><html:checkbox property="eventStartDate.floating"/></floating>
    <start>
      <bw:emitText name="calForm" property="eventStartDate.rfc3339DateTime"
                   tagName="rfc3339DateTime"/>
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
      <year>
        <html:select property="eventStartDate.year">
          <html:options property="yearVals"/>
        </html:select>
      </year>
      <yearText>
        <html:text property="eventStartDate.year" size="4"/>
      </yearText>
      <hour>
        <html:select property="eventStartDate.hour">
          <html:options labelProperty="eventStartDate.hourLabels"
                        property="eventStartDate.hourVals"/>
        </html:select>
      </hour>
      <minute>
        <html:select property="eventStartDate.minute">
          <html:options labelProperty="eventStartDate.minuteLabels"
                        property="eventStartDate.minuteVals"/>
        </html:select>
      </minute>
      <c:if test="${!calForm.hour24}" >
        <ampm>
          <html:select property="eventStartDate.ampm">
            <html:options property="eventStartDate.ampmLabels"/>
          </html:select>
        </ampm>
      </c:if>
      <bw:emitText name="calForm" property="eventStartDate.tzid" tagName="tzid"/>
    </start>
    <end>
      <bw:emitText name="calForm" property="eventEndDate.rfc3339DateTime"
                   tagName="rfc3339DateTime"/>
      <bw:emitText name="calForm" property="eventEndType"
                   tagName="type"/>
      <dateTime>
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
        <year>
          <html:select property="eventEndDate.year">
            <html:options property="yearVals"/>
          </html:select>
          </year>
        <yearText>
          <html:text property="eventEndDate.year" size="4"/>
        </yearText>
        <hour>
          <html:select property="eventEndDate.hour">
            <html:options labelProperty="eventEndDate.hourLabels"
                          property="eventEndDate.hourVals"/>
          </html:select>
        </hour>
        <minute>
          <html:select property="eventEndDate.minute">
            <html:options labelProperty="eventEndDate.minuteLabels"
                          property="eventEndDate.minuteVals"/>
          </html:select>
        </minute>
        <ampm>
          <c:if test="${!calForm.hour24}" >
            <html:select property="eventEndDate.ampm">
              <html:options property="eventEndDate.ampmLabels"/>
            </html:select>
          </c:if>
        </ampm>
        <bw:emitText name="calForm" property="eventEndDate.tzid" tagName="tzid"/>
      </dateTime>
      <duration>
        <days><html:text property="eventDuration.daysStr" size="2" /></days>
        <hours><html:text property="eventDuration.hoursStr" size="2" /></hours>
        <minutes><html:text property="eventDuration.minutesStr" size="2" /></minutes>
        <weeks><html:text property="eventDuration.weeksStr" size="2" /></weeks>
      </duration>
    </end>
    <desc><html:textarea property="description" rows="8" cols="55" styleId="iDesc" styleClass="edit"></html:textarea></desc>
    <bw:emitText name="calForm" property="authpars.maxPublicDescriptionLength"
                 tagName="descLength"/>
    <bw:emitText name="calForm" property="event.status"
                 tagName="status"/>
    <cost><html:text property="event.cost" size="30" styleId="iCost" styleClass="edit"/></cost>
    <link><html:text property="event.link" size="30" styleId="iLink" styleClass="edit"/></link>
    <location>
      <c:if test="${not empty sessionScope.bw_preferred_locations_list}">
        <preferred>
          <c:set var="preferredLocations"
                 value="${bw_preferred_locations_list}" />
          <html:select property="prefLocationId">
            <html:optionsCollection name="preferredLocations"
                                    label="address.value"
                                    value="uid"/>
          </html:select>
        </preferred>
      </c:if>
      <all>
        <c:set var="locations"
               value="${bw_locations_list}" />
        <html:select property="allLocationId">
          <html:optionsCollection name="locations"
                                  label="address.value"
                                  value="uid"/>
          </html:select>
      </all>
      <c:if test="${bwconfig.autoCreateLocations}">
        <address>
          <html:text size="30" value="" property="location.address.value" styleId="iLocation" styleClass="edit"/>
        </address>
        <link>
          <html:text property="location.link" size="30" styleId="iLocLink" styleClass="edit"/>
        </link>
      </c:if>
    </location>

    <c:if test="${calForm.suggestionEnabled}" >
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
        <bw:emitText name="calForm" property="currentCalSuite.name" tagName="name" />
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
          <html:select property="prefContactId">
            <html:optionsCollection name="preferredContacts"
                                    label="cn.value"
                                    value="uid"/>
          </html:select>
        </preferred>
      </c:if>
      <all>
        <c:set var="contacts" value="${bw_contacts_list}"/>
        <html:select property="allContactId">
          <html:optionsCollection name="contacts"
                                  label="cn.value"
                                  value="uid"/>
        </html:select>
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
  </bwhtml:form>
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
  <c:forEach var="tz" items="${calForm.timeZoneNames}">
    <timezone>
      <bw:emitText name="tz" property="name" filter="true"/>
      <bw:emitText name="tz" property="id" filter="true"/>
    </timezone>
  </c:forEach>
</timezones>

<c:set var="calInfo" value="${moduleState.calInfo}" />
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
