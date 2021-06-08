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
</style>
</head>
<body>
	<?php
		

		$servername = "localhost";
		$username = "reic6330";
		$password = "702036330";
		$dbname = "test";

		$conn = new mysqli($servername, $username, $password, $dbname);
		
		if ($conn -> connect_error){
			die("Connection failed: " . $conn->connect_error);
		}

		$sql = "SELECT inGameName, classStanding, gradDate, teamID, teamRole FROM Players";
		$result = $conn->query($sql);

		if ($result->num_rows > 0) {
			while($row = $result->fetch_assoc()){
				echo "<br> inGameName: ". $row["inGameName"]. " | classStanding: ". $row["classStanding"]. "<br>";           
			}
		} else {
			echo "0 Results";
		}
	
	?>
</body>
</html>
