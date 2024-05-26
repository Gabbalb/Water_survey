<?php
require 'vendor/autoload.php';

error_reporting(E_ALL);
ini_set('display_errors', 1);


use Model\UserRepository;

$template = new League\Plates\Engine('templates', 'tpl');

$province = \Model\NoteRepository::getProvince();

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['email'])) {
    $email = $_POST['email'];
    $username = $_POST['username'];
    $password = $_POST['password'];
    $type = $_POST['type'];
    $provincia = $_POST['provincia'];
    $password = password_hash($password, PASSWORD_DEFAULT);

    // Esegui la registrazione
    UserRepository::registrazione($email, $username, $password, $type, $provincia);

    // Reindirizza alla pagina di successo
    echo $template->render('login', [

    ]);
    exit(0); // Assicura che lo script termini dopo il reindirizzamento
}

echo $template->render('registrazione', [
    'province' => $province
]);

