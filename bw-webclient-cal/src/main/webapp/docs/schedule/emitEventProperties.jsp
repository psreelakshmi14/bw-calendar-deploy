<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

    <c:if test="${not empty event.originator}">
      <bw:emitText name="event" property="originator"/>
    </c:if>
    <logic:equal name="event" property="organizerSchedulingObject" value="true" >
      <organizerSchedulingObject />
    </logic:equal>
    <logic:equal name="event" property="attendeeSchedulingObject" value="true" >
      <attendeeSchedulingObject />
    </logic:equal>
    <c:if test="${not empty event.organizer}">
      <c:set var="organizer" value="${event.organizer}"/>
      <organizer>
        <bw:emitText name="organizer" property="cn"/><%--
          Value: string - cn of the organizer --%>
        <bw:emitText name="organizer" property="dir"/><%--
              Value: URI - link to a directory for lookup --%>
        <bw:emitText name="organizer" property="language"/><%--
            Value: string - language code --%>
        <bw:emitText name="organizer" property="sentBy"/><%--
          Value: string - usually mailto url --%>
        <bw:emitText name="organizer" property="organizerUri"/><%--
          Value: string - u --%>
      </organizer>
    </c:if>
    <c:if test="${not empty event.attendees}">
      <attendees>
        <logic:iterate id="attendee" name="event" property="attendees">
          <attendee>
            <bw:emitText name="attendee" property="id" /><%--
                Value: integer - attendee id --%>
            <bw:emitText name="attendee" property="cn"/><%--
              Value: string - cn of the attendee --%>
            <bw:emitText name="attendee" property="cuType"/><%--
              Value: string - type of calendar user --%>
            <bw:emitText name="attendee" property="delegatedFrom"/><%--
                   mailto url --%>
            <bw:emitText name="attendee" property="delegatedTo"/><%--
                   mailto url --%>
            <bw:emitText name="attendee" property="dir"/><%--
                  Value: URI - link to a directory for lookup --%>
            <bw:emitText name="attendee" property="member"/>
            <bw:emitText name="attendee" property="language"/><%--
                Value: string - language code --%>
            <bw:emitText name="attendee" property="sentBy"/><%--
              Value: string - usually mailto url --%>
            <bw:emitText name="attendee" property="rsvp" />
            <bw:emitText name="attendee" property="role"/>
            <bw:emitText name="attendee" property="partstat"/>
            <bw:emitText name="attendee" property="attendeeUri"/>
            <bw:emitText name="attendee" property="scheduleStatus"/>
            <bw:emitText name="attendee" property="scheduleAgent"/>
          </attendee>
        </logic:iterate>
      </attendees>
    </c:if>
    <c:if test="${not empty event.recipients}">
      <recipients>
        <logic:iterate id="recipient" name="event" property="recipients" >
          <bw:emitText name="recipient" tagName="recipient"/>
        </logic:iterate>
      </recipients>
    </c:if>
    <c:if test="${not empty event.comments}">
      <comments>
        <logic:iterate id="comment" name="event" property="comments">
          <bw:emitText name="comment" property="value"/>
        </logic:iterate>
      </comments>
    </c:if>

