<?php
require 'vendor/autoload.php';

error_reporting(E_ALL);
ini_set('display_errors', 1);


use Model\UserRepository;

$template = new League\Plates\Engine('templates', 'tpl');

$province = \Model\NoteRepository::getProvince();
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $title = $_POST['title'];
    $desc = $_POST['desc'];

    // Salva form
    \Model\NoteRepository::creaForm($title, $desc);

    // Reindirizza alla pagina di successo
    echo $template->render('login', [

    ]);
    exit(0); // Assicura che lo script termini dopo il reindirizzamento
}

echo $template->render('crea_form', [
]);
