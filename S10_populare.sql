

DROP TABLE Consecinte;
DROP TABLE Nave;
DROP TABLE Clase;
DROP TABLE Batalii;

-- crearea de tabele

CREATE TABLE Clase
( clasa varchar(50) NOT NULL,
  tip varchar(50) NOT NULL,
  tara varchar(50) NOT NULL,
  nr_arme int(10),
  diametru_tun double(6, 2),
  deplasament double(10, 2) NOT NULL,
  CONSTRAINT PK_Clase PRIMARY KEY (clasa)
);

CREATE TABLE Nave
( nume varchar(50) NOT NULL,
  clasa varchar(50) NOT NULL,
  anul_lansarii int(4) ,
  CONSTRAINT PK_Nave PRIMARY KEY (nume)
);

CREATE TABLE Batalii
( nume varchar(50) NOT NULL,
  data date NOT NULL,
  CONSTRAINT PK_Batalii PRIMARY KEY (nume)
);

CREATE TABLE Consecinte
( nava varchar(50) NOT NULL,
  batalie varchar(50) NOT NULL,
  rezultat varchar(50) NOT NULL,
  CONSTRAINT PK_Consecinte PRIMARY KEY (nava, batalie)
);

-- foreign key-urile

ALTER TABLE Nave 
ADD CONSTRAINT FK_Nave FOREIGN KEY(clasa) REFERENCES Clase(clasa);

ALTER TABLE Consecinte
ADD CONSTRAINT FK_nava FOREIGN KEY(nava) REFERENCES Nave(nume);

ALTER TABLE Consecinte 
ADD CONSTRAINT FK_batalie FOREIGN KEY(batalie) REFERENCES Batalii(nume);

-- constrangerile

ALTER TABLE Clase
ADD CONSTRAINT CK_tip CHECK (tip IN ('vas de linie', 'cuirasat', 'crucisator', 'distrugator'));

ALTER TABLE Consecinte
ADD CONSTRAINT CK_rezultat CHECK (rezultat IN ('scufundat', 'avariat', 'nevatamat'));

-- adaugarea de coloana locatie

ALTER TABLE Batalii
ADD locatie varchar(50);

-- 10.02
-- a)
ALTER TABLE Batalii
ADD CONSTRAINT CK_data CHECK (EXTRACT(YEAR FROM data) > 1499);

-- b)
ALTER TABLE Clase
ADD CONSTRAINT CK_conditie_arma CHECk ((nr_arme < 20 AND diametru_tun < 50) OR (nr_arme >= 20));

-- inserare valori in baza de date

INSERT INTO Clase (clasa, tip, tara, nr_arme, diametru_tun, deplasament) VALUES ('Nimitz', 'cuirasat', 'USA', 50, 35, 3500);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Nimitz', 'Nimitz', 1946);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Abraham Lincoln', 'Nimitz', 1958);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Ronald Reagan', 'Nimitz', 1989);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Roosevelt', 'Nimitz', 1939);

INSERT INTO Clase (clasa, tip, tara, nr_arme, diametru_tun, deplasament) VALUES ('Royal', 'crucisator', 'Anglia', 150, 40, 1800);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Royal', 'Royal', 1860);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Bulwark', 'Royal', 1889);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Defender', 'Royal', 1824);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Dasher', 'Royal', 1924);

INSERT INTO Clase (clasa, tip, tara, deplasament) VALUES ('Flotilla', 'vas de linie', 'Romania', 2700);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Flotilla', 'Flotilla', 1941);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Regele Ferdinand', 'Flotilla', 1999);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Regina Maria', 'Flotilla', 2003);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Viscolul', 'Flotilla', 2010);

INSERT INTO Clase (clasa, tip, tara, deplasament) VALUES ('Lorila', 'vas de linie', 'Germania', 2300);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Lorila', 'Lorila', 1915);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Mendry Candy', 'Lorila', 1924);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Heintz', 'Lorila', 1913);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Ahtun', 'Lorila', 1937);

INSERT INTO Clase (clasa, tip, tara, nr_arme, diametru_tun, deplasament) VALUES ('Vaisseaux', 'cuirasat', 'Franta', 15, 26, 1000);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Vaisseaux', 'Vaisseaux', 1550);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Saint Esprit', 'Vaisseaux', 1578);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Galion de Guise', 'Vaisseaux', 1610);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Grand Galion de Malte', 'Vaisseaux', 1670);

INSERT INTO Clase (clasa, tip, tara, nr_arme, diametru_tun, deplasament) VALUES ('Choppel', 'crucisator', 'Franta', 34, 78, 4700);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Choppel', 'Choppel', 1550);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Aquitaine', 'Choppel', 1678);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Normandie', 'Choppel', 1710);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Provence', 'Choppel', 1770);

INSERT INTO Clase (clasa, tip, tara, nr_arme, diametru_tun, deplasament) VALUES ('Sauro', 'crucisator', 'Italia', 130, 42, 1800);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Sauro', 'Sauro', 1939);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Scirè', 'Sauro', 1943);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Pietro Venuti', 'Sauro', 1937);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Romeo Romei', 'Sauro', 1944);

INSERT INTO Clase (clasa, tip, tara, nr_arme, diametru_tun, deplasament) VALUES ('Galerna', 'crucisator', 'Spania', 15, 34, 1800);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Galerna', 'Galerna', 1927);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Tramontana', 'Galerna', 1928);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Galicia', 'Galerna', 1933);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Castilla', 'Galerna', 1937);

