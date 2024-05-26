<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <link rel="stylesheet" href="https://unpkg.com/spectre.css/dist/spectre.min.css">
    <link rel="stylesheet" href="https://unpkg.com/spectre.css/dist/spectre-exp.min.css">
    <link rel="stylesheet" href="https://unpkg.com/spectre.css/dist/spectre-icons.min.css">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #f5f5f5;
            padding: 10px 20px;
        }
        .navbar h1 {
            margin: 0;
            font-size: 24px;
        }
        .profile {
            display: flex;
            align-items: center;
        }
        .profile h3 {
            margin-right: 20px;
            font-size: 18px;
            color: #333;
        }
        .container {
            padding: 20px;
            display: flex;
        }

        .singolo_form{
            border: black 2px solid;
            height: 150px;
            width: 150px;
            margin-left: 15px;
            border-radius: 7px;
            position: relative;
        }
        .singolo_form:hover{
            border: black 4px solid;
            height: 150px;
            width: 150px;
            margin-left: 15px;
            border-radius: 7px;
            position: relative;
        }
        .titolo {
            position: absolute; /* Per posizionare il titolo all'interno del div */
            bottom: 0; /* Per posizionare il titolo in basso */
            left: 0; /* Per posizionare il titolo a sinistra (puoi modificarlo in base alle tue esigenze) */
            width: 100%; /* Per estendere il titolo su tutta la larghezza del div */
            text-align: center; /* Per centrare il testo orizzontalmente */
            margin-bottom: 10px; /* Per aggiungere un margine inferiore */
        }

    </style>
</head>
<body>
<div class="navbar">
    <div class="title">
        <h1>Nota Spese</h1>
    </div>
    <div class="profile">
        <h3>Ciao <?=$username?></h3>
        <button class="btn btn-action tooltip tooltip-bottom" data-tooltip="Logout">
            <a href="success.php?action=logout">
                <i class="icon icon-share"></i>
            </a>
        </button>
    </div>
</div>




<h3>Form non completati:</h3>
<div class="container">


            <?php
        for ($i = 0; $i < 3; $i++) {
            echo '<div class="singolo_form">
            <a href="form.php?id=' . $i . '" class="titolo">Titolo</a>
        </div>';
        }
        ?>

</div>

<h3>Form completati:</h3>
<div class="container">



</div>

</body>
</html>
