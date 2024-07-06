<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='https://bedework.org/jsp/taglib/bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>categoryReferenced</page>
<tab><c:out value="${calForm.currentTab}"/></tab>

  <bw:emitCategory name="calForm"  property="category"
                   tagName="currentCategory" indent="  "/>
<propRefs>
  <c:if test="${not empty calForm.propRefs}">
    <c:forEach var="propRef" items="${calForm.propRefs}" >
      <propRef>
        <bw:emitText name="propRef" property="collection"
                     tagName="isCollection" />
        <bw:emitText name="propRef" property="path" />
        <bw:emitText name="propRef" property="uid" />
      </propRef>
    </c:forEach>
  </c:if>
</propRefs>

<%@include file="/docs/footer.jsp"%>

</bedework>
