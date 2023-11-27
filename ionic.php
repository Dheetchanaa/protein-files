<?php
//$var1=$_POST[pdbname];
//echo $var1; 
$p=$_FILES["pdbname"]["name"];
$q=$_POST["opt"];
//echo $p;
move_uploaded_file($_FILES["pdbname"]["tmp_name"],$p);
$result=passthru("C:\Strawberry\perl\bin\perl.exe ionic.pl $p $q");
unlink($p);
echo $result;
?>