<?php
require 'vendor/autoload.php';

error_reporting(E_ALL);
ini_set('display_errors', 1);


use Model\UserRepository;

$template = new League\Plates\Engine('templates', 'tpl');

$province = \Model\NoteRepository::getProvince();
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $question = $_POST['question'];
    $form_id = $_POST['form_id'];

    // Salva form
    \Model\NoteRepository::creaDomanda($question, $form_id);

    // Reindirizza alla pagina di successo
    echo $template->render('successQ', [

    ]);
    exit(0); // Assicura che lo script termini dopo il reindirizzamento
}

echo $template->render('crea_domanda', [
]);
