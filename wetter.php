<?php
header('Content-type: text/xml');
$xml = file_get_contents("https://www.yr.no/place/Germany/Baden-W%C3%BCrttemberg/Ulm/forecast.xml");
echo $xml;
?>
