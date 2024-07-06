<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='https://bedework.org/jsp/taglib/bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>modAuthUser</page>
<tab><c:out value="${calForm.currentTab}"/></tab>

<formElements>
  <bw:form action="authuser/update" >
    <bw:emitText name="calForm" property="editAuthUser.userHref"
                 tagName="userHref"/>
    <bw:checkbox property="editAuthUserPublicEvents"
                 tagName="publicEvents" />
    <bw:checkbox property="editAuthUserContentAdmin"
                 tagName="contentAdmin" />
    <bw:checkbox property="editAuthUserApprover"
                 tagName="approver" />

    <submitButtons>
      <button type="update">modAuthUser</button>
    </submitButtons>

  </bw:form>
</formElements>

<%@include file="/docs/footer.jsp"%>

</bedework>
