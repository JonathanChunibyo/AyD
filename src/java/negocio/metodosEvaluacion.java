/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import dao.evaluacionDao;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Jose
 */
public class metodosEvaluacion {

    public metodosEvaluacion() {
    }

    public String dibujarEvaluaciones(String codigo) throws ClassNotFoundException, SQLException {
        String respuesta = "";

        evaluacionDao ev = new evaluacionDao();

        ResultSet r = ev.datosEvaluacionUno(codigo);
        ResultSet r2 = ev.datosEvaluacionDos(codigo);
        while (r.next()) {
            respuesta += "<form action=\"mostrarEvaluacionDosServlet\">\n"
                    + "<tr>\n"
                    + "<td><input type=\"text\" id=\"last-name\" name=\"\" class=\"form-control\" value=\"" + ev.nombreUsuario(r.getString("evaluador")) + "\"></td>\n"
                    + "<input type=\"hidden\" id=\"last-name\" name=\"usuarioUno\" class=\"form-control\" value=\"" + r.getString("evaluador") + "\"></td>"
                    + "<td><input type=\"text\" id=\"last-name\" name=\"\" class=\"form-control\" value=\"" + ev.nombreUsuario(r.getString("usuario")) + "\"></td>\n"
                    + "<input type=\"hidden\" id=\"last-name\" name=\"usuarioDos\" class=\"form-control\" value=\"" + r.getString("usuario") + "\"></td>"
                    + "<td><input type=\"text\" id=\"last-name\" name=\"\" class=\"form-control\" value=\"" + r.getString("fecha") + "\"></td>\n"
                    + "<td><input type=\"submit\" value=\"Mostrar\" style=\"background-color: gray; border: none; color: white; padding: 10px 20px; text-decoration: none; margin: 4px 2px; cursor: pointer;\"></td>\n"
                    + "</tr>\n"
                    + "</form>\n";
        }
        
        while (r2.next()) {            
            respuesta += "<form action=\"mostrarEvaluacionDosServlet\">\n"
                    + "<tr>\n"
                    + "<td><input type=\"text\" id=\"last-name\" name=\"\" class=\"form-control\" value=\"" + ev.nombreUsuario(r2.getString("evaluador")) + "\"></td>\n"
                    + "<input type=\"hidden\" id=\"last-name\" name=\"usuarioUno\" class=\"form-control\" value=\"" + r2.getString("evaluador") + "\"></td>"
                    + "<td><input type=\"text\" id=\"last-name\" name=\"\" class=\"form-control\" value=\"" + ev.nombreUsuario(r2.getString("usuario")) + "\"></td>\n"
                    + "<input type=\"hidden\" id=\"last-name\" name=\"usuarioDos\" class=\"form-control\" value=\"" + r2.getString("usuario") + "\"></td>"
                    + "<td><input type=\"text\" id=\"last-name\" name=\"\" class=\"form-control\" value=\"" + r2.getString("fecha") + "\"></td>\n"
                    + "<td><input type=\"submit\" value=\"Mostrar\" style=\"background-color: gray; border: none; color: white; padding: 10px 20px; text-decoration: none; margin: 4px 2px; cursor: pointer;\"></td>\n"
                    + "</tr>\n"
                    + "</form>\n";
        }

        return respuesta;
    }
    
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        metodosEvaluacion me = new metodosEvaluacion();
        System.out.println(me.dibujarEvaluaciones("1151535"));
    }
}
