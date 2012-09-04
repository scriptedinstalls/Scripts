<?
require 'dbconnect.php';

$query1 = "select name from contacts";

$results = mysql_query($query1) or die("Problems with query: " . mysql_error());
$rowcount = mysql_num_rows($results);
#echo $rowcount;

while ($row = mysql_fetch_array($results)) {
    echo $row["name"], "<br>";
#    echo $row["age"], "<br>";
#    echo $row["state"], "<br>";
 #   echo $row["yearborn"];
}

?>
