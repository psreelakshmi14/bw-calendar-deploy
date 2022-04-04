<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>displayContact</page>
<tab>main</tab>

<contacts>
  <c:forEach var="contact" items="${calForm.editableContacts}" >
    <%@include file="/docs/contact/emitContact.jsp"%>
  </c:forEach>
</contacts>

<%@include file="/docs/footer.jsp"%>



</bedework>
