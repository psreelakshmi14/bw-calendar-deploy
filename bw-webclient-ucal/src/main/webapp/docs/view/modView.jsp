<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>modView</page>
<bw:emitText name="calForm" property="addingView"
             tagName="creating"/>

<views>
  <c:set var="view" value="${calForm.view}"/>
  <view>
    <bw:emitText name="view" property="name" />
    <collections>
      <c:forEach var="collection" items="${view.collections}">
        <collection>
          <bw:emitText name="collection" property="name" />
          <bw:emitText name="collection" property="path" />
        </collection>
      </c:forEach>
    </collections>
  </view>
</views>

<%@include file="/docs/footer.jsp"%>
</bedework>
