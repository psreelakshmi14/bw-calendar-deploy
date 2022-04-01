<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>categoryReferenced</page>
<tab>system</tab>

<currentCategory>
  <c:if test="${not empty calForm.category}">
    <c:set var="category" value="${calForm.category}"/>
    <%@include file="/docs/category/emitCategory.jsp"%>
  </c:if>
</currentCategory>

<propRefs>
  <c:if test="${not empty calForm.propRefs}">
    <logic:iterate id="propRef" name="calForm" property="propRefs" >
      <propRef>
        <bw:emitText name="propRef" property="collection"
                     tagName="isCollection" />
        <bw:emitText name="propRef" property="path" />
        <bw:emitText name="propRef" property="uid" />
      </propRef>
    </logic:iterate>
  </c:if>
</propRefs>

<%@include file="/docs/footer.jsp"%>

</bedework>
