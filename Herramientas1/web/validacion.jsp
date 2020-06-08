<%-- 
    Document   : validacion
    Created on : 15/05/2018, 05:35:37 PM
    Author     : Ted
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    HttpSession ss = request.getSession();
    Logica.Usuarios fori = new Logica.Usuarios();
    String usr1 = request.getParameter("iUsr") == null ? "" : request.getParameter("iUsr");
    String psw1 = request.getParameter("iPsw") == null ? "" : request.getParameter("iPsw");
    
    String msj = fori.inicarSesion(usr1,psw1);
    String usuario = usr1;
    if(msj.equals("2")){
        ss.setAttribute("valido", "ok");
        ss.setAttribute("nombre",usuario);
        response.sendRedirect("usuarios.jsp");
        fori.contar(usr1);
    }else{
        if(msj.equals("1")){
        ss.setAttribute("valido", "ok");
        response.sendRedirect("admi.jsp");
        }else{
            response.sendRedirect("index.jsp");
            ss.invalidate();
        }
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        	
    </body>
</html>
