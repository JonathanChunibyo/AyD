/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.*;

/**
 *
 * @author Jose
 */
public class conexion {

    private final String url = "jdbc:postgresql://localhost/desempenodoc_edd";
    private final String user = "desempenodoc_bd";
    private final String password = "11515213518";

    public Connection connect() throws ClassNotFoundException {
        Connection conn = null;
        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("Connected to the PostgreSQL server successfully.");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return conn;
    }

    /*
    public static void main(String[] args) {
        conexion app = new conexion();
        app.connect();
    }
     */
}
