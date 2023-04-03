package ucl.ac.uk.servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import ucl.ac.uk.main.Model;
import ucl.ac.uk.main.ModelFactory;

@WebServlet("/edit")
@MultipartConfig
public class Edit extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id = request.getParameter("id");
        request.setAttribute("id", id);
        request.getRequestDispatcher("/edit.jsp").forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id = request.getParameter("id");
        String text = request.getParameter("text");
        String url = request.getParameter("url");
        Part filePart = request.getPart("image");
        String linkList = request.getParameter("linkList");
        Model model = ModelFactory.getModel();
        model.editItem(id, text, url, filePart, linkList);
        response.sendRedirect("/viewAllLists");

    }
}