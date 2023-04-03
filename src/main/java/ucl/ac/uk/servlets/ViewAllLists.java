package ucl.ac.uk.servlets;

import ucl.ac.uk.main.ItemList;
import ucl.ac.uk.main.Model;
import ucl.ac.uk.main.ModelFactory;

import java.io.*;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/viewAllLists")
public class ViewAllLists extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Model model = ModelFactory.getModel();
        ArrayList<ItemList> itemLists = model.getItems();
        request.setAttribute("itemLists", itemLists);
        request.getRequestDispatcher("/viewAllLists.jsp").forward(request, response);
    }
}