<?php
ini_set('error_reporting', E_ALL);
#$xml = new DOMDocument();
#$xml->load('http://feeds.bbci.co.uk/news/world/rss.xml');

#$xslt = new XSLTProcessor();

#$xsl = new DOMDocument();
#$xsl->load('nolsol.xsl');
#$xslt->importStylesheet($xsl);

#echo $xslt->transformToXML($xml);
#print $xml
header('Content-type: text/xml');

$file = file_get_contents('http://feeds.bbci.co.uk/news/world/rss.xml');
echo $file;
?>
