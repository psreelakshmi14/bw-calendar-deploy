<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>views</page>

<views>
  <c:forEach var="view" items="${calForm.views}">
    <view>
      <bw:emitText name="view" property="name" />
      <paths>
        <c:forEach var="path" items="${view.collectionPaths}">
          <bw:emitText name="path" />
        </c:forEach>
      </paths>
    </view>
  </c:forEach>
</views>


<%@include file="/docs/footer.jsp"%>
</bedework>
