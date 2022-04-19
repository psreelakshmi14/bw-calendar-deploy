<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bwhtml' prefix='bwhtml' %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>modAuthUser</page>
<tab>users</tab>

<formElements>
  <bwhtml:form action="authuser/update" >
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

  </bwhtml:form>
</formElements>

<%@include file="/docs/footer.jsp"%>

</bedework>
