<?php
require 'vendor/autoload.php';
require_once 'conf/config.php';
use Model\NoteRepository;
use Model\UserRepository;

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$template = new \League\Plates\Engine('templates', 'tpl');

session_start();

$username = $_SESSION['username'];
$nusers = NoteRepository::nusers();
$nform = NoteRepository::nform();
$nansw = NoteRepository::nrisposte();



// Check if there's a specific action to perform
if (isset($_GET['action']) && $_GET['action'] == 'back') {
    // Render the listaAdmin template when action is 'back'
    echo $template->render('admin', [
        'username' => $username,
        'nusers' => $nusers,
        'nform' => $nform,
        'nansw' => $nansw
    ]);
    exit(0);  // Exit after rendering to stop further script execution
}if (isset($_GET['action']) && $_GET['action'] == 'delete') {
    if (isset($_GET['id'])) {
        $id = $_GET['id'];
        \Model\UserRepository::rimuoviUtente($id);
        header('Location: visualizza.php?query=1');
        exit();
    }
}


if (isset($_GET['query'])){
    $results = null;
    $headers = null;
    switch ($_GET['query']){
        case 1:
            $headers = ['id', 'username', 'mail', 'livello permessi', 'elimina' ];
            $results = \Model\NoteRepository::query1();
            break;
        case 2:
            $headers = ['id', 'escrizione', 'data', 'importo', 'utente', 'tipologia'];
            $results = \Model\NoteRepository::query2();
            break;
    }
    if (!is_null($results))
        $utenti = \Model\UserRepository::listAll();
    if($_GET['query']== 1) {
        echo $template->render('users', [
            'results' => $results,
            'headers' => $headers,
            'utenti' => $utenti

        ]);
    } else {
        echo $template->render('note', [
            'results' => $results,
            'headers' => $headers,
            'utenti' => $utenti

        ]);
    }
}else
    echo $template->render('404');