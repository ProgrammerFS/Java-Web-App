<%@ page import="java.util.List" %>
<%@ page import="ucl.ac.uk.main.Model" %>
<%@ page import="ucl.ac.uk.main.ItemList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <link rel="stylesheet" href="insert.css"/>
</head>
<body>

<div style="text-align: center; margin-top: 30vh;">
  <h1>Rename</h1>
  <form action="/rename" method="POST" >
    <%
    out.print("<label for=\"name\">Enter new name for list : " + request.getParameter("name") + "</label><br/>");
    out.print("<input type=\"text\" name=\"name\" id=\"name\" value=\"" + request.getParameter("name") + "\">");
    out.print("<input type=\"text\" name=\"id\" value=\"" + request.getParameter("id") + "\" hidden=\"hidden\" style=\"display: none;\">");
    %>
    <input type="submit" />
  </form>
</div>
</body>
</html>