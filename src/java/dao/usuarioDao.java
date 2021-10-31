/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.usuario;
import java.io.InputStream;
import java.sql.*;
import java.time.LocalDate;

/**
 *
 * @author Jose
 */
public class usuarioDao {

    public boolean crearUsuario(usuario u) throws SQLException, ClassNotFoundException {
        Connection con = new conexion().connect();

        String query = "INSERT INTO public.usuario(codigo, nombre, email, contrasena, genero, fechanacimiento, rol) VALUES (?, ?, ?, ?, ?, ?, ?);";
        PreparedStatement mensajero = con.prepareStatement(query);
        mensajero.setInt(1, Integer.parseInt(u.getCodigo()));
        mensajero.setString(2, u.getNombre());
        mensajero.setString(3, u.getEmail());
        mensajero.setString(4, u.getContra());
        mensajero.setString(5, u.getGenero());
        mensajero.setDate(6, Date.valueOf(u.getFechaNacimiento()));
        mensajero.setString(7, u.getRol());

        return mensajero.executeUpdate() > 0;
    }

    public boolean editarUsuario(usuario u) throws SQLException, ClassNotFoundException {
        Connection con = new conexion().connect();

        String query = "UPDATE public.usuario SET nombre=?, email=?, contrasena=?, genero=?, fechanacimiento=? WHERE codigo=?;";
        PreparedStatement mensajero = con.prepareStatement(query);
        mensajero.setString(1, u.getNombre());
        mensajero.setString(2, u.getEmail());
        mensajero.setString(3, u.getContra());
        mensajero.setString(4, u.getGenero());
        mensajero.setDate(5, Date.valueOf(u.getFechaNacimiento()));
        mensajero.setInt(6, Integer.parseInt(u.getCodigo()));

        return mensajero.executeUpdate() > 0;
    }

    public boolean eliminarUsuario(usuario u) throws SQLException, ClassNotFoundException {
        Connection con = new conexion().connect();

        String query = "DELETE FROM public.usuario WHERE codigo=?;";
        PreparedStatement mensajero = con.prepareStatement(query);
        mensajero.setString(1, u.getCodigo());

        return mensajero.executeUpdate() > 0;
    }

    public usuario infoUsuario(String codigo, String contra) throws SQLException, ClassNotFoundException {
        usuario nuevo = null;
        Connection con = new conexion().connect();
        String query = "SELECT * FROM public.usuario WHERE codigo=? AND contrasena=?;";
        PreparedStatement mensajero = con.prepareStatement(query);
        mensajero.setInt(1, Integer.parseInt(codigo));
        mensajero.setString(2, contra);
        ResultSet resultados = mensajero.executeQuery();

        if (resultados.next()) {
            nuevo = new usuario(resultados.getString("codigo"), resultados.getString("nombre"), resultados.getString("email"), resultados.getString("contrasena"), resultados.getString("genero"), LocalDate.parse(resultados.getString("fechanacimiento")), resultados.getString("rol"));
        }
        return nuevo;
    }

    public boolean usuarioExiste(String email) throws SQLException, ClassNotFoundException {
        Connection con = new conexion().connect();
        String query = "SELECT * FROM usuario WHERE email=?;";
        PreparedStatement mensajero = con.prepareStatement(query);
        mensajero.setString(1, email);
        ResultSet resultados = mensajero.executeQuery();

        return resultados.next();
    }

    public boolean usuarioExisteDos(int codigo) throws SQLException, ClassNotFoundException {
        Connection con = new conexion().connect();
        String query = "SELECT * FROM usuario WHERE codigo=?;";
        PreparedStatement mensajero = con.prepareStatement(query);
        mensajero.setInt(1, codigo);
        ResultSet resultados = mensajero.executeQuery();

        return resultados.next();
    }

    public boolean cambiarContrasena(String codigo, String contra) throws SQLException, ClassNotFoundException {
        Connection con = new conexion().connect();
        String query = "UPDATE public.usuario SET contrasena=? WHERE codigo=?;";
        PreparedStatement mensajero = con.prepareStatement(query);
        mensajero.setString(1, contra);
        mensajero.setInt(2, Integer.parseInt(codigo));

        return mensajero.executeUpdate() > 0;
    }

    public boolean guardarImagen(String codigo, InputStream img) throws SQLException, ClassNotFoundException {
        Connection con = new conexion().connect();
        String query = "UPDATE public.usuario SET imagen=? WHERE codigo=?;";
        PreparedStatement mensajero = con.prepareStatement(query);
        mensajero.setBinaryStream(1, img);
        mensajero.setInt(2, Integer.parseInt(codigo));

        return mensajero.executeUpdate() > 0;
    }

    public byte[] cargarImagen(String codigo) throws SQLException, ClassNotFoundException {
        Connection con = new conexion().connect();
        String query = "SELECT imagen FROM public.usuario WHERE codigo=?;";
        PreparedStatement mensajero = con.prepareStatement(query);
        mensajero.setInt(1, Integer.parseInt(codigo));
        ResultSet resultados = mensajero.executeQuery();

        resultados.next();
        byte[] imagen = resultados.getBytes("imagen");
        return imagen;
    }

    public ResultSet totalUsuarios() throws SQLException, ClassNotFoundException {
        Connection con = new conexion().connect();
        String query = "SELECT * FROM public.usuario;";
        PreparedStatement mensajero = con.prepareStatement(query);
        ResultSet r = mensajero.executeQuery();
        return r;
    }
    
    public usuario infoUsuarioDos(String codigo) throws SQLException, ClassNotFoundException {
        usuario nuevo = null;
        Connection con = new conexion().connect();
        String query = "SELECT * FROM public.usuario WHERE codigo=?";
        PreparedStatement mensajero = con.prepareStatement(query);
        mensajero.setInt(1, Integer.parseInt(codigo));
        ResultSet resultados = mensajero.executeQuery();

        if (resultados.next()) {
            nuevo = new usuario(resultados.getString("codigo"), resultados.getString("nombre"), resultados.getString("email"), resultados.getString("contrasena"), resultados.getString("genero"), LocalDate.parse(resultados.getString("fechanacimiento")), resultados.getString("rol"));
        }
        return nuevo;
    }

    /*
    public static void main(String[] args) throws SQLException, ClassNotFoundException, FileNotFoundException, IOException {
        //usuario u = new usuario("1151535", "Jose Pineda", "jose@gmail.com", "123456", "Hombre", LocalDate.now(), "evaluado");
        
        usuarioDao n = new usuarioDao();
        //System.out.println(n.crearUsuario(u));
        //System.out.println(n.usuarioExisteDos(1151535));
        //byte[] a = {1,2,1,2,1};
        
        InputStream a = new BufferedInputStream(new FileInputStream("C:\\Users\\Jose\\Downloads\\Materias\\AyD\\prueba\\src\\java\\dao\\josepp.png"));
        byte[] byteArray = IOUtils.toByteArray(a);
        int log = byteArray.length;
        
        System.out.println(n.guardarImagen("1151535", a, log));
        
        
        File file = new File("C:\\Users\\Jose\\Downloads\\Materias\\AyD\\prueba\\src\\java\\dao\\josepp.png");
        FileInputStream fis = null;
        fis = new FileInputStream(file);
        System.out.println(n.guardarImagen("1151535", fis, (int) file.length()));
        
    }
     */
}
