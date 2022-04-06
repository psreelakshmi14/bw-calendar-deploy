<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-html' prefix='html' %>
<%@ taglib uri='bedework' prefix='bw' %>
<html:xhtml/>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>modAdminGroup</page>
<tab>users</tab>
<bw:emitText name="calForm" property="addingAdmingroup"
             tagName="creating"/>

<formElements>
  <html:form action="admingroup/update" >
    <name>
      <c:if test="${calForm.addingAdmingroup}" >
        <html:text name="calForm" property="updAdminGroup.account" />
      </c:if>
      <c:if test="${!calForm.addingAdmingroup}" >
        <c:out value="${calForm.updAdminGroup.account}" />
      </c:if>
    </name>
    <desc>
      <html:textarea property="updAdminGroup.description" cols="50"  rows="3"></html:textarea>
    </desc>
    <groupOwner>
      <html:text name="calForm" property="adminGroupGroupOwner" />
    </groupOwner>
    <eventsOwner>
      <html:text name="calForm" property="adminGroupEventOwner" />
    </eventsOwner>

    <!-- these are the values that may be submitted to the update action -->
    <submitButtons>
      <button type="add">addAdminGroup</button>
      <button type="update">updateAdminGroup</button>
      <button type="cancel">cancelled</button>
      <button type="delete">delete</button>
    </submitButtons>

  </genurl:form>
</formElements>

<%@include file="/docs/footer.jsp"%>

</bedework>
