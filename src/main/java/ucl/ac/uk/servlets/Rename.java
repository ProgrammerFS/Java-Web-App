package ucl.ac.uk.servlets;

import ucl.ac.uk.main.Model;
import ucl.ac.uk.main.ModelFactory;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/rename")
public class Rename extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/rename.jsp").forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        Model model = ModelFactory.getModel();
        model.rename(id, name);
        response.sendRedirect("/viewAllLists");
    }
}