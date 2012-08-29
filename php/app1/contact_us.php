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
        <tr><td>&nbsp;</td></tr>
        <tr><td>&nbsp;</td></tr>
        <tr><td>&nbsp;</td></tr>
        <tr><td>&nbsp;</td></tr>
        <tr><td>&nbsp;</td></tr>

        </table>
        <table width="100%">
             <td><form action='action1.php' method='post'></td>
             <tr><td>Name:</td><td><input name='name' type='text'size='25'></td></tr>
             <tr><td>Age:</td>
             <td><select name=age size=1>
             <? for ($i=18;$i<=65;$i++){
                echo "<option value=$i>$i"; 
                } ?>
             </select>
        </td>
        </tr>
            <tr><td>Year Born?:</td>
        <td>
        <select name=yearborn size=1>
            <? for ($i=1939;$i<=1989;$i++) {
            echo "<option value=$i>$i";
            } ?>
        </select>
        </td>
        </tr>
        </form></table>
       
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
