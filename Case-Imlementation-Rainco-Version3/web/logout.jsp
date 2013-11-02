<%-- 
    Document   : logout
    Created on : 06-Aug-2013, 14:32:47
    Author     : Sajee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout Page</title>
            <%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  if(session.getAttribute("userName")==null)
      response.sendRedirect("LoginPage.jsp");

  %>
       
    </head>
    <body>
        <%
        session.invalidate();
        response.sendRedirect("LoginPage.jsp");
        %>
    </body>
</html>
