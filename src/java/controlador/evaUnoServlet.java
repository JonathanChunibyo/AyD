/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import dao.evaluacionDao;
import dao.usuarioDao;
import dto.usuario;
import java.io.IOException;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Jose
 */
@WebServlet(name = "evaUnoServlet", urlPatterns = {"/evaUnoServlet"})
public class evaUnoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String datos = "";
            usuario u = (usuario) request.getSession().getAttribute("usuario");
            String evaluado = request.getParameter("docente");
            String evaluador = u.getCodigo();

            usuarioDao ud = new usuarioDao();
            usuario u2 = ud.infoUsuarioDos(evaluado);

            evaluacionDao ev = new evaluacionDao();
            ResultSet res = ev.datosEvaluacion(evaluado, evaluador);

            if (res.next() == false) {
                if (ev.crearEvaluacion(evaluado, evaluador)) {
                    String datoEva = "";
                    request.getSession().setAttribute("dato", datoEva);
                    request.getSession().setAttribute("usuarioDos", u2);
                    request.getSession().setAttribute("docente", evaluado);
                    request.getRequestDispatcher("./html/crearEvaluacionDos.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("./html/prueba.jsp").forward(request, response);
                }
            } else {
                String datoEva = "Ya Realizaste la Evaluación de este Docente";
                request.getSession().setAttribute("dato", datoEva);
                request.getRequestDispatcher("./html/crearEvaluacion.jsp").forward(request, response);
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
