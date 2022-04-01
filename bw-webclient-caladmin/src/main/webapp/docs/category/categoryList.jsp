<%@ taglib uri='struts-logic' prefix='logic' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>categoryList</page>
<tab>system</tab>

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
