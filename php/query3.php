<?
require 'dbconnect.php';

$name = "Breanna";
$age = 18;
$state = "NE";
$yearborn = 1995;

$query1 = "UPDATE contacts set name = '$name',age = '$age',state = '$state',yearborn = '$yearborn' WHERE name='$name'";
$results = mysql_query($query1) or die("Problems with query: " . mysql_error());
$rowcount = mysql_affected_rows();

echo $rowcount;

?>
