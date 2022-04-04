<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>deleteCategoryConfirm</page>

  <bw:emitCategory name="calForm"  property="category"
                   tagName="currentCategory" indent="  "/>

<%@include file="/docs/footer.jsp"%>

</bedework>
