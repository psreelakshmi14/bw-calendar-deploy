<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='https://bedework.org/jsp/taglib/bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>contactReferenced</page>
<tab><c:out value="${calForm.currentTab}"/></tab>

<c:set var="contact" value="${calForm.contact}"/>
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

<propRefs>
  <c:if test="${not empty calForm.propRefs}">
    <c:forEach var="propRef" items="${calForm.propRefs}" >
      <propRef>
        <bw:emitText name="propRef" property="collection" tagName="isCollection" />
        <bw:emitText name="propRef" property="path" tagName="path" />
        <bw:emitText name="propRef" property="uid" tagName="uid" />
      </propRef>
    </c:forEach>
  </c:if>
</propRefs>

<%@include file="/docs/footer.jsp"%>

</bedework>
