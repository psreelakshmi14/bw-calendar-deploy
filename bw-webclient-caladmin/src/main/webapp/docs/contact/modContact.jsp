<%@ taglib uri='bwhtml' prefix='bwhtml' %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>modContact</page>
<tab><c:out value="${calForm.currentTab}"/></tab>
<bw:emitText name="calForm" property="addingContact"
             tagName="creating"/>

<!-- Mod pages contain only formElements for now; we do this to
     take advantage of Struts' form processing features -->
<formElements>
  <bwhtml:form action="contact/update" >

    <%@include file="/docs/contact/modContactCommon.jsp"%>

    <!-- these are the values that may be submitted to the update action -->
    <submitButtons>
      <button type="add">addContact</button>
      <button type="update">updateContact</button>
      <button type="cancel">forwardto</button>
      <button type="delete">delete</button>
    </submitButtons>

  </bwhtml:form>
</formElements>

<%@include file="/docs/footer.jsp"%>

</bedework>
