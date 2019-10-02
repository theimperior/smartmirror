<?php
	ini_set('display_errors', 1);
	ini_set('display_startup_errors', 1);
	error_reporting(E_ALL);
	$test = 1;
	var_dump($test);
	$html = file_get_html('https://www.alpenverein.de/DAV-Services/Bergwetter/#2019-10-02|weatherLayer');
	var_dump($html);
	$ret = $html->find('div[class="map-container map-ui__element leaflet-container leaflet-touch leaflet-fade-anim leaflet-touch-zoom"]');
	var_dump($ret);
?>
