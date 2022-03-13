<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

    <%-- Output any event fields with forms specific to short format displays --%>
    <logic:present  name="event" property="location">
      <c:set var="location" value="${event.location}"/>
      <location>
        <bw:emitText name="location" property="id"/><%--
                    Value: integer - location id --%>
        <bw:emitText name="location" property="address.value"
                     tagName="address"/><%--
                  Value: string - physical address of the location --%>
        <bw:emitText name="location" property="link"/><%--
                    Value: URI - link to a web address for the location --%>
      </location>
    </logic:present>
    <logic:notPresent  name="event" property="location">
      <location>
        <address></address>
      </location>
    </logic:notPresent>
    <categories>
      <logic:present name="event" property="categories">
        <logic:iterate id="category" name="event" property="categories">
          <%@include file="/docs/category/emitCategory.jsp"%>
        </logic:iterate>
      </logic:present>
    </categories>

