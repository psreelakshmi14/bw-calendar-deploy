<%@ page contentType="text/xml;charset=UTF-8" language="java" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>
<%
try {
%>

  <c:set var="bwconfig" value="${calForm.config}" scope="session" />
  <c:set var="moduleState" value="${bw_module_state}" />

  <now><%-- The actual date right "now" - this may not be the same as currentdate --%>
    <c:set var="fmtnow" value="${calForm.today.formatted}" />
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
    <bw:emitText name="calForm" property="today.utcDate"
                 tagName="utc"/>
    <bw:emitText name="calForm" property="defaultTzid" />
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
  <bw:emitText name="calForm" property="hour24" /><%--
    Values: true, false - Flag if we are using 24 hour time --%>

  <bw:emitText name="calForm" property="publicView"
               tagName="publicview"/><%--
    Values: true, false - Flag if we are in the guest (public) view  --%>
  <bw:emitText name="calForm" property="guest" /><%--
    Value: true, false - Flag if we are a guest --%>
  <c:if test="${!calForm.guest}">
    <bw:emitText name="calForm" property="currentUser"
                 tagName="userid"/><%--
      Value: string - Userid of non-guest user --%>
      <c:forEach var="group" items="${calForm.currentGroups}" >
        <bw:emitText name="group" property="principalRef"
                     tagName="memberOf"/>
      </c:forEach>
  </c:if>
  <bw:emitMsgErr name="org.bedework.client.messageobj" scope="session"
                 tagName="message" indent="  "/>
  <bw:emitMsgErr name="org.bedework.client.errorobj" scope="session"
                 tagName="error" indent="  "/>

  <c:set var="preferences" value="${bw_preferences}" />
  <bw:emitText name="preferences" property="preferredEndType" />

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
      <setSelectionList><c:url value="/main/setSelectionList.do?b=de"/></setSelectionList>
      <setMainEventList><c:url value="/main/setMainEventList.do?b=de"/></setMainEventList>
      <nextMainEventList><c:url value="/main/nextMainEventList.do?b=de"/></nextMainEventList>
      <setOngoingList><c:url value="/main/setOngoingList.do?b=de"/></setOngoingList>
      <setViewPeriod><c:url value="/main/setViewPeriod.do?b=de"/></setViewPeriod>
      <listEvents><c:url value="/main/listEvents.do?b=de"/></listEvents>
      <showPage><c:url value="/main/showPage.do?b=de"/></showPage>
    </main>

    <event>
      <eventMore><c:url value="/event/showEventMore.rdo"/></eventMore>
      <eventView><c:url value="/event/eventView.do?b=de"/></eventView>
      <addEventRef><c:url value="/event/addEventRef.do?b=de"/></addEventRef>
    </event>

    <calendar>
      <fetchPublicCalendars><c:url value="/calendar/fetchPublicCalendars.do?b=de"/></fetchPublicCalendars>
      <fetchCalendars><c:url value="/calendar/fetchCalendars.do?b=de"/></fetchCalendars>
      <fetchForExport><c:url value="/calendar/fetchForExport.do?b=de"/></fetchForExport>
    </calendar>

    <sharing>
      <shareCollection><c:url value="/sharing/sharecol.do?b=de"/></shareCollection>
      <reply><c:url value="/sharing/reply.do?b=de"/></reply>
    </sharing>

    <notifications>
      <remove><c:url value="/notify/remove.do?b=de"/></remove>
      <removeTrans><c:url value="/notify/removeTrans.do?b=de"/></removeTrans>
    </notifications>

    <search>
      <search><c:url value="/search/search.rdo?b=de"/></search>
      <next><c:url value="/search/next.do?b=de"/></next>
    </search>

    <misc>
      <export><c:url value="/misc/export.gdo?b=de"/></export>
      <showPage><c:url value="/misc/showPage.rdo?b=de"/></showPage>
      <async><c:url value="/misc/async.do?b=de"/></async>
    </misc>

    <mail>
      <mailEvent><c:url value="/mail/mailEvent.do?b=de"/></mailEvent>
    </mail>

    <stats>
      <stats><c:url value="/stats/stats.do?b=de"/></stats>
    </stats>

    <%-- The following URLs are used only in the personal client --%>
    <%-- ======================================================= --%>
    <c:if test="${!calForm.guest}">
      <event>
        <initEvent><c:url value="/event/initEvent.do?b=de"/></initEvent>
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
        <addEventSubComplete><c:url value="/event/addEventSubComplete.do?b=de"/></addEventSubComplete>
        <selectCalForEvent><c:url value="/event/selectCalForEvent.gdo?b=de"/></selectCalForEvent>
        <requestFreeBusy><c:url value="/event/requestFreeBusy.gdo?b=de"/></requestFreeBusy>
      </event>

      <widget>
        <attendees><c:url value="/widget/attendees.do?b=de"/></attendees>
      </widget>

      <schedule>
        <showInbox><c:url value="/schedule/showInbox.rdo?b=de"/></showInbox>
        <initAttendeeRespond><c:url value="/schedule/initAttendeeRespond.do?b=de"/></initAttendeeRespond>
        <attendeeRespond><c:url value="/schedule/attendeeRespond.do?b=de"/></attendeeRespond>
        <initAttendeeReply><c:url value="/schedule/initAttendeeReply.do?b=de"/></initAttendeeReply>
        <initAttendeeUpdate><c:url value="/schedule/initAttendeeUpdate.do?b=de"/></initAttendeeUpdate>
        <changeStatus><c:url value="/schedule/changeStatus.do?b=de"/></changeStatus>
        <processAttendeeReply><c:url value="/schedule/processAttendeeReply.do?b=de"/></processAttendeeReply>
        <clearReply><c:url value="/schedule/clearReply.do?b=de"/></clearReply>
        <processRefresh><c:url value="/schedule/processRefresh.do?b=de"/></processRefresh>
        <refresh><c:url value="/schedule/refresh.do?b=de"/></refresh>
      </schedule>

      <freeBusy>
        <fetch><c:url value="/freeBusy/getFreeBusy.do?b=de"/></fetch>
      </freeBusy>

      <calendar>
        <fetch><c:url value="/calendar/showUpdateList.rdo?b=de"/></fetch>
        <fetchDescriptions><c:url value="/calendar/showDescriptionList.rdo?b=de"/></fetchDescriptions>
        <initAdd><c:url value="/calendar/initAdd.do?b=de"/></initAdd>
        <delete><c:url value="/calendar/delete.do?b=de"/></delete>
        <fetchForDisplay><c:url value="/calendar/fetchForDisplay.do?b=de"/></fetchForDisplay>
        <fetchForUpdate><c:url value="/calendar/fetchForUpdate.do?b=de"/></fetchForUpdate>
        <update><c:url value="/calendar/update.do?b=de"/></update>
        <listForExport><c:url value="/calendar/listForExport.rdo?b=de"/></listForExport>
        <setPropsInGrid><c:url value="/calendar/setPropsInGrid.do?b=de"/></setPropsInGrid>
        <setPropsInList><c:url value="/calendar/setPropsInList.do?b=de"/></setPropsInList>
      </calendar>

      <sharing>
        <initAddSubscription><c:url value="/sharing/initAddSubscription.do?b=de"/></initAddSubscription>
        <subscribe><c:url value="/sharing/subscribe.do?b=de"/></subscribe>
      </sharing>

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

      <vpoll>
        <initManageVpoll><c:url value="/vpoll/initManageVpoll.do?b=de"/></initManageVpoll>
      </vpoll>

      <misc>
        <upload><c:url value="/misc/upload.do?b=de"/></upload>
        <initUpload><c:url value="/misc/initUpload.rdo?b=de"/></initUpload>
      </misc>

      <alarm>
        <initEventAlarm><c:url value="/alarm/initEventAlarm.do?b=de"/></initEventAlarm>
        <setAlarm><c:url value="/alarm/setAlarm.do?b=de"/></setAlarm>
      </alarm>

    </c:if>
  </urlPrefixes>

  <bw:emitText name="calForm" property="confirmationId"
               tagName="confirmationid"/><%--
        Value: String - a 16 character random string used to allow users to confirm
        additions to their private calendar.  DEPRECATED. --%>

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

<c:if test="${not empty sessionScope.web_globals.currentLocale}" >
  <bw:emitText name="web_globals" property="currentLocale"
               scope="session" tagName="currentLocale"/>
  </c:if>

  <c:if test="${not empty sessionScope.bw_cache_prefix}">
    <bw:emitText name="bw_cache_prefix" scope="session"
                 tagName="cachePrefix"/>
  </c:if>

  <c:if test="${not empty sessionScope.bw_feature_flags}">
    <bw:emitText name="bw_feature_flags" scope="session"
                 tagName="featureFlags"/>
  </c:if>

  <schedulingMessages>
    <c:if test="${not empty calForm.inBoxInfo}" >
      <c:set var="boxInfo" value="${calForm.inBoxInfo}" />
      <%@include file="/docs/schedule/inoutbox.jsp"%>
    </c:if>
  </schedulingMessages>

  <notifications>
    <c:if test="${not empty calForm.notificationInfo}" >
      <c:set var="notificationInfo" value="${calForm.notificationInfo}" />
      <%@include file="/docs/notifications/notificationInfo.jsp"%>
    </c:if>
  </notifications>

  <selectionState><%--
    What type of information have we selected to display?  Used to
    branch between different templates in the xsl based on user selections. --%>
    <bw:emitText name="moduleState" property="selectionType"/><%--
        Value: view,search,collections,filter
        Used to branch into different presentation depending on the type of
        output we expect --%>
    <filter></filter> <%-- unimplemented --%>
  </selectionState>

  <%-- List of views for menuing --%>
  <views>
    <c:if test="${not empty sessionScope.bw_views_list}">
      <c:forEach var="view" items="${sessionScope.bw_views_list}">
        <view>
          <bw:emitText name="view" property="name"/>
          <paths>
            <c:if test="${not empty view.collectionPaths}">
              <c:forEach var="path" items="${view.collectionPaths}">
                <bw:emitText name="path"/>
              </c:forEach>
            </c:if>
          </paths>
        </view>
      </c:forEach>
    </c:if>
  </views>

<%-- List of filters for menuing --%>
  <filters>
    <c:if test="${not empty sessionScope.bw_filters_list}">
      <c:forEach var="view" items="${sessionScope.bw_filters_list}">
        <filter>
          <bw:emitText name="filter" property="name"/>
        </filter>
      </c:forEach>
    </c:if>
  </filters>

  <%-- System parameters --%>
  <syspars>
    <c:if test="${not empty calForm.dirInfo}">
      <c:set var="dir" value="${calForm.dirInfo}" />
      <bw:emitText name="dir" property="userPrincipalRoot" />
      <bw:emitText name="dir" property="groupPrincipalRoot" />
      <bw:emitText name="dir" property="ticketPrincipalRoot" />
      <bw:emitText name="dir" property="resourcePrincipalRoot" />
      <bw:emitText name="dir" property="hostPrincipalRoot" />
      <bw:emitText name="dir" property="venuePrincipalRoot" />
    </c:if>
  </syspars>

  <c:if test="${not empty calForm.imageUploadDirectory}" >
    <bw:emitText name="calForm" property="imageUploadDirectory" />
  </c:if>

  <%-- Output the calendar tree --%>
  <myCalendars>
    <jsp:include page="/docs/calendar/emitCalendars.jsp"/>
  </myCalendars>
<%
} catch (Throwable t) {
  t.printStackTrace();
}
%>

