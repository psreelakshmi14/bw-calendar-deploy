<%@ page contentType="text/xml;charset=UTF-8" language="java" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>
<%
try {
%>

  <c:set var="bwconfig" value="${sessionScope.bw_client_config}" />
  <c:set var="moduleState" value="${bw_module_state}" />
  <c:set var="globals" value="${sessionScope.web_globals}" />
  <c:set var="bwsess" value="${sessionScope.org_bedework_sessstate}" />
  <c:set var="bwauthpars" value="${bwsess.authpars}" />
  <bw:emitText name="globals" property="calSuiteName" />

  <c:if test="${not empty globals.currentCalSuite}" >
    <currentCalSuite>
      <c:set var="currentCalSuite" value="globals.currentCalSuite" />
      <bw:emitText name="currentCalSuite" property="name" />
      <bw:emitText name="currentCalSuite" property="group.account" tagName="group" />
      <bw:emitText name="currentCalSuite" property="group.principalRef" tagName="groupHref" />
      <bw:emitText name="currentCalSuite" property="resourcesHome" />
      <bw:emitCurrentPrivs name="currentCalSuite" property="currentAccess" />
    </currentCalSuite>
  </c:if>

  <now><%-- The actual date right "now" - this may not be the same as currentdate --%>
    <c:set var="fmtnow" value="${globals.today.formatted}" />
    <bw:emitText name="fmtnow" property="date"/><%--
      Value: YYYYMMDD --%>
    <bw:emitText name="fmtnow" property="longDateString"
                 tagName="longdate"/><%--
      Value (example): February 8, 2004 - long representation of the date --%>
    <bw:emitText name="fmtnow" property="dateString"
                 tagName="shortdate"/><%--
      Value (example): 2/8/04 - short representation of the date --%>
    <bw:emitText name="fmtnow" property="timeString"
                 tagName="time"/><%--
      Value (example): 10:15 PM --%>
    <bw:emitText name="fmtnow" property="twoDigitHour24"
                 tagName="twodigithour24"/>
    <bw:emitText name="globals" property="today.utcDate"
                 tagName="utc"/>
    <bw:emitText name="globals" property="defaultTzid" />
  </now>

  <c:set var="ctView" value="${moduleState.curTimeView}"/>
  <c:set var="curDayFmt" value="${moduleState.curDayFmt}"/>
  <currentdate><%-- The current user-selected date --%>
    <bw:emitText name="curDayFmt" property="dateDigits"
                 tagName="date"/><%--
      Value: yyyymmdd - date value --%>
    <bw:emitText name="curDayFmt" property="fullDateString"
                 tagName="longdate"/><%--
      Value (example): Wednesday, February 11, 2004 --%>
    <bw:emitText name="curDayFmt" property="shortDateString"
                 tagName="shortdate"/><%--
      Value (example): 2/8/04 - short representation of the date --%>
    <bw:emitText name="curDayFmt" property="monthName"
                 tagName="monthname"/><%--
      Value (example): January - full month name --%>
  </currentdate>
  <c:set var="firstDayFmt" value="${moduleState.firstDayFmt}"/>
  <firstday><%-- The first date appearing in the currently selected time period --%>
    <bw:emitText name="firstDayFmt" property="dateDigits"
                 tagName="date"/><%--
      Value: yyyymmdd - date value --%>
    <bw:emitText name="firstDayFmt" property="fullDateString"
                 tagName="longdate"/><%--
      Value (example): Wednesday, February 11, 2004 --%>
    <bw:emitText name="firstDayFmt" property="shortDateString"
                 tagName="shortdate"/><%--
      Value (example): 2/8/04 - short representation of the date --%>
    <bw:emitText name="firstDayFmt" property="monthName"
                 tagName="monthname"/><%--
      Value (example): January - full month name --%>
  </firstday>
  <c:set var="lastDayFmt" value="${moduleState.lastDayFmt}"/>
  <lastday><%-- The last date appearing in the currently selected time period --%>
    <bw:emitText name="lastDayFmt" property="dateDigits"
                 tagName="date"/><%--
      Value: yyyymmdd - date value --%>
    <bw:emitText name="lastDayFmt" property="fullDateString"
                 tagName="longdate"/><%--
      Value (example): Wednesday, February 11, 2004 --%>
    <bw:emitText name="lastDayFmt" property="shortDateString"
                 tagName="shortdate"/><%--
      Value (example): 2/8/04 - short representation of the date --%>
    <bw:emitText name="lastDayFmt" property="monthName"
                 tagName="monthname"/><%--
      Value (example): January - full month name --%>
  </lastday>
  <bw:emitText name="ctView" property="prevDate"
               tagName="previousdate"/><%--
    Value: YYYYMMDD - The previous "firstdate" in the selected time period  --%>
  <bw:emitText name="ctView" property="nextDate"
               tagName="nextdate"/><%--
    Value: YYYYMMDD - The next "firstdate" in the selected time period --%>
  <bw:emitText name="ctView" property="periodName"
               tagName="periodname"/><%--
    Values: Day, Week, Month, Year - The current time period name.   --%>
  <bw:emitText name="ctView" property="multiDay"
               tagName="multiday"/><%--
    Values: true, false - Flag if we are viewing multiple days --%>
  <bw:emitText name="globals" property="hour24" /><%--
    Values: true, false - Flag if we are using 24 hour time --%>

  <bw:emitText name="globals" property="guest" /><%--
    Value: true, false - Flag if we are a guest --%>
  <c:if test="${!globals.guest}">
    <bw:emitText name="globals" property="currentUser"
                 tagName="userid"/><%--
      Value: string - Userid of non-guest user --%>
  </c:if>
  <bw:emitMsgErr name="org.bedework.client.messageobj" scope="session"
                 tagName="message" indent="  "/>
  <bw:emitMsgErr name="org.bedework.client.errorobj" scope="session"
                 tagName="error" indent="  "/>

  <c:set var="presentationState" value="${bw_presentationstate}" />
  <bw:emitText name="presentationState" property="appRoot" tagName="appRoot" /><%--
        Value: URI - the location of web resources used by the code to find the
        XSLT files.  This element is defined prior to build in
        ../../../../clones/democal.properties
        as pubevents.app.root and personal.app.root. Note that references to
        html web resources such as images are set in the xsl stylesheets. --%>
  <bw:emitText name="presentationState" property="browserResourceRoot"/>
  <bw:emitText name="org.bedework.client.urlprefix" scope="request"
               tagName="urlprefix"/><%--
        Value: URI - this is prefix of the calendar application.
        e.g. http://localhost:8080/cal
        Use this value to prefix calls to the application actions in your XSLT.
        e.g. <a href="{$urlPrefix}/eventView.do?guid=...">View Event</a> --%>

  <%-- URLs of other Bedework web clients --%>
  <bw:emitText name="bwconfig" property="personalCalendarUri"
               tagName="personaluri"/>
  <bw:emitText name="bwconfig" property="publicCalendarUri"
               tagName="publicuri"/>
  <bw:emitText name="bwconfig" property="publicAdminUri"
               tagName="adminuri"/>

  <!-- Path to calendar for public event submissions -->
  <submissionsRoot>
    <bw:emitText name="globals" property="encodedSubmissionRoot"
                 tagName="encoded"/>
    <bw:emitText name="globals" property="submissionRoot"
                 tagName="unencoded"/>
  </submissionsRoot>

  <urlPrefixes>
    <%-- Use URL prefixes when writing hyperlinks; these use the "genurl"
       struts tag to correctly build up application links within the
       container. "b=de" in the query string of each prefix has no meaning to
       the application and is not processed: it ensures that if we need to
       append the query string, we can always begin with an ampersand. --%>

    <%-- Public and personal client URLs --%>
    <setup><c:url value="/setup.do?b=de"/></setup>

    <main>
      <initialise><c:url value="/main/initialise.rdo"/></initialise>
      <setSelection><c:url value="/main/setSelection.do?b=de"/></setSelection>
      <setViewPeriod><c:url value="/main/setViewPeriod.do?b=de"/></setViewPeriod>
      <listEvents><c:url value="/main/listEvents.do?b=de"/></listEvents>
      <showPage><c:url value="/main/showPage.do?b=de"/></showPage>
    </main>

    <event>
      <eventMore><c:url value="/event/showEventMore.rdo"/></eventMore>
      <eventView><c:url value="/event/eventView.do?b=de"/></eventView>
      <addEventRef><c:url value="/event/addEventRef.do?b=de"/></addEventRef>
    </event>

    <search>
      <search><c:url value="/search/search.rdo?b=de"/></search>
      <next><c:url value="/search/next.do?b=de"/></next>
    </search>

    <misc>
      <showPage><c:url value="/misc/showPage.rdo?b=de"/></showPage>
    </misc>

    <mail>
      <mailEvent><c:url value="/mail/mailEvent.do?b=de"/></mailEvent>
    </mail>

    <stats>
      <stats><c:url value="/stats/stats.do?b=de"/></stats>
    </stats>

    <%-- The following URLs are used only in the personal client --%>
    <%-- ======================================================= --%>
    <c:if test="${!globals.guest}">
      <event>
        <initEvent><c:url value="/event/initEvent.do?b=de"/></initEvent>
        <initPendingEvents><c:url value="/event/initPendingEvents.do?b=de"/></initPendingEvents>
        <addEvent><c:url value="/event/addEvent.do?b=de"/></addEvent>
        <attendeesForEvent><c:url value="/event/attendeesForEvent.do?b=de"/></attendeesForEvent>
        <showAttendeesForEvent><c:url value="/event/showAttendeesForEvent.rdo?b=de"/></showAttendeesForEvent>
        <initMeeting><c:url value="/event/initMeeting.do?b=de"/></initMeeting>
        <editEvent><c:url value="/event/editEvent.do?b=de"/></editEvent>
        <gotoEditEvent><c:url value="/event/gotoEditEvent.do?b=de"/></gotoEditEvent>
        <updateEvent><c:url value="/event/updateEvent.do?b=de"/></updateEvent>
        <delEvent><c:url value="/event/delEvent.do?b=de"/></delEvent>
        <delInboxEvent><c:url value="/event/delInboxEvent.do?b=de"/></delInboxEvent>
        <showAccess><c:url value="/event/showAccess.rdo?b=de"/></showAccess>
        <addEventRefComplete><c:url value="/event/addEventRefComplete.do?b=de"/></addEventRefComplete>
        <selectCalForEvent><c:url value="/event/selectCalForEvent.gdo?b=de"/></selectCalForEvent>
      </event>

      <schedule>
        <showInbox><c:url value="/schedule/showInbox.rdo?b=de"/></showInbox>
        <showOutbox><c:url value="/schedule/showOutbox.rdo?b=de"/></showOutbox>
        <initAttendeeRespond><c:url value="/schedule/initAttendeeRespond.do?b=de"/></initAttendeeRespond>
        <attendeeRespond><c:url value="/schedule/attendeeRespond.do?b=de"/></attendeeRespond>
        <initAttendeeReply><c:url value="/schedule/initAttendeeReply.do?b=de"/></initAttendeeReply>
        <initAttendeeUpdate><c:url value="/schedule/initAttendeeUpdate.do?b=de"/></initAttendeeUpdate>
        <processAttendeeReply><c:url value="/schedule/processAttendeeReply.do?b=de"/></processAttendeeReply>
        <clearReply><c:url value="/schedule/clearReply.do?b=de"/></clearReply>
        <processRefresh><c:url value="/schedule/processRefresh.do?b=de"/></processRefresh>
        <refresh><c:url value="/schedule/refresh.do?b=de"/></refresh>
      </schedule>

      <calendar>
        <fetch><c:url value="/calendar/showUpdateList.rdo?b=de"/></fetch>
        <fetchDescriptions><c:url value="/calendar/showDescriptionList.rdo?b=de"/></fetchDescriptions>
        <initAdd><c:url value="/calendar/initAdd.do?b=de"/></initAdd>
        <fetchForDisplay><c:url value="/calendar/fetchForDisplay.do?b=de"/></fetchForDisplay>
      </calendar>

      <category>
        <initAdd><c:url value="/category/initAdd.do?b=de"/></initAdd>
        <initUpdate><c:url value="/category/initUpdate.do?b=de"/></initUpdate>
        <fetchForUpdate><c:url value="/category/fetchForUpdate.do?b=de"/></fetchForUpdate>
        <update><c:url value="/category/update.do?b=de"/></update>
        <delete><c:url value="/category/delete.do?b=de"/></delete>
      </category>

      <location>
        <initAdd><c:url value="/location/initAdd.do?b=de"/></initAdd>
        <initUpdate><c:url value="/location/initUpdate.do?b=de"/></initUpdate>
        <fetchForUpdate><c:url value="/location/fetchForUpdate.do?b=de"/></fetchForUpdate>
        <update><c:url value="/location/update.do?b=de"/></update>
        <delete><c:url value="/location/delete.do?b=de"/></delete>
      </location>

      <prefs>
        <fetchForUpdate><c:url value="/prefs/fetchForUpdate.do?b=de"/></fetchForUpdate>
        <update><c:url value="/prefs/update.do?b=de"/></update>
        <fetchSchedulingForUpdate><c:url value="/prefs/fetchSchedulingForUpdate.do?b=de"/></fetchSchedulingForUpdate>
        <updateSchedulingPrefs><c:url value="/prefs/updateSchedulingPrefs.do?b=de"/></updateSchedulingPrefs>
      </prefs>

      <misc>
        <upload><c:url value="/misc/upload.do?b=de"/></upload>
        <initUpload><c:url value="/misc/initUpload.rdo?b=de"/></initUpload>
      </misc>
    </c:if>
  </urlPrefixes>

  <c:forEach var="appvar" items="${sessionScope['org.bedework.client.appvars']}">
      <appvar><%--
          Application variables can be set arbitrarily by the stylesheet designer.
          Use an "appvar" by adding setappvar=key(value) to the query string of
          a URL.  This feature is useful for setting up state during a user's session.
          e.g. <a href="{$urlPrefix}/eventView.do?guid=...&setappvar=currentTab(event)">View Event</a>
          To change the value of an appvar, call the same key with a different value.
          e.g. <a href="{$urlPrefix}/setup.do?setappvar=currentTab(home)">Return Home</a>
          If appvars exist, they will be output in the following form:  --%>
      <bw:emitText name="appvar" property="key" />
      <bw:emitText name="appvar" property="value" />

      <c:if test="${(appvar.key == 'summaryMode') && (appvar.value == 'details')}"><%--
          This is a special use of the appvar feature.  Normally, we don't return
          all details about events except when we display a single event (to keep the
          XML lighter).  To return all event details in an events listing, append a
          query string with setappvar=summaryMode(details).  Turn the detailed view
          off with setappvar=summaryMode(summary).--%>
        <c:set var="detailView" value="true" scope="request"/><%--
            Send this bean to the request scope so we can test for it on the page
            that builds the calendar tree (main.jsp) --%>
      </c:if>
    </appvar>
  </c:forEach>

<c:if test="${not empty sessionScope.bw_feature_flags}">
  <bw:emitText name="bw_feature_flags" scope="session"
               tagName="featureFlags"/>
</c:if>

  <%-- System parameters --%>
  <syspars>
    <c:if test="${not empty globals.dirInfo}">
      <c:set var="dir" value="${globals.dirInfo}" />
      <bw:emitText name="dir" property="userPrincipalRoot" />
      <bw:emitText name="dir" property="groupPrincipalRoot" />
      <bw:emitText name="dir" property="ticketPrincipalRoot" />
      <bw:emitText name="dir" property="resourcePrincipalRoot" />
      <bw:emitText name="dir" property="hostPrincipalRoot" />
      <bw:emitText name="dir" property="venuePrincipalRoot" />
    </c:if>
  </syspars>

  <myCalendars>
    <jsp:include page="/docs/calendar/emitCalendars.jsp"/>
  </myCalendars>

<%
} catch (Throwable t) {
  t.printStackTrace();
}
%>

