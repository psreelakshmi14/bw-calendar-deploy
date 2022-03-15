<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<synchInfo>
  <logic:present name="calForm" property="synchInfo">
    <c:set var="synchInfo" value="${calForm.synchInfo}"
           scope="request" />
    <logic:iterate id="conn" name="synchInfo" property="conns">
      <conn>
        <bw:emitText name="conn" property="name" />
        <bw:emitText name="conn" property="manager" />
        <bw:emitText name="conn" property="readOnly" />
        <props>
          <logic:iterate id="prop" name="conn" property="props">
            <prop>
              <bw:emitText name="prop" property="name" />
              <bw:emitText name="prop" property="type" />
              <bw:emitText name="prop" property="secure" />
              <bw:emitText name="prop" property="description" />
              <bw:emitText name="prop" property="required" />
            </prop>
          </logic:iterate>
        </props>
      </conn>
    </logic:iterate>
  </logic:present>
</synchInfo>
