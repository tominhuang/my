<%@ page contentType="text/html; charset=big5" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=big5">
<title>�j�M</title>
</head>

<body>
�D<a href="query_all.jsp">�C�X�Ҧ��U�Ȫ����</a><br>
<br>
�D����j�M
<br><br>
<form name="form1" method="post" action="query_option.jsp">
  �@�j�M���ءG
    <select name="select">
      <option value="1" selected>�m�W</option>
      <option value="2">�ͤ�</option>
      <option value="3">�q��</option>
      <option value="4">�b��</option>
    </select> 
    ����r
    <input type="text" name="textfield">
    <input type="submit" name="Submit" value="�e�X">

</form>
</body>
</html>