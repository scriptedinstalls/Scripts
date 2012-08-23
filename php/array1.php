
<?

$array1 = array("Toronto", "Ottawa", "Montreal", "Quebec");
$array2 = array("Boston", "New York", "Santa Barbara", "San Francisco");
$array3 = array("Mexico City", "Cozemel", "Cancun", "Acupolco");


$array4 = array("Canada" => $array1, "USA" => $array2, "Mexico" => $array3);

#print_r($array4);
ksort($array4);
foreach($array4 as $key => $i) {
    echo $key, "\n";
    sort($i);
    foreach($i as $j) {
        echo "\t", $j, "\n";
    }


}

?>

