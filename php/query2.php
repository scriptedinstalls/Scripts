<?
require 'dbconnect.php';

$name = "Breanna";
$age = 16;
$state = "NE";
$yearborn = 1995;

$unique_check = "select name from contacts where name = '$name'";
$results_unique_check = mysql_query($unique_check);
$rowcount = mysql_num_rows($results_unique_check);
echo $rowcount;

if ($rowcount > 0) {
    echo "Please use a different name";
    exit();}
    else {
        $query1 = "INSERT INTO contacts(name,age,state,yearborn) VALUES('$name','$age','$state','$yearborn')";
    }
$results = mysql_query($query1) or die("Problems with query: " . mysql_error());
$rowcount = mysql_affected_rows();

echo $rowcount;

?>
