<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

<c:set var="userPrefs" value="${calForm.userPreferences}"/>
<prefs>
  <bw:emitText name="userPrefs" property="ownerHref"
               tagName="user"/>
  <!-- name of default view (collection of subscriptions) that will appear upon login -->
  <bw:emitText name="userPrefs" property="preferredView"/>
  <!-- default mode of view:
       daily - a list of events grouped by date showing entire view period
       list - a list of discrete events from now into the future
       grid - calendar grid - in week and month view periods
  -->
  <bw:emitText name="userPrefs" property="defaultViewMode"/>
  <!-- default period that will appear upon login (day, week, month, year, today) -->
  <bw:emitText name="userPrefs" property="preferredViewPeriod"/>
  <!-- whether user will use 12 (am/pm) or 24 hour mode when entering events -->
  <bw:emitText name="userPrefs" property="hour24"/>
  <bw:emitText name="userPrefs" property="noNotifications"/>
  <bw:emitText name="userPrefs" property="skinName"/>
  <bw:emitText name="userPrefs" property="skinStyle"/>
  <!-- pref end type = date or duration -->
  <bw:emitText name="userPrefs" property="preferredEndType"/>
  <bw:emitText name="userPrefs" property="defaultImageDirectory"/>
  <bw:emitText name="userPrefs" property="maxEntitySize"/>

  <bw:emitText name="userPrefs" property="pageSize"/>
  <bw:emitText name="userPrefs" property="adminResourcesDirectory"/>
  <bw:emitText name="userPrefs" property="suiteResourcesDirectory"/>
  <bw:emitText name="userPrefs" property="categoryMapping"/>
  <bw:emitText name="userPrefs" property="calsuiteApprovers"/>
  <approvers>
    <c:forEach var="approver" items="${userPrefs.calsuiteApproversList}">
      <bw:emitText name="approver"/>
    </c:forEach>
  </approvers>
</prefs>

<categories>
  <bw:emitCategories name="bw_categories_list" scope="session"
                     tagName="all" indent="  "/>
  <bw:emitCategories name="bw_default_categories_list" scope="session"
                     tagName="current" indent="  "/>
</categories>


