<html>
    <head><title></title></head>
        <body>

<?

            $array1 = array("browser" => "mozilla","agent" => "firefox");
            echo $array1["browser"], "\t", $array1["agent"];
            $array2 = array("nested" => array("val1" => 1, "val2" => 2));
                echo "<p>", $array2["nested"]["val1"];
                echo "<p>", $array2["nested"]["val2"];
            $array1["version"] = "0.9.1";
                echo "<p>", $array1["version"]; 

?>

                
        </body>

    




















</html>
