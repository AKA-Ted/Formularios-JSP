<%-- 
    Document   : index
    Created on : 25/05/2018, 10:49:58 PM
    Author     : Ted
--%>

<%
    HttpSession sess = request.getSession();
    String sesionValida = sess.getAttribute("valido") == null ? "": sess.getAttribute("valido").toString();
    String uf = sess.getAttribute("nombre") == null ? "": sess.getAttribute("nombre").toString();
    if(!sesionValida.equals("ok"))
    {
        response.sendRedirect("index.jsp");
        sess.invalidate();
    }
    Logica.Usuarios xd = new Logica.Usuarios();
    
    String mpsw = request.getParameter("modicontra") == null ? "" : request.getParameter("modicontra");
    String pswa = request.getParameter("contra") == null ? "" : request.getParameter("contra");
    xd.modiUsr(uf, pswa, mpsw);
    
    String r1 = request.getParameter("p1") == null ? "" : request.getParameter("p1");
    String r2 = request.getParameter("p2") == null ? "" : request.getParameter("p2");
    String r3 = request.getParameter("p3") == null ? "" : request.getParameter("p3");
    String r4 = request.getParameter("p4") == null ? "" : request.getParameter("p4");
    String r5 = request.getParameter("p5") == null ? "" : request.getParameter("p5");
    xd.calificar(uf,r1, r2, r3, r4, r5);

 %>
<!DOCTYPE html>
<html>
    <head>
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>   
        
        <script>
            $(function() {
            $('#example').barrating({
              theme: 'fontawesome-stars'
            });
          });
        </script>
        <style>
        .carousel-inner > .item > img,
        .carousel-inner > .item > a > img {
            width: 90%;
            margin: auto;
        }
        </style>
    </head>
    
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" >Modo Usuario</a>
                </div>
                 <button class="btn btn-warning navbar-btn" data-toggle="modal" data-target="#myModal">Cambiar Contraseña</button>
                 <button class="btn btn-success" data-toggle="modal" data-target="#myModal2">Contestar encuesta</button>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="index.jsp"><span class="glyphicon glyphicon-log-in"></span>Salir</a></li>
                </ul>
            </div>
        </nav>
       
        
        <!-- Modal de editar -->
        <div id="myModal2" class="modal fade" role="dialog">
            <div class="modal-dialog ">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Encuesta al usuario</h4>
                    </div>
                    <div class="modal-body" >
                    <!-- AQUI EL FORMULARIO DE CONTESTAR PREGUNTAS-->
                    <form class="form-horizontal" action="usuarios.jsp" method="post">
                    
                    <label >¿Qué calificación le darías a la presentación visual de la página?</label>
                    <div class="form-group">
                        <div class="col-sm-2" >
                         <select class="form-control col-sm-8" name="p1" >
                            <option  value="10">10</option>
                            <option  value="9">9</option>
                            <option  value="8">8</option>
                            <option  value="7">7</option>
                            <option  value="6">6</option>
                            <option  value="5">5</option>
                            <option  value="4">4</option>
                            <option  value="3">3</option>
                            <option  value="2">2</option>
                            <option  value="1">1</option>
                          </select>
                        </div>
                    </div>
                    
                    <label >¿Qué calificación le darías al contenido de la página?</label>
                    <div class="form-group">
                        <div class="col-sm-2" >
                         <select class="form-control col-sm-8" name="p2" >
                            <option  value="10">10</option>
                            <option  value="9">9</option>
                            <option  value="8">8</option>
                            <option  value="7">7</option>
                            <option  value="6">6</option>
                            <option  value="5">5</option>
                            <option  value="4">4</option>
                            <option  value="3">3</option>
                            <option  value="2">2</option>
                            <option  value="1">1</option>
                          </select>
                        </div>
                    </div>
                    
                    <label >¿Qué tan intuitivo fue el formato de registro?</label>
                    <div class="form-group">
                        <div class="col-sm-4" >
                         <select class="form-control col-sm-8" name="p3" >
                            <option  value="10">Totalmente intuitivo</option>
                            <option  value="8">Muy intuitivo</option>
                            <option  value="6">Medianamente intuitivo</option>
                            <option  value="4">Poco intuitivo</option>
                            <option  value="2">Nada intuitivo</option>
                          </select>
                        </div>
                    </div>
                    
                    <label >¿La calidad de los archivos es buena? </label>
                    <div class="form-group">
                        <div class="col-sm-4" >
                         <select class="form-control col-sm-8" name="p4" >
                            <option  value="10">Excelente</option>
                            <option  value="8">Muy buena</option>
                            <option  value="6">Media</option>
                            <option  value="4">Mala</option>
                            <option  value="2">Muy mala</option>
                          </select>
                        </div>
                    </div>
                    
                    <label>¿Qué tan bien está estructurada la página ?</label>
                    <div class="form-group">
                        <div class="col-sm-4" >
                         <select class="form-control col-sm-8" name="p5" >
                            <option  value="10">Excelente</option>
                            <option  value="8">Muy buena</option>
                            <option  value="6">Media</option>
                            <option  value="4">Mala</option>
                            <option  value="2">Muy mala</option>
                          </select>
                        </div>
                    </div>
                    
                    <div class="form-group">        
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-info " >Contestar cuestionario</button>
                        </div>
                    </div>
                    </form>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Modal de editar -->
        <div id="myModal" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Edtar Usuario</h4>
                    </div>
                    <div class="modal-body">
                    <!-- AQUI EL FORMULARIO DE AGREGAR USUARIOS-->
                    <form class="form-horizontal" action="usuarios.jsp" method="post">
                    <div class="form-group">
                        <label class=" col-sm-2" for="email">Usuario:</label>
                        <label class="col-sm-10">
                            <%= uf%>
                        </label>
                    </div>
                    <div class="form-group">
                            <label class="control-label col-sm-2" for="pwd">Contaseña:</label>
                        <div class="col-sm-10">          
                            <input type="password" class="form-control" id="contra" placeholder="Escribe la contraseña" name="contra">
                        </div>
                    </div>
                    <div class="form-group">
                            <label class="control-label col-sm-2" for="pwd">Nueva Contaseña:</label>
                        <div class="col-sm-10">          
                            <input type="password" class="form-control" id="modicontra" placeholder="Escribe un nueva contraseña" name="modicontra">
                        </div>
                    </div>
                    <div class="form-group">        
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-info " >Editar</button>
                        </div>
                    </div>
                    </form>
                    </div>
                </div>
            </div>
        </div>
                        
        <div class="col-sm-12">
            <h1>Tarea 1</h1>
            <embed src="docs/TAREA1.pdf" width="100%" height="375"> 
        </div>
        <div class="col-sm-12">
            <h1>Tarea 2</h1>
            <embed src="docs/TAREA2.pdf" width="100%" height="375"> 
        </div>
        <div class="col-sm-12">
            <h1>Tarea 3</h1>
            <embed src="docs/Tarea3.pdf" width="100%" height="375"> 
        </div>
    </body>
</html>
