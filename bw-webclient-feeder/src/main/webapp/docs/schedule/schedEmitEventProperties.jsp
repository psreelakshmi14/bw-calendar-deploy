<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

    <c:if test="${not empty schedEvent.originator}">
      <bw:emitText name="schedEvent" property="originator"/>
    </c:if>
    <c:if test="${event.organizerSchedulingObject}" >
      <organizerSchedulingObject />
    </logic:equal>
    <c:if test="${not empty schedEvent.organizer}">
      <c:set var="organizer" value="${schedEvent.organizer}"/>
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
    <c:if test="${not empty schedEvent.attendees}">
      <attendees>
        <c:forEach var="attendee" items="${schedEvent.attendees}">
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
        </c:forEach>
      </attendees>
    </c:if>
    <c:if test="${not empty schedEvent.recipients}">
      <recipients>
        <c:forEach var="recipient" items="${schedEvent.recipients}" >
          <bw:emitText name="recipient" tagName="recipient"/>
        </c:forEach>
      </recipients>
    </c:if>
    <c:if test="${not empty schedEvent.comments}">
      <comments>
        <c:forEach var="comment" items="${schedEvent.comments}" >
          <bw:emitText name="comment" property="value"/>
        </c:forEach>
      </comments>
    </c:if>

