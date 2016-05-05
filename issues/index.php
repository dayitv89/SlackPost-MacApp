<?php
// Start the session
$fileName = "issues.txt";
$myfile = fopen($fileName, "r") or die("Unable to open file!");
$val = fgets($myfile);
fclose($myfile);
$myfile = fopen($fileName, "w") or die("Unable to open file!");
$txt = (int)$val + 1;
fwrite($myfile, $txt);
fclose($myfile);
header('Content-Type: application/json');
echo json_encode(array('issue'=>$txt));
?>