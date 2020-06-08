package Logica;

import java.sql.ResultSet;
public class Usuarios {
    String error = "";
    String usr = "";
    String psw = "";

    public String getError() {
        return error;
    }

    public String getUsr() {
        return usr;
    }

    public String getPsw() {
        return psw;
    }
    
    
    public String inicarSesion(String usr,String contr){
        String msj = "";
        BD.cDatos base = new BD.cDatos();
        ResultSet respuesta = null;
        try{
            base.conectar();
            respuesta = base.consulta("call iniciarSes('"+usr+"','"+contr+"')");
            if(respuesta.next())
                msj = respuesta.getString("tipoUsr");
            base.cierraConexion();
        }
        catch(Exception error){
            msj = "Error inesperado en loggin";
        }
        return msj;
    }
    
    public String agregarUsr(String bol, String usr, String tipoUsr, String mail, String crra, String contr, String nom,
            String aPat, String aMat){
        String msj = "";
        BD.cDatos base = new BD.cDatos();
        ResultSet respuesta = null;
        try{
            base.conectar();
            respuesta = base.consulta("call inserteUsr('"+bol+"','"+usr+"','"+tipoUsr+"','"+mail+"',"
                    + "'"+crra+"','"+contr+"','"+nom+"','"+aPat+"','"+aMat+"');");
            if(respuesta.next())
                msj = respuesta.getString("Resultado");
            base.cierraConexion();
        }catch(Exception xxx){
            msj = "No se registro";
        }
        return msj;
    }
    
    public String borraUsr(String usr){
        String msj = "";
        BD.cDatos base = new BD.cDatos();
        ResultSet respuesta = null;
        try{
            base.conectar();
            respuesta = base.consulta("call BorrarUser('"+usr+"');");
            if(respuesta.next())
                msj = respuesta.getString("Resultado");
            base.cierraConexion();
            
        }catch(Exception xdxd){
            msj = "no se borro";
        }
        return msj;
    }
    
    public String modiUsr(String usr, String psw, String npsw){
        String msj = "";
        BD.cDatos base = new BD.cDatos();
        ResultSet respuesta = null;
        try{
            base.conectar();
            respuesta = base.consulta("call actualizarContra('"+usr+"','"+psw+"','"+npsw+"');");
            if(respuesta.next())
                msj = respuesta.getString("Resultado");
            base.cierraConexion();
            
        }catch(Exception xdxd){
            msj = "no se borro";
        }
        return msj;
    }
    
    public String calificar(String usr, String r1, String r2, String r3, String r4, String r5){
        String msj = "";
        BD.cDatos base = new BD.cDatos();
        ResultSet respuesta = null;
        try{
            base.conectar();
            respuesta = base.consulta("call calif('"+usr+"','"+r1+"','"+r2+"','"+r3+"','"+r4+"','"+r5+"');");
            if(respuesta.next())
                msj = respuesta.getString("Resultado");
            base.cierraConexion();
            
        }catch(Exception xdxd){
            msj = "no se borro";
        }
        return msj;
    }
    
    
    
    public void contar(String usr){
        String msj = "";
        BD.cDatos base = new BD.cDatos();
        ResultSet respuesta = null;
        try{
            base.conectar();
            respuesta = base.consulta("call contar('"+usr+"')");
            base.cierraConexion();
        }
        catch(Exception error){
            msj = "Error ";
        }
    }
    
    public String media(){
        String msj = "";
        BD.cDatos base = new BD.cDatos();
        ResultSet respuesta = null;
        try{
             base.conectar();
            respuesta = base.consulta("select round(avg(fin),2) from usuarios where tipoUsr != 1;  ");
            if(respuesta.next())
                msj = respuesta.getString("round(avg(fin),2)");
            base.cierraConexion();
        }
        catch(Exception error){
            msj = "Error ";
        }
        return msj;
    }
    
