<%-- 
    Document   : utilize_table
    Created on : 13-Oct-2013, 13:52:15
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        
        
        
    </head>
    
    </style>
    
    <style type="text/css">
        table.table2{
    font-family: Georgia, serif;
    font-size: 12px;
    font-style: normal;
    font-weight: normal;
    letter-spacing: -1px;
    line-height: 1.2em;
    border-collapse:collapse;
    text-align:center;
}
.table2 thead th, .table2 tfoot td{
    padding:20px 10px 20px 10px;
    color:#fff;
    font-size: 14px;
    background-color:#222;
    font-weight:normal;
    border-right:1px dotted #666;
    border-top:3px solid #666;
    -moz-box-shadow:0px -1px 4px #000;
    -webkit-box-shadow:0px -1px 4px #000;
    box-shadow:0px -1px 4px #000;
    text-shadow:1px 1px 1px #000;
    width: 100px;
}
.table2 tfoot th{
    padding:10px;
    font-size:18px;
    text-transform:uppercase;
    color:#888;
}
.table2 tfoot td{
    font-size:36px;
    color:#EF870E;
    border-top:none;
    border-bottom:3px solid #666;
    -moz-box-shadow:0px 1px 4px #000;
    -webkit-box-shadow:0px 1px 4px #000;
    box-shadow:0px 1px 4px #000;
}
.table2 thead th:empty{
    background:transparent;
    -moz-box-shadow:none;
    -webkit-box-shadow:none;
    box-shadow:none;
}
/*.table2 thead :nth-last-child(1){
    border-right:none;
}
.table2 thead :first-child,
.table2 tbody :nth-last-child(1){
    border:none;
}*/
.table2 tbody th{
    text-align:right;
    padding:10px;
    color:#333;
    text-shadow:1px 1px 1px #ccc;
    background-color:#f9f9f9;
}
.table2 tbody td{
    padding:10px;
    background-color:#f0f0f0;
    border-right:1px dotted #999;
    text-shadow:-1px 1px 1px #fff;
    text-transform:uppercase;
    color:#333;
}
.table2 tbody span.check::before{
    content : url(../images/check1.png)
}


        
        
        
    </style>
    
    <body>
        <table class="table2">
                <thead>
                                
                                        <tr>
                                            <th scope="col">Mould Code</th>
                                                <th scope="col">Machine Id</th>
                                                
                                        </tr>
                </thead>
                                
        <%

                                    ResultSet rs_utilize = (ResultSet) session.getAttribute("utilize");
                                    int cnt = 1;
                                    while (rs_utilize.next()) {

                                        String m_code = rs_utilize.getString("mould_code");
                                        String mach_code = rs_utilize.getString("machine_id");
                                        %>
                                     <tr>
                                         <td><%=m_code%></td>
                                        <td><%=mach_code%></td>
                                       

                                    </tr>
                                <%        
                                       } 
                                %>
                                
                                </table>
    </body>
</html>
