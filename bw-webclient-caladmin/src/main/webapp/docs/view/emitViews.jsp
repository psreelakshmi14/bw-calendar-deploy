<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<views>
  <c:if test="${not empty sessionScope.bw_views_list}">
    <c:forEach var="view" items="${sessionScope.bw_views_list}">
      <view>
        <bw:emitText name="view" property="name" />
        <c:forEach var="path" items="${view.collectionPaths}">
          <bw:emitText name="path"/>
        </c:forEach>
      </view>
    </c:forEach>
  </c:if>
</views>
