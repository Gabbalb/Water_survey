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


    <style>

        img {
            margin: 0 auto;
            max-width: 100%;
            max-height: 100%;
        }
    </style>

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



<div class="container mx-auto bg-gray-100 grid grid-cols-1 gap-1 p-4">

    <?php
     $i = 1;
     foreach ($questions as $question): ?>
    <article class="flex flex-col items-center justify-between rounded-lg border border-gray-100 bg-white p-6 w-full mx-auto">
        <div class="w-full">
            <p class="text-sm mb-4 text-gray-500">Question number <?= $i ?></p>
            <p class="text-l font-medium text-gray-900 mb-10"><?=$question['domanda']?></p>

            <p class="text-sm mb-4 text-gray-800">Your answer: <?=$answers[$i - 1]['valore']?></p>


        </div>
    </article>
    <?php $i++; endforeach; ?>

</div>


</body>
</html>
