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
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/favicon.ico"/>
        <title>Desempeño docente | Inicio</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css"> 
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,600|Open+Sans" rel="stylesheet">
        
        <!-- Codigo Java -->
        <%
            String dato = "";
            if(request.getSession().getAttribute("dato") != null){
                dato = String.valueOf(request.getSession().getAttribute("dato"));
            }            
        %>
    </head>
    <body>
        <div class="contenedor">
            <div class="login-box">
                <img src="${pageContext.request.contextPath}/img/logo.png" class="logo" alt="Logo UFPS">
                <h1><center>Registro</center> </h1>
                <center><p style="color:red;"><%=dato%></p></center>
                <form action="${pageContext.request.contextPath}/registrarUsuarioServlet">
                    <!-- Datos de usuario -->
                    <label for="Usuario">Nombre*</label>
                    <input type="text" placeholder="Escriba su nombre completo" name="nombre" required>
                    <label for="Usuario">Código*</label>
                    <input type="text" placeholder="Escriba su código" name="codigo" maxlength="10" required>
                    <label for="Usuario">Correo electrónico*</label>
                    <input type="text" placeholder="Escriba su correo electrónico" name="email" required>
                    <label for="Usuario">Contraseña*</label>
                    <input type="password" placeholder="Escriba una contraseña" name="contra" maxlength="20" required>

                    <div class="custom-select" style="width:200px;">
                        
                        <select name="genero" required>
                            <option>Genero</option>
                            <option value="Hombre">Hombre</option>
                            <option value="Mujer">Mujer</option>
                            <option value="Otro">Otro</option>
                        </select>
                    </div>
                    <br>
                    <label for="Usuario">Fecha de nacimiento*</label> <br>
                    <input type="date" name="fecha">	

                    <br>

                    <hr>

                    <input type="submit" value="Registrarse" required>
                </form>

            </div>
        </div>

        <script src="${pageContext.request.contextPath}/js/select.js"></script>
    </body>
</html>
