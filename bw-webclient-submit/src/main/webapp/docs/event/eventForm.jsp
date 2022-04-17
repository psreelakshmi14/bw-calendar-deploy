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
    <bw:emitContainer name="calForm" property="event"
                      indent="    " tagName="calendar" />

    <allDay><html:checkbox property="eventStartDate.dateOnly"/></allDay>
    <storeUTC><html:checkbox property="eventStartDate.storeUTC"/></storeUTC>
    <floating><html:checkbox property="eventStartDate.floating"/></floating>
    <start>
      <bw:emitText name="calForm" property="eventStartDate.rfc3339DateTime"
                   tagName="rfc3339DateTime"/>
      <bw:emitText name="calForm" property="eventStartDate.hour"
                   tagName="temphour"/>
      <bw:select name="calForm"
                 property="eventStartDate.month"
                 optionLabels="eventStartDate.monthLabels"
                 optionValues="eventStartDate.monthVals"
                 tagName="month"
                 indent="      "/>
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
      <bw:select name="calForm"
                 property="eventStartDate.hour"
                 optionLabels="eventStartDate.hourLabels"
                 optionValues="eventStartDate.hourVals"
                 tagName="hour"
                 indent="      "/>
      <bw:select name="calForm"
                 property="eventStartDate.minute"
                 optionLabels="eventStartDate.minuteLabels"
                 optionValues="eventStartDate.minuteVals"
                 tagName="minute"
                 indent="      "/>
      <c:if test="${!calForm.hour24}" >
        <bw:select name="calForm"
                   property="eventStartDate.ampm"
                   optionLabels="eventStartDate.ampmLabels"
                   tagName="ampm"
                   indent="      "/>
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
    <desc><textarea><c:out value='${calForm.description}'/></textarea></desc>
    <bw:emitText name="calForm" property="authpars.maxPublicDescriptionLength"
                 tagName="descLength"/>
    <bw:emitText name="event" property="status"/>
    <bw:emitText name="event" property="transparency"/>
    <cost><input type="text" value="<c:out value='${event.cost}'/>" /></cost>
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
        <name><html:text property="contactName.value" size="30" styleId="iContact" styleClass="edit, highlite"/></name>
        <phone><html:text property="contact.phone" size="30" styleId="iAddPhone" styleClass="edit"/></phone>
        <link><html:text property="contact.link" size="30" styleId="iCLink" styleClass="edit"/></link>
        <email><html:text property="contact.email" size="30" styleId="iEmail" styleClass="edit"/></email>
      </c:if>
    </contact>

    <%-- As of Bedework 3.5 direct setting of categories is discouraged; admins
         should instead pick subscriptions to which they want to associate
         events.  Then, categories will be set on the event by the back-end.
         Categories will remain available for re-addition to the UI, however,
         for an advanced (perhaps) approach to creating events. --%>
    <categories>
      <bw:emitCategories name="bw_categories_list" scope="session"
                         tagName="all" indent="  " full="false"/>
      <bw:emitCategories name="event"  property="categories"
                         tagName="current" indent="    " full="false"/>
    </categories>

    <!-- return the public tree's calendars.  Will use the aliases in the tree for
         our default topical areas -->
    <calendars>
      <c:set var="calendar" value="${bw_user_collection_list}" scope="session"/>
      <c:set var="fullTree" value="true" scope="request"/>
      <c:set var="stopDescentAtAliases" value="false" scope="request"/>
      <%@include file="/docs/calendar/emitCalendar.jsp"%>
    </calendars>

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

    <bw:emitXprops name="calForm" property="event.xproperties"/>

  </bwhtml:form>
</formElements>

<editableAccess>
  <c:if test="${not empty calForm.curEventFmt}">
    <c:set var="eventFormatter" value="${calForm.curEventFmt}"/>
    <bw:emitText name="eventFormatter" property="xmlAccess" tagName="access"
                 filter="no"/>
  </c:if>
</editableAccess>

<timezones>
  <c:forEach var="tz" items="${calForm.timeZoneNames}">
    <timezone>
      <bw:emitText name="tz" property="name" filter="true"/>
      <bw:emitText name="tz" property="id" filter="true"/>
    </timezone>
  </c:forEach>
</timezones>

<%
} catch (Throwable t) {
  t.printStackTrace();
}
%>

