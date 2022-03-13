<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<views>
  <logic:present name="bw_views_list" scope="session">
    <logic:iterate id="view" name="bw_views_list"
                   scope="session">
      <view>
        <bw:emitText name="view" property="name" />
        <logic:iterate name="view" property="collectionPaths" id="path">
          <bw:emitText name="path"/>
        </logic:iterate>
      </view>
    </logic:iterate>
  </logic:present>
</views>
