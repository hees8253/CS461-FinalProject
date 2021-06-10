<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
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
        $table_name = $_POST['table_name'];

        $servername = "localhost";
        $username = "reic6330";
        $password = "702036330";
        $dbname = "test";

        $conn = new mysqli($servername, $username, $password, $dbname);
        $sql = 'SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = \'' . $table_name . '\'';	
        $res = $conn->query($sql);
        echo "<table span = 80><tr>";
        $cols = array();
        while($row = $res->fetch_row()){
            echo "<th>" . $row[3] . "</th>";
            array_push($cols, $row[3]);
        }
        echo "</tr>";

        $sql = 'SELECT * FROM ' . $table_name;
        $res = $conn->query($sql);

        while($row = $res->fetch_row()){
            echo "<tr id=" . $row[0] . ">";
            foreach ($row as $rowItem) {
                echo "<td>" . $rowItem . "</td>";
            }
            echo "<td><a href=\"removerow.php?id=".$row[0]."&table_name=" . $table_name . "&id_col=" . $cols[0] . "\">Delete</a></td>";
            echo "</tr>";
        }
        echo "</table>";
        $conn->close();
	?>
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<tr>
            <td></td>
            <td><a href="http://webtech.kettering.edu/~reic6330/ESportsDBMSHome.html" id = "homebutton" class="btn btn btn-primary">Home</a></td>
            <td></td>
    </tr>
</div>
<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>
