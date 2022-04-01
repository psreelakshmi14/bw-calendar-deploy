<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<group>
  <bw:emitText name="calForm" property="updAdminGroup.account"
               tagName="name"/>
  <bw:emitText name="calForm" property="updAdminGroup.description"
               tagName="desc"/>
  <bw:emitText name="calForm" property="adminGroupGroupOwner"
               tagName="groupOwner"/>
  <bw:emitText name="calForm" property="adminGroupEventOwner"
               tagName="eventsOwner"/>
  <members>
    <c:if test="${not empty calForm.updAdminGroup.groupMembers}" >
      <logic:iterate name="calForm" property="updAdminGroup.groupMembers"
                     id="member" >
        <member>
          <bw:emitText name="member" property="account" />
          <bw:emitText name="member" property="kind" />
        </member>
      </logic:iterate>
    </c:if>
  </members>
</group>
