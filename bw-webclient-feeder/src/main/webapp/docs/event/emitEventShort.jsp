<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>
    <%-- Output any event fields with forms specific to short format displays --%>
    <c:if test="${not empty event.location}">
      <c:set var="location" value="${event.location}"/>
      <location>
        <bw:emitText name="location" property="uid"/><%--
             Value: integer - location id --%>
        <bw:emitText name="location" property="addressField" tagName="address"/><%--
          Value: string - physical address of the location --%>
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
        <c:if test="${not empty location.subaddress}">
          <bw:emitText name="location" property="subaddress.value" tagName="subaddress"/><%--
            Value: string - more address information --%>
        </c:if>
        <bw:emitText name="location" property="street" />
        <bw:emitText name="location" property="city" />
        <bw:emitText name="location" property="state" />
        <bw:emitText name="location" property="zip" />
        <bw:emitText name="location" property="link"/><%--
            Value: URI - link to a web address for the location --%>
        <bw:emitText name="location" property="code" />
        <bw:emitText name="location" property="alternateAddress" />
      </location>
    </c:if>
    <c:if test="${empty event.location}">
      <location>
        <address></address>
      </location>
    </c:if>
    <bw:emitCategories name="event"  property="categories"
                       tagName="categories" indent="    "/>
