-- MySQL dump 10.11
--
-- Host: localhost    Database: wiki_db
-- ------------------------------------------------------
-- Server version	5.0.51a-3ubuntu5.5

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `archive`
--

DROP TABLE IF EXISTS `archive`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `archive` (
  `ar_namespace` int(11) NOT NULL default '0',
  `ar_title` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  `ar_text` mediumblob NOT NULL,
  `ar_comment` tinyblob NOT NULL,
  `ar_user` int(10) unsigned NOT NULL default '0',
  `ar_user_text` varchar(255) character set latin1 collate latin1_bin NOT NULL,
  `ar_timestamp` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ar_minor_edit` tinyint(4) NOT NULL default '0',
  `ar_flags` tinyblob NOT NULL,
  `ar_rev_id` int(10) unsigned default NULL,
  `ar_text_id` int(10) unsigned default NULL,
  `ar_deleted` tinyint(3) unsigned NOT NULL default '0',
  `ar_len` int(10) unsigned default NULL,
  `ar_page_id` int(10) unsigned default NULL,
  `ar_parent_id` int(10) unsigned default NULL,
  KEY `name_title_timestamp` (`ar_namespace`,`ar_title`,`ar_timestamp`),
  KEY `ar_usertext_timestamp` (`ar_user_text`,`ar_timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `archive`
--

LOCK TABLES `archive` WRITE;
/*!40000 ALTER TABLE `archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `category` (
  `cat_id` int(10) unsigned NOT NULL auto_increment,
  `cat_title` varchar(255) character set latin1 collate latin1_bin NOT NULL,
  `cat_pages` int(11) NOT NULL default '0',
  `cat_subcats` int(11) NOT NULL default '0',
  `cat_files` int(11) NOT NULL default '0',
  `cat_hidden` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`cat_id`),
  UNIQUE KEY `cat_title` (`cat_title`),
  KEY `cat_pages` (`cat_pages`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorylinks`
--

DROP TABLE IF EXISTS `categorylinks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `categorylinks` (
  `cl_from` int(10) unsigned NOT NULL default '0',
  `cl_to` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  `cl_sortkey` varchar(70) character set latin1 collate latin1_bin NOT NULL default '',
  `cl_timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  UNIQUE KEY `cl_from` (`cl_from`,`cl_to`),
  KEY `cl_sortkey` (`cl_to`,`cl_sortkey`,`cl_from`),
  KEY `cl_timestamp` (`cl_to`,`cl_timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `categorylinks`
--

LOCK TABLES `categorylinks` WRITE;
/*!40000 ALTER TABLE `categorylinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorylinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `change_tag`
--

DROP TABLE IF EXISTS `change_tag`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `change_tag` (
  `ct_rc_id` int(11) default NULL,
  `ct_log_id` int(11) default NULL,
  `ct_rev_id` int(11) default NULL,
  `ct_tag` varchar(255) NOT NULL,
  `ct_params` blob,
  UNIQUE KEY `change_tag_rc_tag` (`ct_rc_id`,`ct_tag`),
  UNIQUE KEY `change_tag_log_tag` (`ct_log_id`,`ct_tag`),
  UNIQUE KEY `change_tag_rev_tag` (`ct_rev_id`,`ct_tag`),
  KEY `change_tag_tag_id` (`ct_tag`,`ct_rc_id`,`ct_rev_id`,`ct_log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `change_tag`
--

LOCK TABLES `change_tag` WRITE;
/*!40000 ALTER TABLE `change_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `change_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `externallinks`
--

DROP TABLE IF EXISTS `externallinks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `externallinks` (
  `el_from` int(10) unsigned NOT NULL default '0',
  `el_to` blob NOT NULL,
  `el_index` blob NOT NULL,
  KEY `el_from` (`el_from`,`el_to`(40)),
  KEY `el_to` (`el_to`(60),`el_from`),
  KEY `el_index` (`el_index`(60))
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `externallinks`
--

LOCK TABLES `externallinks` WRITE;
/*!40000 ALTER TABLE `externallinks` DISABLE KEYS */;
INSERT INTO `externallinks` (`el_from`, `el_to`, `el_index`) VALUES (1,'http://meta.wikimedia.org/wiki/Help:Contents','http://org.wikimedia.meta./wiki/Help:Contents'),(1,'http://140.247.149.179/about.html','http://179.149.247.140./about.html'),(1,'http://140.247.149.179/backupinfo','http://179.149.247.140./backupinfo'),(1,'http://en.wikipedia.org/wiki/Wikipedia:CHEATSHEET','http://org.wikipedia.en./wiki/Wikipedia:CHEATSHEET'),(1,'http://www.innoboxdevices.com','http://com.innoboxdevices.www./'),(1,'http://en.wikipedia.org','http://org.wikipedia.en./'),(2,'http://calendar.google.com','http://com.google.calendar./'),(2,'http://140.247.149.179/index.php?title=Special:Contributions&contribs=user&amp;target=Alice','http://179.149.247.140./index.php?title=Special:Contributions&contribs=user&amp;target=Alice'),(2,'http://140.247.149.179/index.php?title=Special:Contributions&contribs=user&amp;target','http://179.149.247.140./index.php?title=Special:Contributions&contribs=user&amp;target'),(2,'http://140.247.149.179/index.php?title=Special:Contributions&contribs=user&amp;target=Carrol','http://179.149.247.140./index.php?title=Special:Contributions&contribs=user&amp;target=Carrol'),(2,'http://140.247.149.179/index.php?title=Special:Contributions&contribs=user&amp;target=Eve','http://179.149.247.140./index.php?title=Special:Contributions&contribs=user&amp;target=Eve'),(2,'http://140.247.149.179/index.php?title=Special:Contributions&contribs=user&amp;target=Mallory','http://179.149.247.140./index.php?title=Special:Contributions&contribs=user&amp;target=Mallory'),(2,'mailto:waters@yourinstitution.com','mailto:com.yourinstitution@waters.');
/*!40000 ALTER TABLE `externallinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filearchive`
--

DROP TABLE IF EXISTS `filearchive`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `filearchive` (
  `fa_id` int(11) NOT NULL auto_increment,
  `fa_name` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  `fa_archive_name` varchar(255) character set latin1 collate latin1_bin default '',
  `fa_storage_group` varbinary(16) default NULL,
  `fa_storage_key` varbinary(64) default '',
  `fa_deleted_user` int(11) default NULL,
  `fa_deleted_timestamp` binary(14) default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `fa_deleted_reason` text,
  `fa_size` int(10) unsigned default '0',
  `fa_width` int(11) default '0',
  `fa_height` int(11) default '0',
  `fa_metadata` mediumblob,
  `fa_bits` int(11) default '0',
  `fa_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') default NULL,
  `fa_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart') default 'unknown',
  `fa_minor_mime` varbinary(32) default 'unknown',
  `fa_description` tinyblob,
  `fa_user` int(10) unsigned default '0',
  `fa_user_text` varchar(255) character set latin1 collate latin1_bin default NULL,
  `fa_timestamp` binary(14) default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `fa_deleted` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`fa_id`),
  KEY `fa_name` (`fa_name`,`fa_timestamp`),
  KEY `fa_storage_group` (`fa_storage_group`,`fa_storage_key`),
  KEY `fa_deleted_timestamp` (`fa_deleted_timestamp`),
  KEY `fa_user_timestamp` (`fa_user_text`,`fa_timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `filearchive`
--

LOCK TABLES `filearchive` WRITE;
/*!40000 ALTER TABLE `filearchive` DISABLE KEYS */;
/*!40000 ALTER TABLE `filearchive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hitcounter`
--

DROP TABLE IF EXISTS `hitcounter`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `hitcounter` (
  `hc_id` int(10) unsigned NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=latin1 MAX_ROWS=25000;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `hitcounter`
--

LOCK TABLES `hitcounter` WRITE;
/*!40000 ALTER TABLE `hitcounter` DISABLE KEYS */;
/*!40000 ALTER TABLE `hitcounter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `image` (
  `img_name` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  `img_size` int(10) unsigned NOT NULL default '0',
  `img_width` int(11) NOT NULL default '0',
  `img_height` int(11) NOT NULL default '0',
  `img_metadata` mediumblob NOT NULL,
  `img_bits` int(11) NOT NULL default '0',
  `img_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') default NULL,
  `img_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart') NOT NULL default 'unknown',
  `img_minor_mime` varbinary(32) NOT NULL default 'unknown',
  `img_description` tinyblob NOT NULL,
  `img_user` int(10) unsigned NOT NULL default '0',
  `img_user_text` varchar(255) character set latin1 collate latin1_bin NOT NULL,
  `img_timestamp` varbinary(14) NOT NULL default '',
  `img_sha1` varbinary(32) NOT NULL default '',
  PRIMARY KEY  (`img_name`),
  KEY `img_usertext_timestamp` (`img_user_text`,`img_timestamp`),
  KEY `img_size` (`img_size`),
  KEY `img_timestamp` (`img_timestamp`),
  KEY `img_sha1` (`img_sha1`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagelinks`
--

DROP TABLE IF EXISTS `imagelinks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `imagelinks` (
  `il_from` int(10) unsigned NOT NULL default '0',
  `il_to` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  UNIQUE KEY `il_from` (`il_from`,`il_to`),
  UNIQUE KEY `il_to` (`il_to`,`il_from`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `imagelinks`
--

LOCK TABLES `imagelinks` WRITE;
/*!40000 ALTER TABLE `imagelinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interwiki`
--

DROP TABLE IF EXISTS `interwiki`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `interwiki` (
  `iw_prefix` varchar(32) NOT NULL,
  `iw_url` blob NOT NULL,
  `iw_local` tinyint(1) NOT NULL,
  `iw_trans` tinyint(4) NOT NULL default '0',
  UNIQUE KEY `iw_prefix` (`iw_prefix`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `interwiki`
--

LOCK TABLES `interwiki` WRITE;
/*!40000 ALTER TABLE `interwiki` DISABLE KEYS */;
INSERT INTO `interwiki` (`iw_prefix`, `iw_url`, `iw_local`, `iw_trans`) VALUES ('acronym','http://www.acronymfinder.com/af-query.asp?String=exact&Acronym=$1',0,0),('advogato','http://www.advogato.org/$1',0,0),('annotationwiki','http://www.seedwiki.com/page.cfm?wikiid=368&doc=$1',0,0),('arxiv','http://www.arxiv.org/abs/$1',0,0),('c2find','http://c2.com/cgi/wiki?FindPage&value=$1',0,0),('cache','http://www.google.com/search?q=cache:$1',0,0),('commons','http://commons.wikimedia.org/wiki/$1',0,0),('corpknowpedia','http://corpknowpedia.org/wiki/index.php/$1',0,0),('dictionary','http://www.dict.org/bin/Dict?Database=*&Form=Dict1&Strategy=*&Query=$1',0,0),('disinfopedia','http://www.disinfopedia.org/wiki.phtml?title=$1',0,0),('docbook','http://wiki.docbook.org/topic/$1',0,0),('doi','http://dx.doi.org/$1',0,0),('drumcorpswiki','http://www.drumcorpswiki.com/index.php/$1',0,0),('dwjwiki','http://www.suberic.net/cgi-bin/dwj/wiki.cgi?$1',0,0),('emacswiki','http://www.emacswiki.org/cgi-bin/wiki.pl?$1',0,0),('elibre','http://enciclopedia.us.es/index.php/$1',0,0),('foldoc','http://foldoc.org/?$1',0,0),('foxwiki','http://fox.wikis.com/wc.dll?Wiki~$1',0,0),('freebsdman','http://www.FreeBSD.org/cgi/man.cgi?apropos=1&query=$1',0,0),('gej','http://www.esperanto.de/cgi-bin/aktivikio/wiki.pl?$1',0,0),('gentoo-wiki','http://gentoo-wiki.com/$1',0,0),('google','http://www.google.com/search?q=$1',0,0),('googlegroups','http://groups.google.com/groups?q=$1',0,0),('hammondwiki','http://www.dairiki.org/HammondWiki/$1',0,0),('hewikisource','http://he.wikisource.org/wiki/$1',1,0),('hrwiki','http://www.hrwiki.org/index.php/$1',0,0),('imdb','http://us.imdb.com/Title?$1',0,0),('jargonfile','http://sunir.org/apps/meta.pl?wiki=JargonFile&redirect=$1',0,0),('jspwiki','http://www.jspwiki.org/wiki/$1',0,0),('keiki','http://kei.ki/en/$1',0,0),('kmwiki','http://kmwiki.wikispaces.com/$1',0,0),('linuxwiki','http://linuxwiki.de/$1',0,0),('lojban','http://www.lojban.org/tiki/tiki-index.php?page=$1',0,0),('lqwiki','http://wiki.linuxquestions.org/wiki/$1',0,0),('lugkr','http://lug-kr.sourceforge.net/cgi-bin/lugwiki.pl?$1',0,0),('mathsongswiki','http://SeedWiki.com/page.cfm?wikiid=237&doc=$1',0,0),('meatball','http://www.usemod.com/cgi-bin/mb.pl?$1',0,0),('mediazilla','http://bugzilla.wikipedia.org/$1',1,0),('mediawikiwiki','http://www.mediawiki.org/wiki/$1',0,0),('memoryalpha','http://www.memory-alpha.org/en/index.php/$1',0,0),('metawiki','http://sunir.org/apps/meta.pl?$1',0,0),('metawikipedia','http://meta.wikimedia.org/wiki/$1',0,0),('moinmoin','http://purl.net/wiki/moin/$1',0,0),('mozillawiki','http://wiki.mozilla.org/index.php/$1',0,0),('oeis','http://www.research.att.com/cgi-bin/access.cgi/as/njas/sequences/eisA.cgi?Anum=$1',0,0),('openfacts','http://openfacts.berlios.de/index.phtml?title=$1',0,0),('openwiki','http://openwiki.com/?$1',0,0),('patwiki','http://gauss.ffii.org/$1',0,0),('pmeg','http://www.bertilow.com/pmeg/$1.php',0,0),('ppr','http://c2.com/cgi/wiki?$1',0,0),('pythoninfo','http://wiki.python.org/moin/$1',0,0),('rfc','http://www.rfc-editor.org/rfc/rfc$1.txt',0,0),('s23wiki','http://is-root.de/wiki/index.php/$1',0,0),('seattlewiki','http://seattle.wikia.com/wiki/$1',0,0),('seattlewireless','http://seattlewireless.net/?$1',0,0),('senseislibrary','http://senseis.xmp.net/?$1',0,0),('slashdot','http://slashdot.org/article.pl?sid=$1',0,0),('sourceforge','http://sourceforge.net/$1',0,0),('squeak','http://wiki.squeak.org/squeak/$1',0,0),('susning','http://www.susning.nu/$1',0,0),('svgwiki','http://wiki.svg.org/$1',0,0),('tavi','http://tavi.sourceforge.net/$1',0,0),('tejo','http://www.tejo.org/vikio/$1',0,0),('tmbw','http://www.tmbw.net/wiki/$1',0,0),('tmnet','http://www.technomanifestos.net/?$1',0,0),('tmwiki','http://www.EasyTopicMaps.com/?page=$1',0,0),('theopedia','http://www.theopedia.com/$1',0,0),('twiki','http://twiki.org/cgi-bin/view/$1',0,0),('uea','http://www.tejo.org/uea/$1',0,0),('unreal','http://wiki.beyondunreal.com/wiki/$1',0,0),('usemod','http://www.usemod.com/cgi-bin/wiki.pl?$1',0,0),('vinismo','http://vinismo.com/en/$1',0,0),('webseitzwiki','http://webseitz.fluxent.com/wiki/$1',0,0),('why','http://clublet.com/c/c/why?$1',0,0),('wiki','http://c2.com/cgi/wiki?$1',0,0),('wikia','http://www.wikia.com/wiki/$1',0,0),('wikibooks','http://en.wikibooks.org/wiki/$1',1,0),('wikicities','http://www.wikicities.com/index.php/$1',0,0),('wikif1','http://www.wikif1.org/$1',0,0),('wikihow','http://www.wikihow.com/$1',0,0),('wikinfo','http://www.wikinfo.org/index.php/$1',0,0),('wikimedia','http://wikimediafoundation.org/wiki/$1',0,0),('wikiquote','http://en.wikiquote.org/wiki/$1',1,0),('wikinews','http://en.wikinews.org/wiki/$1',1,0),('wikisource','http://sources.wikipedia.org/wiki/$1',1,0),('wikispecies','http://species.wikipedia.org/wiki/$1',1,0),('wikitravel','http://wikitravel.org/en/$1',0,0),('wiktionary','http://en.wiktionary.org/wiki/$1',1,0),('wikipedia','http://en.wikipedia.org/wiki/$1',1,0),('wlug','http://www.wlug.org.nz/$1',0,0),('zwiki','http://zwiki.org/$1',0,0),('zzz wiki','http://wiki.zzz.ee/index.php/$1',0,0),('wikt','http://en.wiktionary.org/wiki/$1',1,0);
/*!40000 ALTER TABLE `interwiki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipblocks`
--

DROP TABLE IF EXISTS `ipblocks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ipblocks` (
  `ipb_id` int(11) NOT NULL auto_increment,
  `ipb_address` tinyblob NOT NULL,
  `ipb_user` int(10) unsigned NOT NULL default '0',
  `ipb_by` int(10) unsigned NOT NULL default '0',
  `ipb_by_text` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  `ipb_reason` tinyblob NOT NULL,
  `ipb_timestamp` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ipb_auto` tinyint(1) NOT NULL default '0',
  `ipb_anon_only` tinyint(1) NOT NULL default '0',
  `ipb_create_account` tinyint(1) NOT NULL default '1',
  `ipb_enable_autoblock` tinyint(1) NOT NULL default '1',
  `ipb_expiry` varbinary(14) NOT NULL default '',
  `ipb_range_start` tinyblob NOT NULL,
  `ipb_range_end` tinyblob NOT NULL,
  `ipb_deleted` tinyint(1) NOT NULL default '0',
  `ipb_block_email` tinyint(1) NOT NULL default '0',
  `ipb_allow_usertalk` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`ipb_id`),
  UNIQUE KEY `ipb_address` (`ipb_address`(255),`ipb_user`,`ipb_auto`,`ipb_anon_only`),
  KEY `ipb_user` (`ipb_user`),
  KEY `ipb_range` (`ipb_range_start`(8),`ipb_range_end`(8)),
  KEY `ipb_timestamp` (`ipb_timestamp`),
  KEY `ipb_expiry` (`ipb_expiry`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ipblocks`
--

LOCK TABLES `ipblocks` WRITE;
/*!40000 ALTER TABLE `ipblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `job` (
  `job_id` int(10) unsigned NOT NULL auto_increment,
  `job_cmd` varbinary(60) NOT NULL default '',
  `job_namespace` int(11) NOT NULL,
  `job_title` varchar(255) character set latin1 collate latin1_bin NOT NULL,
  `job_params` blob NOT NULL,
  PRIMARY KEY  (`job_id`),
  KEY `job_cmd` (`job_cmd`,`job_namespace`,`job_title`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `langlinks`
--

DROP TABLE IF EXISTS `langlinks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `langlinks` (
  `ll_from` int(10) unsigned NOT NULL default '0',
  `ll_lang` varbinary(20) NOT NULL default '',
  `ll_title` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  UNIQUE KEY `ll_from` (`ll_from`,`ll_lang`),
  KEY `ll_lang` (`ll_lang`,`ll_title`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `langlinks`
--

LOCK TABLES `langlinks` WRITE;
/*!40000 ALTER TABLE `langlinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `langlinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logging`
--

DROP TABLE IF EXISTS `logging`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `logging` (
  `log_id` int(10) unsigned NOT NULL auto_increment,
  `log_type` varbinary(10) NOT NULL default '',
  `log_action` varbinary(10) NOT NULL default '',
  `log_timestamp` binary(14) NOT NULL default '19700101000000',
  `log_user` int(10) unsigned NOT NULL default '0',
  `log_namespace` int(11) NOT NULL default '0',
  `log_title` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  `log_comment` varchar(255) NOT NULL default '',
  `log_params` blob NOT NULL,
  `log_deleted` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`log_id`),
  KEY `type_time` (`log_type`,`log_timestamp`),
  KEY `user_time` (`log_user`,`log_timestamp`),
  KEY `page_time` (`log_namespace`,`log_title`,`log_timestamp`),
  KEY `times` (`log_timestamp`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `logging`
--

LOCK TABLES `logging` WRITE;
/*!40000 ALTER TABLE `logging` DISABLE KEYS */;
INSERT INTO `logging` (`log_id`, `log_type`, `log_action`, `log_timestamp`, `log_user`, `log_namespace`, `log_title`, `log_comment`, `log_params`, `log_deleted`) VALUES (1,'patrol','patrol','20100717173139',1,0,'Main_Page','','2\n1\n1',0),(2,'patrol','patrol','20100717173307',1,0,'Example_Front_Page','','3\n0\n1',0),(3,'patrol','patrol','20100717173430',1,0,'Example_Front_Page','','4\n3\n1',0),(4,'patrol','patrol','20100717173519',1,8,'Sidebar','','5\n0\n1',0);
/*!40000 ALTER TABLE `logging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `math`
--

DROP TABLE IF EXISTS `math`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `math` (
  `math_inputhash` varbinary(16) NOT NULL,
  `math_outputhash` varbinary(16) NOT NULL,
  `math_html_conservativeness` tinyint(4) NOT NULL,
  `math_html` text,
  `math_mathml` text,
  UNIQUE KEY `math_inputhash` (`math_inputhash`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `math`
--

LOCK TABLES `math` WRITE;
/*!40000 ALTER TABLE `math` DISABLE KEYS */;
/*!40000 ALTER TABLE `math` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objectcache`
--

DROP TABLE IF EXISTS `objectcache`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `objectcache` (
  `keyname` varbinary(255) NOT NULL default '',
  `value` mediumblob,
  `exptime` datetime default NULL,
  PRIMARY KEY  (`keyname`),
  KEY `exptime` (`exptime`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `objectcache`
--

LOCK TABLES `objectcache` WRITE;
/*!40000 ALTER TABLE `objectcache` DISABLE KEYS */;
INSERT INTO `objectcache` (`keyname`, `value`, `exptime`) VALUES ('wiki_db:pcache:idhash:1-0!1!0!!en!2','�WYo�8�#`/`mY���q�h��$@�n���&�H*vZ���:j�q����aK���f��>� �ޔ)\r�ca��x4�Ϛ��^vk�j\Z���5��1�<�B+2b$Qp{�%����W�U�!�r�=_�G)���C��K��Ή�&�gm�g���2M�ʋ.Q�\\�?���g�h��u��	~�C��5���\0�1kykVL�C�E��Do��5�I�|�]���Zja�*�c)t�\Z��#ÜϬ���;�Ҝ��a�����Uq<�7V�/��<vQ&�R.�;c�KA��ʆ�%aRg\\p��슱ɰ��O]���/��[`^μs0�Í6L�=�����eٙ&a4�9M����E�6��1ɰ��I�G�����)[��,�O�38����p4A���T˔T�H�ZZP��|�&\"[��U7�\\��l+���O�)~�<z�?�a�YJm\"��%\r�]I�~\\��nR�����_G<*������v9��?��{%U�H+Z�o.�O\'L,aZ��A�Gw_��z�>Fb;{�VVrî�o��7W����������I&Uُ1ˆ�\0S2DɌ4>6�g�Q|4��5`\n7)���Я5X��\'�v�Jn��|WNy��k�B��O��%Ӷ�~��=<k���mYnsO�I�r	1v���O�*bۼ��B�n�7�\n��7���h� �F��l�4a:��;g��nW⊱�ɭ��f��A�ؔ�a\0beQ<���*c��2JLd�7�Ǯ�3}�j����G�`x����-�ܞ�/k3Oٷ��[\'\"3�L�����l.�KL�~�M��*p��R�\\�v�u:��n�t>�j:%)�0o\nr�Lg��J�$�qv2���0��A��u�R�.�s�.i�J���~�?9\n^�d�`@w�\0[C:1�,2_*�~Ko��Ah~x��ٖ��A�w���;�nTA����3T��@>��I�<�1�&��ܭS\'L\'4��������Б�ਅ�|��������bw��t0Ĺ��~��w�;e�O?A���n)�M��`������=[�w:�}�o\'u��z\\���-�+DUo��ˮ��?��e����aoh�-�\ZdH?sz��}?@Hu�������pDT�t���Vꆨ���^�t�yÍ��xCbq���Mm�IU�\r�C\"<�ϼZ�r\Z�7��;�W*�!�����;��5qЍy�2|��Dy^y��N��6$�j�u9����#\"���)����l���v�w�)7��]3%p~j�V�91U2e�8bm��|q}�]��f*S�xؠ��b�5Vփ�L�E{��r�� �`��','2010-08-02 20:01:03'),('wiki_db:pcache:idhash:1-0!1!0!!en!2!edit=0','�Wmo�6�g�\nZ��\r���I�8��k�ŀ��c@[��D\n$;-��w�dM���kb���w�O_iQoƔ��4Ei<\Z��wM�R/�����5���z�\"��l)s F�\'Y*\"`M&��\n�/�Ԙ���z�r!�Bnx�K�C���2cZ_x��`1�91�d𪭂���^f�\\{�5�|��ә�,�,���M�5��gH8���bR �!f-�͚) H�H�p��Ѣ��C�V�!޷�`��J-�a��R\n]fƁ����0�3����/�\n����a�q��t�A������U��%O\\�ɽT�|ϙ�R|���bE��%9\\#\"�bl2�~�SW���E�����#��N�$���b��L�(�肉m�� �d\\��v����V\rѨ7)3|�x܄�G\"�fX��?/`�YF�?�M0�%��pa�9�bF*J~���6)9Љ�c2Y�Ng�/�����*i�5��wȗ\0^�L�`V��C��K��*���}��n8p�\"MC�_F�/���o�W����U��;|����,2OLEF%s��h�g�Q|6��\rˋ��R���[A�\'\"N�U4t;��NE|�֗�62��\\�T��]:��;V��Ǝ�� �\\� ��ܣc���c;��R�>�\ZI���\r��:�\"ي΁��B��TL5��K\\��������zu��q��@,���3�Ǧ�2%-�W�K��p���0�\rÓ�_��CY�.z\\�dߩ�ND憙R���l!K3LM����}U�k��,��ĺ��^o�H��g3��󮠐��f��$N\Z�! KY\nCɉ�7��`SXr����2�P2�Qpv\Z����ɀ��\0�3C�2�*s��jŠ�7� 4�v6\"��pз�v��`���챪�Zɖ��57)y�\'w\r�%Z�uʓ�锆����~D?�ۛ�\"p�d���,/H�>�0�\r���Nd�ǳO��K�I��x��9���e!�.�+�8��V��)��f�g��K�|A�1����v��o+���o�v�]\\v���J��v���px2��\'�dD�s���v�DH�r���7��pDT�Ct�LӮt#����^g�}ި�~��$6�9:jkېNk�7hO,�茾2��s\Z�AyD���xL��x��;;�s���]Z����B;y]�U�Ny�6��9��h�d��0�ψl��ȏ,�@=�^a��6�w�X=�\\I��9$�eJ�l�Y�7���L��٩�������&����Lf|��*�}ńkd֓��N�ջS,�!������_','2010-08-02 20:00:51'),('wiki_db:messages:en','K�2��.�2�R\n�LIMJ,R�.�24��RR�R�K,�LO,������R�M��+HLO��1tSR���2`\n�R�S�J�3��S�uK�rjPD�J�R�s����p.H2#5�\0l��������d����8�G\0Y>�~�� g�\Z���d�ieh]\0','2010-08-02 20:00:50'),('wiki_db:pcache:idhash:2-0!1!0!!en!2','�Zmo�8���}��u,�N��I�l�	�I�ķ�}h��y�DI;���7ԛ%�j�A{-����3�Cΐ�gǲc@����T�Se8v��*�C���E}�|�`w�D�Q@��A�g����\Z0�§�԰�j�S#}�����A�G�Y=�=����^��A@bI��K?$b�\"T�a�όU���&�f��7��N��>����Sã��bA�xOc�����p$�Ұރ�I>�ws2:���O�G�I{tv�V~��v�{gf��G�m`װ�\'a���!��,�W<�.����AO�6�|�rO�+���-����}PD�I���q�x\n�R����=��({��Ԉ�)��a@���dL��TB��&�;�lE�M�H��7��n�u<n��\Z���@Ǻ{K\"�j�(u�ֈn��r*�p\'8W��\r���c��\\,�l\'ac�\nh��8	S�a�^�(��	�]5��@0=y�t���� ê�f�¦��Y/s���T��J�zD���	r$H��׈o����wJe��?w�c�@Hq�8��8�W���i�>P1�Q����\"n3�W&ʮ��P�\r�{����^I\\�<\Z8\"ł\nh�:�*l>�!V#��e!єy��wY�ޔ�TN(UMf�B�֣�D�����6W3��qUs͟[C���K���Ll^.M���v�#�|\"Ɯ�z��F,���H\0J����~OQ�\0G�?b�˟���I\\f��x;��)b�%\n�ĺ`=5�_{�Y;n�u���$�SޤIU� p	$ �e�䦓�>�Wa�9�X��H04��8��@�SGw��ƌɌ�I����0-�����aYhSfD�9��X��F�c\0�)�RoV5^a��+h�bѰvρ�T׻�қ�W�������\\Q�>h�:�������nHpv����(%�P�CAU��k��?�z�\n���vr��_|6��Q\n�7Lrf�=胔�0Ɓ�\r����O��)=q�6�֏�g�7G�ǀ�@@Urޒ�a�W�8��S�A���_�\nY�o���#\Z�ᖆ#���Jg���&�[9���B�n4�FMZPO\"�ʋ�<*�uT⢈y��H�_`�P�HK,��\n�k��ށ�=>�z�+�X�=�l4��R�y�y:��f\r�)^�RGoVr�-���M�u�\rju|�4`Q��Ԉ�^\r��\"TK�;��ހ\\��	��;�K\"oR;��kSx��j\\�b[i`�q��s���Dk�������ݫY�*\0Ukk���\0�l�%�kso@���)���1���:@o	j�y� ����O��WC$��\"`�v��y�?O�f�~h\0^	�t����g�[=;Ǎ�6�|o�G�n������|*�I\"��ͯ�HHK���/����=2M��P��3��\'��pAgTs�fA ���M�2�K���OM�%_��F_�c����mY����(�<\'���#]�`��)��K^�]v����~�{w�y0���L!X̅�����/.0�}\n��q+n�m�L��\r�T-���y��$��:��m�<�Y�6��ʽ!\r�\0�F�49�J%��^b\ZI������(���}S��k��2�dF��\\�#ބ�3Sx�s���\\���s��\"\'��2��}s�F�6h�J�m(�Y�M4г�o��1A[�o�X]�1d�S��O�H�O���\r�,l��ލ�`����\r85�����%c���cjDS��G9�yå�o\\r�U^�K1(�\'5zG�<t��蠫�i�9Ɏ�E��W�I��ra�YB�v��a��:v�5o��r�_\0!��k�B��5�Ӆ�v�Ep.б��ܻ�9��I�\r���+��ó�\n+��h��Y�A�^��ʹ|рC_=>,0q��1�A+繅*�����+�CE���/�n~�\n�2�x|�,\'��sl����%���#��v��(7Yj��R��W(�;o�-���2W^����Ԣ��\'UYZ/3WY&(fpO3���w�����Ԏ-g�l���+�O���od���V�Xlґ㷲��Kҙ�[)��6�AC�W�p��pYz�I�-�~���tM��;��Rm�������r�/u^s^Θ���K�vU�f��+�1��]�������/���c��K	uU�g��<ɾK�8�֤ݎ�3���','2010-07-18 17:34:30'),('wiki_db:pcache:idhash:3-0!1!0!!en!2','uT]��0�g~E��p�\Zg��3V�j?�:n1cH�$�����M�hw�p�sr�\rKF؋�T ��.J�ᨉ_na/_�A{=�����l��p���Tp���d�z^�)�D����\rèh�:����K�^o�\Z��T�Ջ*���J�+*I�8���υ�\Z������r9���y�����p2^���8}������8F��T#	��ډ�]��q�JD�5Fa#�ˉ��>\n�Q��Ґ��(�v�V�6G\r�YC^0��������\0��PQ�~�<�}=�V������������	I����ޢ�bG�\\T8�閨-n�����w#d�k���$/P�Nh~�V�EVɎE�dfdn�+Ms�w����7SMmdv�	I�^�؂���Z���h��68�o��Q��<z�΅���6��ⷾ,��о�T�;��b/|l?>�uۚ�3Yɝb��Q\r����5?��v�lۆ�A�䄽�3H+���Ӟ�)Mᝒ�����\r:��4��N�ܩu�)� �S�ݡ\'�{��H}�=����C>�)b�hr���?1�ʴ�X�y�i�>J��/','2010-07-18 17:35:19'),('wiki_db:pcache:idhash:3-0!1!0!!en!2!edit=0','uT]s�0̳��w�$�43�a�\Z<�~�u�j4ȒG�h��ޓ��8�-����\Z\'4H�6���jФK�\r��A���\r�Xw�4���~\'�#/��JzG�d\\V���C�`2�+Gt���4d m�f�\0�Z�� -\"��*�5���e\r�j$]��;��#e9~M߮W������0�O�\'�e���7�Ðx��D�[��R�z)�j��1J�r ����$��Q��Rel�\n.3Q#���@I�I��^|����㭠��@�.����x[�4�H��D~�2ss=�GN�û��%{\'~�g,[y�vM6��b���jp��53k�\r#?�#��\'>��~��;��%�ʊ$��b�v��q�n;�+\\�9Xc\Zs.7&�3\Z��W����!�9�=�P�⾘��?��gA��F[>n6���9�+tu?���H�������A|ysy��g��d#�O��\'-|��:������n�-�xo�OKh�;��=dS��;-��^M��w\'�X>�P�;���N�j+�b�;Ӓ�����L��@ۓ��E�%qQ�d�T	��Z��K̹���0��ݯ�{)ƷA��','2010-07-18 17:35:27');
/*!40000 ALTER TABLE `objectcache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oldimage`
--

DROP TABLE IF EXISTS `oldimage`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `oldimage` (
  `oi_name` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  `oi_archive_name` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  `oi_size` int(10) unsigned NOT NULL default '0',
  `oi_width` int(11) NOT NULL default '0',
  `oi_height` int(11) NOT NULL default '0',
  `oi_bits` int(11) NOT NULL default '0',
  `oi_description` tinyblob NOT NULL,
  `oi_user` int(10) unsigned NOT NULL default '0',
  `oi_user_text` varchar(255) character set latin1 collate latin1_bin NOT NULL,
  `oi_timestamp` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `oi_metadata` mediumblob NOT NULL,
  `oi_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') default NULL,
  `oi_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart') NOT NULL default 'unknown',
  `oi_minor_mime` varbinary(32) NOT NULL default 'unknown',
  `oi_deleted` tinyint(3) unsigned NOT NULL default '0',
  `oi_sha1` varbinary(32) NOT NULL default '',
  KEY `oi_usertext_timestamp` (`oi_user_text`,`oi_timestamp`),
  KEY `oi_name_timestamp` (`oi_name`,`oi_timestamp`),
  KEY `oi_name_archive_name` (`oi_name`,`oi_archive_name`(14)),
  KEY `oi_sha1` (`oi_sha1`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `oldimage`
--

LOCK TABLES `oldimage` WRITE;
/*!40000 ALTER TABLE `oldimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `oldimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `page` (
  `page_id` int(10) unsigned NOT NULL auto_increment,
  `page_namespace` int(11) NOT NULL,
  `page_title` varchar(255) character set latin1 collate latin1_bin NOT NULL,
  `page_restrictions` tinyblob NOT NULL,
  `page_counter` bigint(20) unsigned NOT NULL default '0',
  `page_is_redirect` tinyint(3) unsigned NOT NULL default '0',
  `page_is_new` tinyint(3) unsigned NOT NULL default '0',
  `page_random` double unsigned NOT NULL,
  `page_touched` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `page_latest` int(10) unsigned NOT NULL,
  `page_len` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`page_id`),
  UNIQUE KEY `name_title` (`page_namespace`,`page_title`),
  KEY `page_random` (`page_random`),
  KEY `page_len` (`page_len`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` (`page_id`, `page_namespace`, `page_title`, `page_restrictions`, `page_counter`, `page_is_redirect`, `page_is_new`, `page_random`, `page_touched`, `page_latest`, `page_len`) VALUES (1,0,'Main_Page','',9,0,0,0.495170580553,'20100717173519',2,879),(2,0,'Example_Front_Page','',3,0,0,0.490228897819,'20100717173430',4,2566),(3,8,'Sidebar','',2,0,1,0.461713442207,'20100717173519',5,157);
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_props`
--

DROP TABLE IF EXISTS `page_props`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `page_props` (
  `pp_page` int(11) NOT NULL,
  `pp_propname` varbinary(60) NOT NULL,
  `pp_value` blob NOT NULL,
  UNIQUE KEY `pp_page_propname` (`pp_page`,`pp_propname`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `page_props`
--

LOCK TABLES `page_props` WRITE;
/*!40000 ALTER TABLE `page_props` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_props` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_restrictions`
--

DROP TABLE IF EXISTS `page_restrictions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `page_restrictions` (
  `pr_page` int(11) NOT NULL,
  `pr_type` varbinary(60) NOT NULL,
  `pr_level` varbinary(60) NOT NULL,
  `pr_cascade` tinyint(4) NOT NULL,
  `pr_user` int(11) default NULL,
  `pr_expiry` varbinary(14) default NULL,
  `pr_id` int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`pr_id`),
  UNIQUE KEY `pr_pagetype` (`pr_page`,`pr_type`),
  KEY `pr_typelevel` (`pr_type`,`pr_level`),
  KEY `pr_level` (`pr_level`),
  KEY `pr_cascade` (`pr_cascade`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `page_restrictions`
--

LOCK TABLES `page_restrictions` WRITE;
/*!40000 ALTER TABLE `page_restrictions` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_restrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagelinks`
--

DROP TABLE IF EXISTS `pagelinks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `pagelinks` (
  `pl_from` int(10) unsigned NOT NULL default '0',
  `pl_namespace` int(11) NOT NULL default '0',
  `pl_title` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  UNIQUE KEY `pl_from` (`pl_from`,`pl_namespace`,`pl_title`),
  UNIQUE KEY `pl_namespace` (`pl_namespace`,`pl_title`,`pl_from`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `pagelinks`
--

LOCK TABLES `pagelinks` WRITE;
/*!40000 ALTER TABLE `pagelinks` DISABLE KEYS */;
INSERT INTO `pagelinks` (`pl_from`, `pl_namespace`, `pl_title`) VALUES (1,0,'Example_Front_Page'),(1,8,'Sidebar'),(2,0,'AliceProjects'),(2,0,'BobProjects'),(2,0,'Building_Management'),(2,0,'CarrolProjects'),(2,0,'Charity_matching_program'),(2,0,'Computer_Request_Form'),(2,0,'Connecting_to_the_Backup_Server'),(2,0,'Connecting_to_the_Printer'),(2,0,'Customer_Database'),(2,0,'Earnings_re-assessment'),(2,0,'EveProjects'),(2,0,'IT'),(2,0,'Knowledge_Base'),(2,0,'Make_A_Sales_Pitch'),(2,0,'MalloryProjects'),(2,0,'Mission_Statement'),(2,0,'Navigating_HR'),(2,0,'New_Employee_Material'),(2,0,'Ordering_Business_cards'),(2,0,'Pro_Bono_Work'),(2,0,'Requesting_VPN_Access'),(2,0,'Timesheets'),(2,0,'Travel_Reimbursement_Form'),(2,2,'Alice'),(2,2,'Bob'),(2,2,'Carrol'),(2,2,'Eve'),(2,2,'Mallory'),(2,3,'Alice'),(2,3,'Bob'),(2,3,'Carrol'),(2,3,'Eve'),(2,3,'Mallory');
/*!40000 ALTER TABLE `pagelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `protected_titles`
--

DROP TABLE IF EXISTS `protected_titles`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `protected_titles` (
  `pt_namespace` int(11) NOT NULL,
  `pt_title` varchar(255) character set latin1 collate latin1_bin NOT NULL,
  `pt_user` int(10) unsigned NOT NULL,
  `pt_reason` tinyblob,
  `pt_timestamp` binary(14) NOT NULL,
  `pt_expiry` varbinary(14) NOT NULL default '',
  `pt_create_perm` varbinary(60) NOT NULL,
  UNIQUE KEY `pt_namespace_title` (`pt_namespace`,`pt_title`),
  KEY `pt_timestamp` (`pt_timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `protected_titles`
--

LOCK TABLES `protected_titles` WRITE;
/*!40000 ALTER TABLE `protected_titles` DISABLE KEYS */;
/*!40000 ALTER TABLE `protected_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `querycache`
--

DROP TABLE IF EXISTS `querycache`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `querycache` (
  `qc_type` varbinary(32) NOT NULL,
  `qc_value` int(10) unsigned NOT NULL default '0',
  `qc_namespace` int(11) NOT NULL default '0',
  `qc_title` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  KEY `qc_type` (`qc_type`,`qc_value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `querycache`
--

LOCK TABLES `querycache` WRITE;
/*!40000 ALTER TABLE `querycache` DISABLE KEYS */;
/*!40000 ALTER TABLE `querycache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `querycache_info`
--

DROP TABLE IF EXISTS `querycache_info`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `querycache_info` (
  `qci_type` varbinary(32) NOT NULL default '',
  `qci_timestamp` binary(14) NOT NULL default '19700101000000',
  UNIQUE KEY `qci_type` (`qci_type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `querycache_info`
--

LOCK TABLES `querycache_info` WRITE;
/*!40000 ALTER TABLE `querycache_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `querycache_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `querycachetwo`
--

DROP TABLE IF EXISTS `querycachetwo`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `querycachetwo` (
  `qcc_type` varbinary(32) NOT NULL,
  `qcc_value` int(10) unsigned NOT NULL default '0',
  `qcc_namespace` int(11) NOT NULL default '0',
  `qcc_title` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  `qcc_namespacetwo` int(11) NOT NULL default '0',
  `qcc_titletwo` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  KEY `qcc_type` (`qcc_type`,`qcc_value`),
  KEY `qcc_title` (`qcc_type`,`qcc_namespace`,`qcc_title`),
  KEY `qcc_titletwo` (`qcc_type`,`qcc_namespacetwo`,`qcc_titletwo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `querycachetwo`
--

LOCK TABLES `querycachetwo` WRITE;
/*!40000 ALTER TABLE `querycachetwo` DISABLE KEYS */;
/*!40000 ALTER TABLE `querycachetwo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recentchanges`
--

DROP TABLE IF EXISTS `recentchanges`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `recentchanges` (
  `rc_id` int(11) NOT NULL auto_increment,
  `rc_timestamp` varbinary(14) NOT NULL default '',
  `rc_cur_time` varbinary(14) NOT NULL default '',
  `rc_user` int(10) unsigned NOT NULL default '0',
  `rc_user_text` varchar(255) character set latin1 collate latin1_bin NOT NULL,
  `rc_namespace` int(11) NOT NULL default '0',
  `rc_title` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  `rc_comment` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  `rc_minor` tinyint(3) unsigned NOT NULL default '0',
  `rc_bot` tinyint(3) unsigned NOT NULL default '0',
  `rc_new` tinyint(3) unsigned NOT NULL default '0',
  `rc_cur_id` int(10) unsigned NOT NULL default '0',
  `rc_this_oldid` int(10) unsigned NOT NULL default '0',
  `rc_last_oldid` int(10) unsigned NOT NULL default '0',
  `rc_type` tinyint(3) unsigned NOT NULL default '0',
  `rc_moved_to_ns` tinyint(3) unsigned NOT NULL default '0',
  `rc_moved_to_title` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  `rc_patrolled` tinyint(3) unsigned NOT NULL default '0',
  `rc_ip` varbinary(40) NOT NULL default '',
  `rc_old_len` int(11) default NULL,
  `rc_new_len` int(11) default NULL,
  `rc_deleted` tinyint(3) unsigned NOT NULL default '0',
  `rc_logid` int(10) unsigned NOT NULL default '0',
  `rc_log_type` varbinary(255) default NULL,
  `rc_log_action` varbinary(255) default NULL,
  `rc_params` blob,
  PRIMARY KEY  (`rc_id`),
  KEY `rc_timestamp` (`rc_timestamp`),
  KEY `rc_namespace_title` (`rc_namespace`,`rc_title`),
  KEY `rc_cur_id` (`rc_cur_id`),
  KEY `new_name_timestamp` (`rc_new`,`rc_namespace`,`rc_timestamp`),
  KEY `rc_ip` (`rc_ip`),
  KEY `rc_ns_usertext` (`rc_namespace`,`rc_user_text`),
  KEY `rc_user_text` (`rc_user_text`,`rc_timestamp`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `recentchanges`
--

LOCK TABLES `recentchanges` WRITE;
/*!40000 ALTER TABLE `recentchanges` DISABLE KEYS */;
INSERT INTO `recentchanges` (`rc_id`, `rc_timestamp`, `rc_cur_time`, `rc_user`, `rc_user_text`, `rc_namespace`, `rc_title`, `rc_comment`, `rc_minor`, `rc_bot`, `rc_new`, `rc_cur_id`, `rc_this_oldid`, `rc_last_oldid`, `rc_type`, `rc_moved_to_ns`, `rc_moved_to_title`, `rc_patrolled`, `rc_ip`, `rc_old_len`, `rc_new_len`, `rc_deleted`, `rc_logid`, `rc_log_type`, `rc_log_action`, `rc_params`) VALUES (1,'20100717173139','20100717173139',1,'Admin',0,'Main_Page','',0,0,0,1,2,1,0,0,'',1,'140.247.149.188',624,879,0,0,NULL,'',''),(2,'20100717173307','20100717173307',1,'Admin',0,'Example_Front_Page','Created page with \'{|  cellpadding=\"4\" border=\"1\" style=\"border: 1px solid rgb(170, 170, 170); border-collapse:collapse;margin: 1em 1em 1em 0pt; width: 600px;\" |- | align=\"center\" style=\"backgroundâ€¦\'',0,0,1,2,3,0,1,0,'',1,'140.247.149.188',0,2529,0,0,NULL,'',''),(3,'20100717173430','20100717173430',1,'Admin',0,'Example_Front_Page','',0,0,0,2,4,3,0,0,'',1,'140.247.149.188',2529,2566,0,0,NULL,'',''),(4,'20100717173519','20100717173519',1,'Admin',8,'Sidebar','Created page with \'* navigation ** mainpage|mainpage-description ** recentchanges-url|recentchanges ** randompage-url|randompage ** helppage|help * SEARCH * TOOLBOX * LANGUAGES\'',0,0,1,3,5,0,1,0,'',1,'140.247.149.188',0,157,0,0,NULL,'','');
/*!40000 ALTER TABLE `recentchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redirect`
--

DROP TABLE IF EXISTS `redirect`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `redirect` (
  `rd_from` int(10) unsigned NOT NULL default '0',
  `rd_namespace` int(11) NOT NULL default '0',
  `rd_title` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  PRIMARY KEY  (`rd_from`),
  KEY `rd_ns_title` (`rd_namespace`,`rd_title`,`rd_from`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `redirect`
--

LOCK TABLES `redirect` WRITE;
/*!40000 ALTER TABLE `redirect` DISABLE KEYS */;
/*!40000 ALTER TABLE `redirect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revision`
--

DROP TABLE IF EXISTS `revision`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `revision` (
  `rev_id` int(10) unsigned NOT NULL auto_increment,
  `rev_page` int(10) unsigned NOT NULL,
  `rev_text_id` int(10) unsigned NOT NULL,
  `rev_comment` tinyblob NOT NULL,
  `rev_user` int(10) unsigned NOT NULL default '0',
  `rev_user_text` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  `rev_timestamp` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `rev_minor_edit` tinyint(3) unsigned NOT NULL default '0',
  `rev_deleted` tinyint(3) unsigned NOT NULL default '0',
  `rev_len` int(10) unsigned default NULL,
  `rev_parent_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`rev_id`),
  UNIQUE KEY `rev_page_id` (`rev_page`,`rev_id`),
  KEY `rev_timestamp` (`rev_timestamp`),
  KEY `page_timestamp` (`rev_page`,`rev_timestamp`),
  KEY `user_timestamp` (`rev_user`,`rev_timestamp`),
  KEY `usertext_timestamp` (`rev_user_text`,`rev_timestamp`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 MAX_ROWS=10000000 AVG_ROW_LENGTH=1024;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `revision`
--

LOCK TABLES `revision` WRITE;
/*!40000 ALTER TABLE `revision` DISABLE KEYS */;
INSERT INTO `revision` (`rev_id`, `rev_page`, `rev_text_id`, `rev_comment`, `rev_user`, `rev_user_text`, `rev_timestamp`, `rev_minor_edit`, `rev_deleted`, `rev_len`, `rev_parent_id`) VALUES (2,1,2,'',1,'Admin','20100717173139',0,0,879,1),(4,2,4,'',1,'Admin','20100717173430',0,0,2566,3),(5,3,5,'Created page with \'* navigation ** mainpage|mainpage-description ** recentchanges-url|recentchanges ** randompage-url|randompage ** helppage|help * SEARCH * TOOLBOX * LANGUAGES\'',1,'Admin','20100717173519',0,0,157,0);
/*!40000 ALTER TABLE `revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `searchindex` (
  `si_page` int(10) unsigned NOT NULL,
  `si_title` varchar(255) NOT NULL default '',
  `si_text` mediumtext NOT NULL,
  UNIQUE KEY `si_page` (`si_page`),
  FULLTEXT KEY `si_title` (`si_title`),
  FULLTEXT KEY `si_text` (`si_text`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
INSERT INTO `searchindex` (`si_page`, `si_title`, `si_text`) VALUES (1,'main page',' welcome tou800 your newu800 innobox device this isu800 mediawiki theu800 same software behind wikipedia . consult theu800 mediawiki user\'su800 guide foru800 information onu800 editing andu800 administering this wiki. getting started getting started getting started special userlogin login asu800 administrator  username    admin   password    innobox  andu800 special changepassword change your password . editing cheat sheet from wikipedia. seeu800 anu800 example front page customization customization customization when logged inu800 asu800 administrator special configure customize theu800 site name andu800 logo mediawiki sidebar edit theu800 sidebar server maintenence server maintenence server maintenence server backupinfo backup status server aboutu82ehtml server instructions '),(2,'example front page',' cellpadding 4u800 border 1u800 style border 1pxu800 solid rgbu800 170u800 170u800 170u800 ; border-collapse collapse;margin 1emu800 1emu800 1emu800 0ptu800; width 600px; - align center style background-color rgbu800 171u800 231u800 232u800 ;  resources  align center style background-color rgbu800 193u800 190u800 255u800 ;  protocols  align center style background-color rgbu800 171u800 231u800 232u800 ;  forms  - valign topu800 mission statement itu800 building management customer database valign topu800 connecting tou800 theu800 printer ordering business cards requesting vpnu800 access connecting tou800 theu800 backup server valign topu800 travel reimbursement form computer request form timesheets - align center style background-color rgbu800 193u800 190u800 255u800 ;  events  align center style background-color rgbu800 171u800 231u800 232u800 ;  howu800-tou800\'su800  align center style background-color rgbu800 193u800 190u800 255u800 ;  projects  - valign topu800 google calendar annual retreat isu800 mayu800 7thu800 valign topu800 make au800 sales pitch newu800 employee material navigating hru800 knowledge base valign topu800 earnings reu800-assessment prou800 bono work charity matching program knowledge base   special listusers group members   user alice alice - aliceprojects projects - user talk alice talk - fullurl special contributions contribs user&ampu800;ampu800;target alice edits user bobu800 bobu800 - bobprojects projects - user talk bobu800 talk - fullurl special contributions contribs user&ampu800;ampu800;target edits user carrol carrol - carrolprojects projects - user talk carrol talk - fullurl special contributions contribs user&ampu800;ampu800;target carrol edits user eveu800 eveu800 - eveprojects projects - user talk eveu800 talk - fullurl special contributions contribs user&ampu800;ampu800;target eveu800 edits user mallory mallory - malloryprojects projects - user talk mallory talk - fullurl special contributions contribs user&ampu800;ampu800;target mallory edits  additional info  your institution\'su800 name address 1600 cherry tree lane beverly hills cau800 90210 building manager alice waters 432u800 324u800-1345 waters yourinstitutionu82ecomu800 '),(3,'sidebar',' navigation mainpage mainpage-description recentchanges-urlu800 recentchanges randompage-urlu800 randompage helppage help search toolbox languages ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_stats`
--

DROP TABLE IF EXISTS `site_stats`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `site_stats` (
  `ss_row_id` int(10) unsigned NOT NULL,
  `ss_total_views` bigint(20) unsigned default '0',
  `ss_total_edits` bigint(20) unsigned default '0',
  `ss_good_articles` bigint(20) unsigned default '0',
  `ss_total_pages` bigint(20) default '-1',
  `ss_users` bigint(20) default '-1',
  `ss_active_users` bigint(20) default '-1',
  `ss_admins` int(11) default '-1',
  `ss_images` int(11) default '0',
  UNIQUE KEY `ss_row_id` (`ss_row_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `site_stats`
--

LOCK TABLES `site_stats` WRITE;
/*!40000 ALTER TABLE `site_stats` DISABLE KEYS */;
INSERT INTO `site_stats` (`ss_row_id`, `ss_total_views`, `ss_total_edits`, `ss_good_articles`, `ss_total_pages`, `ss_users`, `ss_active_users`, `ss_admins`, `ss_images`) VALUES (1,14,5,2,3,1,-1,1,0);
/*!40000 ALTER TABLE `site_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_summary`
--

DROP TABLE IF EXISTS `tag_summary`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tag_summary` (
  `ts_rc_id` int(11) default NULL,
  `ts_log_id` int(11) default NULL,
  `ts_rev_id` int(11) default NULL,
  `ts_tags` blob NOT NULL,
  UNIQUE KEY `tag_summary_rc_id` (`ts_rc_id`),
  UNIQUE KEY `tag_summary_log_id` (`ts_log_id`),
  UNIQUE KEY `tag_summary_rev_id` (`ts_rev_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tag_summary`
--

LOCK TABLES `tag_summary` WRITE;
/*!40000 ALTER TABLE `tag_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatelinks`
--

DROP TABLE IF EXISTS `templatelinks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `templatelinks` (
  `tl_from` int(10) unsigned NOT NULL default '0',
  `tl_namespace` int(11) NOT NULL default '0',
  `tl_title` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  UNIQUE KEY `tl_from` (`tl_from`,`tl_namespace`,`tl_title`),
  UNIQUE KEY `tl_namespace` (`tl_namespace`,`tl_title`,`tl_from`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `templatelinks`
--

LOCK TABLES `templatelinks` WRITE;
/*!40000 ALTER TABLE `templatelinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text`
--

DROP TABLE IF EXISTS `text`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `text` (
  `old_id` int(10) unsigned NOT NULL auto_increment,
  `old_text` mediumblob NOT NULL,
  `old_flags` tinyblob NOT NULL,
  PRIMARY KEY  (`old_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 MAX_ROWS=10000000 AVG_ROW_LENGTH=10240;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `text`
--

LOCK TABLES `text` WRITE;
/*!40000 ALTER TABLE `text` DISABLE KEYS */;
INSERT INTO `text` (`old_id`, `old_text`, `old_flags`) VALUES (2,'Welcome to your new [http://www.innoboxdevices.com InnoBox Device]<br>\nThis is MediaWiki, the same software behind [http://en.wikipedia.org Wikipedia].<br>\nConsult the [http://meta.wikimedia.org/wiki/Help:Contents MediaWiki User\'s Guide]\nfor information on editing and administering this wiki.\n<br><br>\n== Getting started ==\n* [[Special:UserLogin| Login]] as administrator: (\'\'username:\'\' \'\'\'admin\'\'\' \'\'password:\'\' \'\'\'innobox\'\'\') and [[Special:ChangePassword| change your password]].\n* [http://en.wikipedia.org/wiki/Wikipedia%3ACHEATSHEET Editing Cheat Sheet] from Wikipedia.\n* See an [[Example Front Page]]\n<br>\n== Customization ==\nWhen logged in as administrator\n* [[Special:Configure| Customize the site name and logo]]\n* [[MediaWiki:Sidebar| Edit the sidebar]]\n<br>\n\n== Server Maintenence ==\n*[{{SERVER}}/backupinfo Backup Status]\n*[{{SERVER}}/about.html Server Instructions]','utf-8'),(4,'{|  cellpadding=\"4\" border=\"1\" style=\"border: 1px solid rgb(170, 170, 170); border-collapse:collapse;margin: 1em 1em 1em 0pt; width: 600px;\"\n|-\n| align=\"center\" style=\"background-color: rgb(171, 231, 232); \" | \'\'\'Resources\'\'\'\n| align=\"center\" style=\"background-color: rgb(193, 190, 255); \" | \'\'\'Protocols\'\'\'\n| align=\"center\" style=\"background-color: rgb(171, 231, 232); \" | \'\'\'Forms\'\'\'\n|-\n| valign=\"top\" | \n*[[Mission Statement]] \n*[[IT]] \n*[[Building Management]] \n*[[Customer Database]] \n\n<br>\n\n| valign=\"top\" | \n*[[Connecting to the Printer]] \n*[[Ordering Business cards]] \n*[[Requesting VPN Access]] \n*[[Connecting to the Backup Server]] \n\n<br>\n\n\n| valign=\"top\" | \n*[[Travel Reimbursement Form]] \n*[[Computer Request Form]] \n*[[Timesheets]] \n\n<br>\n\n\n|-\n| align=\"center\" style=\"background-color: rgb(193, 190, 255);\" | \'\'\'Events\'\'\'\n| align=\"center\" style=\"background-color: rgb(171, 231, 232);\" | \'\'\'How-To\'s\'\'\'\n| align=\"center\" style=\"background-color: rgb(193, 190, 255);\" | \'\'\'Projects\'\'\'\n|-\n| valign=\"top\" | \n*[http://calendar.google.com Google Calendar]\n*Annual retreat is May 7th!\n\n\n<br>\n\n| valign=\"top\" | \n*[[Make A Sales Pitch]]\n*[[New Employee Material]] \n*[[Navigating HR]] \n*[[Knowledge Base]]\n<br>\n\n| valign=\"top\" | \n\n*[[Earnings re-assessment]]\n*[[Pro Bono Work]] \n*[[Charity matching program]] \n*[[Knowledge Base]]\n<br> <br>\n\n|}\n<div style=\"border: 1px solid rgb(255, 204, 0);  padding: .7em; margin-right:3em; margin-bottom:2em; background-color: rgb(255, 255, 204); float: left;\"><center>\'\'\'[[Special:Listusers|Group Members]]\'\'\'</center> \n*[[User:Alice|Alice]] - [[AliceProjects|projects]] - [[User talk:Alice|talk]] - [{{fullurl:Special:Contributions|contribs=user&amp;amp;target=Alice}} edits] \n*[[User:Bob|Bob]] - [[BobProjects|projects]] - [[User talk:Bob|talk]] - [{{fullurl:Special:Contributions|contribs=user&amp;amp;target}} edits] \n*[[User:Carrol|Carrol]] - [[CarrolProjects|projects]] - [[User talk:Carrol|talk]] - [{{fullurl:Special:Contributions|contribs=user&amp;amp;target=Carrol}} edits] \n*[[User:Eve|Eve]] - [[EveProjects|projects]] - [[User talk:Eve|talk]] - [{{fullurl:Special:Contributions|contribs=user&amp;amp;target=Eve}} edits] \n*[[User:Mallory|Mallory]] - [[MalloryProjects|projects]] - [[User talk:Mallory|talk]] - [{{fullurl:Special:Contributions|contribs=user&amp;amp;target=Mallory}} edits] \n\n</div> \n\n\'\'\'Additional Info\'\'\'\n\n*Your Institution\'s Name \n*Address: 1600 Cherry Tree Lane, Beverly Hills CA 90210 \n*Building Manager: Alice Waters (432) 324-1345\n*[mailto:waters@yourinstitution.com waters@yourinstitution.com]','utf-8'),(5,'* navigation\n** mainpage|mainpage-description\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help\n* SEARCH\n* TOOLBOX\n* LANGUAGES','utf-8');
/*!40000 ALTER TABLE `text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trackbacks`
--

DROP TABLE IF EXISTS `trackbacks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `trackbacks` (
  `tb_id` int(11) NOT NULL auto_increment,
  `tb_page` int(11) default NULL,
  `tb_title` varchar(255) NOT NULL,
  `tb_url` blob NOT NULL,
  `tb_ex` text,
  `tb_name` varchar(255) default NULL,
  PRIMARY KEY  (`tb_id`),
  KEY `tb_page` (`tb_page`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `trackbacks`
--

LOCK TABLES `trackbacks` WRITE;
/*!40000 ALTER TABLE `trackbacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `trackbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transcache`
--

DROP TABLE IF EXISTS `transcache`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `transcache` (
  `tc_url` varbinary(255) NOT NULL,
  `tc_contents` text,
  `tc_time` int(11) NOT NULL,
  UNIQUE KEY `tc_url_idx` (`tc_url`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `transcache`
--

LOCK TABLES `transcache` WRITE;
/*!40000 ALTER TABLE `transcache` DISABLE KEYS */;
/*!40000 ALTER TABLE `transcache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updatelog`
--

DROP TABLE IF EXISTS `updatelog`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `updatelog` (
  `ul_key` varchar(255) NOT NULL,
  PRIMARY KEY  (`ul_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `updatelog`
--

LOCK TABLES `updatelog` WRITE;
/*!40000 ALTER TABLE `updatelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `updatelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL auto_increment,
  `user_name` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  `user_real_name` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  `user_password` tinyblob NOT NULL,
  `user_newpassword` tinyblob NOT NULL,
  `user_newpass_time` binary(14) default NULL,
  `user_email` tinytext NOT NULL,
  `user_options` blob NOT NULL,
  `user_touched` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `user_token` binary(32) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `user_email_authenticated` binary(14) default NULL,
  `user_email_token` binary(32) default NULL,
  `user_email_token_expires` binary(14) default NULL,
  `user_registration` binary(14) default NULL,
  `user_editcount` int(11) default NULL,
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `user_email_token` (`user_email_token`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_options`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`) VALUES (1,'Admin','',':B:71461d62:fa143d8b3ea007466cf2ba60c76ff4b0','',NULL,'','quickbar=1\nunderline=2\ncols=80\nrows=25\nsearchlimit=20\ncontextlines=5\ncontextchars=50\ndisablesuggest=0\nskin=\nmath=1\nusenewrc=0\nrcdays=7\nrclimit=50\nwllimit=250\nhideminor=0\nhidepatrolled=0\nnewpageshidepatrolled=0\nhighlightbroken=1\nstubthreshold=0\npreviewontop=1\npreviewonfirst=0\neditsection=1\neditsectiononrightclick=0\neditondblclick=0\neditwidth=0\nshowtoc=1\nshowtoolbar=1\nminordefault=0\ndate=default\nimagesize=2\nthumbsize=2\nrememberpassword=0\nnocache=0\ndiffonly=0\nshowhiddencats=0\nnorollbackdiff=0\nenotifwatchlistpages=0\nenotifusertalkpages=1\nenotifminoredits=0\nenotifrevealaddr=0\nshownumberswatching=1\nfancysig=0\nexternaleditor=0\nexternaldiff=0\nforceeditsummary=0\nshowjumplinks=1\njustify=0\nnumberheadings=0\nuselivepreview=0\nwatchlistdays=3\nextendwatchlist=0\nwatchlisthideminor=0\nwatchlisthidebots=0\nwatchlisthideown=0\nwatchlisthideanons=0\nwatchlisthideliu=0\nwatchlisthidepatrolled=0\nwatchcreations=0\nwatchdefault=0\nwatchmoves=0\nwatchdeletion=0\nnoconvertlink=0\ngender=unknown\nriched_use_toggle=1\nriched_start_disabled=1\nriched_use_popup=1\nriched_toggle_remember_state=1\nvariant=en\nlanguage=en\nsearchNs0=1','20100801200131','c60e246abd3d1be40088f51a8c960ba0',NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,'20091002235520',5);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `user_groups` (
  `ug_user` int(10) unsigned NOT NULL default '0',
  `ug_group` varbinary(16) NOT NULL default '',
  UNIQUE KEY `ug_user_group` (`ug_user`,`ug_group`),
  KEY `ug_group` (`ug_group`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` (`ug_user`, `ug_group`) VALUES (1,'bureaucrat'),(1,'sysop');
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_newtalk`
--

DROP TABLE IF EXISTS `user_newtalk`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `user_newtalk` (
  `user_id` int(11) NOT NULL default '0',
  `user_ip` varbinary(40) NOT NULL default '',
  `user_last_timestamp` binary(14) NOT NULL default '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  KEY `un_user_id` (`user_id`),
  KEY `un_user_ip` (`user_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `user_newtalk`
--

LOCK TABLES `user_newtalk` WRITE;
/*!40000 ALTER TABLE `user_newtalk` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_newtalk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valid_tag`
--

DROP TABLE IF EXISTS `valid_tag`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `valid_tag` (
  `vt_tag` varchar(255) NOT NULL,
  PRIMARY KEY  (`vt_tag`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `valid_tag`
--

LOCK TABLES `valid_tag` WRITE;
/*!40000 ALTER TABLE `valid_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `valid_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchlist`
--

DROP TABLE IF EXISTS `watchlist`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `watchlist` (
  `wl_user` int(10) unsigned NOT NULL,
  `wl_namespace` int(11) NOT NULL default '0',
  `wl_title` varchar(255) character set latin1 collate latin1_bin NOT NULL default '',
  `wl_notificationtimestamp` varbinary(14) default NULL,
  UNIQUE KEY `wl_user` (`wl_user`,`wl_namespace`,`wl_title`),
  KEY `namespace_title` (`wl_namespace`,`wl_title`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `watchlist`
--

LOCK TABLES `watchlist` WRITE;
/*!40000 ALTER TABLE `watchlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `watchlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-08-01 20:04:07
