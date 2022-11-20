<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>deleteContactConfirm</page>
<tab><c:out value="${calForm.currentTab}"/></tab>

<c:set var="contact" value="${calForm.contact}" />
<contact>
  <c:set var="cn" value="${contact.cn}" />
  <c:if test="${empty cn}">
    <c:set var="cnval" value="Broken contact" />
  </c:if>
  <c:if test="${not empty cn}">
    <c:set var="cnval" value="${cn.value}" />
  </c:if>
  <bw:emitText name="cnval"
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
