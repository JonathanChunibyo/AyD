<%-- 
    Document   : prueba
    Created on : 5/06/2021, 03:06:45 PM
    Author     : Jose
--%>

<%@page import="dto.usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            String dato = "";
            if(request.getSession().getAttribute("dato") != null){
                dato = String.valueOf(request.getSession().getAttribute("dato"));
            }            
        %>
    </head>
    <body>
        <h1>no sirve conitan</h1>
        <%=dato%>
        
    </body>
</html>
