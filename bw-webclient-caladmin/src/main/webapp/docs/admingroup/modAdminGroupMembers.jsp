<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='struts-html' prefix='html' %>
<%@ taglib uri='struts-genurl' prefix='genurl' %>
<%@ taglib uri='bedework' prefix='bw' %>
<html:xhtml/>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>modAdminGroupMembers</page>
<tab>users</tab>

<adminGroup>
  <bw:emitText name="calForm" property="updAdminGroup.account"
               tagName="name"/>
  <members>
    <logic:present name="calForm" property="updAdminGroup.groupMembers" >
      <logic:iterate name="calForm" property="updAdminGroup.groupMembers"
                     id="member" >
        <member>
          <bw:emitText name="member" property="account" />
          <bw:emitText name="member" property="kind" />
        </member>
      </logic:iterate>
    </logic:present>
  </members>
</adminGroup>

<formElements>
  <genurl:form action="admingroup/updateMembers" >
    <member><html:text property="updGroupMember" size="15" /></member>

    <!-- these are the values that may be submitted to the update action -->
    <submitButtons>
      <button type="add">addGroupMember</button>
      <button type="remove">removeGroupMember</button>
    </submitButtons>

  </genurl:form>
</formElements>

<%@include file="/docs/footer.jsp"%>

</bedework>
