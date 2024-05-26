# Gestione-Spese
Sito Web con DataBase per la gestione delle spese di ciascun utente tramite note spese

## Progettazione
Questo progetto è stato organizzato con il supporto amminitrativo di ClickUp con suddivisione del carico di lavoro e report degli errori
(Immagine in ClickUp.png)

## Architettura

### Tecnologia Lato Server
Abbiamo utilizzato PHP per la gestione delle spese lato server e il render delle pagine.
Nello specifico abbiamo utilizzato la libreria `League/Plates` che abbiamo installato tramite `composer`
Per installare tutto il pacchetto il comando è:

```
composer require League/Plates
```
\
 Questa libreria permette il rendering di vari templates (file `.tpl`) a seconda della pagina che ci serve

 ### Autenticazione
 L'autenticazione la abbiamo gestita con delle sessioni in PHP e i dati sono abbiamo salvati in un database in cui la password non è in chiaro


## Database
Il database è di tipo SQL è formato da 3 tabelle
 * Users (`Int id, Varchar(255) username, Varchar(255) mail, Varchar(255) password`)
 * Note (`Int id, Varchar(255) descrizione, Date date, float importo, Int id_user, Int id_tipo`)
 * Tipologia(`Int id, Varchar(255) Nome, Int id_nota`)

### Diagramma ER
```
[Permessi] --- 11 --- [Users] --- 1N --- [Note] --- 11 --- [Tipologia]
```
