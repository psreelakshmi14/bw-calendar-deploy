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
  <bw:emitText name="ctView" property="periodName"
               tagName="periodname"/><%--
    Values: Day, Week, Month, Year - The current time period name.   --%>
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
  <bw:emitMsgErr name="calForm" property="msg"
                 tagName="message" indent="  "/>
  <bw:emitMsgErr name="calForm" property="err"
                 tagName="error" indent="  "/>

  <c:set var="presentationState" value="${bw_presentationstate}" />
  <bw:emitText name="presentationState" property="appRoot" tagName="appRoot" /><%--
        Value: URI - the location of web resources used by the code to find the
        XSLT files.  This element is defined prior to build in
        ../../../../clones/democal.properties
        as pubevents.app.root and personal.app.root. Note that references to
        html web resources such as images are set in the xsl stylesheets. --%>
  <bw:emitText name="presentationState" property="browserResourceRoot"/>
  <bw:emitText name="calForm" property="urlPrefix"
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
    <%-- Use URL prefixes when writing hyperlinks; these use the "c:url"
       tag to correctly build up application links within the
       container. "b=de" in the query string of each prefix has no meaning to
       the application and is not processed: it ensures that if we need to
       append the query string, we can always begin with an ampersand. --%>

    <%-- Public and personal client URLs --%>
    <setup><c:url value="/setup.do?b=de"/></setup>

    <main>
      <initialise><c:url value="/main/initialise.rdo"/></initialise>
      <eventsFeed><c:url value="/main/eventsFeed.do?b=de"/></eventsFeed>
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

    <search>
      <search><c:url value="/search/search.rdo?b=de"/></search>
      <next><c:url value="/search/next.do?b=de"/></next>
    </search>

    <misc>
      <export><c:url value="/misc/export.gdo?b=de"/></export>
      <showPage><c:url value="/misc/showPage.rdo?b=de"/></showPage>
      <async><c:url value="/misc/async.do?b=de"/></async>
    </misc>

    <stats>
      <stats><c:url value="/stats/stats.do?b=de"/></stats>
    </stats>
  </urlPrefixes>

  <bw:emitText name="calForm" property="confirmationId"
               tagName="confirmationid"/><%--
        Value: String - a 16 character random string used to allow users to confirm
        additions to their private calendar.  DEPRECATED. --%>

  <c:forEach var="appvar" items="${calForm.appVars}">
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

  <selectionState><%--
    What type of information have we selected to display?  Used to
    branch between different templates in the xsl based on user selections. --%>
    <bw:emitText name="moduleState" property="selectionType"/><%--
        Value: view,search,collections,filter
        Used to branch into different presentation depending on the type of
        output we expect --%>
    <filter></filter> <%-- unimplemented --%>
  </selectionState>

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

  <c:if test="${not empty sessionScope.bw_feature_flags}">
      <bw:emitText name="bw_feature_flags" scope="session"
                   tagName="featureFlags"/>
  </c:if>
<%
} catch (Throwable t) {
  t.printStackTrace();
}
%>

