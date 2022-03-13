<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>deleteViewConfirm</page>
<tab>calsuite</tab>

<c:set var="curView" value="${calForm.view}"/>
<currentView>
  <bw:emitText name="curView" property="name" />
  <logic:iterate name="curView" property="collectionPaths" id="path">
    <bw:emitText name="path"/>
  </logic:iterate>
</currentView>

<%@include file="/docs/footer.jsp"%>
</bedework>
