package ucl.ac.uk.servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import ucl.ac.uk.main.ItemList;
import ucl.ac.uk.main.Model;
import ucl.ac.uk.main.ModelFactory;

@WebServlet("/view")
public class ViewList extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        Model model = ModelFactory.getModel();
        String id = request.getParameter("id");
        ItemList itemList = model.getItem(id);
        request.setAttribute("itemList", itemList);
        request.getRequestDispatcher("/view.jsp").forward(request, response);
    }

}
