<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>List forms</title>
    <script src="https://cdn.tailwindcss.com"></script>

    <link rel="stylesheet" href="https://unpkg.com/spectre.css/dist/spectre.min.css">
    <link rel="stylesheet" href="https://unpkg.com/spectre.css/dist/spectre-exp.min.css">
    <link rel="stylesheet" href="https://unpkg.com/spectre.css/dist/spectre-icons.min.css">
    <style>
        .container .badge {
            position: absolute;
            top: 1.5rem; /* Modifica secondo le tue necessità */
            right: 1.5rem; /* Modifica secondo le tue necessità */
        }
    </style>
</head>
<body class="bg-gray-100">

<header class="text-base lg:text-sm">
    <div class="bg-white items-center gap-x-14 px-4 max-w-screen-xl mx-auto lg:flex lg:px-8">
        <div class="flex items-center justify-between py-3 lg:py-5">
            <a href="#">
                <svg viewBox="0 0 1024 1024" class="icon h-8 w-8" version="1.1" xmlns="http://www.w3.org/2000/svg" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"><path d="M768 85.333333H554.666667c0 23.466667-19.2 42.666667-42.666667 42.666667s-42.666667-19.2-42.666667-42.666667H256C209.066667 85.333333 170.666667 123.733333 170.666667 170.666667v682.666666c0 46.933333 38.4 85.333333 85.333333 85.333334h512c46.933333 0 85.333333-38.4 85.333333-85.333334V170.666667c0-46.933333-38.4-85.333333-85.333333-85.333334z" fill="#455A64"></path><path d="M768 874.666667H256c-12.8 0-21.333333-8.533333-21.333333-21.333334V170.666667c0-12.8 8.533333-21.333333 21.333333-21.333334h512c12.8 0 21.333333 8.533333 21.333333 21.333334v682.666666c0 12.8-8.533333 21.333333-21.333333 21.333334z" fill="#FFFFFF"></path><path d="M554.666667 85.333333c0 23.466667-19.2 42.666667-42.666667 42.666667s-42.666667-19.2-42.666667-42.666667h-149.333333v85.333334c0 23.466667 19.2 42.666667 42.666667 42.666666h298.666666c23.466667 0 42.666667-19.2 42.666667-42.666666V85.333333h-149.333333z" fill="#90A4AE"></path><path d="M512 0c-46.933333 0-85.333333 38.4-85.333333 85.333333s38.4 85.333333 85.333333 85.333334 85.333333-38.4 85.333333-85.333334-38.4-85.333333-85.333333-85.333333z m0 128c-23.466667 0-42.666667-19.2-42.666667-42.666667s19.2-42.666667 42.666667-42.666666 42.666667 19.2 42.666667 42.666666-19.2 42.666667-42.666667 42.666667z" fill="#90A4AE"></path><path d="M448 426.666667h256v42.666666H448zM320 405.333333h85.333333v85.333334h-85.333333z" fill="#CFD8DC"></path><path d="M448 618.666667h256v42.666666H448zM320 597.333333h85.333333v85.333334h-85.333333z" fill="#03A9F4"></path></g></svg>
            </a>

        </div>
        <nav class="nav-menu flex-1 overflow-y-auto max-h-screen lg:block">
            <ul class="items-center space-y-6 lg:flex lg:space-x-6 lg:space-y-0">
                <li>
                    <div class="flex items-center gap-1 px-2 border rounded-lg">
                        <input type="text" placeholder="Search" class="w-full px-2 py-2 text-gray-500 bg-transparent rounded-md outline-none">
                    </div>
                </li>
                <li><a href="#" class="block text-gray-700 hover:text-gray-900">Home</a></li>
                <li><a href="index.php" class="block text-gray-700 hover:text-gray-900">Logout</a></li>
                <li><a href="#" class="block text-gray-700 hover:text-gray-900">Support</a></li>
                <!-- Avatar and dropdown menu -->
            </ul>
        </nav>
    </div>
    <nav class="border-b">
        <ul class="flex items-center gap-x-3 max-w-screen-xl mx-auto px-4 overflow-x-auto lg:px-8">
            <li class="py-1 border-b-2 border-indigo-600">
                <a href="#" class="block py-2 px-3 rounded-lg text-gray-700 hover:text-gray-900 hover:bg-gray-100">Overview</a>
            </li>
        </ul>
    </nav>
</header>

<div class="container bg-gray-100 grid grid-cols-1 gap-1">
    <?php

    foreach ($non_completati as $form) {
    echo '<a href="form.php?id=' . $form['id'] . '" class="titolo">
    <article class="relative flex items-end justify-between rounded-lg border border-gray-100 bg-white p-6 mr-6 ml-6 mt-3">
        <div>
            <p class="text-xl font-medium text-gray-900">' . $form['titolo'] . '</p>
            <p class="text-sm text-gray-500"> ' . $form['descrizione'] . ' </p>
        </div>
        <div class="badge absolute top-6 right-6 inline-flex gap-2 rounded-full pl-1.5 pr-1.5 bg-red-100 text-red-600">
            <span class="text-xs font-medium">  Not completed  </span>
        </div>
    </article>
    </a>';
    }
    ?>
</div>








<span class="flex items-center bg-gray-100 mt-4 mb-4">
  <span class="h-px flex-1 bg-black"></span>
  <span class="shrink-0 px-6">Form Completed</span>
  <span class="h-px flex-1 bg-black"></span>
</span>


<div class="container bg-gray-100 grid grid-cols-1 gap-1">

    <?php

        foreach ($completati as $form) {
    echo '<a href="review.php?id=' . $form['id'] . '" class="titolo">

    <article class="relative flex items-end justify-between rounded-lg border border-gray-100 bg-white p-6 mr-6 ml-6 mt-3">
        <div>
            <p class="text-xl font-medium text-gray-900">' . $form['titolo'] . '</p>
            <p class="text-sm text-gray-500"> ' . $form['descrizione'] . ' </p>
        </div>
        <div class="badge absolute top-6 right-6 inline-flex gap-2 rounded-full pl-1.5 pr-1.5 bg-green-100 text-green-600">
            <span class="text-xs font-medium">  Completed  </span>
        </div>
    </article>

    </a>';
    }
    ?>
</div>



</body>
</html>
