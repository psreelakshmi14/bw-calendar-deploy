<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>deleteContactConfirm</page>
<tab>main</tab>

<c:set var="contact" value="${calForm.contact}" />
<contact>
  <bw:emitText name="contact" property="cn.value"
               tagName="name"/>
  <bw:emitText name="contact" property="phone" />
  <c:if test="${not empty contact.email}">
    <bw:emitText name="contact" property="email"/>
  </c:if>
  <c:if test="${not empty contact.link}">
    <bw:emitText name="contact" property="link" />
  </c:if>
</contact>

<formElements>
  <c:url value="/contact/delete.do" var="theUrl"/>
  <form id="calForm" method="post" action="${theUrl}">
    <input type="submit" name="cancelled" value="Cancel" />
    <input type="submit" name="deleteContactOK" value="Delete" />
  </form>
</formElements>

<%@include file="/docs/footer.jsp"%>

</bedework>
