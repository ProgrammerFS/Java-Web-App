package ucl.ac.uk.servlets;

import java.io.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import ucl.ac.uk.main.Model;
import ucl.ac.uk.main.ModelFactory;

@WebServlet("/delete")
public class Delete extends HttpServlet
{
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        Model model = ModelFactory.getModel();
        model.deleteItem(id);
        response.sendRedirect("/viewAllLists");
    }
}