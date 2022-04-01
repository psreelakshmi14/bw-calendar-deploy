<%@ taglib uri='struts-logic' prefix='logic' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>contactList</page>
<tab>main</tab>

<contacts>
  <c:if test="${not empty sessionScope.bw_editable_contacts_list}">
    <logic:iterate id="contact" name="bw_editable_contacts_list"
                   scope="session">
      <%@include file="/docs/contact/emitContact.jsp"%>
    </logic:iterate>
  </c:if>
</contacts>

<%@include file="/docs/footer.jsp"%>

</bedework>
