DELIMITER //
CREATE OR REPLACE PROCEDURE E4b()
BEGIN
    SELECT t1.tara AS tara1, t2.tara AS tara2
	FROM Clase t1 
 	JOIN Clase t2 ON t1.deplasament = t2.deplasament AND t1.tip = t2.tip AND t1.clasa < t2.clasa;
END //
    
DELIMITER ;

DELIMITER //
CREATE PROCEDURE E5a()
BEGIN
    SELECT n.nume, n.clasa, n.anul_lansarii, c1.nr_arme
	FROM NAVE n
	JOIN CLASE c1 ON c1.clasa = n.clasa
	WHERE c1.nr_arme <= ALL (SELECT c2.nr_arme FROM Clase c2 WHERE c2.nr_arme is NOT NULL) AND c1.nr_arme IS NOT NULL;
END //
    
DELIMITER ;

DELIMITER //
CREATE PROCEDURE E6b()
BEGIN
    SELECT c.batalie, COUNT(DISTINCT n.clasa) AS "Numar de clase", c.rezultat
	FROM Consecinte c
 	JOIN Nave n ON c.nava = n.nume
	GROUP BY c.batalie, c.rezultat;
END //
    
DELIMITER ;