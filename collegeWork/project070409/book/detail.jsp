<%@ page contentType="text/html; charset=ms950" %>
<%@ include file="include/mysql.jsp" %>
<%@ include file="include/head.jsp" %>
<%@ include file="check/session/count.jsp" %>
<%@ include file="check/session/count_book.jsp" %>

<%--�d�߲ŦX���--%>
<sql:query var="bookinfo">
	SELECT * FROM bookinfo where ISBN = '${param.isbn}'
</sql:query>
<sql:query sql="SELECT * FROM comment where ISBN = '${param.isbn}' order by time desc" var="comment" />
<sql:query sql="SELECT * FROM tag where ISBN = '${param.isbn}'" var="tag" />
<sql:query sql="SELECT DISTINCT(id) FROM record_book where ISBN = '${param.isbn}' order by count_date desc" var="record_book" />
<sql:query sql="SELECT sum(tcount) FROM tag where ISBN = '${param.isbn}'" var="sum" />
	<c:forEach items="${sum.rowsByIndex}" var="sum_put">
		<c:set value="${sum_put[0]}" var="sumup" />
	</c:forEach>


<c:choose>
	<c:when test="${bookinfo.rowCount=='0'}">
		�d�L���
	</c:when>

	<c:otherwise>
		<p>�ԲӸ��</p>
		
<table border="1" cellspacing="0">
  <tr bgcolor="#CCCC99"> 
    <%--Title--%>
    <th>�Ϥ�</th></th></th>
    <th>�ѦW</th>
    <th>�@��</th>
    <th>�X����</th>
    <th>�X�����</th>
    <th>ISBN</th>
    <th>���O</th>
    <th>�y��</th>
  </tr>
  <c:forEach items="${bookinfo.rowsByIndex}" var="row"> 
  <tr> 
    <td><img src="images/${row[4]}.jpg"></td>
    <c:forEach begin="0" end="6" var="item"> 
    <td>${row[item]}</td>
    </c:forEach> </tr>
  <tr> 
    <td colspan="8"> <c:set var="filedir" value="file/${row[4]}/summary.jsp" /> 
      <jsp:include page="${filedir}" /> <br> <br> <br> </td>
  </tr>
  <tr> 
  
    <td colspan="8" align="center"> <br>
	<c:if test="${param.isbn!='9573258552'}">
		<a href="read/read.jsp?isbn=${row[4]}">�}�l�\Ū�q�l��</a>
	</c:if>
	<c:if test="${param.isbn=='9573258552'}">
		���ѨS���u�W��
	</c:if>	
      <br> <br> </td>
  </tr>
  <tr> 
    <td colspan="8" align="center">����<br><br>

	<c:choose>
		<c:when test="${tag.rowCount=='0'}">
			�L		
		</c:when>
	
		<c:otherwise>

			<c:forEach items="${tag.rowsByIndex}" var="tag_put">
				<a href="search.jsp?textfield=${tag_put[1]}">		
				<c:choose>
					<c:when test="${tag_put[2]>0.4*sumup}">
						<font size="10">
					</c:when>
					
					<c:when test="${tag_put[2]>0.3*sumup}">
						<font size="8">
					</c:when>

					<c:when test="${tag_put[2]>0.2*sumup}">
						<font size="6">
					</c:when>
					
					<c:when test="${tag_put[2]>0.1*sumup}">
						<font size="4">
					</c:when>
					
					<c:otherwise>
						<font size="2">
					</c:otherwise>
				</c:choose>
     		   ${tag_put[1]}</font></a>�@
			</c:forEach>
		</c:otherwise>
	</c:choose>	

<c:if test="${sessionScope.id!=null}">
	<form name="form" method="post" action="tag_deal.jsp?isbn=${param.isbn}">
          <input name="textfield" type="text" size="14"><br>
        <select name="select2">
          <option value="10">�����ʷ��j</option>
          <option value="8">�����ʤj</option>
          <option value="6" selected>�����ʴ��q</option>
          <option value="4">�����ʤp</option>
          <option value="2">�����ʷ��p</option>
        </select>
        <input type="submit" name="Submit" value="�K����">
	  </form>
</c:if>		

	 </td>
  </tr>
  <tr>
    <td colspan="8"><p align="center">��������</p>
	<c:choose>
		<c:when test="${comment.rowCount=='0'}">
			<p align="center">�L</p>
		</c:when>
	
		<c:otherwise>
			<c:forEach items="${comment.rowsByIndex}" var="comment_put">
			
			<img src="comment/star/${comment_put[4]}.gif"> <a href="blog/blog.jsp?id=${comment_put[1]}">${comment_put[1]}</a> 
			<c:if test="${comment_put[1]=='Mary'}"><a href="http://npc.twbbs.org/000000001.htm" target="_blank">��</a></c:if>
			�b�@${comment_put[2]}�@���G			
			<c:if test="${sessionScope.id==comment_put[1]}">
				<a href="detail_del.jsp?isbn=${comment_put[0]}">�R�����g���סI�I</a>
			</c:if>
			<br>
			<pre>${comment_put[3]}</pre>
			</c:forEach>
		</c:otherwise>
	</c:choose>	
	</td>
  </tr>
  </c:forEach> 
</table>			
	</c:otherwise>
</c:choose>

<c:if test="${sessionScope.id!=null}">
	<form name="form1" method="post" action="detail_deal.jsp?isbn=${param.isbn}">	  
  <p> 
    <textarea name="textarea" cols="78" rows="5"></textarea>
  </p>
  <p align="center">
    <select name="select">
      <option value="1">�@���P</option>
      <option value="2">�G���P</option>
      <option value="3" selected>�T���P</option>
      <option value="4">�|���P</option>
      <option value="5">�����P</option>
    </select>
    <input type="submit" name="Submit" value="�e�X����">
  </p>
	  </form>
</c:if>
<hr>

<div algin="center">
<c:choose>
	<c:when test="${record_book.rowCount=='0'}">
		�d�L���
	</c:when>

	<c:otherwise>
		�̪��s�������y���H���G<br>
		<c:forEach items="${record_book.rowsByIndex}" var="record_book_put">
			<a href="blog/blog.jsp?id=${record_book_put[0]}" target="_blank">${record_book_put[0]}</a> <c:if test="${record_book_put[0]=='Mary'}"><a href="http://npc.twbbs.org/000000001.htm" target="_blank">��</a></c:if><br>
		</c:forEach>
	</c:otherwise>
</c:choose>	
</div>