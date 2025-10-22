<?php
require_once __DIR__ . '/../vendor/autoload.php';

// Site
const SITE_NAME = "Auction App";
const SITE_BASE_URL = "http://localhost:5000/public/";

// Database
$dotenv = Dotenv\Dotenv::createImmutable(__DIR__ . '/..');
$dotenv->load();

define('DB_HOST', $_ENV['DB_HOST']);
define('DB_USER', $_ENV['DB_USER']);
define('DB_PASS', $_ENV['DB_PASS']);
define('DB_NAME', $_ENV['DB_NAME']);


// Timezone
//date_default_timezone_set("Asia/Makassar");
date_default_timezone_set("Africa/Accra");
