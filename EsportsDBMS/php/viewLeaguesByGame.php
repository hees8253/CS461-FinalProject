<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<TITLE>Kettering Esports Staff Directory</TITLE>
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
  max-width: 1080px;
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
		
		$game = $_POST["gameTitle"];
		
		$sql = "SELECT L.leagueName, L.startDate, L.endDate, T.teamName, L.game 
				FROM Leagues as L 
				INNER JOIN Teams as T ON L.teamID = T.teamID
				WHERE L.game = '$game';";

        $result = $conn->query($sql);
                
        if ($result->num_rows > 0) {

            echo "<br>| League: | Team Enrolled: | Start Date: | End Date: | Game |<br>";

            while($row = $result->fetch_assoc()){
                echo "<br>" . $row["leagueName"] . " | " . $row["teamName"] . " | " . $row["startDate"] . " | " . $row["endDate"] . " | " . $row["game"] . "<br>";
            }
        } else {
            echo "0 Results";
        }
        
    
    ?>
	<br>
	<tr>
            <td></td>
            <td><a href="http://webtech.kettering.edu/~reic6330/ESportsDBMSHome.html" id = "homebutton" class="btn btn btn-primary">Home</a></td>
            <td></td>
    </tr>
<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</div>
</body>
</html>
