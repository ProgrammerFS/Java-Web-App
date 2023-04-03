<%@ page import="ucl.ac.uk.main.*" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: fahads
  Date: 08/03/2023
  Time: 9:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Lists</title>
    <link rel="stylesheet" href="insert.css"/>
    <script>
        function showFileName() {
            var fileInput = document.getElementById("file");
            var fileName = fileInput.files[0].name;
            var label = document.querySelector('label[for="file"]');
            label.innerHTML = "File uploaded: " + fileName;
        }
    </script>

</head>
<body>
<form action="insert" method="POST" enctype="multipart/form-data">
    <h1>Create a List : </h1>
    <label for="text">Enter text:</label>
    <input type="text" name="text" id="text" /><br>
    <label for="url">Enter URL:</label>
    <input type="url" name="url" id="url" value=""/><br>
    <label for="name">Enter Name:</label>
    <input type="text" name="name" id="name" required/><br>
    <label for="file">Choose Image:</label><br/>
    <input type="file" name="file" id="file" class="fileInput" onchange="showFileName()"/>

        <%
            //shows the link list options only if one or more lists exists
            ArrayList<ItemList> lists = (ArrayList<ItemList>) request.getAttribute("itemList");
            if (lists.size() > 0) {
                out.print("<label for=\"linkList\">Choose a link List</label><br/>");
                out.print("<select name=\"linkList\" id=\"linkList\">");
                out.print("<option value=\"" + null + "\"></option>");
                for (ItemList itemList : lists) {
                    out.print("<option value=\"" + itemList.getId() + "\" " + ">" + itemList.getName() + "</option>");
                }
                out.print("</select><br>");
            }%>
    <input type="submit"/>
</form>
<a href="/viewAllLists">check_list</a>
</body>
</html>
