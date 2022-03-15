<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>locationReferenced</page>
<tab>main</tab>

  <c:set var="location" value="${calform.location}"/>
<location>
  <bw:emitText name="location" property="address.value"
               tagName=""address"/">
  <subaddress>
    <logic:present name="calForm" property="location.subaddress">
      <c:out value="${location.subaddress.value}" />
    </logic:present>
  </subaddress>
  <logic:present name="calForm" property="location.link">
    <bw:emitText name="location" property="link" />
  </logic:present>
</location>

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
