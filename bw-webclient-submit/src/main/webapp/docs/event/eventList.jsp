
<bedework>
<%@include file="/docs/header.jsp"%>

<page>eventList</page>
<tab>main</tab>

<%@include file="/docs/event/eventListRoot.jsp"%>

<%--  Generate form elements to be exposed
Unused
<formElements>
  <bw:form action="event/fetchForDisplay.do">
    <listAllSwitchFalse>
      <html:radio name="calForm" property="listAllEvents"
                    value="false"
                    onclick="document.calForm.submit();" />
    </listAllSwitchFalse>
    <listAllSwitchTrue>
      <html:radio name="calForm" property="listAllEvents"
                    value="true"
                    onclick="document.calForm.submit();" />
    </listAllSwitchTrue>
  </bw:form>
</formElements>
 --%>

<%@include file="/docs/footer.jsp"%>

</bedework>
