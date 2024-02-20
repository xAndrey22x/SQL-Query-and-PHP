<html>

<head>
    <title>Exercitiul 5, subpunctul b)</title>
</head>

<body background="img2.jpg">
    <h1 style="font-family:sans-serif">
        <center>Exercitiul 5, subpunctul b)</center>
    </h1>
    <?php
    // creare variabile cu nume scurte
    $vclasa = $_POST['vclasa'];
    $vclasa = trim($vclasa);
    if (!$vclasa) {
        echo 'Nu ati introdus criteriul de cautare. Va rog sa incercati din nou.';
        echo '<br>';
        echo '<br>';
        echo '<a href="afisare.html">
    <input type=submit value="Inapoi">
            </a>';
        exit;
    }
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
    $query = "SELECT c1.nava\n"

    . "FROM Consecinte c1\n"

    . " JOIN Nave n1 ON c1.nava = n1.nume\n"

    . "WHERE c1.batalie IN (SELECT c2.batalie FROM Consecinte c2 JOIN Nave n2 ON c2.nava = n2.nume WHERE n2.clasa = '" .$vclasa. "') AND n1.clasa != '" .$vclasa. "'";
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
    <th>nava</th>
  </tr>';
    for ($i = 0; $i < $num_results; $i++) {
        $row = mysqli_fetch_assoc($result);
        echo '<tr><td>' . ($i + 1) . '</td>';
        echo '<td>' . htmlspecialchars(stripslashes($row['nava'])) . '</td>';
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