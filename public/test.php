<?php
require_once __DIR__ . "/../src/config.php";

$connection = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);

if ($connection->connect_error) {
  die("❌ Connection failed: " . $connection->connect_error);
} else {
  echo "✅ Database connection successful!<br>";
  echo "Connected to database: <strong>" . DB_NAME . "</strong><br>";
  echo "Timezone: <strong>" . date_default_timezone_get() . "</strong>";
}

$connection->close();
