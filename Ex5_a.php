<html>

<head>
    <title>Exercitiul 5, subpunctul a)</title>
</head>

<body background="img2.jpg">
    <h1 style="font-family:sans-serif">
        <center>Exercitiul 5, subpunctul a)</center>
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
    $query = "CALL E5a();";
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
    <th>nume</th>
    <th>clasa</th>
    <th>anul_lansarii</th>
    <th>nr_arme</th>
  </tr>';
    for ($i = 0; $i < $num_results; $i++) {
        $row = mysqli_fetch_assoc($result);
        echo '<tr><td>' . ($i + 1) . '</td>';
        echo '<td>' . htmlspecialchars(stripslashes($row['nume'])) . '</td>';
        echo '<td>' . stripslashes($row['clasa']) . '</td>';
        echo '<td>' . stripslashes($row['anul_lansarii']) . '</td>';
        echo '<td>' . stripslashes($row['nr_arme']) . '</td>';
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