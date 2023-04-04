<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/jquery-ui.css" />
    <script src="js/jquery.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script>
    $(function() {
        $( "#datepicker" ).datepicker();
    });
    </script>
    <style>
        @media print{
            @page{
                size: 8.5in 11in;
            }
        }
        
        #print{
            border:2px solid #000;
            width:800px;
            height:850px;
            max-width:800px;
            max-height:800px;
            margin:auto;
            font-size:12px;
        }
        table {
            border-collapse: collapse;
            }

        table, td, th {
            border: 1px solid black;
        }
    </style>
</head> 
<body> 
<button onclick="printContent('print')">Print Content</button>
<button><a style = "text-decoration:none; color:#000;" href = "index.php?page=reports">Back</a></button>
<?php
session_start();
//error_reporting(0);
    $sql=$_SESSION['sql'];
    $conn = new mysqli("localhost", "root", "", "tms_db") or die(mysqli_error());
    $q = $conn->query($sql) or die(mysqli_error());
    $f = $q->fetch_array();
?>

<br />
<br />
    <div id="print">
        <div style = "margin:10px;">    <br />  
          <center><img src="image/ap.png"></center>
            <center>BROLAZ ANGOLA</center>
                           <center>LUANDA - ANGOLA</center>
            <br/>
            <center>PROJECT LIST</center>
            <br />
            <br />
            <label>Date:
                <?php echo "<u>".
                       date("d-m-Y")."</u>";
                    ?>
            <br />
            <br />
            <center>
                <table>
                        <tr>
                            <th style = "padding-right:10px;padding-left:10px;"><center>#</center></th>
                            <th style = "padding-right:50px;padding-left:50px;"><center>Project.</center></th>
                            <th style = "padding-right:30px;padding-left:30px;"><center>Task.</center></th>
                            <th style = "padding-right:30px;padding-left:30px;"><center>Completed Task</center></th>
                            <th style = "padding-right:30px;padding-left:30px;"><center>Work Duration</center></th>
                            <th style = "padding-right:30px;padding-left:30px;"><center>Progress</center></th>
                            <th style = "padding-left:30px; padding-right:30px;"><center>Due date</center></th>
                        </tr>
                <?php
                 // if(isset($_POST['print_patient'])){
       
          $query =$conn->query($sql) or die(mysqli_error());

        
        $cnt=$query->num_rows;
                    for($a = 1; $a <= $cnt; $a++){
                        $fetch = $query->fetch_array();
                         $tprog = $conn->query("SELECT * FROM task_list where project_id = {$fetch['id']}")->num_rows;
                        $cprog = $conn->query("SELECT * FROM task_list where project_id = {$fetch['id']} and status = 3")->num_rows;
                        $prog = $tprog > 0 ? ($cprog/$tprog) * 100 : 0;
                        $prog = $prog > 0 ?  number_format($prog,2) : $prog;
                        $prod = $conn->query("SELECT * FROM user_productivity where project_id = {$fetch['id']}")->num_rows;
                        $dur = $conn->query("SELECT sum(time_rendered) as duration FROM user_productivity where project_id = {$fetch['id']}");
                        $dur = $dur->num_rows > 0 ? $dur->fetch_assoc()['duration'] : 0;
                        if($fetch['status'] == 0 && strtotime(date('Y-m-d')) >= strtotime($fetch['start_date'])):
                        if($prod  > 0  || $cprog > 0)
                          $row['status'] = 2;
                        else
                          $row['status'] = 1;
                        elseif($fetch['status'] == 0 && strtotime(date('Y-m-d')) > strtotime($fetch['end_date'])):
                        $row['status'] = 4;
                        endif;
                ?>
                    <tr>
                        <td><center><?php echo $a ?> </center></td>
                        <td><center><?php echo $fetch['name']?> </center></td>
                        <td><center> <?php echo number_format($tprog) ?></center></td>
                        <td><center><?php echo number_format($cprog) ?></center></td>
                        <td><center><?php echo number_format($dur).' Hr/s.' ?></center></td>
                        <td><center><?php echo $prog ?>% Complete</center></td>
                        <td><center><?php  echo date("Y-m-d",strtotime($fetch['end_date'])) ?></center></td>
                    </tr>
                <?php
                    }//}
                    $conn->close();
                ?>
                </table>
            </center>
        </div>
    </div>
<script>
function printContent(el){
    var restorepage = document.body.innerHTML;
    var printcontent = document.getElementById(el).innerHTML;
    document.body.innerHTML = printcontent;
    window.print();
    document.body.innerHTML = restorepage;
}
</script>
</html>