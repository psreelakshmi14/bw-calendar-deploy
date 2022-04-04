<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

  <bw:emitText name="notificationInfo" property="changed" />
  <c:forEach var="notification" items="${notificationInfo.notifications}" >
    <notification>
      <bw:emitText name="notification" property="name" />
      <bw:emitText name="notification" property="type" />
      <bw:emitText name="notification" property="xmlFragment" 
                   tagName="message" filter="false" />
    </notification>
  </c:forEach>

