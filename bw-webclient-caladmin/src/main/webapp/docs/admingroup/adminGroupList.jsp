<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>adminGroupList</page>
<tab><c:out value="${calForm.currentTab}"/></tab>

<groups>
  <bw:emitText name="calForm" property="showAgMembers"
               tagName="showMembers"/>
  <c:forEach var="adminGroup" items="${sessionScope.bw_admin_groups}" >
    <group>
      <bw:emitText name="adminGroup" property="account"
                   tagName="name"/>
      <bw:emitText name="adminGroup" property="description"
                   tagName="desc"/>
      <members>
        <c:if test="${calForm.showAgMembers}">
          <c:if test="${not empty adminGroup.groupMembers}" >
            <c:forEach var="member" items="${adminGroup.groupMembers}" >
              <member>
                <bw:emitText name="member" property="account" />
                <bw:emitText name="member" property="kind" />
              </member>
            </c:forEach>
          </c:if>
        </c:if>
      </members>
    </group>
  </c:forEach>
</groups>

<calSuites>
  <c:forEach var="calSuite" items="${calForm.calSuites}" >
    <%@include file="/docs/calsuite/emitCalSuite.jsp"%>
  </c:forEach>
</calSuites>

<%@include file="/docs/footer.jsp"%>
</bedework>
