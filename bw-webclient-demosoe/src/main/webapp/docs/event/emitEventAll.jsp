<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

    <%@ include file="/docs/schedule/emitEventProperties.jsp" %>
    <bw:emitText name="eventFormatter" property="xmlAccess" tagName="access"
                 filter="no"/>

