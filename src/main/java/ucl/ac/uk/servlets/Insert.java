package ucl.ac.uk.servlets;

import java.io.*;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import ucl.ac.uk.main.ItemList;
import ucl.ac.uk.main.Model;
import ucl.ac.uk.main.ModelFactory;

@WebServlet("/insert")
@MultipartConfig
public class Insert extends HttpServlet
{
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException
    {
        Model model = ModelFactory.getModel();
        ArrayList<ItemList> itemList = model.getItems();
        request.setAttribute("itemList", itemList);
        request.getRequestDispatcher("/insert.jsp").forward(request, response);
    }
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException
    {
        Model model = ModelFactory.getModel();
        String text = request.getParameter("text");
        String url = request.getParameter("url");
        String name = request.getParameter("name");
        Part filePart = request.getPart("file");
        String linklist = request.getParameter("linkList");
        model.addItem(text,name,url, filePart, linklist);
        response.sendRedirect("/viewAllLists");
    }
}