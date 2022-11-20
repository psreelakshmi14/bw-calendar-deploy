<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bwhtml' prefix='bwhtml' %>
<%@ taglib uri='bedework' prefix='bw' %>

<bedework>
<%@include file="/docs/header.jsp"%>

<page>modLocation</page>
<tab><c:out value="${calForm.currentTab}"/></tab>

<bw:emitText name="calForm" property="addingLocation"
             tagName="creating"/>

<!-- Mod pages contain only formElements for now; we do this to
     take advantage of Struts' form processing features -->
<formElements>
  <bwhtml:form action="location/update" >
      <!--
    <bw:textField property="locationAddress.value" size="30"
                  tagName="address" />
     -->
    <bw:textField property="location.addressField" size="30"
                  tagName="addressField" />
    <bw:textField property="location.roomField" size="30"
                  tagName="roomField" />
    <bw:textField property="location.subField1" size="30"
                  tagName="subField1" />
    <bw:textField property="location.subField2" size="30"
                  tagName="subField2" />
    <bw:textField property="location.geouri" size="30"
                  tagName="geouri" />
    <bw:textField property="location.subaddressField" size="30"
                  tagName="subaddress" />
    <bw:textField property="location.street" size="30"
                  tagName="street" />
    <bw:textField property="location.city" size="30"
                  tagName="city" />
    <bw:textField property="location.state" size="30"
                  tagName="state" />
    <bw:textField property="location.zip" size="30"
                  tagName="zip" />
    <bw:textField property="location.link" size="30"
                  tagName="link" />
    <bw:checkbox property="location.accessible"
                 tagName="accessible" />
    <bw:textField property="location.code" size="30"
                  tagName="code" />
    <bw:textField property="location.alternateAddress" size="30"
                  tagName="alternateAddress" />
    <bw:textField property="locationStatus" size="30"
                  tagName="status" />

    <!-- these are the values that may be submitted to the update action -->
    <submitButtons>
      <button type="add">addLocation</button>
      <button type="update">updateLocation</button>
      <button type="cancel">forwardto</button>
      <button type="delete">delete</button>
    </submitButtons>

  </bwhtml:form>
</formElements>

<%@include file="/docs/footer.jsp"%>

</bedework>
