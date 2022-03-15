<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>deleteViewConfirm</page>

<views>
  <c:set var="view" value="${calForm.view}"/>
  <view>
    <bw:emitText name="view" property="name" />
    <collections>
      <logic:iterate name="view" property="collections" id="collection">
        <collection>
          <bw:emitText name="collection" property="name" />
          <bw:emitText name="collection" property="path" />
        </collection>
      </logic:iterate>
    </collections>
  </view>
</views>

<%@include file="/docs/footer.jsp"%>
</bedework>
