<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>deleteLocationConfirm</page>

<currentLocation>
  <bw:emitText name="calForm" property="location.addressField" tagName="address" />
  <bw:emitText name="calForm" property="location.street" tagName="subaddress"/>
  <bw:emitText name="calForm" property="location.link" tagName="link"/>
  <bw:emitText name="calForm" property="location.uid" tagName="uid"/>
</currentLocation>

<%@include file="/docs/footer.jsp"%>

</bedework>
