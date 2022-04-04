<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

    <%-- Output any event fields with forms specific to short format displays --%>
    <c:if test="${not empty event.location}">
      <c:set var="location" value="${event.location}"/>
      <location>
        <bw:emitText name="location" property="uid"/><%--
            Value: integer - location id --%>
        <bw:emitText name="location" property="addressField" tagName="address"/><%--
          Value: string - physical address of the location --%>
        <bw:emitText name="location" property="link"/><%--
            Value: URI - link to a web address for the location --%>
        <bw:emitText name="location" property="subaddressField" tagName="subaddress"/><%--
            Value: string - more address information --%>
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
    <bw:emitCategories name="event"  property="categories"
                       tagName="categories" indent="    "/>
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

   <bw:emitXprops name="event" property="xproperties"/>
