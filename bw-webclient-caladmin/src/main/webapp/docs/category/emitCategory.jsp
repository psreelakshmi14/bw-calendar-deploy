<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix="c" %>
<%@ taglib uri='struts-logic' prefix='logic' %>
<%@ taglib uri='bedework' prefix='bw' %>

<category>
  <%-- unique id  --%>
  <bw:emitText name="category" property="uid" />
  <bw:emitText name="category" property="href" />
  <%-- text value of the category --%>
  <c:if test="${not empty category.word}" >
    <bw:emitText name="category" property="word.value" tagName="value" />
  </c:if>
  <c:if test="${empty category.word}" >
    <value></value>
  </c:if>
    <bw:emitText name="category" property="colPath" />
    <bw:emitText name="category" property="name" />
  <%-- description of the category  --%>
    <bw:emitText name="category" property="descriptionVal" tagName="description" />
    <%-- status of the category  --%>
    <bw:emitText name="category" property="status" tagName="status" />
  <%-- creator of the category  --%>
  <bw:emitText name="category" property="creatorHref" tagName="creator" />
</category>

