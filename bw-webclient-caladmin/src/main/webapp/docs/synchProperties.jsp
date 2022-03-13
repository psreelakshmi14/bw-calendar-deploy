<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<properties>
  <logic:iterate id="property" name="properties" property="property">
    <property>
      <bw:emitText name="property" property="name" />
      <bw:emitText name="property" property="value" />
    </property>
  </logic:iterate>
</properties>
