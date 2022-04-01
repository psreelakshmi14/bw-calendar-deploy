<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>addFilter</page>
<tab>system</tab>

<filters>
  <c:if test="${not empty calForm.filters}">
    <logic:iterate name="calForm" property="filters" id="filter">
      <filter>
        <bw:emitText name="filter" property="name"/>
        <bw:emitText name="filter" property="description"/>
        <bw:emitText name="filter" property="definition"/>
      </filter>
    </logic:iterate>
  </c:if>
</filters>

<%@include file="/docs/footer.jsp"%>

</bedework>
