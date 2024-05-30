<?php

require 'vendor/autoload.php';
require_once 'conf/config.email.php';
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use Util\Email;

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

/**
 * @var $email_config
 */


use Model\UserRepository;
use Model\NoteRepository;

$template = new League\Plates\Engine('templates', 'tpl');

function invio_email($email, $risposte, $questions, $username) {

    global $email_config;
    $mail = new Email($email_config);

    $subject = 'Thank you for completing the water survey';

    // Contenuto del messaggio
    $message = '
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thank you for completing the water questionnaire</title>
    <style>
        body {
            line-height: 1.6;
            color: #333;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        p, li{
            color: black;
        }
        .container {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            background-color: #fff;
        }
        .header {
            background-color: #4CAF50;
            color: white;
            padding: 20px;
            text-align: center;
            border-radius: 10px 10px 0 0;
        }
        .content {
            padding: 20px;
        }
        .footer {
            margin-top: 20px;
            text-align: center;
            color: #777;
        }
        ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        li {
            margin-bottom: 10px;
        }
        li strong {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Thank you for completing the water questionnaire</h1>
        </div>
        <div class="content">
            <p>Dear ' . $username . ',</p>
            <p>Thank you for participating in our water questionnaire. We have received your responses and appreciate them greatly. Below, you can find a summary of your answers:</p>
            <p><strong>Form Title:</strong> ' . htmlspecialchars($questions[0]['titolo']) . '</p>
            <p><strong>Form Description:</strong> ' . htmlspecialchars($questions[0]['descrizione']) . '</p>
            <ul>';
    foreach ($questions as $index => $question) {
        $message .= '<li><strong>' . htmlspecialchars($question['domanda']) . ':</strong> ' . htmlspecialchars($risposte[$index + 1]) . '</li>';
    }
    $message .= '
            </ul>
            <p><strong>Date and Time of Submission:</strong> ' . date("m/d/Y H:i:s") . '</p>
            <p>If you wish to modify your answers or have additional questions, please feel free to contact us by replying to this email.</p>
            <p>Thank you again for your time and contribution.</p>
            <p>Best regards,<br>From the Staff</p>
        </div>
        <div class="footer">
            <p>© 2024 From the Staff. All rights reserved.</p>
        </div>
    </div>
</body>
</html>
';

    try {
        $sent = $mail->sendEmail($email, $subject, $message);
    } catch (Exception $e) {
        $sent = false;
    }

}

session_start();
$username = $_SESSION['username'];
$id_utente = UserRepository::getID($username);


if(isset($_GET['id'])) {
    $id_form = $_GET['id'];
} else {
    $id_form = 1;
}


$questions = Model\NoteRepository::listQuestionByForm($id_form);

if (isset($_GET['question_1'])) {

    $risposte = [];
    for ($i = 1; $i <= sizeof($questions); $i++) {
        $domanda = $_GET['question_' . $i];
        //risposte in un vettore, serve per l'email
        $risposte[$i] = $domanda;
    }
    Model\NoteRepository::salvaRisposte($id_utente, $id_form, $questions, $risposte);
    //email utente
    $email_user = Model\UserRepository::getEmail($username);

    //funzione temporaneamente commentata, altriemnti ho mille email
    //invio_email($email_user, $risposte, $questions, $username);



}

echo $template->render('form', [
    'questions' => $questions,
]);
