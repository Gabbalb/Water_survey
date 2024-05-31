<?php
global $username;
require 'vendor/autoload.php';

error_reporting(E_ALL);
ini_set('display_errors', 1);


use Model\NoteRepository;
use Model\UserRepository;

$template = new League\Plates\Engine('templates', 'tpl');

session_start();
$nusers = NoteRepository::nusers();
$nform = NoteRepository::nform();
$nansw = NoteRepository::nrisposte();
$_SESSION['username'] = $username;

$province = \Model\NoteRepository::getProvince();
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $title = $_POST['title'];
    $desc = $_POST['desc'];

    // Salva form
    \Model\NoteRepository::creaForm($title, $desc);

    // Reindirizza alla pagina di successo
    echo $template->render('admin', [
        'username' => $username,
        'nusers' => $nusers,
        'nform' => $nform,
        'nansw' => $nansw
    ]);


    exit(0); // Assicura che lo script termini dopo il reindirizzamento
}

echo $template->render('crea_form', [
]);
