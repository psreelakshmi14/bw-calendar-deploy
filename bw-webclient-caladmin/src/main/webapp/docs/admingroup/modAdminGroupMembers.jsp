<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bwhtml' prefix='bwhtml' %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>modAdminGroupMembers</page>
<tab>users</tab>

<adminGroup>
  <bw:emitText name="calForm" property="updAdminGroup.account"
               tagName="name"/>
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
</adminGroup>

<formElements>
  <bwhtml:form action="admingroup/updateMembers" >
    <bw:textField property="updGroupMember" size="15"
                  tagName="member">

    <!-- these are the values that may be submitted to the update action -->
    <submitButtons>
      <button type="add">addGroupMember</button>
      <button type="remove">removeGroupMember</button>
    </submitButtons>

  </bwhtml:form>
</formElements>

<%@include file="/docs/footer.jsp"%>

</bedework>
