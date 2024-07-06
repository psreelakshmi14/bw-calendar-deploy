<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='https://bedework.org/jsp/taglib/bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>modView</page>
<tab><c:out value="${calForm.currentTab}"/></tab>

<bw:emitText name="calForm" property="addingView"
             tagName="creating"/>

<c:set var="curView" value="${calForm.view}"/>
<currentView>
  <bw:emitText name="curView" property="name" />
  <c:if test="${not empty curView.collectionPaths}">
    <c:forEach var="path" items="${curView.collectionPaths}">
      <bw:emitText name="path"/>
    </c:forEach>
  </c:if>
</currentView>


<%-- subscriptions are a subset of calendars --%>
<calendars>
  <c:set var="calendar" value="${bw_user_collection_list}"
         scope="session" />

  <%-- open up the calendars to descend down the tree, but stop after the root --%>
  <c:set var="fullTree" value="true" scope="request"/>
  <c:set var="stopDescent" value="true" scope="request"/>

  <%@include file="/docs/calendar/emitCalendar.jsp"%>
</calendars>

<%@include file="/docs/footer.jsp"%>
</bedework>
