<?php
$feed = file_get_contents("http://feeds.feedburner.com/blogspot/rkEL");
$regex = "/[\+]{3}.*[\+]{3}/";
preg_match_all($regex, $feed, $matches);
//create JSON out of the feed
//var_dump($matches[0]);
//$text = html_entity_decode($matches[0][0]);
echo '{"newsTicker":[';
$numberOfItems = count($matches[0]);
$i = 1;
foreach($matches[0] as $feed){
	$htmlfeed = html_entity_decode($feed);
	echo '"<ul><li>';
	print(str_replace("<br>", "</li><li>", $htmlfeed));
	if($i == $numberOfItems){
		echo '</li></ul>"]}';
	}
	else {
		echo '</li></ul>",';
	}
	$i++;
}
//print($matches[0][0]);
//print($postTicker);
?>
