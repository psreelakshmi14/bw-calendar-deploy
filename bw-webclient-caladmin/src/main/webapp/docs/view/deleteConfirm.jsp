<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>deleteViewConfirm</page>
<tab>calsuite</tab>

<c:set var="curView" value="${calForm.view}"/>
<currentView>
  <bw:emitText name="curView" property="name" />
  <c:forEach var="path" items="${curView.collectionPaths}">
    <bw:emitText name="path"/>
  </c:forEach>
</currentView>

<%@include file="/docs/footer.jsp"%>
</bedework>
