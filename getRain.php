<?php
	//$currentDate = date('Y_m_d');
	//$currentHour = date('h');
	//$currentMin = date('i');
	//$url = "https://img3.kachelmannwetter.com/images/data/cache/px250/px250_" . $currentDate . "_" . $currentHour

	$doc = new DOMDocument;
	$doc->validateOnParse = true;
	$doc->LoadHTML(file_get_contents('https://kachelmannwetter.com/de/regenradar/ulm'));
	$chnodes = $doc->getElementById('model-image')->childNodes;
	//foreach ($chnodes as $child)
	//{
	//	var_dump($child);
	//}
	//var_dump($chnodes[1]);
	$url = urldecode($chnodes[1]->getAttribute('src'));
	//echo $url;
	$image = imagecreatefrompng($url);
	$bg_color = imagecolorexact($image, 110, 110, 110);
	imagecolortransparent($image, $bg_color);
	header("Content-type: image/png");
	imagepng($image);
	imagedestroy($image);
?>
