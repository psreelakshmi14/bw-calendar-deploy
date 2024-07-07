<%@ page contentType="text/xml;charset=UTF-8" language="java" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='https://bedework.org/jsp/taglib/bedework' prefix='bw' %>
<%
try {
%>

  <c:set var="bwconfig" value="${sessionScope.bw_client_config}" />
  <c:set var="moduleState" value="${bw_module_state}" />
  <c:set var="globals" value="${sessionScope.web_globals}" />

  <now><%-- The actual date right "now" - this may not be the same as currentdate --%>
    <bw:emitText name="globals" property="defaultTzid" />
    <c:set var="fmtnow" value="${globals.today.formatted}" />
    <bw:emitText name="fmtnow" property="date"/><%--
      Value: YYYYMMDD --%>
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

  <%-- get the default number of days for event lists --%>
  <c:set var="bwauthpars" value="${calForm.authpars}" scope="session" />
  <bw:emitText name="bwauthpars" property="defaultWebCalPeriod"
               tagName="defaultdays"/>
  <bw:emitText name="bwauthpars" property="maxWebCalPeriod"
               tagName="maxdays"/>

  <bw:emitMsgErr name="org.bedework.client.messageobj" scope="session"
                 tagName="message" indent="    "/>
  <bw:emitMsgErr name="org.bedework.client.errorobj" scope="session"
                 tagName="error" indent="    "/>
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
  <suggestionEnabled><c:out value="${globals.suggestionEnabled}"/></suggestionEnabled>
  <workflowEnabled><c:out value="${globals.workflowEnabled}"/></workflowEnabled>

  <%-- Path to collections for public event submissions --%>
  <submissionsRoot>
    <bw:emitText name="globals" property="encodedSubmissionRoot"
                 tagName="encoded"/>
    <bw:emitText name="globals" property="submissionRoot"
                 tagName="unencoded"/>
  </submissionsRoot>

  <%-- Path to collections for public event workflow --%>
  <workflowRoot>
    <bw:emitText name="globals" property="encodedWorkflowRoot"
                 tagName="encoded"/>
    <bw:emitText name="globals" property="workflowRoot"
                 tagName="unencoded"/>
  </workflowRoot>

  <urlPrefixes>
    <%-- Use URL prefixes when writing hyperlinks; these use the "c:url"
         tag to correctly build up application links within the
         container. "b=de" in the query string of each prefix has no meaning to
         the application and is not processed: it ensures that if we need to
         append the query string, we can always begin with an ampersand. --%>
    <setup><c:url value="/setup.do?b=de"/></setup>
    <initPendingTab><c:url value="/main/initPendingTab.do?b=de"/></initPendingTab>
    <initApprovalQueueTab><c:url value="/main/initApprovalQueueTab.do?b=de"/></initApprovalQueueTab>
    <initSuggestionQueueTab><c:url value="/main/initSuggestionQueueTab.do?b=de"/></initSuggestionQueueTab>
    <showCalsuiteTab><c:url value="/main/showCalsuiteTab.rdo?b=de"/></showCalsuiteTab>
    <showUsersTab><c:url value="/main/showUsersTab.rdo?b=de"/></showUsersTab>
    <showSystemTab><c:url value="/main/showSystemTab.rdo?b=de"/></showSystemTab>
    <logout><c:url value="/setup.do?logout=true"/></logout>

    <search>
      <unindex><c:url value="/index/unindex.do?b=de"/></unindex>
      <search><c:url value="/search/search.rdo?b=de"/></search>
      <next><c:url value="/search/next.do?b=de"/></next>
    </search>

    <event>
      <fetchForApprovePublish><c:url value="/event/fetchForApprovePublish.do?b=de"/></fetchForApprovePublish>
      <approvePublish><c:url value="/event/approvePublish.do?b=de"/></approvePublish>
      <showEvent><c:url value="/event/showEvent.rdo?b=de"/></showEvent>
      <showModForm><c:url value="/event/showModForm.rdo?b=de"/></showModForm>
      <showUpdateList><c:url value="/event/showUpdateList.rdo?b=de"/></showUpdateList>
      <nextUpdateList><c:url value="/event/nextUpdateList.do?b=de"/></nextUpdateList>
      <showDeleteConfirm><c:url value="/event/showDeleteConfirm.rdo?b=de"/></showDeleteConfirm>
      <initAddEvent><c:url value="/event/initAddEvent.do?b=de"/></initAddEvent>
      <initUpdateEvent><c:url value="/event/initUpdateEvent.do?b=de"/></initUpdateEvent>
      <delete><c:url value="/event/delete.do?b=de"/></delete>
      <fetchForDisplay><c:url value="/event/fetchForDisplay.do?b=de"/></fetchForDisplay>
      <fetchForUpdate><c:url value="/event/fetchForUpdate.do?b=de"/></fetchForUpdate>
      <fetchUpdateList><c:url value="/event/fetchUpdateList.do?b=de"/></fetchUpdateList>
      <update><c:url value="/event/update.do?b=de"/></update>
      <selectCalForEvent><c:url value="/event/selectCalForEvent.do?b=de"/></selectCalForEvent>
      <initUpload><c:url value="/event/initUpload.rdo?b=de"/></initUpload>
      <upload><c:url value="/event/upload.do?b=de"/></upload>
    </event>
    <suggest>
      <setStatus><c:url value="/suggest/setStatus.gdo?b=de"/></setStatus>
      <setStatusForUpdate><c:url value="/suggest/setStatusForUpdate.gdo?b=de"/></setStatusForUpdate>
    </suggest>
    <contact>
      <showContact><c:url value="/contact/showContact.do?b=de"/></showContact>
      <showReferenced><c:url value="/contact/showReferenced.do?b=de"/></showReferenced>
      <showModForm><c:url value="/contact/showModForm.do?b=de"/></showModForm>
      <showUpdateList><c:url value="/contact/showUpdateList.do?b=de"/></showUpdateList>
      <showDeleteConfirm><c:url value="/contact/showDeleteConfirm.do?b=de"/></showDeleteConfirm>
      <initAdd><c:url value="/contact/initAdd.do?b=de"/></initAdd>
      <initUpdate><c:url value="/contact/initUpdate.do?b=de"/></initUpdate>
      <delete><c:url value="/contact/delete.do?b=de"/></delete>
      <fetchForDisplay><c:url value="/contact/fetchForDisplay.do?b=de"/></fetchForDisplay>
      <fetchForUpdate><c:url value="/contact/fetchForUpdate.do?b=de"/></fetchForUpdate>
      <fetchUpdateList><c:url value="/contact/fetchUpdateList.do?b=de"/></fetchUpdateList>
      <update><c:url value="/contact/update.do?b=de"/></update>
    </contact>
    <location>
      <showLocation><c:url value="/location/showLocation.do?b=de"/></showLocation>
      <showReferenced><c:url value="/location/showReferenced.do?b=de"/></showReferenced>
      <showModForm><c:url value="/location/showModForm.do?b=de"/></showModForm>
      <showUpdateList><c:url value="/location/showUpdateList.do?b=de"/></showUpdateList>
      <showDeleteConfirm><c:url value="/location/showDeleteConfirm.do?b=de"/></showDeleteConfirm>
      <initAdd><c:url value="/location/initAdd.do?b=de"/></initAdd>
      <initUpdate><c:url value="/location/initUpdate.do?b=de"/></initUpdate>
      <delete><c:url value="/location/delete.do?b=de"/></delete>
      <fetchForDisplay><c:url value="/location/fetchForDisplay.do?b=de"/></fetchForDisplay>
      <fetchForUpdate><c:url value="/location/fetchForUpdate.do?b=de"/></fetchForUpdate>
      <fetchUpdateList><c:url value="/location/fetchUpdateList.do?b=de"/></fetchUpdateList>
      <update><c:url value="/location/update.do?b=de"/></update>
    </location>
    <category>
      <showReferenced><c:url value="/category/showReferenced.do?b=de"/></showReferenced>
      <showModForm><c:url value="/category/showModForm.do?b=de"/></showModForm>
      <showUpdateList><c:url value="/category/showUpdateList.do?b=de"/></showUpdateList>
      <showDeleteConfirm><c:url value="/category/showDeleteConfirm.do?b=de"/></showDeleteConfirm>
      <initAdd><c:url value="/category/initAdd.do?b=de"/></initAdd>
      <initUpdate><c:url value="/category/initUpdate.do?b=de"/></initUpdate>
      <delete><c:url value="/category/delete.do?b=de"/></delete>
      <fetchForUpdate><c:url value="/category/fetchForUpdate.do?b=de"/></fetchForUpdate>
      <fetchUpdateList><c:url value="/category/fetchUpdateList.do?b=de"/></fetchUpdateList>
      <update><c:url value="/category/update.do?b=de"/></update>
    </category>
    <calendar>
      <calOpenCloseMod><c:url value="/calendar/openCloseMod.do?b=de"/></calOpenCloseMod>
      <calOpenCloseSelect><c:url value="/calendar/openCloseSelect.do?b=de"/></calOpenCloseSelect>
      <calOpenCloseDisplay><c:url value="/calendar/openCloseDisplay.do?b=de"/></calOpenCloseDisplay>
      <fetch><c:url value="/calendar/showUpdateList.rdo?b=de"/></fetch>
      <fetchDescriptions><c:url value="/calendar/showDescriptionList.rdo?b=de"/></fetchDescriptions>
      <initAdd><c:url value="/calendar/initAdd.do?b=de"/></initAdd>
      <delete><c:url value="/calendar/delete.do?b=de"/></delete>
      <fetchForDisplay><c:url value="/calendar/fetchForDisplay.do?b=de"/></fetchForDisplay>
      <fetchForUpdate><c:url value="/calendar/fetchForUpdate.do?b=de"/></fetchForUpdate>
      <update><c:url value="/calendar/update.do?b=de"/></update>
      <calOpenCloseMove><c:url value="/calendar/openCloseMove.do?b=de"/></calOpenCloseMove>
      <move><c:url value="/calendar/showMoveForm.rdo?b=de"/></move>
    </calendar>
    <notifications>
      <remove><c:url value="/notify/remove.do?b=de"/></remove>
      <removeTrans><c:url value="/notify/removeTrans.do?b=de"/></removeTrans>
    </notifications>
    <subscriptions>
      <subOpenCloseMod><c:url value="/subs/openCloseMod.do?b=de"/></subOpenCloseMod>
      <fetch><c:url value="/subs/showSubs.rdo?b=de"/></fetch>
      <fetchForUpdate><c:url value="/subs/fetchForUpdate.do?b=de"/></fetchForUpdate>
      <delete><c:url value="/subs/delete.do?b=de"/></delete>
      <initAdd><c:url value="/subs/initAdd.do?b=de"/></initAdd>
      <update><c:url value="/subs/update.do?b=de"/></update>
    </subscriptions>
    <view>
      <fetch><c:url value="/view/showViews.rdo?b=de"/></fetch>
      <fetchForUpdate><c:url value="/view/fetchForUpdate.do?b=de"/></fetchForUpdate>
      <addView><c:url value="/view/addView.do?b=de"/></addView>
      <update><c:url value="/view/update.do?b=de"/></update>
      <remove><c:url value="/view/removeView.do?b=de"/></remove>
    </view>
    <calsuite>
      <fetch><c:url value="/calsuite/showCalSuites.rdo?b=de"/></fetch>
      <fetchForUpdate><c:url value="/calsuite/fetchForUpdate.do?b=de"/></fetchForUpdate>
      <add><c:url value="/calsuite/addCalSuite.do?b=de"/></add>
      <update><c:url value="/calsuite/update.do?b=de"/></update>
      <showAddForm><c:url value="/calsuite/showAddForm.rdo?b=de"/></showAddForm>
      <showModForm><c:url value="/calsuite/showModForm.rdo?b=de"/></showModForm>
      <fetchPrefsForUpdate><c:url value="/calsuite/fetchPrefsForUpdate.do?b=de"/></fetchPrefsForUpdate>
      <updatePrefs><c:url value="/calsuite/updatePrefs.do?b=de"/></updatePrefs>
    </calsuite>
    <calsuiteresources>
      <fetch><c:url value="/resource/showResources.rdo?b=de"/></fetch>
      <edit><c:url value="/resource/editResource.rdo?b=de"/></edit>
      <add><c:url value="/resource/addResource.do?b=de"/></add>
      <update><c:url value="/resource/updateResource.do?b=de"/></update>
      <remove><c:url value="/resource/removeResource.do?b=de"/></remove>
    </calsuiteresources>
    <globalresources>
      <fetch><c:url value="/globalres/showResources.rdo?b=de"/></fetch>
      <edit><c:url value="/globalres/editResource.rdo?b=de"/></edit>
      <add><c:url value="/globalres/addResource.do?b=de"/></add>
      <update><c:url value="/globalres/updateResource.do?b=de"/></update>
      <remove><c:url value="/globalres/removeResource.do?b=de"/></remove>
    </globalresources>
    <system>
      <fetch><c:url value="/syspars/fetch.do?b=de"/></fetch>
      <update><c:url value="/syspars/update.do?b=de"/></update>
    </system>
    <stats>
      <update><c:url value="/stats/update.do?b=de"/></update>
    </stats>
    <timezones>
      <showUpload><c:url value="/timezones/showUpload.rdo?b=de"/></showUpload>
      <initUpload><c:url value="/timezones/initUpload.do?b=de"/></initUpload>
      <upload><c:url value="/timezones/upload.do?b=de"/></upload>
      <fix><c:url value="/timezones/fix.do?b=de"/></fix>
    </timezones>
    <authuser>
      <showModForm><c:url value="/authuser/showModForm.do?b=de"/></showModForm>
      <showUpdateList><c:url value="/authuser/showUpdateList.do?b=de"/></showUpdateList>
      <getAuthUsers><c:url value="/authuser/getAuthUsers.do?b=de"/></getAuthUsers>
      <initUpdate><c:url value="/authuser/initUpdate.do?b=de"/></initUpdate>
      <fetchForUpdate><c:url value="/authuser/fetchForUpdate.do?b=de"/></fetchForUpdate>
      <update><c:url value="/authuser/update.do?b=de"/></update>
    </authuser>
    <prefs>
      <fetchForUpdate><c:url value="/prefs/fetchForUpdate.do?b=de"/></fetchForUpdate>
      <update><c:url value="/prefs/update.do?b=de"/></update>
    </prefs>
    <admingroup>
      <showModForm><c:url value="/admingroup/showModForm.rdo?b=de"/></showModForm>
      <showModMembersForm><c:url value="/admingroup/showModMembersForm.rdo?b=de"/></showModMembersForm>
      <showUpdateList><c:url value="/admingroup/showUpdateList.rdo?b=de"/></showUpdateList>
      <showChooseGroup><c:url value="/admingroup/showChooseGroup.rdo?b=de"/></showChooseGroup>
      <showDeleteConfirm><c:url value="/admingroup/showDeleteConfirm.rdo?b=de"/></showDeleteConfirm>
      <initAdd><c:url value="/admingroup/initAdd.do?b=de"/></initAdd>
      <initUpdate><c:url value="/admingroup/initUpdate.do?b=de"/></initUpdate>
      <delete><c:url value="/admingroup/delete.do?b=de"/></delete>
      <fetchForUpdate><c:url value="/admingroup/fetchForUpdate.do?b=de"/></fetchForUpdate>
      <fetchForUpdateMembers><c:url value="/admingroup/fetchForUpdateMembers.do?b=de"/></fetchForUpdateMembers>
      <fetchUpdateList><c:url value="/admingroup/fetchUpdateList.do?b=de"/></fetchUpdateList>
      <update><c:url value="/admingroup/update.do?b=de"/></update>
      <updateMembers><c:url value="/admingroup/updateMembers.do?b=de"/></updateMembers>
      <switch><c:url value="/admingroup/switch.do?b=de"/></switch>
    </admingroup>
    <filter>
      <showAddForm><c:url value="/filter/getFilters.rdo?b=de"/></showAddForm>
      <add><c:url value="/filter/add.do?b=de"/></add>
      <delete><c:url value="/filter/delete.do?b=de"/></delete>
    </filter>
  </urlPrefixes>

  <bw:emitText name="calForm" property="calSuiteName" />

  <c:if test="${not empty calForm.currentCalSuite}" >
    <currentCalSuite>
      <bw:emitText name="calForm" property="currentCalSuite.name" tagName="name" />
      <bw:emitText name="calForm" property="currentCalSuite.group.account" tagName="group" />
      <bw:emitText name="calForm" property="currentCalSuite.group.principalRef" tagName="groupHref" />
      <bw:emitText name="calForm" property="currentCalSuite.resourcesHome" tagName="resourcesHome" />
      <bw:emitCurrentPrivs name="calForm" property="currentCalSuite.currentAccess" tagName="currentAccess"/>
    </currentCalSuite>
  </c:if>

  <notifications>
    <c:if test="${not empty calForm.notificationInfo}" >
        <c:set var="notificationInfo"
               value="${calForm.notificationInfo}" />
        <%@include file="/docs/notifications/notificationInfo.jsp"%>
    </c:if>
  </notifications>

  <userInfo>
    <%-- user type --%>
    <bw:emitText name="calForm" property="curUserContentAdminUser"
                 tagName="contentAdminUser" />
    <bw:emitText name="calForm" property="curUserApproverUser"
                 tagName="approverUser" />
    <bw:emitText name="globals" property="superUser" />
    <userMaintOK><c:out value="${calForm.userMaintOK}"/></userMaintOK>
    <adminGroupMaintOk><c:out value="${calForm.adminGroupMaintOK}"/></adminGroupMaintOk>

    <%-- user and group --%>
    <bw:emitText name="globals" property="currentUser"/>
    <bw:emitText name="globals" property="adminUserId" tagName="user"/>
    <c:if test="${not empty calForm.adminGroupName}" >
      <bw:emitText name="calForm" property="adminGroupName" tagName="group"/>
      <bw:emitText name="calForm" property="oneGroup"/>
    </c:if>
    <groups>
      <c:if test="${not empty sessionScope.bw_user_admin_search_groups}" >
        <c:forEach var="adminGroup" items="${sessionScope.bw_user_admin_search_groups}" >
          <group>
            <bw:emitText name="adminGroup" property="account"
                         tagName="name"/>
            <bw:emitText name="adminGroup" property="principalRef"
                         tagName="href"/>
            <bw:emitText name="adminGroup" property="ownerHref"
                         tagName="ownerHref"/>
            <bw:emitText name="adminGroup" property="description"
                         tagName="desc"/>
          </group>
        </c:forEach>
      </c:if>
    </groups>
  </userInfo>

  <%-- System parameters and directory info--%>
  <syspars>
    <c:if test="${not empty calForm.dirInfo}" >
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

  <c:if test="${not empty sessionScope.bw_feature_flags}" >
      <bw:emitText name="bw_feature_flags" scope="session"
                   tagName="featureFlags"/>
  </c:if>

  <c:forEach var="appvar" items="${sessionScope['org.bedework.client.appvars']}">
    <appvar>
      <bw:emitText name="appvar" property="key" />
      <bw:emitText name="appvar" property="value" />
    </appvar>
  </c:forEach>

<%
} catch (Throwable t) {
  t.printStackTrace();
}
%>
