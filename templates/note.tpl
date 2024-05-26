<!DOCTYPE html>
<html lang="en" data-theme="light">
<head>
    <meta charset="UTF-8">
    <title>Nota Spese</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.7.2/dist/full.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/spectre.css/dist/spectre.min.css">
    <link rel="stylesheet" href="https://unpkg.com/spectre.css/dist/spectre-exp.min.css">
    <link rel="stylesheet" href="https://unpkg.com/spectre.css/dist/spectre-icons.min.css">

</head>
<body class="bg-gray-100">
<header class="bg-white">
    <div class="mx-auto flex h-16 max-w-screen-xl items-center gap-8 px-4 sm:px-6 lg:px-8">
        <h1 class="text-2xl font-bold">Nota spese</h1>

        <div class="flex flex-1 items-center justify-end md:justify-between">
            <nav aria-label="Global" class="hidden md:block">

            </nav>

            <div class="flex items-center gap-4">
                <a href="visualizza.php?action=back" class="flex items-center justify-center w-8 h-8 text-white bg-blue-500 rounded hover:bg-blue-600">
                    <button class="text-white"><i class="fa fa-arrow-left"></i></button>
                </a>
                <a href="index.php?action=logout" class="flex items-center justify-center w-8 h-8 text-white bg-blue-500 rounded hover:bg-blue-600">
                    <button class="text-white"><i class="icon icon-share"></i></button>
                </a>
            </div>
        </div>
    </div>
</header>

<div class="p-6  max-w-screen-xl mx-auto px-4 md:px-8">
    <div class="max-w-lg">
        <h3 class="text-gray-800 text-xl font-bold sm:text-2xl">

        </h3>
        <p class="text-gray-600 mt-2">

        </p>
    </div>
    <div class="mt-12 shadow-sm border rounded-lg overflow-x-auto">
        <table class="w-full table-auto text-sm text-left">
            <thead class="bg-gray-50 text-gray-600 font-medium border-b">
            <tr>
                <?php foreach ($headers as $head): ?>
                <th class="py-3 px-6"><?= $head ?></th>
                <?php endforeach; ?>
            </tr>
            </thead>
            <tbody class="text-gray-600 divide-y">
            <?php foreach ($results as $result): ?>
            <tr>
                <?php for ($i = 0; $i < sizeof($result) / 2; $i++): ?>
                <td class="px-6 py-4 whitespace-nowrap"><?= $result[$i] ?></td>
                <?php endfor; ?>
            </tr>
            <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>