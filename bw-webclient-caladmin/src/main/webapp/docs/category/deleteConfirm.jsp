<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>deleteCategoryConfirm</page>
<tab><c:out value="${calForm.currentTab}"/></tab>

  <bw:emitCategory name="calForm"  property="category"
                   tagName="currentCategory" indent="  "/>

<%@include file="/docs/footer.jsp"%>

</bedework>
