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


session_start();
$username = $_SESSION['username'];
$id_utente = UserRepository::getID($username);


$id_form = 1;
if(isset($_GET['id'])) {
    $id_form = $_GET['id'];
}


$questions = Model\NoteRepository::listQuestionByForm($id_form);


echo $template->render('review', [
    'questions' => $questions,
]);
