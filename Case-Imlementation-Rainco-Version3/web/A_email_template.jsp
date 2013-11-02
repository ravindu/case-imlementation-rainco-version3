
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>CSS3 Contact Form</title>

<link href="css/A_email_structure.css" rel="stylesheet" type="text/css" media="screen" />
</head>

<body>

<div id="contact">
	<h1>Send an email</h1>
	<form action="#" method="post">
		<fieldset>
			<label for="name">Name:</label>
			<input type="text" id="name" placeholder="Enter your full name" />
			
			<label for="email">Email:</label>
			<input type="email" id="email" placeholder="Enter your email address" />
			
			<label for="message">Message:</label>
			<textarea id="message" placeholder="What's on your mind?"></textarea>
			
			<input type="submit" value="Send message" />
			
		</fieldset>
	</form>
</div>

</body>
</html>