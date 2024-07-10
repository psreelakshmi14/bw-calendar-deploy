<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>contactList</page>

<contacts>
  <c:if test="${not empty sessionScope.bw_editable_contacts_list}">
    <c:forEach var="contact" items="${sessionScope.bw_editable_contacts_list}">
      <%@include file="/docs/contact/emitContact.jsp"%>
    </c:forEach>e>
  </c:if>
</contacts>

<%@include file="/docs/footer.jsp"%>

</bedework>