    public String contados(){
        ResultSet despliegue = null;
        BD.cDatos obj = new BD.cDatos();
        String usuarios = "<table  class=\"table table-striped\">";
                usuarios += "<thead>";
                usuarios += "<th>No. de Entrada</th>";
                usuarios += "<th>Dia/Hora</th>";
                usuarios += "<th>Boleta</th>";
                usuarios += "<th>Nombre del Usuario</th>";
                usuarios += "<th>Carrera</th>";
                usuarios += "</thead>";
        try{
            obj.conectar();
            despliegue = obj.consulta("select * from entradas INNER JOIN usuarios ON entradas.usr = usuarios.usr;");
            while(despliegue.next()){
                usuarios += "<tr>";
                usuarios += "<td>";
                usuarios += despliegue.getString("idEnt");
                usuarios += "</td>";
                usuarios += "<td>";
                usuarios += despliegue.getString("dia");
                usuarios += "</td>";
                usuarios += "<td>";
                usuarios += despliegue.getString("bol");
                usuarios += "</td>";
                usuarios += "<td>";
                usuarios += despliegue.getString("nom");
                usuarios += "&nbsp";
                usuarios += despliegue.getString("aPat");
                usuarios += "&nbsp";
                usuarios += despliegue.getString("aMat");
                usuarios += "</td>";
                usuarios += "<td>";
                usuarios += despliegue.getString("crra");
                usuarios += "</td>";
                usuarios += "</tr>";
            }
            usuarios +="</table>";
            obj.cierraConexion();  
        }catch(Exception ted){
            this.error = ted.getMessage();
        }
        return usuarios;
    }
    
    public String consultaProm(){
        ResultSet despliegue = null;
        BD.cDatos obj = new BD.cDatos();
        String usuarios = "<table  class=\"table table-striped\">";
                usuarios += "<thead>";
                usuarios += "<th>Usuario</th>";
                usuarios += "<th>Promedio de Calificacion</th>";
                usuarios += "</thead>";
        try{
            obj.conectar();
            despliegue = obj.consulta("select usr, fin from usuarios where tipoUsr != 1;");
            while(despliegue.next()){
                usuarios += "<tr>";
                usuarios += "<td>";
                usuarios += despliegue.getString("usr");
                usuarios += "</td>";
                usuarios += "<td>";
                usuarios += despliegue.getString("fin");
                usuarios += "</td>";
                usuarios += "</tr>";
            }
            usuarios +="</table>";
            obj.cierraConexion();  
        }catch(Exception ted){
            this.error = ted.getMessage();
        }
        return usuarios;
    }
    
    public String consulta(){
        ResultSet despliegue = null;
        BD.cDatos obj = new BD.cDatos();
        String usuarios = "<table  class=\"table table-striped\">";
                usuarios += "<thead>";
                usuarios += "<th>Boleta</th>";
                usuarios += "<th>Usuario</th>";
                usuarios += "<th>Contraseña</th>";
                usuarios += "<th>Nombre</th>";
                usuarios += "<th>E-Mail</th>";
                usuarios += "<th>Carrera</th>";
                usuarios += "</thead>";
        try{
            obj.conectar();
            despliegue = obj.consulta("call consultaUsr();");
            while(despliegue.next()){
                usuarios += "<tr>";
                usuarios += "<td>";
                usuarios += despliegue.getString("bol");
                usuarios += "</td>";
                usuarios += "<td>";
                usuarios += despliegue.getString("usr");
                usuarios += "</td>";
                usuarios += "<td>";
                usuarios += despliegue.getString("md5(psw)");
                usuarios += "</td>";
                usuarios += "<td>";
                usuarios += despliegue.getString("nom");
                usuarios += "&nbsp";
                usuarios += despliegue.getString("aPat");
                usuarios += "&nbsp";
                usuarios += despliegue.getString("aMat");
                usuarios += "</td>";
                usuarios += "<td>";
                usuarios += despliegue.getString("mail");
                usuarios += "</td>";
                usuarios += "<td>";
                usuarios += despliegue.getString("crra");
                usuarios += "</td>";
                usuarios += "</tr>";
            }
            usuarios +="</table>";
            obj.cierraConexion();  
        }catch(Exception ted){
            this.error = ted.getMessage();
        }
        return usuarios;
    }
    
}
