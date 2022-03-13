<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<c:set var="event" value="${eventFmt.event}"  />
<%-- Output a single event. This page handles fields common to all views --%>
  <event>
    <bw:emitText name="event" property="entityType"/>
    <bw:emitText name="event" property="scheduleMethod"/>
    <bw:emitText name="event" property="name"/>
    <bw:emitText name="event" property="created"/>
    <start><%-- start date and time --%>
      <bw:emitText name="event" property="noStart"/>
      <c:set var="date" value="${eventFmt.start}"
             scope="request" />
      <%@ include file="/docs/event/emitDate.jsp" %>
    </start>
    <end><%-- end date and time --%>
      <bw:emitText name="event" property="endType" tagName="type"/>
      <c:set var="date" value="${eventFmt.end}"
             scope="request" />
      <%@ include file="/docs/event/emitDate.jsp" %>
    </end>
    <bw:emitText name="event" property="creatorHref" tagName="creator"/>
    <bw:emitText name="event" property="ownerHref" tagName="owner"/>

    <bw:emitText name="event" property="id"/><%--
      Value: integer - event id --%>
    <bw:emitText name="event" property="uid" tagName="guid" />
    <bw:emitText name="event" property="encodedHref" />
    <bw:emitText name="event" property="recurrenceId" tagName="recurrenceId" />
    <bw:emitText name="event" property="summary" /><%--
      Value: string - short description, typically used for the event title  --%>
    <bw:emitText name="event" property="color"/>
    <bw:emitText name="event" property="link"/><%--
      Value: URI - link associated with the event --%>
    <bw:emitText name="event" property="deleted"/>
    <bw:emitText name="event"
                 property="publick" tagName="public"/>
    <bw:emitText name="eventInfo" property="editable"/><%--
      Value: true,false - true if user can edit (and delete) event, false otherwise --%>
    <logic:present  name="event" property="target">
      <isAnnotation/>
    </logic:present>
    <bw:emitText name="eventInfo" property="kind"/><%--
      Value: 0 - actual event entry
             1 - 'added event' from a reference
             2 - from a subscription --%>
    <bw:emitText name="event" property="recurring"/><%--
      Value: true,false - true if the event is recurring --%>
    <bw:emitContainer name="event" indent="    " tagName="calendar" />
    <bw:emitText name="event" property="status" /><%-- Status
          Value: string, only one of CONFIRMED, TENTATIVE, or CANCELLED --%>

    <%-- Output any event fields with forms specific to short format displays --%>
    <logic:present  name="event" property="location">
      <c:set var="location" value="${event.location}"/>
      <location>
        <bw:emitText name="location" property="uid"/><%--
            Value: location uid --%>
        <bw:emitText name="location" property="combinedValues" />
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
        <logic:present name="location" property="subaddress">
          <bw:emitText name="location" property="subaddress.value"
                       tagName="subaddress"/><%--
            Value: string - more address information --%>
        </logic:present>
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
    </logic:present>
    <logic:notPresent  name="event" property="location">
      <location>
        <address></address>
        <uid></uid><%--
          Value: integer - location id --%>
        <subaddress></subaddress><%--
          Value: string - more address information --%>
        <link></link><%--
          Value: URI - link to a web address for the location --%>
        <creator></creator><%--
          Value: string - location creator id --%>
      </location>
    </logic:notPresent>

    <categories>
      <logic:present name="event" property="categories">
        <logic:iterate id="category" name="event" property="categories">
          <%@include file="/docs/category/emitCategory.jsp"%>
        </logic:iterate>
      </logic:present>
    </categories>

    <!-- always produce the xproperties, if they exist -->
    <logic:present name="event" property="xproperties">
      <xproperties>
        <logic:iterate id="xprop" name="event" property="xproperties">
          <logic:equal name="xprop" property="skipJsp" value="false">
            <c:out value="<${xprop.name}>" escapeXml="false"/>
              <logic:present name="xprop" property="parameters">
                <parameters>
                <logic:iterate id="xpar" name="xprop" property="parameters">
                  <c:out value="<${xpar.name}><![CDATA[${xpar.value}]]></${xpar.name}>" escapeXml="false"/>
                </logic:iterate>
                </parameters>
              </logic:present>
              <values>
                <c:out value="<text><![CDATA[${xprop.value}]]></text>" escapeXml="false"/>
              </values>
            <c:out value="</${xprop.name}>" escapeXml="false"/>
          </logic:equal>
        </logic:iterate>
      </xproperties>
    </logic:present>

    <logic:present  name="event" property="percentComplete">
      <bw:emitText name="event" property="percentComplete"/>
    </logic:present>

    <logic:present  name="event" property="geo">
      <bw:emitText name="event" property="geo.latitude" tagName="latitude"/>
      <bw:emitText name="event" property="geo.longitude" tagName="longitude"/>
    </logic:present>

    <logic:present name="detailView" scope="request">
      <%@ include file="/docs/event/emitEventDetail.jsp"%>
    </logic:present>

    <logic:present name="allView" scope="request">
      <%@ include file="/docs/event/emitEventDetail.jsp"%>
      <%@ include file="/docs/event/emitEventAll.jsp" %>
    </logic:present>

    <%-- ****************************************************************
          the following code should not be produced in the public client
         **************************************************************** --%>
    <logic:equal name="calForm" property="guest" value="false">
      <bw:emitCurrentPrivs name="eventInfo" property="currentAccess" />
    </logic:equal>
  </event>
