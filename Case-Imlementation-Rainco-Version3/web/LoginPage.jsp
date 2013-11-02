<%-- 
    Document   : LoginPage
    Created on : 05-Aug-2013, 16:30:31
    Author     : Sajee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>

	<!-- Basics -->
	
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	
	<title>Login</title>

	<!-- CSS -->
	
        <link rel="stylesheet" href="css/reset_RC.css">
        <link rel="stylesheet" href="css/styles_RC.css">
	
</head>

<body>
	
	<!-- Begin Page Content -->
	
	<div id="container">
		
            <form action="LoginControl_RC" method="post">
		
		<label for="name">Username:</label>
		
                <input type="name" name="username" id="username">
		
		<label for="username">Password:</label>
		
                <input type="password" name="password" id="password">
		
		<div id="lower">
		
		<input type="checkbox"><label class="check" for="checkbox">Keep me logged in</label>
		
		<input type="submit" value="Login">
		
		</div>
		
		</form>
		
	</div>
	
	
	<!-- End Page Content -->
	
</body>

</html>

	
