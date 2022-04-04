<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
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
      <c:forEach var="member" items="${calForm.updAdminGroup.groupMembers}" >
        <member>
          <bw:emitText name="member" property="account" />
          <bw:emitText name="member" property="kind" />
        </member>
      </c:forEach>
    </c:if>
  </members>
</group>
