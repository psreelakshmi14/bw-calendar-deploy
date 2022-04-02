<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

    <%-- Output any event fields with forms specific to short format displays --%>
    <c:if test="${not empty event.location}">
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
    </c:if>
    <c:if test="${empty event.location}">
      <location>
        <address></address>
      </location>
    </c:if>
    <categories>
      <c:if test="${not empty event.categories}">
        <logic:iterate id="category" name="event" property="categories">
          <category>
            <bw:emitText name="category" property="id"/><%--
              Value: integer - category id --%>
            <bw:emitText name="category" property="word.value"
                         tagName="value"/><%--
              Value: string - the category value --%>
          </category>
        </logic:iterate>
      </c:if>
    </categories>

