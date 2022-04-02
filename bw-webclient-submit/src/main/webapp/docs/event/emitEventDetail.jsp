<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
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
        <c:if test="${not empty location.subaddress}">
          <bw:emitText name="location" property="subaddressField" tagName="subaddress"/><%--
            Value: string - more address information --%>
        </c:if>
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
          <category>
            <bw:emitText name="category" property="id"/><%--
              Value: integer - category id --%>
            <bw:emitText name="category" property="word.value" tagName="word" /><%--
              Value: string - the category value --%>
            <c:if test="${not empty category.description}" >
              <bw:emitText name="category" property="description.value"
                           tagName="description" /><%--
                  Value: string - long description of category --%>
            </c:if>
            <bw:emitText name="category" property="creatorHref" tagName="creator" /><%--
              Value: string - category creator id --%>
          </category>
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

    <c:if test="${not empty event.xproperties}">
      <xproperties>
        <logic:iterate id="xprop" name="event" property="xproperties">
          <logic:equal name="xprop" property="skipJsp" value="false">
            <c:out value="<${xprop.name}>" escapeXml="false"/>
              <c:if test="${not empty xprop.parameters}">
                <parameters>
                <logic:iterate id="xpar" name="xprop" property="parameters">
                  <c:out value="<${xpar.name}><![CDATA[${xpar.value}]]></${xpar.name}>" escapeXml="false"/>
                </logic:iterate>
                </parameters>
              </c:if>
              <values>
                <c:out value="<text><![CDATA[${xprop.value}]]></text>" escapeXml="false"/>
              </values>
            <c:out value="</${xprop.name}>" escapeXml="false"/>
          </logic:equal>
        </logic:iterate>
      </xproperties>
    </c:if>
