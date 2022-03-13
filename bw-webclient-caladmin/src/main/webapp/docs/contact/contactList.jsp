<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='struts-html' prefix='html' %>
<html:xhtml/>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>contactList</page>
<tab>main</tab>

<contacts>
  <logic:present name="bw_editable_contacts_list" scope="session">
    <logic:iterate id="contact" name="bw_editable_contacts_list"
                   scope="session">
      <%@include file="/docs/contact/emitContact.jsp"%>
    </logic:iterate>
  </logic:present>
</contacts>

<%@include file="/docs/footer.jsp"%>

</bedework>
