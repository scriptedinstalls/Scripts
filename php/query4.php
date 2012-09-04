<?
require 'dbconnect.php';

$name = "Breanna";
$age = 18;
$state = "NE";
$yearborn = 1995;

$query1 = "DELETE FROM contacts where name  = '$name'";
$results = mysql_query($query1) or die("Problems with query: " . mysql_error());
$rowcount = mysql_affected_rows();

echo $rowcount;

?>
