$var=$ARGV[0];
$var1=$ARGV[1];
$flag=0;
print'<html>';
print'<head> </head>';
print '<h2><font color="blue">AROMATIC-AROMATIC INTERACTION</font></h2>';
print "The given input file is: ", $var;
print'</br>';
print'</div>';
open (MYFILE, "$var");
@am=();
@at=();
@a=();
@x1=();
@c1=();
@c2=();
@y1=();
@z1=();
$opt=$var1;
while(<MYFILE>)
{
if($_=~/^ATOM/)
{
if((substr($_,17,3) eq "PHE") || (substr($_,17,3) eq "TYR") || (substr($_,17,3) eq "TRP"))
{
if((substr($_,13,4) eq "CZ  "))
{
push(@a,$_);
push(@am,substr($_,7,4));
push(@at,substr($_,13,4));
push(@c1,substr($_,23,4));
push(@c2,substr($_,17,3));
push(@x1,substr($_,31,7));
push(@y1,substr($_,39,7));
push(@z1,substr($_,47,7));
}
}
}
}
sub round {
  my $number = shift || 0;
  my $dec = 10 ** (shift || 0);
  return int( $dec * $number + .5 * ($number <=> 0)) / $dec;
}
#$angleq[$i]=round($angleq[$i],3);
print'<body>';
print'<br>';
print'<table border="1">'; 
print'<tr><td>S.NO</td><td>Residue no</td><td>Atom name</td><td>Molecule name</td><td>S.NO</td><td>Residue no</td><td>Atom name</td><td>Molecule name</td><td>Interaction value</td></tr>';
for($i=1;$i<scalar(@a);$i++)
{
for($j=$i+1;$j<scalar(@a);$j++)
{
$xans=($x1[$j-1]-$x1[$i-1])*($x1[$j-1]-$x1[$i-1]);
$yans=($y1[$j-1]-$y1[$i-1])*($y1[$j-1]-$y1[$i-1]);
$zans=($z1[$j-1]-$z1[$i-1])*($z1[$j-1]-$z1[$i-1]);
$ans=sqrt($xans+$yans+$zans);
if ($opt == 0)
 { $opt =5;
 }
if($ans < $opt)
{
print "<tr><td> $am[$i-1]:</td><td> $c1[$i-1] :</td><td> $at[$i-1] :</td><td> $c2[$i-1] -> </td><td>$am[$j-1] : </td><td>$c1[$j-1] : </td><td>$at[$j-1] : </td><td>$c2[$j-1] =></td> ";
$ans=round($ans,3);
print"<td>$ans</td></tr>";
print"\n";
$flag=1;
}
}
}
print'</table>';
print'</body>';
print'</html>';
if ($flag==0)
{
print"THERE IS NO INTERACTION";
}