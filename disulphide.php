<?php
//$var1=$_POST[pdbname];
//echo $var1; 
$p=$_FILES["pdbname"]["name"];
//echo $p;
move_uploaded_file($_FILES["pdbname"]["tmp_name"],$p);
$result=passthru("C:\Strawberry\perl\bin\perl.exe disulphide.pl $p");
unlink($p);
echo $result . "<br>";
?>