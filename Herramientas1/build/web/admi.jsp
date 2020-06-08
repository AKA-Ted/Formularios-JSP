<%-- 
    Document   : admi
    Created on : 26/05/2018, 11:49:14 AM
    Author     : Ted
--%>

<%
    HttpSession sess = request.getSession();
    String sesionValida = sess.getAttribute("valido") == null ? "": sess.getAttribute("valido").toString();
    if(!sesionValida.equals("ok"))
    {
        response.sendRedirect("index.jsp");
        sess.invalidate();
    }
    Logica.Usuarios diego = new Logica.Usuarios();
    
    String bol = request.getParameter("bol") == null ? "" : request.getParameter("bol");
    String usr = request.getParameter("usr") == null ? "" : request.getParameter("usr");
    String tipoUsr = request.getParameter("tipoUsr") == null ? "" : request.getParameter("tipoUsr");
    String psw = request.getParameter("psw") == null ? "" : request.getParameter("psw");
    String mail = request.getParameter("email") == null ? "" : request.getParameter("email");
    String crra = request.getParameter("carr") == null ? "" : request.getParameter("carr");
    String nom = request.getParameter("nom") == null ? "" : request.getParameter("nom");
    String aPat = request.getParameter("aPat") == null ? "" : request.getParameter("aPat");
    String aMat = request.getParameter("aMat") == null ? "" : request.getParameter("aMat");
    diego.agregarUsr(bol, usr, tipoUsr, mail, crra, psw, nom, aPat, aMat);
    
    String busr = request.getParameter("busr") == null ? "" : request.getParameter("busr");
    diego.borraUsr(busr);
    
    String info = diego.consulta();
    String tabla = diego.contados();
    String califUsr = diego.consultaProm();
    String prom = diego.media();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>.: Administrador :.</title>
        
        <link href="css/cssindex.css" rel="stylesheet" type="text/css"/>
        <script src="js/jsindex.js" type="text/javascript"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" >Modo Administrador</a>
                </div>
                <button class="btn btn-primary navbar-btn" data-toggle="modal" data-target="#myModal1">Agregar</button>
                <button class="btn btn-danger navbar-btn" data-toggle="modal" data-target="#myModal2">Borrar</button>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="index.jsp"><span class="glyphicon glyphicon-log-in"></span>Salir</a></li>
                </ul>
            </div>
        </nav>
        
        <!-- Modal de borrar -->
        <div id="myModal2" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Borrar Usuario</h4>
                    </div>
                    <div class="modal-body">
                    <!-- AQUI EL FORMULARIO DE borrar USUARIOS-->
                    <form class="form-horizontal" action="admi.jsp" method="post">
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="email">Usuario:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="busr" placeholder="Escribe un usuario" name="busr">
                            </div>
                        </div>
                        <div class="form-group">        
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-info " >Borrar</button>
                            </div>
                        </div>
                    </form>
                    </div>
                </div>
            </div>
        </div>
        
        <div id="myModal1" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Agregar Usuario</h4>
                    </div>
                    <div class="modal-body">
                    <!-- AQUI EL FORMULARIO DE AGREGAR USUARIOS-->
                        <form class="form-horizontal" action="admi.jsp" method="post">
                           <div class="form-group">
                                <label class="control-label col-sm-2" for="email">Boleta:</label>
                               <div class="col-sm-10">
                                <input type="number" name="bol" id="boleta"  class="form-control" placeholder="Boleta" required>
                               </div>
                           </div>
                         <div class="form-group">
                             
                            <label class="control-label col-sm-2" for="email">Nombre:</label>
                             <div class="col-sm-10">
                             <input type="text" name="nom" id="nombre" class="form-control" placeholder="Nombre" required>
                             </div>
                         </div>
                            
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="email">Apellido Paterno:</label>
                            <div class="col-sm-10">
                            <input type="text" name="aPat" id="aPat"  class="form-control" placeholder="Apellido Paterno" required>
                            </div>
                       </div>
                         <div class="form-group">
                            
                            <label class="control-label col-sm-2" for="email">Apellido Materno:</label>
                            <div class="col-sm-10">
                             <input type="text" name="aMat" id="aMat"  class="form-control" placeholder="Apellido Materno" required>
                           </div>
                         </div>
                         <div class="form-group">
                             
                            <label class="control-label col-sm-2" for="email">Selcciona:</label>
                            <div class="col-sm-10">
                             <select class="form-control" name="carr" >
                                <option  value="Ciencias de la Informatica">Ciencias de la Informatica</option>
                                <option  value="Administración Industrial">Administración Industrial</option>
                                <option  value="Ingeniería Industrial">Ingeniería Industrial</option>
                                <option  value="Ingeniería en Informática">Ingeniería en Informática</option>
                              </select>
                           </div>
                         </div>
                           <div class="form-group">
                               
                            <label class="control-label col-sm-2" for="email">Usuario:</label>
                            <div class="col-sm-10">
                             <input type="text" name="usr" id="username" class="form-control" placeholder="Usuario" required>
                           </div>
                           </div>
                            <div class="form-group">
                                
                                <label class="control-label col-sm-2" for="email">Selecciona:</label>
                                <div class="col-sm-10">
                                <select class="form-control" name="tipoUsr" >
                                   <option  value="1">Administrador</option>
                                   <option  value="2">Usuario</option>
                                 </select>
                                 </div>
                           </div>
                           <div class="form-group">
                            <label class="control-label col-sm-2" for="email">E-Mail:</label>
                            <div class="col-sm-10">
                             <input type="email" name="email" id="email"  class="form-control" placeholder="Email" required>
                           </div>
                           </div>
                           <div class="form-group">
                            <label class="control-label col-sm-2" for="email">Contraseña:</label>
                            <div class="col-sm-10">
                             <input type="password" name="psw" id="password"  class="form-control" placeholder="Password" required>
                           </div>
                           </div>
                           <div class="form-group">
                             <div class="row">
                               <div class="col-sm-6 col-sm-offset-3">
                                   <button type="submit" class="btn btn-info " >Registrar</button>
                               </div>
                             </div>
                           </div>
                       </form>
                    </div>
                </div>
            </div>
        </div>
        
        <h3>Información de Usuarios Registrados</h3>
        <%=info%>
        <h3>Calificación de nuestros usuarios</h3>
        <%= califUsr%>
        <div align="center">
            <h3>Calificación promedio de la página</h3>
            <h3><%=prom%></h3>
        </div>
        <h3>Registro de Entradas</h3>
        <%= tabla%>
    </body>
</html>
