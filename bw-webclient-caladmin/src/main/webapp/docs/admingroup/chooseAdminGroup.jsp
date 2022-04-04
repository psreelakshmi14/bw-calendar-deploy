<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

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
  <logic:iterate id="calSuite" name="calForm" property="calSuites" >
    <%@include file="/docs/calsuite/emitCalSuite.jsp"%>
  </logic:iterate>
</calSuites>

<%@include file="/docs/footer.jsp"%>
</bedework>
