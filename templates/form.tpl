<!DOCTYPE html>
<html lang="en" data-theme="light">
<head>
    <meta charset="UTF-8">
    <title>Form</title>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.7.2/dist/full.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/spectre.css/dist/spectre.min.css">
    <link rel="stylesheet" href="https://unpkg.com/spectre.css/dist/spectre-exp.min.css">
    <link rel="stylesheet" href="https://unpkg.com/spectre.css/dist/spectre-icons.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <script type="module"> import preline from 'https://cdn.jsdelivr.net/npm/preline@2.1.0/+esm' </script>
</head>
<body class="bg-gray-100">
<header class="bg-white">
    <div class="mx-auto max-w-screen-xl px-4 sm:px-6 lg:px-8">
        <div class="flex h-16 items-center justify-between">
            <div class="md:flex md:items-center md:gap-12">
                <a class="block text-teal-600" href="#">
                    <span class="sr-only">Home</span>
                </a>
            </div>

            <div class="hidden md:block">
                <nav aria-label="Global">

                </nav>
            </div>
            <div class="flex items-center gap-4">
                <div class="sm:flex sm:gap-4">
                    <a
                            class=" text-white rounded-md bg-teal-600 px-5 py-2.5 text-sm font-medium text-white shadow"
                            href="lista_form_utente.php"
                    >
                        Go back
                    </a>
                </div>
            </div>

            <div class="flex items-center gap-4">
                <div class="sm:flex sm:gap-4">
                    <a
                            class=" text-white rounded-md bg-teal-600 px-5 py-2.5 text-sm font-medium text-white shadow"
                            href="index.php"
                    >
                        Logout
                    </a>
                </div>
            </div>
</header>


<div class="container bg-gray-100 grid grid-cols-1 gap-1">

    <article class="flex items-end justify-between rounded-lg border border-gray-100 bg-white p-6 mr-6 ml-6 mt-3">
        <div>
            <p class="text-sm text-gray-500">Form</p>

            <p class="text-xl font-medium text-gray-900"><?=$questions[0]['titolo']?></p>
            <p class="text-sm font-medium text-gray-900"><?=$questions[0]['descrizione']?></p>
        </div>

    </article>

    </a>
</div>

<form method="get">
    <div class="container mx-auto bg-gray-100 grid grid-cols-1 gap-1 p-4">

        <?php
     $i = 1;
     foreach ($questions as $question): ?>
        <article class="flex flex-col items-center justify-between rounded-lg border border-gray-100 bg-white p-6 w-full mx-auto">
            <div class="w-full">
                <p class="text-sm mb-4 text-gray-500">Question number <?= $i ?> - Rate from 0 to 7</p>
                <p class="text-l font-medium text-gray-900 mb-10"><?=$question['domanda']?></p>
                <div class="relative w-full mb-6">
                    <input name="question_<?= $i ?>" id="range-input-<?= $i ?>" type="range" value="4" min="0" max="7" class="w-full h-2 bg-gray-200 rounded-lg appearance-none cursor-pointer dark:bg-gray-700">
                    <span class="text-sm text-gray-500 dark:text-gray-400 absolute left-0 -bottom-6">Min (0)</span>
                    <span id="val-<?= $i ?>" class="text-sm text-gray-500 dark:text-gray-400 absolute left-1/2 transform -translate-x-1/2 -bottom-6">4</span>
                    <span class="text-sm text-gray-500 dark:text-gray-400 absolute right-0 -bottom-6">Max (7)</span>
                </div>
            </div>
        </article>
        <?php $i++; endforeach; ?>

    </div>


    <div>
        <div class=" place-content-center flex items-center justify-between rounded-lg border border-gray-100 bg-white p-6 mr-20 ml-20 mt-3">
            <button onclick="toggleModal(true)" class="w-full py-2 ml-2 shadow-sm rounded-md bg-indigo-600 text-white mt-4 flex items-center justify-center">
                Submit
            </button>
        </div>

        <div id="modal" class="fixed inset-0 w-full h-full" style="display: none;">
            <div class="fixed inset-0 w-full h-full bg-black opacity-40" onclick="toggleModal(false)"></div>

            <div class="fixed top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 px-4 w-full max-w-lg">
                <div class="bg-white rounded-md shadow-lg px-4 py-6 sm:flex">
                    <div class="flex items-center justify-center flex-none w-12 h-12 mx-auto bg-red-100 rounded-full">
                        <!-- SVG Icon -->
                        <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5 text-red-600" viewBox="0 0 20 20" fill="currentColor">
                            <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd"/>
                        </svg>
                    </div>
                    <div class="mt-2 text-center sm:ml-4 sm:text-left">
                        <h2 class="text-lg font-medium text-gray-800">Are you sure?</h2>
                        <p class="mt-2 text-sm leading-relaxed text-gray-500">
                            Ending the survey will record all the answers and, after saving, they can not be changed. Before confirming exit control all your answers
                        </p>
                        <div class="items-center gap-2 mt-3 text-sm sm:flex">
                            <a href="lista_form_utente.php"> <button onclick="toggleModal(false)" class="w-full mt-2 p-2.5 flex-1 text-white bg-red-600 rounded-md ring-offset-2 ring-red-600 focus:ring-2">
                                    Finish Test
                                </button></a>
                            <button onclick="toggleModal(false)" aria-label="Close" class="w-full mt-2 p-2.5 flex-1 text-gray-800 rounded-md border ring-offset-2 ring-indigo-600 focus:ring-2">
                                Review your answers
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
</form>






<script>
    // Seleziona tutti gli input di tipo range nella pagina
    var rangeInputs = document.querySelectorAll('input[type="range"]');

    // Per ogni input di tipo range, aggiungi un gestore eventi
    rangeInputs.forEach(function (rangeInput) {
        // Aggiungi un ascoltatore per l'evento input
        rangeInput.addEventListener('input', function () {
            // Ottieni l'ID dell'input corrente e calcola l'ID dello span di valore corrispondente
            var idNum = this.id.split('-')[2];
            var rangeValueSpan = document.getElementById('val-' + idNum);

            // Imposta il testo dello span al valore corrente del range
            rangeValueSpan.textContent = this.value;
        });

        // Trigger dell'evento input per aggiornare il valore iniziale
        rangeInput.dispatchEvent(new Event('input'));
    });



    function toggleModal(open) {
        const modal = document.getElementById('modal');
        if (open) {
            modal.style.display = 'block';
        } else {
            modal.style.display = 'none';
        }
    }


</script>

</body>
</html>
