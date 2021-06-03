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
        <link rel="icon" type="image/x-icon" href="../img/favicon.ico"/>
        <title>Desempeño docente | Inicio</title>

        <link rel="stylesheet" href="../css/css.css"> 
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,600|Open+Sans" rel="stylesheet">
    </head>
    <body>
        <div class="contenedor">
            <div class="login-box">
                <img src="../img/logo.png" class="logo" alt="Logo UFPS">
                <h1><center> Registro</center> </h1>
                <form>
                    <!-- Datos de usuario -->
                    <label for="Usuario">Nombre*</label>
                    <input type="text" placeholder="Escriba su nombre completo" name="name">
                    <label for="Usuario">Código*</label>
                    <input type="text" placeholder="Escriba su código" name="user">
                    <!-- Constraseña -->
                    <label for="Usuario">Correo electrónico*</label>
                    <input type="text" placeholder="Escriba su correo electrónico" name="email">
                    <label for="Usuario">Contacto*</label>
                    <input type="text" placeholder="Escriba su numero de celular" name="name">

                    <div class="custom-select" style="width:200px;">

                        <select>
                            <option value="0">Genero</option>
                            <option value="1">Hombre</option>
                            <option value="2">Mujer</option>
                            <option value="3">Otro</option>
                        </select>
                    </div>
                    <br>
                    <label for="Usuario">Fecha de nacimiento*</label> <br>
                    <input type="date">	

                    <br>

                    <hr>

                    <input type="submit" value="Registrarse">
                </form>

            </div>
        </div>

        <script src="../js/select.js"></script>
    </body>
</html>
