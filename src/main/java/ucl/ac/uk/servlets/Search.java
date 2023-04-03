package ucl.ac.uk.servlets;

import ucl.ac.uk.main.ItemList;
import ucl.ac.uk.main.Model;
import ucl.ac.uk.main.ModelFactory;

import java.io.*;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/search")
@MultipartConfig
public class Search extends HttpServlet
{
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Model model = ModelFactory.getModel();
        ArrayList<ItemList> itemLists = model.getItems();
        request.setAttribute("items", itemLists);
        request.getRequestDispatcher("/search.jsp").forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Model model = ModelFactory.getModel();
        ArrayList<ItemList> itemLists = model.getItems();
        String searchTerm = request.getParameter("searchTerm");
        request.setAttribute("searchTerm", searchTerm);
        request.setAttribute("itemLists", itemLists);
        request.getRequestDispatcher("/search.jsp").forward(request, response);

    }
}