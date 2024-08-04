<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='https://bedework.org/jsp/taglib/bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>eventList</page>

<%
  try {
%>
<%@include file="/docs/event/eventListRoot.jsp"%>

<c:if test="${globals.currentTab == 'main'}">
  <%-- Output the writable calendars --%>
  <calendars>
    <c:forEach var="calendar" items="${sessionScope.bw_addcontent_collection_list}" >
      <calendar>
        <bw:emitCollection name="calendar" indent="  " full="false" noTag="true" />
      </calendar>
    </c:forEach>
  </calendars>

  <%-- Output the categories for UI filtering: --%>
  <bw:emitCategories name="bw_categories_list" scope="session"
                     tagName="categories" indent="  "/>
</c:if>
<%
  } catch (final Throwable t) {
    t.printStackTrace();
  }
%>
<%@include file="/docs/footer.jsp"%>

</bedework>
