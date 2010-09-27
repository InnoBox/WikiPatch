<?php
# MediaWiki extensions

# Note this is only one of TWO extensions.php files that is currently being used
# to manage MediaWiki extensions.
#
# The other file is located in /etc/mediawiki-extensions/
# and uses the mwenext and mwdisext to enable and disable extensions that 
# were installused using the mediawiki extensions package that come from ubuntu
# This file is used only for extensions that were installed by hand
# Like FCKeditor


# FCKeditor: WYSIWYG editor for wiki pages
require_once("$IP/extensions/FCKeditor/FCKeditor.php");

# Note finally that the Configure extensions is yet another exception.
# The Configure extension is managed from the LocalSettings.php page.
#
# The reason for this is so that the Configure extension can be invoked last so 
# that it reflects any configurations done in LocalSettings.php
