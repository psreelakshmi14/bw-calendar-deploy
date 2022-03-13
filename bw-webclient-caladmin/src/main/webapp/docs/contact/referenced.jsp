<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='struts-html' prefix='html' %>
<%@ taglib uri='bedework' prefix='bw' %>
<html:xhtml/>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>contactReferenced</page>
<tab>main</tab>

<c:set var="contact" value="${calform.contact}"/>
<contact>
  <bw:emitText name="contact" property="cn.value"
               tagName="name"/>
  <bw:emitText name="contact" property="phone" />
  <logic:present name="contact" property="email">
    <bw:emitText name="contact" property="email"/>
  </logic:present>
  <logic:present name="contact" property="link">
    <bw:emitText name="contact" property="link" />
  </logic:present>
</contact>

<propRefs>
  <logic:present name="calForm" property="propRefs">
    <logic:iterate id="propRef" name="calForm" property="propRefs" >
      <propRef>
        <logic:present name="propRef" property="collection">
          <bw:emitText name="propRef" property="collection" tagName="isCollection" />
        </logic:present>
        <logic:notPresent name="propRef" property="collection">
          <isCollection></isCollection>
        </logic:notPresent>
        <logic:present name="propRef" property="path">
          <bw:emitText name="propRef" property="path" tagName="path" />
        </logic:present>
        <logic:notPresent name="propRef" property="path">
          <path></path>
        </logic:notPresent>
        <logic:present name="propRef" property="uid">
          <bw:emitText name="propRef" property="uid" tagName="uid" />
        </logic:present>
        <logic:notPresent name="propRef" property="uid">
          <uid></uid>
        </logic:notPresent>
      </propRef>
    </logic:iterate>
  </logic:present>
</propRefs>

<%@include file="/docs/footer.jsp"%>

</bedework>
