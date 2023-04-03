<%@ page import="ucl.ac.uk.main.Model" %>
<%@ page import="ucl.ac.uk.main.ItemList" %>
<%@ page import="java.util.List" %>
<%@ page import="ucl.ac.uk.main.Model" %>
<%@ page import="ucl.ac.uk.main.ModelFactory" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit List</title>
    <link rel="stylesheet" href="insert.css">
</head>
<body>

<form action="/edit" method="POST" enctype="multipart/form-data">
    <%
    Model model = ModelFactory.getModel();
    ItemList itemList = model.getItem(request.getParameter("id"));
    out.print("<h1>Edit List : " + itemList.getName() +"</h1>");
    out.print("<label for=\"text\">Enter text:</label>");
    out.print("<input type=\"text\" name=\"text\" id=\"text\" value=\"" +  itemList.getText() + "\"/><br>");
    out.print("<label for=\"url\">Enter URL:</label>");
    out.print("<input type=\"url\" name=\"url\" value=\"" + itemList.getUrl() + "\"/><br>");
    out.print("<label for=\"image\">Choose Image :</label>");
    out.print("<p>If you would like to keep the previous image, please select it again</p>");
    out.print("<input type=\"file\" name=\"image\" id=\"image\" value=\"images/default-image.png\"/><br>");
    out.print("<input type=\"hidden\" name=\"id\" value=\"" + request.getAttribute("id") + "\"/>");%>
    <%  List<ItemList> itemLists = model.getItems();
        if (itemLists.size() > 1) {
            out.print("<label for=\"linkList\">Choose a link List</label><br/>");
            out.print("<select name=\"linkList\" id=\"linkList\">");
            out.print("<option value=\"" + null + "\"></option>");
            for (ItemList selectItemList : itemLists) {
                if (selectItemList.getId().equals(itemList.getLinkedlist())) {
                    out.print("<option value=\"" + selectItemList.getId() + "\" " + "selected>" + selectItemList.getName() + "</option>");
                }
                else if (selectItemList.getId().equals(itemList.getId())){
                    //don't display
                }
                else{
                    out.print("<option value=\"" + selectItemList.getId() + "\" " + ">" + selectItemList.getName() + "</option>");
                }
            }
            out.print("</select><br>");
        }%>
    <input type="submit" />
</form>
<a href="/viewAllLists">Cancel Edit</a>
</body>
</html>
