<?php

namespace Model;
use Util\Connection;

class NoteRepository
{

    public static function getQuestions() {
        $pdo = Connection::getInstance();
        $sql = "SELECT domanda, id_form FROM domande";
        $stmt = $pdo -> query($sql);
        return $stmt -> fetchAll();
    }
    public static function getForms() {
        $pdo = Connection::getInstance();
        $sql = "SELECT id, titolo FROM form";
        $stmt = $pdo -> query($sql);
        return $stmt -> fetchAll();
    }

    public static function creaForm($title, $desc) {
        $pdo = Connection::getInstance();
        $stmt = $pdo -> prepare('INSERT INTO form (titolo, descrizione) VALUES (:titolo, :descrizione)');
        $stmt -> execute([
            'titolo' => $title,
            'descrizione' => $desc,
        ]);
    }

    public static function creaDomanda($question, $id_form) {
        $pdo = Connection::getInstance();
        $sql = "INSERT INTO domande (id_form, domanda) VALUES (:id_form, :domanda)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            'id_form' => $id_form,
            'domanda' => $question,
        ]);
    }
    public static function salvaRisposte($userId, $formId, $questions, $risposte) {
        $pdo = Connection::getInstance();
        $stmt = $pdo->prepare('INSERT INTO risposte (valore, id_utente, id_form, id_domanda) VALUES (:valore, :id_utente, :id_form, :id_domanda)');
        foreach ($questions as $index => $question) {
            $stmt->execute([
                'valore' => $risposte[$index + 1],
                'id_utente' => $userId,
                'id_form' => $formId,
                'id_domanda' => $index + 1,
            ]);
        }
    }

    public static function listAnswersByForm($userId, $formId): array {
        $pdo = Connection::getInstance();
        $stmt = $pdo -> prepare('
        SELECT id_domanda, valore FROM risposte
WHERE id_utente = :id_utente AND id_form = :id_form');
        $stmt -> execute([
            'id_utente' => $userId,
            'id_form' => $formId,
        ]);
        return $stmt -> fetchAll();
    }

    public static function listAll($id): array
    {
        try {
            $pdo = Connection::getInstance();
            $sql = 'SELECT * FROM risposte WHERE id_utente = :id_user'; // Assicurati che il nome della colonna sia corretto
            $stmt = $pdo->prepare($sql);
            $stmt->execute(['id_user' => $id]);
            return $stmt->fetchAll(); // Utilizza PDO::FETCH_ASSOC per ottenere solo un array associativo
        } catch (PDOException $e) {
            // Gestione degli errori, ad esempio loggare l'errore e restituire un array vuoto
            error_log("Errore durante il recupero delle spese dell'utente: " . $e->getMessage());
            return []; // Restituisce un array vuoto in caso di errore
        }
    }

    //prende le domande da un form identificato dall'id
    public static function listQuestionByForm($id)
    {
        try {
            $pdo = Connection::getInstance();
            $sql = 'SELECT domanda, titolo, descrizione FROM domande, form WHERE id_form = form.id
AND id_form = :id';
            $stmt = $pdo->prepare($sql);
            $stmt->execute(['id' => $id]);
            return $stmt->fetchAll();
        } catch (PDOException $e) {
            error_log("Errore durante il recupero delle spese dell'utente: " . $e->getMessage());
            return [];
        }
    }





    //ricava i form identificati dall'id non completati dall'utente

    public static function listFormNotCompleted($id_utente)
    {
        try {
            $pdo = Connection::getInstance();
            $sql = 'SELECT DISTINCT form.id, form.titolo, form.descrizione 
                FROM form 
                LEFT JOIN domande ON form.id = domande.id_form 
                WHERE form.id NOT IN (
                    SELECT id_form FROM risposte WHERE id_utente = :id_utente
                )';

            $stmt = $pdo->prepare($sql);
            $stmt->execute(['id_utente' => $id_utente]);
            return $stmt->fetchAll();
        } catch (PDOException $e) {
            error_log("Errore durante il recupero delle spese dell'utente: " . $e->getMessage());
            return [];
        }
    }




    //ricava i form completati dall'utente identificato dall'id

    public static function listFormCompleted($id_utente)
    {
        try {
            $pdo = Connection::getInstance();
            $sql = 'SELECT f.id, f.titolo, f.descrizione
                FROM form f
                JOIN risposte r ON f.id = r.id_form
                WHERE r.id_utente = :id_utente
                GROUP BY f.id, f.titolo, f.descrizione;';

            $stmt = $pdo->prepare($sql);
            $stmt->execute(['id_utente' => $id_utente]);
            return $stmt->fetchAll();
        } catch (PDOException $e) {
            error_log("Errore durante il recupero delle spese dell'utente: " . $e->getMessage());
            return [];
        }
    }


    public static function query1()
    {
        $pdo = Connection::getInstance();
        $sql = 'SELECT id, username, mail, id_permesso FROM users;';
        $result = $pdo->query($sql);
        return $result->fetchAll();
    }

    public static function query2(){
        $pdo = Connection::getInstance();
        $sql = 'SELECT * FROM form';
        $result = $pdo->query($sql);
        return $result->fetchAll();
    }

    public static function query3(){
        $pdo = Connection::getInstance();
        $sql = 'SELECT * FROM risposte';
        $result = $pdo->query($sql);
        return $result->fetchAll();
    }

    public static function nusers() {
        $pdo = Connection::getInstance();
        $sql = 'SELECT COUNT(*) AS count FROM users';
        $result = $pdo->query($sql);
        return $result->fetchColumn();
    }

    public static function nform() {
        $pdo = Connection::getInstance();
        $sql = 'SELECT COUNT(*) AS countform FROM form';
        $result = $pdo->query($sql);
        return $result->fetchColumn();
    }

    public static function nrisposte() {
        $pdo = Connection::getInstance();
        $sql = 'SELECT COUNT(*) AS countansw FROM risposte';
        $result = $pdo->query($sql);
        return $result->fetchColumn();
    }

    public static function cancellaRispostebyId($id_utente){
        try {
            $pdo = Connection::getInstance();

            // Verifica se l'utente con l'ID fornito ha delle spese nel database
            $sql = 'DELETE FROM risposte WHERE Id_utente = :id_utente';
            $stmt = $pdo->prepare($sql);
            $stmt->execute(['id_utente' => $id_utente]);
            $spese = $stmt->fetchAll();

            if (!$spese) {
                // Se l'utente non ha spese, ritorna un array vuoto
                return [];
            }

            return $spese;
        } catch (PDOException $e) {
            // Gestione degli errori di PDO
            error_log("Errore durante l'esecuzione della query: " . $e->getMessage());
            throw new Exception("Errore durante l'esecuzione della query.");
        } catch (Exception $e) {
            // Gestione degli altri tipi di errori
            error_log("Errore: " . $e->getMessage());
            throw $e;
        }
    }

    public static function getProvince(){
        $pdo = Connection::getInstance();
        $sql = 'SELECT id, nome_province AS province FROM province';
        $result = $pdo->query($sql);
        return $result->fetchAll();
    }


    public static function eliminaform($id)
    {
        $pdo = Connection::getInstance();

        try {
            $pdo = Connection::getInstance();

            // Begin a transaction to ensure data integrity
            $pdo->beginTransaction();

            // Delete related records in the `domande` table
            $sqlDeleteDomande = 'DELETE FROM domande WHERE id_form = :id';
            $stmtDeleteDomande = $pdo->prepare($sqlDeleteDomande);
            $stmtDeleteDomande->execute(['id' => $id]);

            // Delete the form record in the `form` table
            $sqlDeleteForm = 'DELETE FROM form WHERE id = :id';
            $stmtDeleteForm = $pdo->prepare($sqlDeleteForm);
            $stmtDeleteForm->execute(['id' => $id]);

            // Commit the transaction
            $pdo->commit();

            return true;
        } catch (PDOException $e) {
            // Rollback the transaction if something failed
            $pdo->rollBack();
            error_log("Errore durante l'eliminazione del form: " . $e->getMessage());
            return false;
        }
    }



}