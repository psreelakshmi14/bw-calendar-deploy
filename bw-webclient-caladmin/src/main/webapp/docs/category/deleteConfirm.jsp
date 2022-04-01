<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>deleteCategoryConfirm</page>
<tab>system</tab>

<currentCategory>
  <c:if test="${not empty calForm.category}">
    <c:set var="category" value="${calForm.category}"/>
    <%@include file="/docs/category/emitCategory.jsp"%>
  </c:if>
</currentCategory>

<%@include file="/docs/footer.jsp"%>

</bedework>
