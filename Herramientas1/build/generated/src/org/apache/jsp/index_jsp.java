package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");


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
        
      out.write("\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            alert('Usuario Agregado');\n");
      out.write("        </script>\n");
      out.write("    ");

    }


      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>.: Log In:.</title>\n");
      out.write("        <link href=\"//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css\" rel=\"stylesheet\" id=\"bootstrap-css\">\n");
      out.write("        <script src=\"//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js\"></script>\n");
      out.write("        <script src=\"//code.jquery.com/jquery-1.11.1.min.js\"></script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css\">\n");
      out.write("        <link href=\"css/index.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <script>\n");
      out.write("            $(function() {\n");
      out.write("            $('#login-form-link').click(function(e) {\n");
      out.write("                $(\"#login-form\").delay(100).fadeIn(100);\n");
      out.write("                        $(\"#register-form\").fadeOut(100);\n");
      out.write("                        $('#register-form-link').removeClass('active');\n");
      out.write("                        $(this).addClass('active');\n");
      out.write("                        e.preventDefault();\n");
      out.write("                });\n");
      out.write("                $('#register-form-link').click(function(e) {\n");
      out.write("                        $(\"#register-form\").delay(100).fadeIn(100);\n");
      out.write("                        $(\"#login-form\").fadeOut(100);\n");
      out.write("                        $('#login-form-link').removeClass('active');\n");
      out.write("                        $(this).addClass('active');\n");
      out.write("                        e.preventDefault();\n");
      out.write("                });\n");
      out.write("\n");
      out.write("        });\n");
      out.write("\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container\">\n");
      out.write("        <div class=\"row\">\n");
      out.write("         <div class=\"col-md-6 col-md-offset-3\">\n");
      out.write("           <div class=\"panel panel-login\">\n");
      out.write("             <div class=\"panel-body\">\n");
      out.write("               <div class=\"row\">\n");
      out.write("                 <div class=\"col-lg-12\">\n");
      out.write("                     \n");
      out.write("                     \n");
      out.write("                   <form id=\"login-form\" action=\"validacion.jsp\" method=\"post\" role=\"form\" style=\"display: block;\">\n");
      out.write("                     <h2>Iniciar Sesión</h2>\n");
      out.write("                       <div class=\"form-group\">\n");
      out.write("                          <i class=\"fa fa-user prefix grey-text\"></i>\n");
      out.write("                            <input type=\"text\" class=\"form-control\" id=\"iUsr\" name=\"iUsr\" placeholder=\"Escribe un usuario\" required=\"\" autofocus=\"\" />\n");
      out.write("                       </div>\n");
      out.write("                       <div class=\"form-group\">\n");
      out.write("                         <i class=\"fa fa-key prefix grey-text\"></i>\n");
      out.write("                    <input type=\"password\" class=\"form-control\" id=\"contra\" name=\"iPsw\" placeholder=\"Escribe la contraseña\" required=\"\"/>     \t\t  \n");
      out.write("                       </div>\n");
      out.write("                       <div class=\"col-xs-6 form-group pull-right\">     \n");
      out.write("                           <button type=\"submit\"  class=\"form-control btn btn-login\" >Iniciar Sesión</button>\n");
      out.write("                       </div>\n");
      out.write("                   </form>\n");
      out.write("                     \n");
      out.write("                     \n");
      out.write("                     \n");
      out.write("                     \n");
      out.write("                   <form id=\"register-form\" action=\"index.jsp\" method=\"post\" role=\"form\" style=\"display: none;\">\n");
      out.write("                     <h2>Registrarse</h2>\n");
      out.write("                       <div class=\"form-group\">\n");
      out.write("                         <input type=\"number\" name=\"bol\" id=\"boleta\"  class=\"form-control\" placeholder=\"Boleta\" required>\n");
      out.write("                       </div>\n");
      out.write("                     <div class=\"form-group\">\n");
      out.write("                         <input type=\"text\" name=\"nom\" id=\"nombre\" class=\"form-control\" placeholder=\"Nombre\" required>\n");
      out.write("                       </div>\n");
      out.write("                     <div class=\"form-group\">\n");
      out.write("                         <input type=\"text\" name=\"aPat\" id=\"aPat\"  class=\"form-control\" placeholder=\"Apellido Paterno\" required>\n");
      out.write("                       </div>\n");
      out.write("                     <div class=\"form-group\">\n");
      out.write("                         <input type=\"text\" name=\"aMat\" id=\"aMat\"  class=\"form-control\" placeholder=\"Apellido Materno\" required>\n");
      out.write("                       </div>\n");
      out.write("                     <div class=\"form-group\">\n");
      out.write("                         <select class=\"form-control\" name=\"carr\" >\n");
      out.write("                            <option  value=\"Ciencias de la Informatica\">Ciencias de la Informatica</option>\n");
      out.write("                            <option  value=\"Administración Industrial\">Administración Industrial</option>\n");
      out.write("                            <option  value=\"Ingeniería Industrial\">Ingeniería Industrial</option>\n");
      out.write("                            <option  value=\"Ingeniería en Informática\">Ingeniería en Informática</option>\n");
      out.write("                          </select>\n");
      out.write("                       </div>\n");
      out.write("                       <div class=\"form-group\">\n");
      out.write("                         <input type=\"text\" name=\"usr\" id=\"username\" class=\"form-control\" placeholder=\"Usuario\" required>\n");
      out.write("                       </div>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                         <input type=\"hidden\" name=\"tipoUsr\" id=\"tipoUsr\"  class=\"form-control\" placeholder=\"tipoUsr\" value=\"2\">\n");
      out.write("                       </div>\n");
      out.write("                       <div class=\"form-group\">\n");
      out.write("                         <input type=\"email\" name=\"email\" id=\"email\"  class=\"form-control\" placeholder=\"Email\" required>\n");
      out.write("                       </div>\n");
      out.write("                       <div class=\"form-group\">\n");
      out.write("                         <input type=\"password\" name=\"psw\" id=\"password\"  class=\"form-control\" placeholder=\"Password\" required>\n");
      out.write("                       </div>\n");
      out.write("                       <div class=\"form-group\">\n");
      out.write("                         <div class=\"row\">\n");
      out.write("                           <div class=\"col-sm-6 col-sm-offset-3\">\n");
      out.write("                               <button  class=\"form-control btn btn-register\">Registrarse</button>\n");
      out.write("                           </div>\n");
      out.write("                         </div>\n");
      out.write("                       </div>\n");
      out.write("                   </form>\n");
      out.write("                 </div>\n");
      out.write("               </div>\n");
      out.write("             </div>\n");
      out.write("             <div class=\"panel-heading\">\n");
      out.write("               <div class=\"row\">\n");
      out.write("                 <div class=\"col-xs-6 tabs\">\n");
      out.write("                   <a href=\"#\" class=\"active\" id=\"login-form-link\"><div class=\"login\">LOGIN</div></a>\n");
      out.write("                 </div>\n");
      out.write("                 <div class=\"col-xs-6 tabs\">\n");
      out.write("                   <a href=\"#\" id=\"register-form-link\"><div class=\"register\">REGISTRO</div></a>\n");
      out.write("                 </div>\n");
      out.write("               </div>\n");
      out.write("             </div>\n");
      out.write("           </div>\n");
      out.write("         </div>\n");
      out.write("       </div>\n");
      out.write("     </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
