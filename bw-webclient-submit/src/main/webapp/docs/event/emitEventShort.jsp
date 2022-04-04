<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
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
    <bw:emitCategories name="event"  property="categories"
                       tagName="categories" indent="    " full="false"/>
