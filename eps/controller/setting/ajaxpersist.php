<?php
session_start();
$_SESSION[$_POST['fieldname']] = $_POST['value'];

?>