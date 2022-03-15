<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>categoryList</page>

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
