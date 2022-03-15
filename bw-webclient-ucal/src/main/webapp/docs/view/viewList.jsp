<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>views</page>

<views>
  <logic:iterate name="calForm" property="views" id="view">
    <view>
      <bw:emitText name="view" property="name" />
      <paths>
        <logic:iterate name="view" property="collectionPaths" id="path">
          <bw:emitText name="path" />
        </logic:iterate>
      </paths>
    </view>
  </logic:iterate>
</views>


<%@include file="/docs/footer.jsp"%>
</bedework>
