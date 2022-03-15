<%@ taglib uri='struts-logic' prefix='logic' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>displayContact</page>
<tab>main</tab>

<contacts>
  <logic:iterate id="contact" name="calForm" property="editableContacts" >
    <%@include file="/docs/contact/emitContact.jsp"%>
  </logic:iterate>
</contacts>

<%@include file="/docs/footer.jsp"%>



</bedework>
