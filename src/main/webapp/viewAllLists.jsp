<%@ page import="java.util.ArrayList" %>
<%@ page import="ucl.ac.uk.main.Model" %>
<%@ page import="ucl.ac.uk.main.Model" %>
<%@ page import="ucl.ac.uk.main.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Lists</title>
    <link rel="stylesheet" href="viewAllLists.css"/>

</head>
<body>

<h1>Lists</h1>
<ul>
  <a href="/insert" ><button style="margin-bottom: 15px;margin-top: 10px">Add Lists</button></a><br/>
  <a href="/search" ><button style="margin-bottom: 15px;">Search</button></a>
<%
  ArrayList<ItemList> itemLists = (ArrayList<ItemList>) request.getAttribute("itemLists");


  for(ItemList itemList : itemLists)
  {
    out.print("<li>");
    out.print("<div class=\"card\">");
    out.print("<div class=\"card-header\" style=\"font-size: 30px;\">" + itemList.getName() + "<a href=\"/rename?id=" + itemList.getId() + "&name=" + itemList.getName() + "\" ><div class=\"card-edit-icon\" style=\"font-size: 20px;\">&#9998;</div></a></div>");
    out.print("<br/>");
    out.print("<div class=\"card-body-container\">");
    if (!itemList.getText().equals("")) {
      out.print("<div class=\"card-body-text\" style=\"font-size: 20px;\">Text : " + itemList.getText() + "</a></div><br/>");
      out.print("<br/>");
    }
    if (!itemList.getUrl().equals("")) {
      out.print("<div class=\"card-body-url\" style=\"font-size: 20px;\">URL : " + "<a href=" + itemList.getUrl() + ">" + "Click here to view url" + "</a>" + "</a></div><br/>");
      out.print("<br/>");
    }
    if (itemList.getLinkedlist()!=null && !itemList.getLinkedlist().equals("") && !itemList.getLinkedlist().equals("null")){
      out.print("<div class=\"card-body-url\" style=\"font-size: 20px;\">LinkedList : <a href=\"/view?id=" + itemList.getLinkedlist() + "\" style=\"display: inline-block\">Linked List</a></div><br/>");
    };
    out.print("<div class=\"card-image-container\">");
    if (!itemList.getImage().equals("images/default-image.png")) {
      out.print("<img src=\"" + itemList.getImage() + "\" width=\"200\" height=\"150\" style=\"padding-bottom: 10px;\"></div>");
      out.print("</div>");
    }
    out.print("<a href=\"/delete?id=" + itemList.getId() + "\" style=\"padding-right: 10px;\"><button type=\"submit\">Delete List</button></a>");
    out.print("<a href=\"/edit?id=" + itemList.getId() + "\" style=\"padding-right: 10px;\"><button type=\"submit\">Edit Items</button></a>");
    out.print("<a href=\"/view?id=" + itemList.getId() + "\" style=\"padding-right: 10px;\"><button type=\"submit\">View List</button></a>");
    out.print("</li>");

  }

%>
</ul>

</body>
</html>
