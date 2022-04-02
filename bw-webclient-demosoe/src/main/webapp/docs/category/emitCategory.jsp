<%@ taglib uri='bedework' prefix='bw' %>

<category>
  <%-- unique id  --%>
  <bw:emitText name="category" property="uid" />
  <%-- text value of the category --%>
  <c:if test="${not empty category.word}" >
    <bw:emitText name="category" property="word.value" tagName="value" />
  </c:if>
  <c:if test="${empty category.word}" >
    <value></value>
  </c:if>
  <c:if test="${not empty category.colPath}" >
      <bw:emitText name="category" property="colPath" />
  </c:if>
  <c:if test="${not empty category.name}" >
      <bw:emitText name="category" property="name" />
  </c:if>
  <%-- description of the category  --%>
  <c:if test="${not empty category.descriptionVal}" >
      <bw:emitText name="category" property="descriptionVal" tagName="description" />
  </c:if>
    <%-- status of the category  --%>
    <c:if test="${not empty category.status}" >
      <bw:emitText name="category" property="status" tagName="status" />
    </c:if>
  <%-- creator of the category  --%>
  <bw:emitText name="category" property="creatorHref" tagName="creator" />
</category>

