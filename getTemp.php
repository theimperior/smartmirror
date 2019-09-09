<?php
	error_reporting(E_ALL);
    	ini_set('display_errors', TRUE);
    	ini_set('display_startup_errors', TRUE);
	$message=shell_exec("/var/www/smartmirror/scripts/getouttemp.sh 2>&1");
	$temperatur = number_format((float) $message, 1, '.', '');
	echo '{"CurrentTemp":';
	echo $temperatur;
	echo '}';
?>
