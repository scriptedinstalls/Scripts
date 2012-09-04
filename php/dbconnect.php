<?
$host = "localhost";
$user = "root";
$password = "railsrocks";
$dbname = "contacts";

$conn = mysql_connect($host,$user,$password) or die("Problems Connecting: " . mysql_error());

#if ($conn) { echo "True";}

$dbselect = mysql_select_db($dbname,$conn) or die("Error selecting DB : " . mysql_error());
?>
