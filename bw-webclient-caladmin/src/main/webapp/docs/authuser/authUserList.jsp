<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='struts-html' prefix='html' %>
<%@ taglib uri='bedework' prefix='bw' %>
<html:xhtml/>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>authUserList</page>
<tab>users</tab>

<authUsers>
  <logic:iterate id="authUser" name="bw_auth_users" scope="session" >
    <authUser>
      <bw:emitText name="authUser" property="userHref" />
      <bw:emitText name="authUser" property="publicEventUser"/>
      <bw:emitText name="authUser" property="contentAdminUser"/>
      <bw:emitText name="authUser" property="approverUser"/>
    </authUser>
  </logic:iterate>
</authUsers>

<%@include file="/docs/footer.jsp"%>

</bedework>
