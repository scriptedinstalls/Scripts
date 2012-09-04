<?
setcookie(contactname, $_POST['name'], time() + 3600);

echo "Name:\t", $_POST['name'], "<br>";
echo "Age:\t", $_POST['age'], "<br>";
echo "YearBorn:\t", $_POST['yearborn'], "<br>";
echo "The site was rated as:\t", $_POST['ratesite'], "<br>";

$to = "joeblow";
$subject = "Testing contact us form";
$headers = "From: joeblow@busybox.net\r\n";
$message = <<<EOF
    Hello $_POST[name],
    Your age is $_POST[age],
    Your birth year is $_POST[yearborn],

    Thank you,

    Me

EOF;

mail($to,$subject,$message,$headers);


?>
