<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>categoryReferenced</page>

  <bw:emitCategory name="calForm"  property="category"
                   tagName="currentCategory" indent="  "/>
<%@include file="/docs/footer.jsp"%>

</bedework>
