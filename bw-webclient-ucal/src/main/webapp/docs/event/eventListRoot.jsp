<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<%--  Generate events --%>
<c:set var="detailView" value="true" scope="request"/>
<events>
  <logic:present name="bw_search_result" scope="request">
    <c:set var="sres" value="${bw_search_result}" />
    <logic:present name="bw_search_params" scope="request" >
      <c:set var="params" value="${bw_search_params}" />
      <bw:emitText name="params" property="curOffset" />
      <bw:emitText name="params" property="pageSize" />
      <logic:present  name="params" property="toDate">
        <bw:emitText name="params" property="toDate.dtval" />
      </logic:present>
    </logic:present>
    <logic:notPresent name="bw_search_params" scope="request" >
      <curOffset>0</curOffset>
      <pageSize>0</pageSize>
      <toDate.dtval>19530315</toDate.dtval>
    </logic:notPresent>

    <paged>true</paged>
    <bw:emitText name="sres" property="found" tagName="resultSize" />

    <logic:present name="bw_search_list" scope="request">
      <logic:iterate id="sre" name="bw_search_list" scope="request">
        <logic:equal name="sre" property="docType" value="event">
          <c:set var="eventFormatter" value="${sre.entity}"
                 scope="request"  />
          <%@include file="/docs/event/emitEvent.jsp"%>
        </logic:equal>
      </logic:iterate>
    </logic:present>
  </logic:present>
</events>
