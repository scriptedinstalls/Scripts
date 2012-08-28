<?
$f1 = "header.php";
$f2 = "leftnav.php";
$f3 = "footer.php";
$title = "Our first dynamically included site....";

?>

<html>
    <head><title><? echo $title ?>></title></head>

    <table width="100%">
        <tr>
            <td align = 'center'><? include 'header.php';?> </td>
        </tr>
        <tr><td>&nbsp;</td></tr>
        <tr><td>&nbsp;</td></tr>
        <tr><td>&nbsp;</td></tr>
        <tr><td>&nbsp;</td></tr>
        <tr><td>&nbsp;</td></tr>




        <tr>
            <td align = 'left'><? include 'leftnav.php';?></td>
        </tr>
        <table width="100%">
        <tr>
             <td><form action='action1.php' method='post'></td>
             <td>Name:</td>
        </tr>
       
        <tr><td>&nbsp;</td></tr>
        <tr><td>&nbsp;</td></tr>
        <tr><td>&nbsp;</td></tr>
        <tr><td>&nbsp;</td></tr>
        <tr><td>&nbsp;</td></tr>
        <tr><td>&nbsp;</td></tr>
        <tr><td>&nbsp;</td></tr>
        <tr><td>&nbsp;</td></tr>
        <tr><td>&nbsp;</td></tr>
        <tr><td>&nbsp;</td></tr>

        <tr>
            <td align = 'center'><? include 'footer.php';?></td>
            <td>&nbsp;</td>
        </tr>
    
    </table>


</html>
