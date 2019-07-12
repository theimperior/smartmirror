<?php
	$message=shell_exec("/var/www/smartmirror/scripts/getouttemp.sh 2>&1");
	$temperatur = number_format((float) $message, 1, '.', '');
	echo '{"CurrentTemp":';
	echo $temperatur;
	echo '}';
?>
