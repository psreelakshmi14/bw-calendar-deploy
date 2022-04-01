<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<location>
  <address>
    <c:url value="/location/fetchForUpdate.do" var="theUrl">
      <c:param name="uid" value="${location.uid}"/>
    </c:url>
    <a href='<c:out value="${theUrl}"/>'><c:out
        value="${location.addressField}" /></a>
  </address>

  <bw:emitText name="location" property="roomField" />
  <bw:emitText name="location" property="subField1" />
  <bw:emitText name="location" property="subField2" />

  <logic:equal name="location" property="accessible" value="true" >
    <accessible>true</accessible>
  </logic:equal>
  <logic:notEqual name="location" property="accessible" value="true" >
    <accessible>false</accessible>
  </logic:notEqual>
  <bw:emitText name="location" property="geouri" />
  <bw:emitText name="location" property="status" />

  <subaddress>
    <c:if test="${not empty location.subaddress}" >
      <c:out value="${location.subaddress.value}" />
    </c:if>
  </subaddress>

  <bw:emitText name="location" property="street" />
  <bw:emitText name="location" property="city" />
  <bw:emitText name="location" property="state" />
  <bw:emitText name="location" property="zip" />
  <bw:emitText name="location" property="link" />

  <bw:emitText name="location" property="code" />
  <bw:emitText name="location" property="alternateAddress" />
  <keys>
    <c:if test="${not empty location.keys}">
      <logic:iterate id="keyFld" name="location" property="keys">
        <bw:emitText name="keyFld" property="keyName" />
        <bw:emitText name="keyFld" property="keyVal" />
      </logic:iterate>
    </c:if>
  </keys>
</location>

