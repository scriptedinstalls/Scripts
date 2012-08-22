<a href="vars3.php">HTTP Referer tag</a>
<p>

<?

echo $_SERVER['HTTP_USER_AGENT'];
echo "<p>";
echo $_SERVER['PHP_SELF'];
echo "<p>";
echo $_SERVER['REQUEST_METHOD'];
echo "<p>";
echo $_SERVER['DOCUMENT_ROOT'];
echo "<p>";
echo $_SERVER['REMOTE_ADDR'];
echo "<p>";
echo $_SERVER['HTTP_REFERER'];

?>


