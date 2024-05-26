<!doctype html>
<html lang="en" data-theme="light">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Dashboard</title>


    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.10.2/dist/full.min.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.tailwindcss.com"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
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
        }
        .table-wrapper {
            margin-top: 20px;
        }
        .btn-add-row {
            position: fixed;
            right: 20px;
            bottom: 20px;
            cursor: pointer;
            z-index: 1000; /* ensures the button stays on top of other content */
        }

    </style>
</head>
<body class="bg-gray-100">
<div class="navbar">
    <div class="title">
        <h1>Nota Spese Dashboard</h1>
    </div>
    <div class="profile">
        <h3>Ciao <?=$username?></h3>
        <a href="index.php?action=logout">
            <button class="btn btn-action tooltip tooltip-bottom" data-tooltip="Logout">

                <i class="icon icon-share"></i>

            </button></a>
    </div>
</div>

<section class="bg-gray-100 ">
    <div class="mx-auto max-w-screen-xl px-4 py-12 sm:px-6 md:py-16 lg:px-8">
        <div class="mx-auto max-w-3xl text-center">
            <h2 class="text-3xl font-bold text-gray-900 sm:text-4xl">Una dashboard tutta per te...</h2>

            <p class="mt-4 text-gray-500 sm:text-xl">
                Le spese dei tuoi dipendenti stanno andando così
            </p>
        </div>

        <div class="mt-8 sm:mt-12" id="stats">
            <dl class="grid grid-cols-1 gap-4 sm:grid-cols-3">
                <div class="flex flex-col rounded-lg bg-blue-50 px-4 py-8 text-center">
                    <dt class="order-last text-lg font-medium text-gray-500">Utenti</dt>

                    <dd class="text-4xl font-extrabold text-blue-600 md:text-5xl">
                        <?= $nusers ?>
                    </dd>
                </div>

                <div class="flex flex-col rounded-lg bg-blue-50 px-4 py-8 text-center">
                    <dt class="order-last text-lg font-medium text-gray-500">Form Creati</dt>

                    <dd class="text-4xl font-extrabold text-blue-600 md:text-5xl"><?= $nform ?></dd>
                </div>

                <div class="flex flex-col rounded-lg bg-blue-50 px-4 py-8 text-center">
                    <dt class="order-last text-lg font-medium text-gray-500">Risposte Ricevute</dt>

                    <dd class="text-4xl font-extrabold text-blue-600 md:text-5xl"><?= $nansw ?></dd>
                </div>
            </dl>
        </div>
    </div>
