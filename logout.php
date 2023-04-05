<?php
session_start();

if (isset($_SESSION['userdata']['id'])) {
    unset($_SESSION['userdata']);
}

header('location:./');
?>