<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>eventList</page>
<tab>main</tab>

<%@include file="/docs/event/eventListRoot.jsp"%>

  <%-- Output the writable calendars --%>
  <calendars>
    <logic:iterate id="calendar" name="bw_addcontent_collection_list" scope="session">
      <calendar>
        <bw:emitCollection name="calendar" indent="  " full="false" noTag="true" />
      </calendar>
    </logic:iterate>
  </calendars>

  <%-- Output the categories for UI filtering: --%>
  <bw:emitCategories name="bw_categories_list" scope="session"
                     tagName="categories" indent="  "/>

<%@include file="/docs/footer.jsp"%>

</bedework>
