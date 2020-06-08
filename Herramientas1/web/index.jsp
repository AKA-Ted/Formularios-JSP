<%
    Logica.Usuarios fori = new Logica.Usuarios();
    String bol = request.getParameter("bol") == null ? "" : request.getParameter("bol");
    String usr = request.getParameter("usr") == null ? "" : request.getParameter("usr");
    String tipoUsr = request.getParameter("tipoUsr") == null ? "" : request.getParameter("tipoUsr");
    String psw = request.getParameter("psw") == null ? "" : request.getParameter("psw");
    String mail = request.getParameter("email") == null ? "" : request.getParameter("email");
    String crra = request.getParameter("carr") == null ? "" : request.getParameter("carr");
    String nom = request.getParameter("nom") == null ? "" : request.getParameter("nom");
    String aPat = request.getParameter("aPat") == null ? "" : request.getParameter("aPat");
    String aMat = request.getParameter("aMat") == null ? "" : request.getParameter("aMat");
    
    String msj = fori.agregarUsr(bol, usr, tipoUsr, mail, crra, psw , nom, aPat, aMat);
    
    if(msj.equals("AGREGADO")){
        %>
        <script type="text/javascript">
            alert('Usuario Agregado');
        </script>
    <%
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>.: Log In:.</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
        <script>
            $(function() {
            $('#login-form-link').click(function(e) {
                $("#login-form").delay(100).fadeIn(100);
                        $("#register-form").fadeOut(100);
                        $('#register-form-link').removeClass('active');
                        $(this).addClass('active');
                        e.preventDefault();
                });
                $('#register-form-link').click(function(e) {
                        $("#register-form").delay(100).fadeIn(100);
                        $("#login-form").fadeOut(100);
                        $('#login-form-link').removeClass('active');
                        $(this).addClass('active');
                        e.preventDefault();
                });

        });

        </script>
    </head>
    <body >
        <div class="container">
        <div class="row">
         <div class="col-md-6 col-md-offset-3">
           <div class="panel panel-login">
             <div class="panel-body">
               <div class="row">
                 <div class="col-lg-12">
                     
                     
                   <form id="login-form" action="validacion.jsp" method="post" role="form" style="display: block;">
                     <h2>Iniciar Sesión</h2>
                       <div class="form-group">
                          <i class="fa fa-user prefix grey-text"></i>
                            <input type="text" class="form-control" id="iUsr" name="iUsr" placeholder="Escribe un usuario" required="" autofocus="" />
                       </div>
                       <div class="form-group">
                         <i class="fa fa-key prefix grey-text"></i>
                    <input type="password" class="form-control" id="contra" name="iPsw" placeholder="Escribe la contraseña" required=""/>     		  
                       </div>
                       <div class="col-xs-6 form-group pull-right">     
                           <button type="submit"  class="form-control btn btn-login" >Iniciar Sesión</button>
                       </div>
                   </form>
                     
                     
                     
                     
                   <form id="register-form" action="index.jsp" method="post" role="form" style="display: none;">
                     <h2>Registrarse</h2>
                       <div class="form-group">
                         <input type="number" name="bol" id="boleta"  class="form-control" placeholder="Boleta" required>
                       </div>
                     <div class="form-group">
                         <input type="text" name="nom" id="nombre" class="form-control" placeholder="Nombre" required>
                       </div>
                     <div class="form-group">
                         <input type="text" name="aPat" id="aPat"  class="form-control" placeholder="Apellido Paterno" required>
                       </div>
                     <div class="form-group">
                         <input type="text" name="aMat" id="aMat"  class="form-control" placeholder="Apellido Materno" required>
                       </div>
                     <div class="form-group">
                         <select class="form-control" name="carr" >
                            <option  value="Ciencias de la Informatica">Ciencias de la Informatica</option>
                            <option  value="Administración Industrial">Administración Industrial</option>
                            <option  value="Ingeniería Industrial">Ingeniería Industrial</option>
                            <option  value="Ingeniería en Informática">Ingeniería en Informática</option>
                          </select>
                       </div>
                       <div class="form-group">
                         <input type="text" name="usr" id="username" class="form-control" placeholder="Usuario" required>
                       </div>
                        <div class="form-group">
                         <input type="hidden" name="tipoUsr" id="tipoUsr"  class="form-control" placeholder="tipoUsr" value="2">
                       </div>
                       <div class="form-group">
                         <input type="email" name="email" id="email"  class="form-control" placeholder="Email" required>
                       </div>
                       <div class="form-group">
                         <input type="password" name="psw" id="password"  class="form-control" placeholder="Password" required>
                       </div>
                       <div class="form-group">
                         <div class="row">
                           <div class="col-sm-6 col-sm-offset-3">
                               <button  class="form-control btn btn-register">Registrarse</button>
                           </div>
                         </div>
                       </div>
                   </form>
                 </div>
               </div>
             </div>
             <div class="panel-heading">
               <div class="row">
                 <div class="col-xs-6 tabs">
                   <a href="#" class="active" id="login-form-link"><div class="login">LOGIN</div></a>
                 </div>
                 <div class="col-xs-6 tabs">
                   <a href="#" id="register-form-link"><div class="register">REGISTRO</div></a>
                 </div>
               </div>
             </div>
           </div>
         </div>
       </div>
     </div>
    </body>
</html>
