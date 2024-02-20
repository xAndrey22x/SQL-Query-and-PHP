<html>

<head>
    <title>Exercitiul 3, subpunctul a)</title>
</head>

<body background="img2.jpg">
    <h1 style="font-family:sans-serif">
        <center>Exercitiul 3, subpunctul a)</center>
    </h1>
    <?php
    // creare variabile cu nume scurte
    $deplasament1 = $_POST['deplasament1'];
    $deplasament1 = trim($deplasament1);
    $deplasament2 = $_POST['deplasament2'];
    $deplasament2 = trim($deplasament2);

    if (!$deplasament1 or !$deplasament2) {
        echo 'Nu ati introdus criteriul de cautare. Va rog sa incercati din nou.';
        echo '<br>';
        echo '<br>';
        echo '<a href="afisare.html">
    <input type=submit value="Inapoi">
            </a>';
        exit;
    }

    if ($deplasament1 > $deplasament2) {
        echo 'Nu ati introdus bine deplasamentele. Va rog sa incercati din nou.';
        echo '<br>';
        echo '<br>';
        echo '<a href="afisare.html">
    <input type=submit value="Inapoi">
            </a>';
        exit;
    }
    if (!is_numeric($deplasament1) or !is_numeric($deplasament2)) {
        echo 'Nu ati introdus bine deplasamentele. Va rog sa incercati din nou.';
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
    $query = "SELECT clasa, tara, deplasament\n"

        . "FROM Clase\n"

        . "WHERE tip = 'vas de linie' AND (deplasament > '" . $deplasament1 . "' AND deplasament < '" . $deplasament2 . "')\n"

        . "ORDER BY tara DESC, deplasament ASC;";

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
    <th>clasa</th>
    <th>tara</th>
    <th>deplasament</th>
  </tr>';
    for ($i = 0; $i < $num_results; $i++) {
        $row = mysqli_fetch_assoc($result);
        echo '<tr><td>' . ($i + 1) . '</td>';
        echo '<td>' . htmlspecialchars(stripslashes($row['clasa'])) . '</td>';
        echo '<td>' . stripslashes($row['tara']) . '</td>';
        echo '<td>' . stripslashes($row['deplasament']) . '</td>';
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