<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='https://bedework.org/jsp/taglib/bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>locationReferenced</page>

  <c:set var="location" value="${calForm.location}"/>
<location>
  <bw:emitText name="location" property="address.value"
               tagName="address">
  <subaddress>
    <c:if test="${not empty calForm.location.subaddress}">
      <c:out value="${location.subaddress.value}" />
    </c:if>
  </subaddress>
  <c:if test="${not empty calForm.location.link}">
    <bw:emitText name="location" property="link" />
  </c:if>
</location>

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
