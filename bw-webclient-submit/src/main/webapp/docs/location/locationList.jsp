<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@ include file="/docs/header.jsp" %>

<%
try {
%>

<page>locationList</page>

<locations>
  <logic:iterate id="location" name="calForm" property="editableLocations" >
    <location>
      <bw:emitText name="location" property="address.value" tagName="address" />
      <logic:present name="location" property="subaddress">
        <bw:emitText name="location" property="subaddress.value" tagName="subaddress"/>
      </logic:present>
      <bw:emitText name="location" property="link" />
      <bw:emitText name="location" property="uid" />
    </location>
  </logic:iterate>
</locations>

<%
} catch (Throwable t) {
  t.printStackTrace();
}
%>

<%@ include file="/docs/footer.jsp" %>

</bedework>
