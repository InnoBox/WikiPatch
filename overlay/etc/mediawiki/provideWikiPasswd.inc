<?php
#This is an Innobox Script to read in the password from the wiki password file.
#Thats all.
$lines=file('/etc/mediawiki/wiki_password.txt');
#The password is the entire contents of the file, except for a trailing
#newline (and the password does not contain any whitespace itself).
$wgDBpassword= rtrim($lines[0]);
#echo "<br>In provideWikiPasswd.inc</br>";
#echo $wgDBpassword
?>
