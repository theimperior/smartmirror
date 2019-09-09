<?php

function extract_unit($string, $start, $end) {
	$pos = stripos($string, $start);
	$str = substr($string, $pos);
	$str_two = substr($str, strlen($start));
	$second_pos = stripos($str_two, $end);
	$str_three = substr($str_two, 0, $second_pos);
	$unit = trim($str_three); // remove whitespaces

	return $unit;
}

header('Content-type: application/json');

$jsonp = file_get_contents("https://www.dwd.de/DWD/warnungen/warnapp/json/warnings.json");
 
$json = extract_unit($jsonp, 'warnWetter.loadWarnings(', ');');
 
 
$alert_list = json_decode($json, true);
//var_dump($alert_list); 
$relevant_alerts = $alert_list["warnings"]["108425000"];
$relevant_prealerts = $alert_list["vorabInformation"]["108425000"];
 
if($relevant_alerts == null) $relevant_alerts = array();
if($relevant_prealerts == null) $relevant_prealerts = array();

$relevant_alerts = array_merge($relevant_prealerts, $relevant_alerts);

$sortArray = array();
foreach($relevant_alerts as $key => $array) {
        $sortArray[$key] = $array['level'];
} 

array_multisort($sortArray, SORT_ASC, SORT_NUMERIC, $relevant_alerts);

$numberOfAlerts = count($relevant_alerts);
$description = "";

echo '{"headline":"';
$cnt = 0;
foreach($relevant_alerts as $alert) {
	$event = $alert['event'];
	$headline = $alert['headline'];
	$description = $alert['description'];
	$regionName = $alert['regionName'];
	$level = $alert['level'];
	$start = utf8_decode(date('d.m.Y H:i', substr($alert['start'], 0, 10)));
	$end = utf8_decode(date('d.m.Y H:i', substr($alert['end'], 0, 10)));
	/*echo "<li style='padding-left: 5px;background: transparent'><span class='tooltip'><img src='$level.png' width='18' height='18' />&nbsp;&nbsp;$event<br />
	<span class='tooltiptext'>$headline für die $regionName<br />Gültig von $start bis $end<br />$description</span></span>
	</li>";*/
	#if ($cnt > 0) echo ',';
	#echo '"headline":"'.$headline.'"';
	echo $headline.' ';
	$cnt += 1;
}

	echo '","description":"'.$description.'"}';
?>
