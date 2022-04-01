<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>adminGroupList</page>
<tab>users</tab>

<groups>
  <bw:emitText name="calForm" property="showAgMembers"
               tagName="showMembers"/>
  <logic:iterate id="adminGroup" name="bw_admin_groups" scope="session" >
    <group>
      <bw:emitText name="adminGroup" property="account"
                   tagName="name"/>
      <bw:emitText name="adminGroup" property="description"
                   tagName="desc"/>
      <members>
        <logic:equal name="calForm" property="showAgMembers" value="true">
          <c:if test="${not empty adminGroup.groupMembers}" >
            <logic:iterate name="adminGroup" property="groupMembers"
                           id="member" >
              <member>
                <bw:emitText name="member" property="account" />
                <bw:emitText name="member" property="kind" />
              </member>
            </logic:iterate>
          </c:if>
        </logic:equal>
      </members>
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
