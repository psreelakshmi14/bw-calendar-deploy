<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>modPrefs</page>
<c:set var="userPrefs" value="${calForm.userPreferences}"/>
<prefs>
  <bw:emitText name="userPrefs" property="ownerHref"
               tagName="user"/>
  <bw:emitText name="userPrefs" property="email"/>
  <!-- default calendar into which events will be placed -->
  <defaultCalendar>
    <bw:emitText name="userPrefs" property="defaultCalendarPath"
                 tagName="path"/>
    <subName></subName>
  </defaultCalendar>
  <!-- name of default view (collection of subscriptions) that will appear upon login -->
  <bw:emitText name="userPrefs" property="preferredView"/>
  <!-- default period that will appear upon login (day, week, month, year, today) -->
  <bw:emitText name="userPrefs" property="preferredViewPeriod"/>
  <!-- whether user will use 12 (am/pm) or 24 hour mode when entering events -->
  <bw:emitText name="userPrefs" property="hour24"/>
  <!-- skinName is XSL skin name; skinStyle is intended for CSS stylesheet name -->
  <bw:emitText name="userPrefs" property="skinName"/>
  <bw:emitText name="userPrefs" property="skinStyle"/>
  <!-- string of chars representing the days -->
  <bw:emitText name="userPrefs" property="workDays"/>
  <!-- start and end in minutes: e.g. 14:30 is 870 and 17:30 is 1050 -->
  <bw:emitText name="userPrefs" property="workdayStart"/>
  <bw:emitText name="userPrefs" property="workdayEnd"/>
  <!-- pref end type = date or duration -->
  <bw:emitText name="userPrefs" property="preferredEndType"/>
  <!-- user mode: 0 = basicMode, 1 = simpleMode, 2 = advancedMode -->
  <bw:emitText name="userPrefs" property="userMode"/>
  <bw:emitText name="userPrefs" property="defaultTzid"/>

  <bw:emitCategories name="bw_default_categories_list" scope="session"
                     tagName="defaultCategories" indent="  "/>
</prefs>

<formElements>
 <form>
   <!-- user's writable calendars -->
   <calendars>
     <c:set var="addContentCalendarCollections"
            value="${bw_addcontent_collection_list}" />
     <bw:selectCollection name="calForm"
                          property="calendarId"
                          cols="addContentCalendarCollections"
                          indent="    "/>
   </calendars>
 </form>
</formElements>

<%@include file="/docs/footer.jsp"%>

</bedework>
