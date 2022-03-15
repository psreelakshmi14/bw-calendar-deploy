<%@ taglib uri='struts-logic' prefix='logic' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>categoryList</page>
<tab>system</tab>

<categories>
  <logic:present name="bw_editable_categories_list" scope="session">
    <logic:iterate id="category" name="bw_editable_categories_list"
                   scope="session">
      <%@include file="/docs/category/emitCategory.jsp"%>
    </logic:iterate>
  </logic:present>
</categories>

<%@include file="/docs/footer.jsp"%>

</bedework>
