<%-- 
    Document   : index
    Created on : 26/05/2021, 09:39:32 AM
    Author     : JONATHAN ADONAY RUBIO JIMENEZ
    Code       : 1151521
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="Author" content="Jonathan Adonay Rubio Jimenez" lang="es">
        <title>Desempeño docente | Inicio</title>
        <link rel="icon" type="image/x-icon" href="../img/favicon.ico"/>
        <link rel="stylesheet" href="css/css.css"> 
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,600|Open+Sans" rel="stylesheet"> 
    </head>
    <body>
        <div class="contenedor">
            <div class="login-box">
                <img src="img/logo.png" class="logo" alt="Logo UFPS">
                <h1><center> Desempeño docente</center> </h1>
                <form>
                    <!-- Datos de usuario -->
                    <label for="Usuario">Digite su usuario</label>
                    <input type="text" placeholder="Usuario" name="user">
                    <!-- Constraseña -->
                    <label for="Usuario">Digite contraseña</label>
                    <input type="password" placeholder="Contraseña" name="password">

                    <input type="submit"  value="Iniciar sesión">
                    <a href="html/sesion.jsp" class="btn btn-success">prueba inicio sesion</a>
                    <a  href="#" id="btn-abrir-popup" class="btn-abrir-popup">¿Olvidaste tu clave?</a> <br>
                    <a  href="html/registro.jsp"> Registrarse </a>
                </form>
                <a title="Programa sistemas" target="_blank" href="https://ingsistemas.cloud.ufps.edu.co/"><img src="img/link1.png" class="link1" alt="Programa ing. sistemas"></a> 
                <a title="Programa sistemas" target="_blank" href="https://divisist2.ufps.edu.co/"><img src="img/link2.jpg" class="link2" alt="Programa ing. sistemas"></a> 
                <a title="Programa sistemas" target="_blank" href="https://divisist2.ufps.edu.co/login_plad"><img src="img/link3.png" class="link3" alt="Programa ing. sistemas"></a> 
            </div>

            <div class="overlay" id="overlay">
                <div class="popup" id="popup">
                    <a href="#" id="btn-cerrar-popup" class="btn-cerrar-popup"><i class="fas fa-times"></i></a>

                    <h3> Desempeño docente </h3>

                    <h4>Recuperar contraseña</h4>
                    <p>Para restablecer su clave de usuario complete el siguiente formulario con uno de los correos electrónicos asociados a su código y el texto de la imagen mostrada. Al oprimir el botón "Enviar enlace" se enviará un correo con un enlace de recuperación.</p>

                    <form>    
                        <!-- Datos de usuario -->
                        <label for="Usuario">Código*</label> &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" placeholder="Escriba su código" name="user"> <br>
                        <!-- Constraseña -->
                        <label for="Usuario">Email*</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="text" placeholder="Escriba su correo electrónico" name="correo">
                        <p type="example">example: "docente@ufps.edu.co"</p>
                        <br><br><br>
                        <center><input type="submit" value="Enviar enlace"></center>

                    </form>

                </div>
            </div>

        </div>

        <script src="js/popup.js"></script>
    </body>
</html>
