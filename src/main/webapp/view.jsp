<%@ page import="ucl.ac.uk.main.ItemList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>View Item</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
    }
    .container {
      max-width: 100%;
      margin: 50px auto;
      background-color: #fff;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
      animation: fade-in 0.5s ease-out;
    }
    h1 {
      font-size: 36px;
      margin-bottom: 20px;
    }
    .field {
      margin-bottom: 20px;
    }
    .field label {
      display: block;
      font-size: 18px;
      margin-bottom: 10px;
      color: #444;
    }
    .field-value {
      font-size: 24px;
      color: black;
    }
    .card-header {
      max-width: calc(100% - 50px);
      display: inline-block;
      vertical-align: middle;
      font-size: 20px;
      font-weight: bold;
      margin-bottom: 10px;
      color: #222;
    }
    a {
      color: #2196f3;
      text-decoration: none;
      display: none;
      border-bottom: 1px solid #2196f3;
      transition: border-bottom 0.2s ease-in-out;
    }
    a:hover {
      border-bottom-color: #0d47a1;
    }
    img {
      max-width: 20%;
    }
    @keyframes fade-in {
      from { opacity: 0; }
      to { opacity: 1; }
    }
    .card-edit-icon {
      display: inline-block;
      vertical-align: middle;
      font-size: 1.5em;
      color: #aaa;
      cursor: pointer;
      margin-left: 10px;
      transition: color 0.3s;
      font-size: 20px;
    }
  </style>
</head>
<body>

<div class="container">
  <a href="/viewAllLists" style="display: inline-block"><button>Back</button></a>
  <h1>View Item</h1>

  <div class="field">
    <%ItemList itemList = ((ItemList) request.getAttribute("itemList"));%>
    <%if (itemList.getName()!=null){%>
    <label>Name</label>
    <%out.print("<span class=\"field-value\">" + itemList.getName().toUpperCase() + "</span><a href=\"/rename?id=" + itemList.getId() + "&name=" + itemList.getName() + "\" style=\"display: inline-block;\"><div class=\"card-edit-icon\" style=\"font-size: 20px;\">&#9998;</div></a>");%>

    <%}%>
  </div>
  <div class="field">
    <%if (itemList.getText()!=null){%>
    <label>Text</label>
    <span class="field-value"><%= itemList.getText() %></span>
    <%}%>
  </div>
  <div class="field">
    <%if (itemList.getUrl()!=null){%>
    <label>URL</label>
    <span class="field-value"><a href="<%= itemList.getUrl() %>" style="display: inline-block"><%= itemList.getUrl() %></a></span>
    <%}%>
  </div>
  <div class="field">
    <%if (itemList.getLinkedlist()!=null){%>
    <label>LinkedList</label>
    <% out.print("<span class=\"field-value\"><a href=\"/view?id=" + itemList.getLinkedlist() + "\" style=\"display: inline-block\">Linked List</a></span><br/>");%>
    <%};%>
  </div>
  <div class="field">

    <%
      if (itemList.getImage()!=null && !itemList.getImage().equals("images/default-image.png")){
        out.print("<label>Image</label><br/>");
        out.print("<img src=\"" + itemList.getImage() + "\"/><br/>");
      }
      out.print("<br/>");
      out.print("<a href=\"/delete?id=" + itemList.getId() + "\" style=\"display: inline-block; color: white;\"><button type=\"submit\" style=\"margin-right: 10px;\">Delete</button></a>");
      out.print("<a href=\"/edit?id=" + itemList.getId() + "\" style=\"display: inline-block\"; color: white;><button type=\"submit\" style=\"margin-left: 10px;\">Edit</button></a>");
    %>
  </div>

  </div>

</body>
</html>
