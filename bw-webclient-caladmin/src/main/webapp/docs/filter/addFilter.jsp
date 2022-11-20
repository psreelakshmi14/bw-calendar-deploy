<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>addFilter</page>
<tab><c:out value="${calForm.currentTab}"/></tab>

<filters>
  <c:if test="${not empty calForm.filters}">
    <c:forEach var="filter" items="${calForm.filters}">
      <filter>
        <bw:emitText name="filter" property="name"/>
        <bw:emitText name="filter" property="description"/>
        <bw:emitText name="filter" property="definition"/>
      </filter>
    </c:forEach>
  </c:if>
</filters>

<%@include file="/docs/footer.jsp"%>

</bedework>
