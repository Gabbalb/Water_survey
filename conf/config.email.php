<?php

use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\PHPMailer;

define('DEV', false);  // In development or live? Development = true | Live = false

// SMTP server settings - ENTER YOUR DETAILS HERE
$email_config = [
    'server'      => 'smtp.gmail.com',
    'port'        => '465',
    'username'    => 'zanoris54@gmail.com',
    'password'    => 'ydmi ruwf tmns tdvz',
    'security'    => PHPMailer::ENCRYPTION_SMTPS,
    'admin_email' => 'zano sano',
    'admin_name'  => 'Zanotti Luca',  // Set the correct name here
    'debug'       => (DEV) ? SMTP::DEBUG_SERVER : SMTP::DEBUG_OFF,
];