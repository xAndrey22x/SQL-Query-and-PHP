<html>

<head>
    <title>Exercitiul 6, subpunctul b)</title>
</head>

<body background="img2.jpg">
    <h1 style="font-family:sans-serif">
        <center>Exercitiul 6, subpunctul b)</center>
    </h1>
    <?php
    // creare variabile cu nume scurte

    // se precizează că se foloseşte PEAR DB
    require_once('PEAR.php');
    $user = 'root';
    $pass = '';
    $host = 'localhost';
    $db_name = 's10_colocviu';
    // se stabileşte şirul pentru conexiune universală sau DSN
    $dsn = new mysqli($host, $user, $pass, $db_name);
    // se verifică dacă a funcţionat conectarea
    if ($dsn->connect_error) {
        die('Eroare la conectare:' . $dsn->connect_error);
    }
    // se emite interogarea
    $query = "CALL E6b();";
    $result = mysqli_query($dsn, $query);
    if (!$result) {
        die('Interogare gresita :' . mysqli_error($dsn));
    }
    // se obţine numărul tuplelor returnate
    $num_results = mysqli_num_rows($result);
    if ($num_results == 0) {
        echo 'Nu exista rezultate conform interogarii';
        echo '<br>';
        echo '<br>';
        echo '<a href="afisare.html">
    <input type=submit value="Inapoi">
            </a>';
        exit;
    }
    // se afişează fiecare tuplă returnată
    echo '<table style="width:100%" border = 1>
  <tr>
    <th>#</th>
    <th>batalie</th>
    <th>Numar de clase</th>
    <th>rezultat</th>
  </tr>';
    for ($i = 0; $i < $num_results; $i++) {
        $row = mysqli_fetch_assoc($result);
        echo '<tr><td>' . ($i + 1) . '</td>';
        echo '<td>' . htmlspecialchars(stripslashes($row['batalie'])) . '</td>';
        echo '<td>' . stripslashes($row['Numar de clase']) . '</td>';
        echo '<td>' . stripslashes($row['rezultat']) . '</td>';
        '</tr>';

    }
    echo '</table>';
    echo '<br>';
    echo '<a href="afisare.html">
    <input type=submit value="Inapoi">
            </a>';
    // deconectarea de la BD
    mysqli_close($dsn);
    ?>
</body>

</html>