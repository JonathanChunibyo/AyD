/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.*;
import java.time.LocalDate;

/**
 *
 * @author Jose
 */
public class evaluacionDao {

    public boolean crearEvaluacion(String codigo, String codigo2) throws SQLException, ClassNotFoundException {
        Connection con = new conexion().connect();

        String query = "INSERT INTO public.evaluacion(usuario, evaluador, fecha) VALUES (?, ?, ?);";
        PreparedStatement mensajero = con.prepareStatement(query);
        mensajero.setInt(1, Integer.parseInt(codigo));
        mensajero.setInt(2, Integer.parseInt(codigo2));
        mensajero.setDate(3, Date.valueOf(LocalDate.now()));

        return mensajero.executeUpdate() > 0;
    }

    public boolean agregarDatosUno(String codigo1, String codigo2, String texto1, String texto2, String texto3, String texto4, String texto5, String texto6, String texto7, String texto8, String dato1, String dato2, String dato3, String dato4, String dato5, String dato6, String dato7, String dato8) throws SQLException, ClassNotFoundException {
        Connection con = new conexion().connect();

        String query = "UPDATE public.evaluacion SET competencia1=?, competencia2=?, competencia3=?, competencia4=?, competencia5=?, competencia6=?, competencia7=?, competencia8=?, dato1=?, dato2=?, dato3=?, dato4=?, dato5=?, dato6=?, dato7=?, dato8=? WHERE usuario=? AND evaluador=?;";
        PreparedStatement mensajero = con.prepareStatement(query);
        mensajero.setString(1, texto1);
        mensajero.setString(2, texto2);
        mensajero.setString(3, texto3);
        mensajero.setString(4, texto4);
        mensajero.setString(5, texto5);
        mensajero.setString(6, texto6);
        mensajero.setString(7, texto7);
        mensajero.setString(8, texto8);
        mensajero.setString(9, dato1);
        mensajero.setString(10, dato2);
        mensajero.setString(11, dato3);
        mensajero.setString(12, dato4);
        mensajero.setString(13, dato5);
        mensajero.setString(14, dato6);
        mensajero.setString(15, dato7);
        mensajero.setString(16, dato8);
        mensajero.setInt(17, Integer.parseInt(codigo1));
        mensajero.setInt(18, Integer.parseInt(codigo2));

        return mensajero.executeUpdate() > 0;
    }

    public boolean agregarDatosDos(String codigo1, String codigo2, String texto1, String texto2, String texto3, String dato1, String dato2, String dato3) throws SQLException, ClassNotFoundException {
        Connection con = new conexion().connect();

        String query = "UPDATE public.evaluacion SET competencia9=?, competencia10=?, competencia11=?, dato9=?, dato10=?, dato11=? WHERE usuario=? AND evaluador=?;";
        PreparedStatement mensajero = con.prepareStatement(query);
        mensajero.setString(1, texto1);
        mensajero.setString(2, texto2);
        mensajero.setString(3, texto3);
        mensajero.setString(4, dato1);
        mensajero.setString(5, dato2);
        mensajero.setString(6, dato3);
        mensajero.setInt(7, Integer.parseInt(codigo1));
        mensajero.setInt(8, Integer.parseInt(codigo2));

        return mensajero.executeUpdate() > 0;
    }

    public ResultSet datosEvaluacion(String codigo1, String codigo2) throws ClassNotFoundException, SQLException {
        Connection con = new conexion().connect();
        String query = "SELECT * FROM public.evaluacion WHERE usuario=? AND evaluador=?;";
        PreparedStatement mensajero = con.prepareStatement(query);
        mensajero.setInt(1, Integer.parseInt(codigo1));
        mensajero.setInt(2, Integer.parseInt(codigo2));
        ResultSet r = mensajero.executeQuery();
        return r;
    }
    
    public ResultSet datosEvaluacionUno(String codigo) throws ClassNotFoundException, SQLException {
        Connection con = new conexion().connect();
        String query = "SELECT * FROM public.evaluacion WHERE usuario=?;";
        PreparedStatement mensajero = con.prepareStatement(query);
        mensajero.setInt(1, Integer.parseInt(codigo));
        ResultSet r = mensajero.executeQuery();
        return r;
    }
    
    public ResultSet datosEvaluacionDos(String codigo) throws ClassNotFoundException, SQLException {
        Connection con = new conexion().connect();
        String query = "SELECT * FROM public.evaluacion WHERE evaluador=?;";
        PreparedStatement mensajero = con.prepareStatement(query);
        mensajero.setInt(1, Integer.parseInt(codigo));
        ResultSet r = mensajero.executeQuery();
        return r;
    }
    
    public String nombreUsuario(String codigo) throws ClassNotFoundException, SQLException {
        Connection con = new conexion().connect();
        String query = "SELECT nombre FROM public.usuario WHERE codigo=?;";
        PreparedStatement mensajero = con.prepareStatement(query);
        mensajero.setInt(1, Integer.parseInt(codigo));
        ResultSet r = mensajero.executeQuery();
        r.next();
        
        return r.getString("nombre");
    }
    
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        evaluacionDao e = new evaluacionDao();
        ResultSet r = e.datosEvaluacionUno("1151525");
        r.next();
        System.out.println(r.getString("evaluador"));
    }
}
