<%-- 
    Document   : file_open_test
    Created on : Aug 5, 2013, 10:42:25 PM
    Author     : Rajitha
--%>

<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <%
            
            
            File l_Directory = new File("raw_material_pdf");
            
            
            File[] list = l_Directory.listFiles();
            for(int i= 0;i< list.length;i++){
                String s =  list[i].getName();
                
             %>
             
             <a href="../raw_material_pdf/11111.pdf">click here</a>
             <%
            }
            %>
    </body>
</html>
