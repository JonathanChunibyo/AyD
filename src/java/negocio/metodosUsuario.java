/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import dao.usuarioDao;
import dto.usuario;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

/**
 *
 * @author Jose
 */
public class metodosUsuario {

    public metodosUsuario() {
    }

    public boolean nuevoUsuario(usuario u) throws SQLException, ClassNotFoundException {
        boolean respuesta = false;

        usuarioDao info = new usuarioDao();
        if (!(info.usuarioExiste(u.getEmail()) || info.usuarioExisteDos(Integer.parseInt(u.getCodigo())))) {
            if (info.crearUsuario(u)) {
                respuesta = true;
            }
        }
        return respuesta;
    }

    public usuario iniciarSesion(String codigo, String contra) throws SQLException, ClassNotFoundException {
        usuarioDao info = new usuarioDao();
        usuario u = info.infoUsuario(codigo, contra);
        return u;
    }

    public boolean cambiarContra(String codigo, String contra, String contraDos) throws SQLException, ClassNotFoundException {
        boolean respuesta = false;
        usuarioDao info = new usuarioDao();
        if (info.infoUsuario(codigo, contra) != null) {
            respuesta = info.cambiarContrasena(codigo, contraDos);
        }

        return respuesta;
    }

    public boolean cambiarImagen(String codigo, InputStream img) throws SQLException, ClassNotFoundException {
        usuarioDao info = new usuarioDao();
        return info.guardarImagen(codigo, img);
    }

    public String cargarImagen(String codigo) throws SQLException, ClassNotFoundException {
        String respuesta = "";
        usuarioDao info = new usuarioDao();
        if(info.cargarImagen(codigo) != null){
            byte[] photo = info.cargarImagen(codigo);
            respuesta = Base64.getEncoder().encodeToString(photo);
        }

        return respuesta;
    }
    
    public String dibujarUsuario() throws SQLException, ClassNotFoundException{
        String datos = "";
        usuarioDao info = new usuarioDao();
        ResultSet r = info.totalUsuarios();
        
        while (r.next()) {
            datos += "<option value=\""+ r.getString("codigo") +"\">" + r.getString("nombre") +"</option>";
        }
        
        return datos;
    }
    
    /*
    public boolean nuevaImagen(String codigo) throws FileNotFoundException, SQLException, ClassNotFoundException{
        usuarioDao n = new usuarioDao();
        File file = new File("${pageContext.request.contextPath}/img/perfil.png");
        FileInputStream fis = null;
        fis = new FileInputStream(file);
        return n.guardarImagen(codigo, fis);
    }
    */
    /*
    public static void main(String[] args) throws SQLException, FileNotFoundException, ClassNotFoundException {
        metodosUsuario mu = new metodosUsuario();
        //usuario u = new usuario("1151532", "Jose", "josepp@gmail.com", "123", "Hombre", LocalDate.now(), "evaluado");
        //System.out.println(mu.nuevoUsuario(u));
        //System.out.println(mu.iniciarSesion("1151535", "123456"));
        System.out.println(mu.nuevaImagen("1151535"));
    }
     */
}
