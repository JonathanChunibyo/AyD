/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import dao.evaluacionDao;
import dto.evaluacion;
import dto.usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Jose
 */
@WebServlet(name = "evaTresServlet", urlPatterns = {"/evaTresServlet"})
public class evaTresServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String datos = "";
            usuario u = (usuario) request.getSession().getAttribute("usuario");
            String evaluado = String.valueOf(request.getSession().getAttribute("docente"));
            String evaluador = u.getCodigo();
            
            String unoUno = request.getParameter("unoUno");
            String unoDos = request.getParameter("unoDos");
            String dosUno = request.getParameter("dosUno");
            String dosDos = request.getParameter("dosDos");
            String tresUno = request.getParameter("tresUno");
            String tresDos = request.getParameter("tresDos");
                    
            evaluacionDao ev = new evaluacionDao();
            evaluacion e = new evaluacion();
            
            
            
            if(ev.agregarDatosDos(evaluado, evaluador, unoUno, dosUno, tresUno, unoDos, dosDos, tresDos)){
                request.getSession().setAttribute("grafica", e.crearGrafica(evaluado, evaluador));
                double total = e.calcularTotal(evaluado, evaluador);
                request.getSession().setAttribute("total", total);
                
                if(total >= 90){
                    request.getSession().setAttribute("calificacion", "SOBRESALIENTE");
                }else if(total >= 60){
                    request.getSession().setAttribute("calificacion", "SATISFACTORIO");
                }else{
                    request.getSession().setAttribute("calificacion", "NO SATISFACTORIO");
                }
                
                request.getRequestDispatcher("./html/crearEvaluacionCuatro.jsp").forward(request, response);
            }else{
                request.getRequestDispatcher("./html/prueba.jsp").forward(request, response);
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
