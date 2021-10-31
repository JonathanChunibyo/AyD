/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import dto.usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import negocio.metodosUsuario;

/**
 *
 * @author Jose
 */
@WebServlet(name = "loginServlet", urlPatterns = {"/loginServlet"})
public class loginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String datos = "";
            String codigo = request.getParameter("codigo");
            String contra = request.getParameter("contra");
            
            metodosUsuario mu = new metodosUsuario();
            usuario u = mu.iniciarSesion(codigo, contra);
            
            if (u != null && u.getRol().equals("evaluado")) {
                request.getSession().setAttribute("imagen", mu.cargarImagen(codigo));
                request.getSession().setAttribute("usuario", u);
                request.getRequestDispatcher("./html/usuarioTres.jsp").forward(request, response);
            } else if (u != null && u.getRol().equals("evaluador")) {
                request.getSession().setAttribute("imagen", mu.cargarImagen(codigo));
                request.getSession().setAttribute("usuario", u);
                request.getRequestDispatcher("./html/info.jsp").forward(request, response);
            } else if (u != null && u.getRol().equals("admin")) {
                request.getSession().setAttribute("imagen", mu.cargarImagen(codigo));
                request.getSession().setAttribute("usuario", u);
                request.getRequestDispatcher("").forward(request, response);

            } else {
                datos = "Datos Incorrectos";
                request.getSession().setAttribute("dato", datos);
                request.getRequestDispatcher("./index.jsp").forward(request, response);
            }

        } catch (Exception ex) {
            request.getRequestDispatcher("./html/prueba.jsp").forward(request, response);
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
