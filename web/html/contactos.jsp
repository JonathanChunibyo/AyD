<%-- 
    Document   : contactos
    Created on : 7/06/2021, 11:54:25 PM
    Author     : Jose
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
                                <h3>AyD edos</h3>
                            </div>

                        </div>
                        <div class="clearfix"></div>

                        <div class="row">
                            <div class="col-md-12 col-sm-12">
                                <div class="x_panel">
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                        </li>
                                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                                        </li>
                                    </ul>
                                    <div class="x_content">
                                        <h3>Equipo de desarrollo</h3>
                                        <img src="../img/AyDedos.png" class="logo" alt="Logo UFPS" style="height: 150px; width: 150px" align="right">
                                        <br>
                                        
                                        
                                        <h4> Somos profesionales en el desarrollo productos y servicios TI, comprometidos a proporcionar las tecnologías más innovadoras para todos nuestros clientes, con el objetivo de incrementar su productividad.</h4><br>
                                        <br><br><br>
                                        <h3>Recursos humanos</h3>
                                        <br>
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Necesidad</th>
                                                    <th scope="col">Recurso</th>
                                                    <th scope="col">Cantidad</th>
                                                    <th scope="col">Estado</th>
                                                    <th scope="col">Responsabilidades</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <th scope="row">Administrador del proyecto</th>
                                                    <td>Jonathan Adonay Rubio Jimenez</td>
                                                    <td>20 horas</td>
                                                    <td>Asignado</td>
                                                    <td>Planificar, ejecutar y monitorear las acciones y procesos de ejecución del equipo de trabajo.</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Requerimientos</th>
                                                    <td>-Jonathan Adonay Rubio Jimenez <br>
                                                        -Jose Anibal Pineda Peña <br>
                                                        -Luis Felipe Cortés Cordoba
                                                    </td>
                                                    <td>10 horas</td>
                                                    <td>Asignados</td>
                                                    <td>- Crear y desarrollar nuevos programas o sistemas.<br>
                                                        - Análisis de requerimientos.<br>
                                                        - Desarrollo de 
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Consultoría y dominio experto</th>
                                                    <td>- Yudith del Pilar Rodriguez Tenjo</td>
                                                    <td>2 horas</td>
                                                    <td>Pendiente</td>
                                                    <td>Ofrecer entrevistas para recolección de requerimientos del sistema, modificaciones y mejoras en el sistema para su entrega final.</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                       
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
