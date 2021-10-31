/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import dto.usuario;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import negocio.metodosUsuario;

/**
 *
 * @author Jose
 */
@WebServlet(name = "imagenServlet", urlPatterns = {"/imagenServlet"})
@MultipartConfig
public class imagenServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String datos = "";
            usuario u = (usuario) request.getSession().getAttribute("usuario");
            String codigo = request.getParameter("codigoImg");

            Part file = request.getPart("imagen");
            InputStream fileContenido = file.getInputStream();

            metodosUsuario mu = new metodosUsuario();

            if (mu.cambiarImagen(codigo, fileContenido)) {
                request.getSession().setAttribute("imagen", mu.cargarImagen(codigo));
                datos = "Imagen Guardada";
                request.getSession().setAttribute("dato", datos);
                
                if (u.getRol().equals("evaluado")) {
                    request.getRequestDispatcher("./html/usuarioDos.jsp").forward(request, response);
                } else if (u.getRol().equals("evaluador")) {
                    request.getRequestDispatcher("./html/datosUno.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("").forward(request, response);
                }
            } else {
                datos = "No se Pudo Guardar la Imagen";
                request.getSession().setAttribute("dato", datos);
                
                if (u.getRol().equals("evaluado")) {
                    request.getRequestDispatcher("./html/usuarioDos.jsp").forward(request, response);
                } else if (u.getRol().equals("evaluador")) {
                    request.getRequestDispatcher("./html/datosUno.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("").forward(request, response);
                }
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