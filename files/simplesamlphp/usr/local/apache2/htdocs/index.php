<?php

error_reporting(E_ALL);

include_once "/mnt/simplesaml/lib/_autoload.php";
$auth = new \SimpleSAML\Auth\Simple("default-sp");

if ($_REQUEST['logout'] === 'true' && $auth->isAuthenticated()) {
		$auth->logout();
} else {
	if (!$auth->isAuthenticated()) {
		$auth->requireAuth();
	}

	echo '<html><head><title>DevIDP Details</title></head><body>';
	$attr = $auth->getAttributes();
	echo '<pre>';
	var_dump($attr);
	echo '</pre>';
	echo '<form method="POST"><input type="hidden" value="true" name="logout"/><input type="submit" value="logout"></form>';
	echo '</body></html>';
}