<%-- 
    Document   : alumnos
    Created on : 07-feb-2021, 18:20:02
    Author     : Usuario
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Alumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Mensajes Alumnos</h1>
        <%
            String grupo_activo = (String) request.getAttribute("grupo");
            ArrayList<Alumno> grupos = (ArrayList<Alumno>) request.getAttribute("grupos");
            ArrayList<Alumno> alumnos = (ArrayList<Alumno>) request.getAttribute("alumnos");
        %>
        <hr>
        <h1>Grupo seleccionado <%= grupo_activo%></h1>
        <form action="action" method="post">
            Grupo: <select name="grupo">
                <%
                    for(int i = 0; i < grupos.size(); i++) {
                        String textoSelected = "";
                        if(grupos.get(i).equals(grupo_activo)) {
                            textoSelected = " selected";
                        }
                %>
                <option <%= textoSelected%> value="<%= grupos.get(i)%>"><%= grupos.get(i)%></option>
                <% } %>
            </select>
            <br>
            Alumnos: <select name="alumno">
                <%
                    for(int i = 0; i < alumnos.size(); i++) {
                %>
                <option value="<%= alumnos.get(i)%>"><%= alumnos.get(i)%></option>
                <% }%>
            </select>
            <input type="submit" value="Mostrar">
        </form>
        <br>
    </body>
</html>
