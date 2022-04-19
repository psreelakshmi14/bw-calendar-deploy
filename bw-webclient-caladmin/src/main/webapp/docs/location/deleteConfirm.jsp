<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>deleteLocationConfirm</page>
<tab>main</tab>

<location>
  <bw:emitText name="calForm" property="location.address.value"
               tagName="address"/>
  <subaddress>
    <c:if test="${not empty calForm.location.subaddress}">
      <c:out value="${calForm.location.subaddress.value}" />
    </c:if>
  </subaddress>
  <c:if test="${not empty calForm.location.link}">
    <bw:emitText name="calForm" property="location.link"
                 tagName="link"/>
  </c:if>
</location>

<formElements>
  <c:url value="/location/delete.do" var="theUrl"/>
  <form id="calForm" method="post" action="${theUrl}">
    <input type="submit" name="cancelled" value="Cancel" />
    <input type="submit" name="deleteLocationOK" value="Delete" />
  </form>
</formElements>

<%@include file="/docs/footer.jsp"%>

</bedework>
