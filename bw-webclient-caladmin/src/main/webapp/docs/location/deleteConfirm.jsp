<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='struts-html' prefix='html' %>
<%@ taglib uri='struts-genurl' prefix='genurl' %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>deleteLocationConfirm</page>
<tab>main</tab>

<location>
  <bw:emitText name="calForm" property="location.address.value"
               tagName="address"/>
  <subaddress>
    <logic:present name="calForm" property="location.subaddress">
      <c:out value="${calForm.location.subaddress.value}" />
    </logic:present>
  </subaddress>
  <logic:present name="calForm" property="location.link">
    <bw:emitText name="calForm" property="location.link"
                 tagName="link"/>
  </logic:present>
</location>

<formElements>
  <genurl:form action="location/delete.do" >
    <html:submit property="cancelled" value="Cancel"/>
    <html:submit property="deleteLocationOK" value="Delete"/>
  </genurl:form>
</formElements>

<%@include file="/docs/footer.jsp"%>

</bedework>
