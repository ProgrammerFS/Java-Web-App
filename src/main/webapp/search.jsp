<%@ page import="ucl.ac.uk.main.ItemList" %>
<%@ page import="ucl.ac.uk.main.Model" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="ucl.ac.uk.main.Model" %>
<%@ page import="ucl.ac.uk.main.ModelFactory" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search Results</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }
    h1 {
      margin-top: 50px;
      margin-bottom: 20px;
      font-size: 28px;
    }
    form {
      display: flex;
      justify-content: center;
      margin-top: 20px;
    }
    input[type="text"] {
      padding: 10px;
      font-size: 16px;
      border-radius: 5px;
      border: 1px solid #ccc;
    }
    input[type="submit"] {
      background-color: #4CAF50;
      color: white;
      border: none;
      border-radius: 5px;
      font-size: 16px;
      padding: 10px 20px;
      cursor: pointer;
      margin-left: 10px;
    }
    input[type="submit"]:hover {
      background-color: #3e8e41;
    }
    a {
      text-decoration: none;
      color: #333;
      font-size: 20px;
    }
    a:hover {
      text-decoration: underline;
    }
    .results-container {
      max-width: 800px;
      margin: 0 auto;
      padding: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }
    body {
      background-color: #f2f2f2;
      font-family: Arial, sans-serif;
      text-align: center;
      margin-top: 50px;
    }
    h1 {
      font-size: 24px;
      font-weight: bold;
      margin-top: 40px;
      margin-bottom: 20px;
      padding-bottom: 10px;
      padding-top :10px;
      border-top: 1px solid #ccc;
      border-bottom: 1px solid #ccc;
    }
    a {
      display: block;
      margin-bottom: 2px;
      padding: 5px;
      background-color: #F2F2F2;
      color: #333;
      text-decoration: none;
      border-radius: 5px;
      transition: background-color 0.3s ease;
    }
    a:hover {
      color: #007bff;
      background-color: #E2E2E2;
    }
    .results {
      display: inline-block;
      background-color: #fff;
      border-radius: 5px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
      margin-bottom: 20px;
      padding: 20px;
      max-width: 600px;
      text-align: left;
    }
  </style>
</head>
<body>
  <form method="POST" action="/search">
    <input type="text" placeholder="Enter text .." name="searchTerm"/>
    <input type="submit">
  </form>
  <%
    //Reading input from the lists and adding each element that matches the search term
    //to its respective HashMap
    ArrayList<ItemList> itemLists = (ArrayList<ItemList>) request.getAttribute("itemLists");
    HashMap<String, String> nameList = new HashMap<>();
    HashMap<String, String> textList = new HashMap<>();
    HashMap<String, String> urlList = new HashMap<>();
    String searchTerm = ((String) request.getAttribute("searchTerm"));
    if (!(searchTerm == null)){
      searchTerm = searchTerm.toLowerCase();
      for(ItemList itemList : itemLists){
        if(itemList.getName().toLowerCase().contains(searchTerm)){
          nameList.put(itemList.getName(), itemList.getId());
        }
        if (itemList.getText().toLowerCase().contains(searchTerm)){
          textList.put(itemList.getText(), itemList.getId());
        }
        if (itemList.getUrl().toLowerCase().contains(searchTerm)){
          urlList.put(itemList.getUrl(), itemList.getId());

        }
      }

    }

    out.print("<h1>Lists</h1>");
    Iterator<HashMap.Entry<String, String>> nameIterator = nameList.entrySet().iterator();
    while (nameIterator.hasNext()) {
      HashMap.Entry<String, String> entry = nameIterator.next();
      String name = entry.getKey();
      String id = entry.getValue();
      out.print("<a href=\"/view?id=" + id + "\">" + name + "<a/><br/>");
    }
    out.print("<h1>Texts</h1>");
    Iterator<HashMap.Entry<String, String>> textIterator = textList.entrySet().iterator();
    while (textIterator.hasNext()) {
      HashMap.Entry<String, String> entry = textIterator.next();
      String text = entry.getKey();
      String id = entry.getValue();
      out.print("<a href=\"/view?id=" + id + "\">" + text + "</a><br/>");
    }
    out.print("<h1>Urls</h1>");
    Iterator<HashMap.Entry<String, String>> urlIterator = urlList.entrySet().iterator();
    while (urlIterator.hasNext()) {
      HashMap.Entry<String, String> entry = urlIterator.next();
      String url = entry.getKey();
      String id = entry.getValue();
      out.print("<a href=\"/view?id=" + id + "\">" + url + "</a><br/>");
    }
  %>
  <h1></h1>
<a href="/viewAllLists" style="align-self: baseline">back</a>
</body>
</html>
