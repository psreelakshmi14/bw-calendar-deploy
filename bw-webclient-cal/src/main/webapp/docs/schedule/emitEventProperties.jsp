<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

    <logic:present  name="event" property="originator">
      <bw:emitText name="event" property="originator"/>
    </logic:present>
    <logic:equal name="event" property="organizerSchedulingObject" value="true" >
      <organizerSchedulingObject />
    </logic:equal>
    <logic:equal name="event" property="attendeeSchedulingObject" value="true" >
      <attendeeSchedulingObject />
    </logic:equal>
    <logic:present  name="event" property="organizer">
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
    </logic:present>
    <logic:present name="event" property="attendees">
      <attendees>
        <logic:iterate id="attendee" name="event" property="attendees">
          <attendee>
            <bw:emitText name="attendee" property="id"
                         tagName="id" /><%--
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
            <bw:emitText name="attendee" property="rsvp"
                         tagName="rsvp" />
            <bw:emitText name="attendee" property="role"/>
            <bw:emitText name="attendee" property="partstat"/>
            <bw:emitText name="attendee" property="attendeeUri"/>
            <bw:emitText name="attendee" property="scheduleStatus"/>
            <bw:emitText name="attendee" property="scheduleAgent"/>
          </attendee>
        </logic:iterate>
      </attendees>
    </logic:present>
    <logic:present name="event" property="recipients">
      <recipients>
        <logic:iterate id="recipient" name="event" property="recipients" >
          <bw:emitText name="recipient" tagName="recipient"/>
        </logic:iterate>
      </recipients>
    </logic:present>
    <logic:present name="event" property="comments">
      <comments>
        <logic:iterate id="comment" name="event" property="comments">
          <bw:emitText name="comment" property="value"/>
        </logic:iterate>
      </comments>
    </logic:present>
