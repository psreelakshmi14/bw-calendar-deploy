<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='https://bedework.org/jsp/taglib/bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>chooseGroup</page>
<tab>none</tab>

<groups>
  <c:forEach var="adminGroup" items="${sessionScope.bw_user_admin_groups}" >
    <group>
      <bw:emitText name="adminGroup" property="account"
                   tagName="name"/>
      <bw:emitText name="adminGroup" property="description"
                   tagName="desc"/>
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
