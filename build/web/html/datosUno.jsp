<%-- 
    Document   : datosUno
    Created on : 6/06/2021, 06:49:40 PM
    Author     : JONATHAN ADONAY RUBIO JIMENEZ
--%>

<%@page import="dto.usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/favicon.ico"/>

        <title>Desempeño docente | Inicio</title>

        <!-- Bootstrap -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet">
        <!-- NProgress -->
        <link href="${pageContext.request.contextPath}css/nprogress.css" rel="stylesheet">
        <!-- iCheck -->
        <link href="${pageContext.request.contextPath}/css/green.css" rel="stylesheet">

        <!-- bootstrap-progressbar -->
        <link href="${pageContext.request.contextPath}/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
        <!-- JQVMap -->
        <link href="${pageContext.request.contextPath}/css/jqvmap.min.css" rel="stylesheet"/>
        <!-- bootstrap-daterangepicker -->
        <link href="${pageContext.request.contextPath}/css/daterangepicker.css" rel="stylesheet">

        <!-- Custom Theme Style -->
        <link href="${pageContext.request.contextPath}/css/custom.min.css" rel="stylesheet">

        <!-- Codigo Java -->
        <%
            String dato = "";
            if (request.getSession().getAttribute("dato") != null) {
                dato = String.valueOf(request.getSession().getAttribute("dato"));
            }

            String nombre = "";
            String email = "";
            String codigo = "";
            String rol = "";
            String genero = "";
            String fecha = "";
            if (request.getSession().getAttribute("usuario") != null) {
                usuario u = (usuario) request.getSession().getAttribute("usuario");
                nombre = u.getNombre();
                email = u.getEmail();
                codigo = u.getCodigo();
                rol = u.getRol();
                genero = u.getGenero();
                fecha = String.valueOf(u.getFechaNacimiento());
            }

        %>
    </head>

    <body class="nav-md">

        <div class="container body">
            <div class="main_container">
                <div class="col-md-3 left_col">
                    <div class="left_col scroll-view">
                        <div class="navbar nav_title" style="border: 0;">
                            <a href="infoServlet" class="site_title"><i class="fa fa-book"></i> <span>Evaluador</span></a>
                        </div>

                        <div class="clearfix"></div>

                        <!-- menu profile quick info -->
                        <div class="profile clearfix">
                            <div class="profile_pic">
                                <img src="data:image/png;base64,${imagen}" alt="..." class="img-circle profile_img">
                            </div>
                            <div class="profile_info">
                                <span>Bienvenido</span>
                                <h2><%=nombre%></h2>
                            </div>
                        </div>
                        <!-- /menu profile quick info -->

                        <br />

                        <!-- sidebar menu -->
                        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                            <div class="menu_section">
                                <h3>General</h3>
                                <ul class="nav side-menu">
                                    <li><a href="datosUsuarioServlet"><i class="fa fa-laptop"></i> Información Personal <span class="label label-success pull-right"></span></a></li>
                                    <li><a href="crearEvaluacionServlet"><i class="fa fa-edit"></i> Evaluación Docente <span class="label label-success pull-right" ></span></a></li>
                                    <li><a href="mostrarEvaluacionServlet"><i class="fa fa-bar-chart-o"></i>Evaluaciones Realizadas<span cclass="label label-success pull-right"></span></a></li>
                                </ul>
                            </div>
                            <div class="menu_section">
                                <h3>Información</h3>
                                <ul class="nav side-menu">
                                    <li><a href="contactosServlet"><i class="fa fa-bug"></i> Contacto <span  class="label label-success pull-right"></span></a></li>
                                    <li><a><i class="fa fa-windows"></i> Extras <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li><a href="infoServlet">Interes</a></li>  
                                            <li><a href="errorServlet">404 Error</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>

                        </div>
                        <!-- /sidebar menu -->

                        <!-- /menu footer buttons -->
                        <div class="sidebar-footer hidden-small">
                            <a data-toggle="tooltip" data-placement="top" title="Settings">
                                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
                            </a>
                            <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
                            </a>
                            <a data-toggle="tooltip" data-placement="top" title="Lock">
                                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
                            </a>
                            <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.html">
                                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                            </a>
                        </div>
                        <!-- /menu footer buttons -->
                    </div>
                </div>

                <!-- top navigation -->
                <div class="top_nav">
                    <div class="nav_menu">
                        <div class="nav toggle">
                            <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                        </div>
                        <nav class="nav navbar-nav">
                            <ul class=" navbar-right">
                                <li class="nav-item dropdown open" style="padding-left: 15px;">
                                    <a href="javascript:;" class="user-profile dropdown-toggle" aria-haspopup="true" id="navbarDropdown" data-toggle="dropdown" aria-expanded="false"></a>
                                    <div class="dropdown-menu dropdown-usermenu pull-right" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item"  href="datosUsuarioServlet"> Perfil</a>
                                        <a class="dropdown-item"  href="indexServlet"><i class="fa fa-sign-out pull-right"></i> Cerrar Sesión</a>
                                    </div>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <!-- /top navigation -->


                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">
                        <div class="page-title">
                            <div class="title_left">
                                <h3>Informacion Personal</h3>
                            </div>

                        </div>
                        <div class="clearfix"></div>

                        <div class="row">
                            <div class="col-md-12 col-sm-12">
                                <div class="x_panel">
                                    <span class="section">Docente / Evaluador</span>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                        </li>
                                    </ul>
                                    <div class="x_content">
                                        <form action="${pageContext.request.contextPath}/contrasenaServlet">
                                            <div class="field item form-group">
                                                <label class="col-form-label col-md-3 col-sm-3  label-align">Nombre: <span class="required"></span></label>
                                                <div class="col-md-6 col-sm-6">
                                                    <input class="form-control" class='text' value="<%=nombre%>" name="nombre" required readonly>
                                                </div>
                                            </div>
                                            <div class="field item form-group">
                                                <label class="col-form-label col-md-3 col-sm-3  label-align">Codigo: <span class="required"></span></label>
                                                <div class="col-md-6 col-sm-6">
                                                    <input class="form-control" class='number' value="<%=codigo%>" name="codigo" type="number" required readonly></div>
                                            </div>
                                            <div class="field item form-group">
                                                <label class="col-form-label col-md-3 col-sm-3  label-align">Correo electronico: <span class="required"></span></label>
                                                <div class="col-md-6 col-sm-6">
                                                    <input class="form-control" type="email" class='email' value="<%=email%>" name="email" data-validate-linked='email' required readonly></div>
                                            </div>
                                            <div class="field item form-group">
                                                <label class="col-form-label col-md-3 col-sm-3  label-align">Genero: <span class="required"></span></label>
                                                <div class="col-md-6 col-sm-6">
                                                    <input class="form-control" class='text' type="text" value="<%=genero%>" name="genero" required readonly></div>
                                            </div>
                                            <div class="field item form-group">
                                                <label class="col-form-label col-md-3 col-sm-3  label-align">Fecha de nacimiento: <span class="required"></span></label>
                                                <div class="col-md-6 col-sm-6">
                                                    <input class="form-control" class='date' type="date" value="<%=fecha%>" name="fecha" required readonly></div>
                                            </div>


                                            <div class="field item form-group">
                                                <label class="col-form-label col-md-3 col-sm-3  label-align">Contraseña: <span class="required"> </span></label>
                                                <div class="col-md-6 col-sm-6">
                                                    <input class="form-control" type="password" id="password1" name="contra1" required>
                                                </div>
                                            </div>

                                            <div class="field item form-group">
                                                <label class="col-form-label col-md-3 col-sm-3  label-align">Nueva contraseña: <span class="required"></span></label>
                                                <div class="col-md-6 col-sm-6">
                                                    <input class="form-control" type="password" name="contra2" data-validate-linked='password' required></div>
                                            </div>
                                            <div class="ln_solid">
                                                <div class="form-group">
                                                    <div class="col-md-6 offset-md-3">
                                                        <br>
                                                        <p style="color:red;"><%=dato%></p>
                                                        <button type='submit' class="btn btn-primary">Actualizar</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>


                                        <div class="ln_solid">
                                            <div class="form-group">
                                                <div class="col-md-6 offset-md-3">
                                                    <hr style="height:2px;border-width:0;color:gray;background-color:gray">

                                                    <form action="${pageContext.request.contextPath}/imagenServlet" method="post" enctype="multipart/form-data">
                                                        <input class="form-control" class='number' type="hidden" value="<%=codigo%>" name="codigoImg" type="number" required readonly>
                                                        <input  class="form-control" type="file" name="imagen" accept="image/png" required>
                                                        <br>
                                                        <center><button type='submit' class="btn btn-primary">Subir Imagen</button></center>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- footer content -->
                <footer>
                    <div class="pull-right">
                        Equipo de desarrollo: AyDedos
                    </div>
                    <div class="clearfix"></div>
                </footer>
                <!-- /footer content -->
            </div>
        </div>

        <!-- jQuery -->
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
        <!-- FastClick -->
        <script src="${pageContext.request.contextPath}/js/fastclick.js"></script>
        <!-- NProgress -->
        <script src="${pageContext.request.contextPath}/js/nprogress.js"></script>
        <!-- Chart.js -->
        <script src="${pageContext.request.contextPath}/js/Chart.min.js"></script>
        <!-- gauge.js -->
        <script src="${pageContext.request.contextPath}/js/gauge.min.js"></script>
        <!-- bootstrap-progressbar -->
        <script src="${pageContext.request.contextPath}/js/bootstrap-progressbar.min.js"></script>
        <!-- iCheck -->
        <script src="${pageContext.request.contextPath}/js/icheck.min.js"></script>
        <!-- Skycons -->
        <script src="${pageContext.request.contextPath}/js/skycons.js"></script>
        <!-- Flot -->
        <script src="${pageContext.request.contextPath}/js/jquery.flot.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.flot.pie.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.flot.time.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.flot.stack.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.flot.resize.js"></script>
        <!-- Flot plugins -->
        <script src="${pageContext.request.contextPath}/js/jquery.flot.orderBars.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.flot.spline.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/curvedLines.js"></script>
        <!-- DateJS -->
        <script src="${pageContext.request.contextPath}/js/date.js"></script>
        <!-- JQVMap -->
        <script src="${pageContext.request.contextPath}/js/jquery.vmap.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.vmap.world.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.vmap.sampledata.js"></script>
        <!-- bootstrap-daterangepicker -->
        <script src="${pageContext.request.contextPath}/js/moment.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/daterangepicker.js"></script>

        <!-- Custom Theme Scripts -->
        <script src="${pageContext.request.contextPath}/js/custom.min.js"></script>

    </body>
</html>
