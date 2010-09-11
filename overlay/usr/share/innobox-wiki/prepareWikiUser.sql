# Copied from http://www.mediawiki.org/wiki/Manual:Installing_MediaWiki#MySQL
# The password field is set to a placeholder that is easily substituted
# using python's string processing functions.
create database wiki_db;
grant drop, index, create, select, insert, update, delete, alter, lock tables on wiki_db.* to 'wiki_user'@'localhost' identified by '%(WIKI_PASSWORD)s';

