<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>
<contact>
  <name>
    <c:url value="/contact/fetchForUpdate.do" var="theUrl">
      <c:param name="uid" value="${contact.uid}"/>
    </c:url>
    <a href='<c:out value="${theUrl}"/>'><c:out
              value="${contact.cn.value}" /></a>
  </name>
  <bw:emitText name="contact" property="phone" />
  <bw:emitText name="contact" property="status" />
  <logic:present name="contact" property="email">
    <bw:emitText name="contact" property="email"/>
  </logic:present>
  <logic:present name="contact" property="link">
    <bw:emitText name="contact" property="link" />
  </logic:present>
</contact>
