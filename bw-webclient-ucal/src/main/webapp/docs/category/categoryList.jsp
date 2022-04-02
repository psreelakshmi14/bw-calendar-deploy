<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>categoryList</page>

<categories>
  <c:if test="${not empty sessionScope.bw_editable_categories_list}">
    <logic:iterate id="category" name="bw_editable_categories_list"
                   scope="session">
      <%@include file="/docs/category/emitCategory.jsp"%>
    </logic:iterate>
  </c:if>
</categories>

<%@include file="/docs/footer.jsp"%>

</bedework>
