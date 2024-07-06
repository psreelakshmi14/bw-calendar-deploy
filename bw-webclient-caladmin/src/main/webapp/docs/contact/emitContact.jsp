<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='https://bedework.org/jsp/taglib/bedework' prefix='bw' %>
<contact>
  <name>
    <c:url value="/contact/fetchForUpdate.do" var="theUrl">
      <c:param name="uid" value="${contact.uid}"/>
    </c:url>
    <c:set var="cn" value="${contact.cn}" />
    <c:if test="${empty cn}">
      <c:set var="cnval" value="Broken contact" />
    </c:if>
    <c:if test="${not empty cn}">
      <c:set var="cnval" value="${cn.value}" />
    </c:if>
    <a href='<c:out value="${theUrl}"/>'><c:out
              value="${cnval}" /></a>
  </name>
  <bw:emitText name="contact" property="phone" />
  <bw:emitText name="contact" property="status" />
  <c:if test="${not empty contact.email}">
    <bw:emitText name="contact" property="email"/>
  </c:if>
  <c:if test="${not empty contact.link}">
    <bw:emitText name="contact" property="link" />
  </c:if>
</contact>