</section>
<section class="container bg-gray-100 grid grid-cols-3  gap-4">

    <!-- spese degli utenti -->
    <a href="registrazione.php"><article class="rounded-lg border border-gray-100 bg-white p-6">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-sm text-gray-500">Aggiungi</p>

                    <p class="text-2xl font-medium text-gray-900">Nuovo Utente</p>
                </div>

                <span class="rounded-full bg-blue-100 p-3 text-blue-600">
      <svg
              xmlns="http://www.w3.org/2000/svg"
              class="h-8 w-8"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
              stroke-width="2"
      >
        <path
                stroke-linecap="round"
                stroke-linejoin="round"
                d="M20 18L14 18M17 15V21M4 21C4 17.134 7.13401 14 11 14C11.695 14 12.3663 14.1013 13 14.2899M15 7C15 9.20914 13.2091 11 11 11C8.79086 11 7 9.20914 7 7C7 4.79086 8.79086 3 11 3C13.2091 3 15 4.79086 15 7Z"
        />
      </svg>
    </span>
            </div>
        </article></a> <!--NUOVO UTENTE-->

    <a href="visualizza.php?query=1"><article class="rounded-lg border border-gray-100 bg-white p-6">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-sm text-gray-500">Visualizza</p>

                    <p class="text-2xl font-medium text-gray-900">Utenti</p>
                </div>

                <span class="rounded-full bg-blue-100 p-3 text-blue-600">
      <svg
              xmlns="http://www.w3.org/2000/svg"
              class="h-8 w-8"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
              stroke-width="2"
      >
        <path
                stroke-linecap="round"
                stroke-linejoin="round"
                d="M12 14C8.13401 14 5 17.134 5 21H19C19 17.134 15.866 14 12 14Z"
        ></path>
          <path
                  stroke-linecap="round"
                  stroke-linejoin="round"

                  d="M16 7C16 9.20914 14.2091 11 12 11C9.79086 11 8 9.20914 8 7C8 4.79086 9.79086 3 12 3C14.2091 3 16 4.79086 16 7Z"></path>
          <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M12 14C8.13401 14 5 17.134 5 21H19C19 17.134 15.866 14 12 14Z" ></path>
    </span>
            </div>

        </article></a> <!--VISUALIZZA UTENTI-->

    <a href="visualizza.php?query=2"><article class="rounded-lg border border-gray-100 bg-white p-6">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-sm text-gray-500">Visualizza</p>

                    <p class="text-2xl font-medium text-gray-900">Risposte</p>
                </div>

                <span class="rounded-full bg-blue-100 p-3 text-blue-600">
      <svg
              xmlns="http://www.w3.org/2000/svg"
              class="h-8 w-8"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
              stroke-width="2"
      >
        <path
                stroke-linecap="round"
                stroke-linejoin="round"
                d="M3 9V19.4C3 19.9601 3 20.2399 3.10899 20.4538C3.20487 20.642 3.35774 20.7952 3.5459 20.8911C3.7596 21 4.0395 21 4.59846 21H15.0001M17 8L13 12L11 10M7 13.8002V6.2002C7 5.08009 7 4.51962 7.21799 4.0918C7.40973 3.71547 7.71547 3.40973 8.0918 3.21799C8.51962 3 9.08009 3 10.2002 3H17.8002C18.9203 3 19.4801 3 19.9079 3.21799C20.2842 3.40973 20.5905 3.71547 20.7822 4.0918C21.0002 4.51962 21.0002 5.07969 21.0002 6.19978L21.0002 13.7998C21.0002 14.9199 21.0002 15.48 20.7822 15.9078C20.5905 16.2841 20.2842 16.5905 19.9079 16.7822C19.4805 17 18.9215 17 17.8036 17H10.1969C9.07899 17 8.5192 17 8.0918 16.7822C7.71547 16.5905 7.40973 16.2842 7.21799 15.9079C7 15.4801 7 14.9203 7 13.8002Z"    </span>
            </div>

        </article></a> <!--VISUALIZZA FORM-->

    <a href="visualizza.php?query=2"><article class="rounded-lg border border-gray-100 bg-white p-6">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-sm text-gray-500">Crea</p>

                    <p class="text-2xl font-medium text-gray-900">Form</p>
                </div>

                <span class="rounded-full bg-blue-100 p-3 text-blue-600">
      <svg
              xmlns="http://www.w3.org/2000/svg"
              class="h-8 w-8"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
              stroke-width="2"
      >
        <path
                stroke-linecap="round"
                stroke-linejoin="round"

                d="M20.1498 7.93997L8.27978 19.81C7.21978 20.88 4.04977 21.3699 3.32977 20.6599C2.60977 19.9499 3.11978 16.78 4.17978 15.71L16.0498 3.84C16.5979 3.31801 17.3283 3.03097 18.0851 3.04019C18.842 3.04942 19.5652 3.35418 20.1004 3.88938C20.6356 4.42457 20.9403 5.14781 20.9496 5.90463C20.9588 6.66146 20.6718 7.39189 20.1498 7.93997V7.93997Z"

            </div>

        </article></a> <!--CREA FORM-->

    <a href="visualizza.php?query=2"><article class="rounded-lg border border-gray-100 bg-white p-6">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-sm text-gray-500">Crea</p>

                    <p class="text-2xl font-medium text-gray-900">Domanda</p>
                </div>

                <span class="rounded-full bg-blue-100 p-3 text-blue-600">
      <svg
              xmlns="http://www.w3.org/2000/svg"
              class="h-8 w-8"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
              stroke-width="2"
      >
        <path
                stroke-linecap="round"
                stroke-linejoin="round"
                d="M3 9V19.4C3 19.9601 3 20.2399 3.10899 20.4538C3.20487 20.642 3.35774 20.7952 3.5459 20.8911C3.7596 21 4.0395 21 4.59846 21H15.0001M17 8L13 12L11 10M7 13.8002V6.2002C7 5.08009 7 4.51962 7.21799 4.0918C7.40973 3.71547 7.71547 3.40973 8.0918 3.21799C8.51962 3 9.08009 3 10.2002 3H17.8002C18.9203 3 19.4801 3 19.9079 3.21799C20.2842 3.40973 20.5905 3.71547 20.7822 4.0918C21.0002 4.51962 21.0002 5.07969 21.0002 6.19978L21.0002 13.7998C21.0002 14.9199 21.0002 15.48 20.7822 15.9078C20.5905 16.2841 20.2842 16.5905 19.9079 16.7822C19.4805 17 18.9215 17 17.8036 17H10.1969C9.07899 17 8.5192 17 8.0918 16.7822C7.71547 16.5905 7.40973 16.2842 7.21799 15.9079C7 15.4801 7 14.9203 7 13.8002Z"    </span>
            </div>

        </article></a> <!--VISUALIZZA FORM-->

    <a href="visualizza.php?query=2"><article class="rounded-lg border border-gray-100 bg-white p-6">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-sm text-gray-500">Visualizza</p>

                    <p class="text-2xl font-medium text-gray-900">Domande</p>
                </div>

                <span class="rounded-full bg-blue-100 p-3 text-blue-600">
      <svg
              xmlns="http://www.w3.org/2000/svg"
              class="h-8 w-8"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
              stroke-width="2"
      >
        <path
                stroke-linecap="round"
                stroke-linejoin="round"
                d="M3 9V19.4C3 19.9601 3 20.2399 3.10899 20.4538C3.20487 20.642 3.35774 20.7952 3.5459 20.8911C3.7596 21 4.0395 21 4.59846 21H15.0001M17 8L13 12L11 10M7 13.8002V6.2002C7 5.08009 7 4.51962 7.21799 4.0918C7.40973 3.71547 7.71547 3.40973 8.0918 3.21799C8.51962 3 9.08009 3 10.2002 3H17.8002C18.9203 3 19.4801 3 19.9079 3.21799C20.2842 3.40973 20.5905 3.71547 20.7822 4.0918C21.0002 4.51962 21.0002 5.07969 21.0002 6.19978L21.0002 13.7998C21.0002 14.9199 21.0002 15.48 20.7822 15.9078C20.5905 16.2841 20.2842 16.5905 19.9079 16.7822C19.4805 17 18.9215 17 17.8036 17H10.1969C9.07899 17 8.5192 17 8.0918 16.7822C7.71547 16.5905 7.40973 16.2842 7.21799 15.9079C7 15.4801 7 14.9203 7 13.8002Z"    </span>
            </div>

        </article></a> <!--VISUALIZZA FORM-->

</section>



</body>
</html>