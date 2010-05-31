<?php
#This is an Innobox Script to read in the password from the wiki password file.
#Thats all.
$lines=file('/etc/mediawiki/wiki_password.txt');
$wgDBpassword= $lines[0];
#echo "<br>In provideWikiPasswd.inc</br>";
#echo $wgDBpassword
?>
