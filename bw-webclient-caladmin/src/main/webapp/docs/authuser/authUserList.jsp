<%@ taglib uri='https://bedework.org/jsp/taglib/bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>authUserList</page>

<authUsers>
  <c:forEach var="authUser" items="${sessionScope.bw_auth_users}" >
    <authUser>
      <bw:emitText name="authUser" property="userHref" />
      <bw:emitText name="authUser" property="publicEventUser"/>
      <bw:emitText name="authUser" property="contentAdminUser"/>
      <bw:emitText name="authUser" property="approverUser"/>
    </authUser>
  </c:forEach>
</authUsers>

<%@include file="/docs/footer.jsp"%>

</bedework>
