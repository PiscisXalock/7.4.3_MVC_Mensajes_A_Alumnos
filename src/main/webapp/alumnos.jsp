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
        <style>
            #form1 {
                padding:20px;
                background-image: url("imagenes/form1.jpg");
                background-repeat: no-repeat;
                background-size: cover;
                background-attachment: fixed;
                background-position: center;
                border-bottom: 2px solid bisque;
                text-align: center;
            }
            #form2, table {
                padding:20px;
                background-image: url("imagenes/form2.jpg");
                background-repeat: no-repeat;
                background-size: cover;
                background-attachment: fixed;
                background-position: center;
                text-align: center;
                margin: auto;
            }

            td{
                border: 1px solid tomato;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <h1>Mensaje a alumnos</h1>
        <%
            String grupoActivo = (String) request.getAttribute("grupo");
            ArrayList<String> grupos = (ArrayList<String>) request.getAttribute("grupos");
            ArrayList<Alumno> alumnos = (ArrayList<Alumno>) request.getAttribute("alumnos");
        %>
        Grupo Seleccionado: <%=grupoActivo%> <br>
        <form id="form1" action="servletAlumno" method="get">
            Grupo: <select name="grupo">

                <%

                    for (String p : grupos) {
                        String textoSelected = "";
                        if (p.equals(grupoActivo)) {
                            textoSelected = " selected";
                        }
                %>
                <option <%=textoSelected%> value="<%=p%>"><%=p%></option>
                <% }%>
            </select>
            <br>
            <input type="submit" value="Seleccionar">
        </form>

        <form id="form2" action="servletAlumno" method="post">
            Grupo seleccionado: <input type="text" name="grupoSeleccionado" value="<%=grupoActivo%>">

            <table>
                <% for (Alumno al : alumnos) {%>
                <tr>
                    <td>
                        <%=al.getNombre()%>
                    </td>
                    <td>
                        <%=al.getApellidos()%>
                    </td>
                    <td>
                        <%=al.getEmail()%>
                    </td>
                    <td>
                        <input type="checkbox"  value="1" name="<%=al.getId()%>">
                    </td>
                </tr>
                <% }%>
            </table>
            <input type="submit" value="Enviar">
        </form>

    </body>
</html>
