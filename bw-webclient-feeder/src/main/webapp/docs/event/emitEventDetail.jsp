<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

    <%-- Output any event fields with forms specific to short format displays --%>
    <c:if test="${not empty event.location}">
      <c:set var="location" value="${event.location}"/>
      <location>
        <bw:emitText name="location" property="uid"/><%--
            Value: location uid --%>
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
        <bw:emitText name="location" property="link"/>

        <bw:emitText name="location" property="code" />
        <bw:emitText name="location" property="alternateAddress" /><%--
            Value: URI - link to a web address for the location --%>
        <bw:emitText name="location" property="creatorHref" tagName="creator" /><%--
          Value: string - location creator id --%>
      </location>
    </c:if>
    <c:if test="${empty event.location}">
      <location>
        <address></address>
        <id></id><%--
          Value: integer - location id --%>
        <subaddress></subaddress><%--
          Value: string - more address information --%>
        <link></link><%--
          Value: URI - link to a web address for the location --%>
        <creator></creator><%--
          Value: string - location creator id --%>
      </location>
    </c:if>
    <categories>
      <c:if test="${not empty event.categories}">
        <logic:iterate id="category" name="event" property="categories">
          <%@include file="/docs/category/emitCategory.jsp"%>
        </logic:iterate>
      </c:if>
    </categories>
    <jsp:include page="/docs/event/emitRecur.jsp"/>
    <bw:emitText name="event" property="description" /><%--
        Value: string - long description of the event.  Limited to 500 characters. --%>
    <bw:emitText name="event" property="cost" /><%--
        Value: string - cost information --%>
    <bw:emitText name="event" property="sequence"/><%--
        RFC sequence number for the event --%>

    <c:if test="${not empty event.contact}">
      <c:set var="contact" value="${event.contact}"/>
      <contact>
        <bw:emitText name="contact" property="id"/><%--
          Value: integer - contact id --%>
        <bw:emitText name="contact" property="cn.value" tagName="name"/><%--
          Value: string - contact's name --%>
        <bw:emitText name="contact" property="phone"/><%--
          Value (example): x7777 - contact's phone number --%>
        <bw:emitText name="contact" property="email"/><%--
          Value (example): nobody@nowhere.edu - contact's email address --%>
        <bw:emitText name="contact" property="link"/><%--
          Value: URI - link to contact web page --%>
      </contact>
    </c:if>

