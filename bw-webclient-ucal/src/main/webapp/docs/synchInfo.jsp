<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='bedework' prefix='bw' %>

<synchInfo>
  <c:if test="${not empty calForm.synchInfo}">
    <c:set var="synchInfo" value="${calForm.synchInfo}"
           scope="request" />
    <c:forEach var="conn" items="${synchInfo.conns}">
      <conn>
        <bw:emitText name="conn" property="name" />
        <bw:emitText name="conn" property="manager" />
        <bw:emitText name="conn" property="readOnly" />
        <props>
          <c:forEach var="prop" items="${conn.props}">
            <prop>
              <bw:emitText name="prop" property="name" />
              <bw:emitText name="prop" property="type" />
              <bw:emitText name="prop" property="secure" />
              <bw:emitText name="prop" property="description" />
              <bw:emitText name="prop" property="required" />
            </prop>
          </c:forEach>
        </props>
      </conn>
    </c:forEach>
  </c:if>
</synchInfo>
