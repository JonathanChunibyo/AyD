<%-- 
    Document   : usuarioCinco
    Created on : 9/06/2021, 07:31:16 PM
    Author     : Jose
--%>

<%@page import="dto.evaluacion"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.time.LocalDate"%>
<%@page import="negocio.metodosUsuario"%>
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
        
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

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

            ResultSet rs = (ResultSet) request.getSession().getAttribute("datosEvaluacion");
            rs.next();
            String usuario = rs.getString("usuario");
            String evaluador = rs.getString("evaluador");
            String fechaDos = rs.getString("fecha");

            String competencia1 = rs.getString("competencia1");
            String competencia2 = rs.getString("competencia2");
            String competencia3 = rs.getString("competencia3");
            String competencia4 = rs.getString("competencia4");
            String competencia5 = rs.getString("competencia5");
            String competencia6 = rs.getString("competencia6");
            String competencia7 = rs.getString("competencia7");
            String competencia8 = rs.getString("competencia8");
            String competencia9 = rs.getString("competencia9");
            String competencia10 = rs.getString("competencia10");
            String competencia11 = rs.getString("competencia11");

            String dato1 = rs.getString("dato1");
            String dato2 = rs.getString("dato2");
            String dato3 = rs.getString("dato3");
            String dato4 = rs.getString("dato4");
            String dato5 = rs.getString("dato5");
            String dato6 = rs.getString("dato6");
            String dato7 = rs.getString("dato7");
            String dato8 = rs.getString("dato8");
            String dato9 = rs.getString("dato9");
            String dato10 = rs.getString("dato10");
            String dato11 = rs.getString("dato11");
            
            evaluacion evalu = new evaluacion();
            String grafica = evalu.crearGrafica(usuario, evaluador);
            double total = evalu.calcularTotal(usuario, evaluador);
            String calificacion = "";

            if (total >= 90) {
                calificacion = "SOBRESALIENTE";
            }else if(total >= 60){
                calificacion = "SATISFACTORIO";
            }else{
                calificacion = "NO SATISFACTORIO";
            }

        %>
        <%=grafica%>
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
                                    <li><a href="mostrarEvaluacionServlet"><i class="fa fa-bar-chart-o"></i>Evaluaciones<span cclass="label label-success pull-right"></span></a></li>
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
                            <div class="title_right">
                                <div class="col-md-5 col-sm-5  form-group row pull-right top_search">
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>

                        <div class="row">

                            <div class="col-md-12 col-sm-12 ">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Datos de la Evaluacion</h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>

                                    <div class="x_content">


                                        <center><h5>Datos</h5></center>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name"><h4>Informacion Basica</h4><span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 ">
                                                <div class="input-group">
                                                    <table class="default">
                                                        <tr>
                                                            <th><center>Evaluador</center></th>
                                                        <th><center>Evaluado</center></th>
                                                        <th><center>Fecha</center></th>
                                                        </tr>
                                                        <tr>
                                                            <td><input type="text" id="last-name" name="" class="form-control" value="<%=evaluador%>" readonly></td>
                                                            <td><input type="text" id="last-name" name="" class="form-control" value="<%=usuario%>" readonly></td>
                                                            <td><input type="text" id="last-name" name="" class="form-control" value="<%=fechaDos%>" readonly></td>
                                                        </tr>

                                                    </table>
                                                </div>
                                            </div>
                                        </div>

                                        <center><h5>Académica 50%</h5></center>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name"><h4>Dominio curricular</h4><span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 ">
                                                <div class="input-group">
                                                    <input type="text" id="last-name" name="ochoUno" class="form-control" value="<%=competencia1%>" style="width: 470px" readonly>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <input type="text" id="last-name" name="ochoUno" class="form-control" value="<%=dato1%>" readonly>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name"><h4>Planeación y organización académica</h4><span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 ">
                                                <div class="input-group">
                                                    <input type="text" id="last-name" name="ochoUno" class="form-control" value="<%=competencia2%>" style="width: 470px" readonly>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <input type="text" id="last-name" name="ochoUno" class="form-control" value="<%=dato2%>" readonly>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name"><h4>Pedagógica y didáctica</h4><span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 ">
                                                <div class="input-group">
                                                    <input type="text" id="last-name" name="ochoUno" class="form-control" value="<%=competencia3%>" style="width: 470px" readonly>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <input type="text" id="last-name" name="ochoUno" class="form-control" value="<%=dato3%>" readonly>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name"><h4>Evaluación del aprendizajes</h4><span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 ">
                                                <div class="input-group">
                                                    <input type="text" id="last-name" name="ochoUno" class="form-control" value="<%=competencia4%>" style="width: 470px" readonly>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <input type="text" id="last-name" name="ochoUno" class="form-control" value="<%=dato4%>" readonly>
                                                </div>
                                            </div>
                                        </div>
                                        <br><br>
                                        <hr>
                                        <center><h5>Administrativa 30%</h5></center>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name"><h4>Uso de recursos</h4><span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 ">
                                                <div class="input-group">
                                                    <input type="text" id="last-name" name="ochoUno" class="form-control" value="<%=competencia5%>" style="width: 470px" readonly>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <input type="text" id="last-name" name="ochoUno" class="form-control" value="<%=dato5%>" readonly>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name"><h4>Seguimiento de procesos</h4><span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 ">
                                                <div class="input-group">
                                                    <input type="text" id="last-name" name="ochoUno" class="form-control" value="<%=competencia6%>" style="width: 470px" readonly>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <input type="text" id="last-name" name="ochoUno" class="form-control" value="<%=dato6%>" readonly>
                                                </div>
                                            </div>
                                        </div>
                                        <br><br>
                                        <hr>
                                        <center><h5>Comunitaria 20%</h5></center>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name"><h4>Comunicación institucional</h4><span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 ">
                                                <div class="input-group">
                                                    <input type="text" id="last-name" name="ochoUno" class="form-control" value="<%=competencia7%>" style="width: 470px" readonly>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <input type="text" id="last-name" name="ochoUno" class="form-control" value="<%=dato7%>" readonly>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name"><h4>Interacción comunidad / entorno</h4><span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 ">
                                                <div class="input-group">
                                                    <input type="text" id="last-name" name="ochoUno" class="form-control" value="<%=competencia8%>" style="width: 470px" readonly>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <input type="text" id="last-name" name="ochoUno" class="form-control" value="<%=dato8%>" readonly>
                                                </div>
                                            </div>
                                        </div>
                                        <br><br>
                                        <hr>
                                        
                                        
                                        <center><h5>Competencias Comportamentales</h5></center>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name"><h4>Primero</h4><span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 ">
                                                <div class="input-group">
                                                    <input type="text" id="last-name" name="ochoUno" class="form-control" value="<%=competencia9%>" style="width: 470px" readonly>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <input type="text" id="last-name" name="ochoUno" class="form-control" value="<%=dato9%>" readonly>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name"><h4>Segundo</h4><span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 ">
                                                <div class="input-group">
                                                    <input type="text" id="last-name" name="ochoUno" class="form-control" value="<%=competencia10%>" style="width: 470px" readonly>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <input type="text" id="last-name" name="ochoUno" class="form-control" value="<%=dato10%>" readonly>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name"><h4>Tercero</h4><span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 ">
                                                <div class="input-group">
                                                    <input type="text" id="last-name" name="ochoUno" class="form-control" value="<%=competencia11%>" style="width: 470px" readonly>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <input type="text" id="last-name" name="ochoUno" class="form-control" value="<%=dato11%>" readonly>
                                                </div>
                                            </div>
                                        </div>
                                        <br>
                                        <br><br>
                                        <hr>
                                        <hr>
                                        <hr>

                                        <center><h5>Resultados</h5></center>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name"><h4>VALORACIÓN FINAL DEL DESEMPEÑO</h4><span class="required"></span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 ">
                                                <div class="input-group">
                                                    <input type="text" id="last-name" name="" value="<%=calificacion%>" class="form-control" readonly>
                                                    <input type="text" id="last-name" name="" value="<%=total%>" class="form-control" readonly>
                                                </div>
                                            </div>
                                        </div>

                                        <div id="top_x_div" style="width: 800px; height: 400px;"></div>

                                        <!-- End SmartWizard Content -->
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
        <!-- jQuery Smart Wizard -->
        <script src="${pageContext.request.contextPath}/js/jquery.smartWizard.js"></script>
        <!-- Custom Theme Scripts -->
        <script src="${pageContext.request.contextPath}/js/custom.min.js"></script>

    </body>
</html>