INSERT INTO Clase (clasa, tip, tara, nr_arme, diametru_tun, deplasament) VALUES ('Kongo', 'crucisator', 'Portugalia', 118, 27, 1800);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Kongo', 'Kongo', 1961);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Vasco Da Gama', 'Kongo', 1977);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Alvarez Gabral', 'Kongo', 1942);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Corte Real', 'Kongo', 1987);

INSERT INTO Clase (clasa, tip, tara, nr_arme, diametru_tun, deplasament) VALUES ('Orion', 'crucisator', 'Suedia', 151, 43, 2000);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Orion', 'Orion', 1912);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('StockHolm', 'Orion', 1923);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Tapper', 'Orion', 1908);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Griffon', 'Orion', 1901);

INSERT INTO Clase (clasa, tip, tara, nr_arme, diametru_tun, deplasament) VALUES ('Skjold', 'distrugator', 'Norvegia', 130, 42, 1800);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Skjold', 'Skjold', 1935);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Storm', 'Skjold', 1945);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Skudd', 'Skjold', 1955);
INSERT INTO Nave (nume, clasa, anul_lansarii) VALUES('Steil', 'Skjold', 1965);

INSERT INTO Batalii(nume, data, locatie) VALUES('Falklands War', str_to_date('20/08/1960', '%d/%m/%y'), 'Santa FE');
INSERT INTO Batalii(nume, data, locatie) VALUES('Battle of Chaul', str_to_date('13/04/1508', '%d/%m/%y'), 'Chaul');
INSERT INTO Batalii(nume, data, locatie) VALUES('French Revolutionary', str_to_date('26/11/1793', '%d/%m/%y'), 'Franta');
INSERT INTO Batalii(nume, data, locatie) VALUES('Russo-Swedish War', str_to_date('05/02/1733', '%d/%m/%y'), 'Suedia');
INSERT INTO Batalii(nume, data, locatie) VALUES('American War', str_to_date('24/09/1811', '%d/%m/%y'), 'North America');
INSERT INTO Batalii(nume, data, locatie) VALUES('Black Sea raid', str_to_date('29/07/1918', '%d/%m/%y'), 'Marea Neagra');
INSERT INTO Batalii(nume, data, locatie) VALUES('World War II', str_to_date('25/12/1941', '%d/%m/%y'), 'Anglia');
INSERT INTO Batalii(nume, data, locatie) VALUES('World War I', str_to_date('09/01/1916', '%d/%m/%y'), 'Kirpen Island');
INSERT INTO Batalii(nume, data, locatie) VALUES('Operation Pedestal', str_to_date('14/06/1945', '%d/%m/%y'), 'Malta');
INSERT INTO Batalii(nume, data, locatie) VALUES('Cassablanca', str_to_date('11/05/1943', '%d/%m/%y'), 'Franta');
INSERT INTO Batalii(nume, data, locatie) VALUES('Capul Sarici', str_to_date('17/11/1914', '%d/%m/%y'), 'Marea Neagra');
INSERT INTO Batalii(nume, data, locatie) VALUES('Kongo War', str_to_date('12/05/1978', '%d/%m/%y'), 'Kongo Sea');
INSERT INTO Batalii(nume, data, locatie) VALUES('Polo War', str_to_date('15/02/1980', '%d/%m/%y'), 'Pacific');

INSERT INTO Consecinte(nava, batalie, rezultat) VALUES('Abraham Lincoln', 'Falklands War', 'nevatamat');
INSERT INTO Consecinte(nava, batalie, rezultat) VALUES('Dasher', 'World War II', 'avariat');
INSERT INTO Consecinte(nava, batalie, rezultat) VALUES('Flotilla', 'World War II', 'scufundat');
INSERT INTO Consecinte(nava, batalie, rezultat) VALUES('Galion de Guise', 'Russo-Swedish War', 'nevatamat');
INSERT INTO Consecinte(nava, batalie, rezultat) VALUES('Roosevelt', 'Cassablanca', 'avariat');
INSERT INTO Consecinte(nava, batalie, rezultat) VALUES('Bulwark', 'Capul Sarici', 'avariat');
INSERT INTO Consecinte(nava, batalie, rezultat) VALUES('Heintz', 'Capul Sarici', 'nevatamat');
INSERT INTO Consecinte(nava, batalie, rezultat) VALUES('Royal', 'Capul Sarici', 'avariat');
INSERT INTO Consecinte(nava, batalie, rezultat) VALUES('Tapper', 'Capul Sarici', 'avariat');
INSERT INTO Consecinte(nava, batalie, rezultat) VALUES('Galicia', 'Capul Sarici', 'scufundat');
INSERT INTO Consecinte(nava, batalie, rezultat) VALUES('Grand Galion de Malte', 'Capul Sarici', 'avariat');
INSERT INTO Consecinte(nava, batalie, rezultat) VALUES('Kongo', 'Kongo War', 'avariat');
INSERT INTO Consecinte(nava, batalie, rezultat) VALUES('Vasco Da Gama', 'Kongo War', 'nevatamat');
INSERT INTO Consecinte(nava, batalie, rezultat) VALUES('Alvarez Gabral', 'Cassablanca', 'scufundat');
INSERT INTO Consecinte(nava, batalie, rezultat) VALUES('Scirè', 'Kongo War', 'nevatamat');
INSERT INTO Consecinte(nava, batalie, rezultat) VALUES('Castilla', 'Kongo War', 'avariat');
INSERT INTO Consecinte(nava, batalie, rezultat) VALUES('Kongo', 'Polo War', 'nevatamat');

