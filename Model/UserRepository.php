<?php

namespace Model;
use Util\Connection;

class UserRepository
{

    private static function start()
    {
        if (session_id() == "")
            session_start();
    }


    public static function userAuthentication(string $username, string $password){
        $pdo = Connection::getInstance();
        $sql = 'SELECT * FROM users WHERE username=:username';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
                'username' => $username
            ]
        );

        if($stmt->rowCount() == 0){
            return null;
        }

        $row = $stmt->fetch();
        if (!password_verify($password, $row['password'])) {

            return null;
        }
        return $row;
    }


    public static function verificaCredenziali($username, $password): array
    {
        $pdo = Connection::getInstance();
        $sql = 'SELECT password, username, id_permesso
            FROM users 
            WHERE username = :username';
        $stmt = $pdo->prepare($sql);
        $stmt->execute(['username' => $username]);
        $result = $stmt->fetch();

        // Inizializza il valore di default per id_permesso
        $idPermesso = null;

        // Se non viene trovato alcun utente con lo username fornito
        if (!$result) {
            return ['success' => false, 'id_permesso' => $idPermesso];
        }

        // Verifica se la password fornita corrisponde all'hash memorizzato nel database
        if (password_verify($password, $result['password'])) {
            // Assegna id_permesso se la password è corretta
            $idPermesso = $result['id_permesso'];
            return ['success' => true, 'id_permesso' => $idPermesso];
        } else {
            return ['success' => false, 'id_permesso' => $idPermesso];
        }
    }



    public static function registrazione($email, $username, $password, $type, $provincia)
    {
        $pdo = Connection::getInstance();
        $sql = 'INSERT INTO users(username, password, mail, id_permesso, area_id) 
        VALUES (:username, :password, :email, :type, :provincia)';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            ':email' => $email,
            ':username' => $username,
            ':password' => $password,
            ':type' => $type,
            ':provincia' => $provincia
        ]);

    }

    public static function logout()
    {
        self::start();
        //Distrugge la sessione per evitare che parti successive del codice
        //nello stesso script la utilizzino
        $_SESSION = [];
        //Distrugge la sessione sul server
        session_destroy();
    }

    public static function listAll(): array
    {
        try {
            $pdo = Connection::getInstance();
            $sql = 'SELECT * FROM sondaggio_acqua.users'; // Assicurati che il nome della colonna sia corretto
            $stmt = $pdo->prepare($sql);
            $stmt->execute([

            ]);
            return $stmt->fetchAll(); // Utilizza PDO::FETCH_ASSOC per ottenere solo un array associativo
        } catch (PDOException $e) {
            // Gestione degli errori, ad esempio loggare l'errore e restituire un array vuoto
            error_log("Errore durante il recupero delle spese dell'utente: " . $e->getMessage());
            return []; // Restituisce un array vuoto in caso di errore
        }
    }


    public static function getID($username)
    {
        try {
            $pdo = Connection::getInstance();  // Assicurati che Connection::getInstance() restituisca un oggetto PDO
            $sql = "SELECT id FROM users WHERE username = :username";
            $stmt = $pdo->prepare($sql);
            $stmt->execute(['username' => $username]);
            $result = $stmt->fetch();

            if ($result) {
                return (int) $result['id'];  // Cast a int per sicurezza, anche se le funzioni di fetch di PDO dovrebbero già fornire il tipo corretto.
            } else {
                return null;  // Nessun utente trovato con quel username
            }
        } catch (PDOException $e) {
            // Log dell'errore
            // In un'applicazione reale, qui si potrebbe loggare l'errore e/o mostrare un messaggio all'utente
            error_log("Errore durante la ricerca dell'ID utente: " . $e->getMessage());
            return null;  // Restituisce null in caso di errore
        }
    }


    public static function getEmail($username)
    {
        $pdo = Connection::getInstance(); // Assicurati che Connection::getInstance() restituisca un oggetto PDO

        $sql = "SELECT mail FROM users WHERE username = :username";
        $stmt = $pdo->prepare($sql);
        $stmt->execute(['username' => $username]);
        $result = $stmt->fetch();

        return $result ? $result['mail'] : null;
    }



    public static function rimuoviUtente($id)
    {
        NoteRepository::cancellaRispostebyId($id);
        $pdo = Connection::getInstance();
        $sql = 'DELETE FROM users WHERE id = :id';
        $stmt = $pdo->prepare($sql);
        $stmt->execute([':id' => $id]);
    }


}
