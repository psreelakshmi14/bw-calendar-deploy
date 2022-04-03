<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

    <bw:emitRrules name="calForm" property="rruleComponents"
                   indent="    " />

    <c:if test="${not empty event.rdates}">
      <bw:emitRexdates name="event" property="rdates" indent="    " />
    </c:if>

    <c:if test="${not empty event.exdates}">
      <bw:emitRexdates name="event" property="exdates" indent="    " />
    </c:if>

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

