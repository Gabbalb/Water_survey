<?php

require 'vendor/autoload.php';

use Model\NoteRepository;
use Model\UserRepository;
use Util\Authenticator;
use League\Plates\Engine;


$template = new Engine('templates', 'tpl');


session_start();
$username = $_SESSION['username'];
$id_utente = UserRepository::getID($username);



    $lista_form_fatti = NoteRepository::listFormCompleted($id_utente);
    $lista_form_non_fatti = NoteRepository::listFormNotCompleted($id_utente);


    echo $template->render('lista_form_utente', [
        'completati' => $lista_form_fatti,
        'non_completati' => $lista_form_non_fatti,
    ]);