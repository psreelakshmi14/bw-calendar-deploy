<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>chooseGroup</page>
<tab>none</tab>

<groups>
  <logic:iterate id="adminGroup" name="bw_user_admin_groups" scope="session" >
    <group>
      <bw:emitText name="adminGroup" property="account"
                   tagName="name"/>
      <bw:emitText name="adminGroup" property="description"
                   tagName="desc"/>
    </group>
  </logic:iterate>
</groups>

<calSuites>
  <logic:iterate id="calSuite" name="calForm" property="calSuites" >
    <%@include file="/docs/calsuite/emitCalSuite.jsp"%>
  </logic:iterate>
</calSuites>

<%@include file="/docs/footer.jsp"%>
</bedework>
