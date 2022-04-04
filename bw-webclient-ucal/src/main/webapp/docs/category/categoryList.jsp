<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>

<bedework>
<%@include file="/docs/header.jsp"%>

  <page>categoryList</page>

  <bw:emitCategories name="bw_editable_categories_list" scope="session"
                     tagName="categories" indent="  "/>

<%@include file="/docs/footer.jsp"%>

</bedework>
