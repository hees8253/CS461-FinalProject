<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<TITLE>Webtech Test Page</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
a:link {
        color: #006633;
}
a:visited {
        color: #003366;
}
a:hover {
        color: #009933;
}
a:active {
        color: #990000;
}

.content {
  max-width: 500px;
  margin: auto;
}
</style>
</head>
<body>
<div class="content">
	<?php
		

		$servername = "localhost";
		$username = "reic6330";
		$password = "702036330";
		$dbname = "test";

		$conn = new mysqli($servername, $username, $password, $dbname);
		
		if ($conn -> connect_error){
			die("Connection failed: " . $conn->connect_error);
		}
		
		$inEmail = $_POST['InputEmail'];
		$name = $_POST['Name'];
		$inGameName = $_POST['inGameName'];
		$discordId = $_POST['discordId'];
		$role = $_POST['role'];
		$gameTitle = $_POST['gameTitle'];
		
		
		$sql = " INSERT INTO `OrgMembers`
			VALUES('$inEmail', '$name', '$inGameName', '$discordId', 'Staff');";
		$sql .= "
			INSERT INTO `Staff`
			Values('$inGameName', '$role', '$gameTitle');";
		
		if ($conn->multi_query($sql) === TRUE) {
			echo "New records created successfully";
		} else {
			echo "Error: " . $sql . "<br>" . $conn->error;
		}
		
		$conn->close();
	
	?>
	<tr>
            <td></td>
            <td><a href="http://webtech.kettering.edu/~reic6330/ESportsDBMSHome.html" id = "homebutton" class="btn btn btn-primary">Home</a></td>
            <td></td>
    </tr>
</div>
</body>
</html>
