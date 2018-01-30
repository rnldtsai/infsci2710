<?php

$servername = "localhost";
      $username = "root";
      $password = "mysql";
      $database = "lab";
      $conn = new mysqli($servername, $username, $password, $database);

      // Check connection
      if ($conn->connect_error) {
          die("Connection failed: " . $conn->connect_error);
      } 

      $sql = "";
      switch($_GET[action]){
        case 'dept': $sql = "select dept_name as n, AVG(tot_cred)/100 as t from student group by dept_name;";
        break;
        case 'dept_name': $sql = "select CONCAT(name,'@', SUBSTRING(dept_name, 1 ,3)) as n, tot_cred/100 as t from student;";
        break;
        case 'dept_low': $sql = "select dept_name as n, AVG(tot_cred)/100 as t from student group by dept_name having AVG(tot_cred) < 50;";
        break;
        case 'advisor': $sql = "SELECT i.name as n, AVG(s.tot_cred)/100 as t  FROM `lab`.`student` as s, `lab`.`advisor` as a, `lab`.`instructor` as i WHERE s.`ID` = a.`s_ID` and a.`i_ID` = i.`ID` group by i.`name`";
        break;
        case 'advisor_salary': $sql = "SELECT i.name as n, SUM(s.tot_cred)/i.salary as t  FROM `lab`.`student` as s, `lab`.`advisor` as a, `lab`.`instructor` as i WHERE s.`ID` = a.`s_ID` and a.`i_ID` = i.`ID` group by i.`name`";
        break;        
        default:  $sql = "select name as n,tot_cred/100 as t from student;";
      }

      $result = $conn->query($sql);
      $output = "letter\tfrequency\n";
      if ($result){
        while($row = $result->fetch_assoc())
        {
            $output .= $row['n']."\t".$row['t']."\n"; 
        }
      }
      $result->free();

      echo $output;

      // Close connection
      mysqli_close($conn);

?>
