<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='struts-html' prefix='html' %>
<%@ taglib uri='struts-genurl' prefix='genurl' %>
<%@ taglib uri='bedework' prefix='bw' %>
<html:xhtml/>


<%
try {
%>

<c:set var="event" value="${calForm.event}"/>
<formElements>
  <subscriptionId></subscriptionId>
  <bw:emitText name="event" property="uid"
               tagName=""guid"/">
  <bw:emitText name="event" property="recurrenceId"/>

  <genurl:form action="event/editEvent">
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
      <logic:notEqual name="calForm" property="hour24" value="true" >
        <ampm>
          <html:select property="eventStartDate.ampm">
            <html:options property="eventStartDate.ampmLabels"/>
          </html:select>
        </ampm>
      </logic:notEqual>
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
          <logic:notEqual name="calForm" property="hour24" value="true" >
            <html:select property="eventEndDate.ampm">
              <html:options property="eventEndDate.ampmLabels"/>
            </html:select>
          </logic:notEqual>
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
    <desc><html:textarea property="description"></html:textarea></desc>
    <bw:emitText name="calForm" property="authpars.maxPublicDescriptionLength"
                 tagName="descLength"/>
    <bw:emitText name="event" property="status"/>
    <bw:emitText name="event" property="transparency"/>
    <cost><html:text name="event" property="cost"/></cost>
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
      <logic:equal name="bwconfig" property="autoCreateContacts"
                 value="true">
        <name><html:text property="contactName.value" size="30" styleId="iContact" styleClass="edit, highlite"/></name>
        <phone><html:text property="contact.phone" size="30" styleId="iAddPhone" styleClass="edit"/></phone>
        <link><html:text property="contact.link" size="30" styleId="iCLink" styleClass="edit"/></link>
        <email><html:text property="contact.email" size="30" styleId="iEmail" styleClass="edit"/></email>
      </logic:equal>
    </contact>

    <%-- As of Bedework 3.5 direct setting of categories is discouraged; admins
         should instead pick subscriptions to which they want to associate
         events.  Then, categories will be set on the event by the back-end.
         Categories will remain available for re-addition to the UI, however,
         for an advanced (perhaps) approach to creating events. --%>
    <categories>
      <all>
        <logic:iterate id="category" name="bw_categories_list" scope="session">
          <category>
            <bw:emitText name="category" property="word.value" tagName="value" />
            <bw:emitText name="category" property="uid" tagName="uid" />
          </category>
        </logic:iterate>
      </all>
      <current>
        <c:if test="${not empty event.categories}">
          <logic:iterate id="category" name="event" property="categories">
            <category>
              <bw:emitText name="category" property="word.value"
                           tagName="keyword"/>
            </category>
          </logic:iterate>
        </c:if>
      </current>
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

  </genurl:form>
</formElements>

<editableAccess>
  <c:if test="${not empty calForm.curEventFmt}">
    <c:set var="eventFormatter" value=""${calForm.curEventFmt}"/>
    <bw:emitText name="eventFormatter" property="xmlAccess" tagName="access"
                 filter="no"/>
  </c:if>
</editableAccess>

<timezones>
  <logic:iterate id="tz" name="calForm" property="timeZoneNames">
    <timezone>
      <bw:emitText name="tz" property="name" filter="true"/>
      <bw:emitText name="tz" property="id" filter="true"/>
    </timezone>
  </logic:iterate>
</timezones>

<%
} catch (Throwable t) {
  t.printStackTrace();
}
%>

