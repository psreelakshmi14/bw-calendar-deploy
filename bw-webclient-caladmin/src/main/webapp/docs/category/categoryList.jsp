<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>categoryList</page>
<tab>system</tab>

  <bw:emitCategories name="bw_editable_categories_list" scope="session"
                     tagName="categories" indent="  "/>

<%@include file="/docs/footer.jsp"%>

</bedework>
