<%@ page contentType="text/xml;charset=UTF-8" buffer="none" language="java" %><?xml version="1.0" encoding="UTF-8"?>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@ include file="/docs/header.jsp" %>

<%
try {
%>

<page>modLocation</page>

<bw:emitText name="calForm" property="addingLocation"
             tagName="creating"/>

<currentLocation>
  <bw:emitText name="calForm" property="location.addressField" tagName="addressField" />
  <bw:emitText name="calForm" property="location.roomField" tagName="roomField" />
  <bw:emitText name="calForm" property="location.subField1" tagName="subField1" />
  <bw:emitText name="calForm" property="location.subField2" tagName="subField2" />
  <bw:emitText name="calForm" property="location.geouri" tagName="geouri" />
  <bw:emitText name="calForm" property="location.subaddress" tagName="subaddress" />
  <bw:emitText name="calForm" property="location.street" tagName="street"/>
  <bw:emitText name="calForm" property="location.city" tagName="city"/>
  <bw:emitText name="calForm" property="location.state" tagName="state"/>
  <bw:emitText name="calForm" property="location.zip" tagName="zip"/>
  <bw:emitText name="calForm" property="location.link" tagName="link"/>
  <bw:emitText name="calForm" property="location.uid" tagName="uid"/>
</currentLocation>

<%
} catch (Throwable t) {
  t.printStackTrace();
}
%>

<%@ include file="/docs/footer.jsp" %>

</bedework>
