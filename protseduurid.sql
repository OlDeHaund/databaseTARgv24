-- SQL SALVESTATUS PROTSEDUURID -- Funktsioonid - mitu SQL kasku kaivitatakse jarjest 
--SQL SERVER --
Create database procTARgv24

USE procTARgv24
CREATE TABLE uudised(
uudisID int PRIMARY KEY identity(1,1),
uudiseTeema varchar(50),
kuupaev date,
autor varchar(25),
kirjeldus text
)
Select * from uudised
INSERT INTO uudised(uudiseTeema, kuupaev, autor, kirjeldus)
Values(
'Udune ilm', '2025-02-06', 'postimees', 'Lounani oodatakse udune ilm')
--protseduuri loomine
--sisestab uudised tabelisse ja kohe naitab
CREATE PROCEDURE lisaUudis
@uusTeema varchar(50),
@Paev date,
@Autor varchar(20),
@kirjeldus text
AS
Begin
INSERT INTO uudised(uudiseTeema, kuupaev, autor, kirjeldus)
Values(
@uusTeema, @Paev, @Autor, @kirjeldus)
SELECT * FROM uudised;

END;
-- procedure kutse
EXEC lisaUudis 'Windows 11 ei toota TTHKs', '2025-02-06', 'Paint', 'Tana ei toota mitte yhte arvutu multimeedia klassis'
-- teine kutse voimalus
EXEC lisaUudis
@uusTeema = '2.marts on juba 2 kevade paev',
@Paev= '2025-02-05',
@Autor='test',
@kirjeldus='puudub';

-- protsedur, kustutamine tabelist (ID)
CREATE PROCEDURE kustutaUudis
@id int
AS
Begin
Select * from uudised;
DELETE FROM uudised WHERE uudisID=@id;
Select * from uudised;
End;
--kutse
Exec kustutaUudis @id = 3
Exec kustutaUudis 3;

UPDATE uudised SET kirjeldus= 'uus kirjeldus'
WHERE kirjeldus LIKE 'puudub';
SELECT * FROM uudised;
--protseduur mis uuendab andmed tabelis/UPDATE
CREATE PROCEDURE uuendaKirjeldus
@uuskirjeldus text
AS
BEGIN
SELECT * FROM uudised
UPDATE uudised SET kirjeldus= @uuskirjeldus
WHERE kirjeldus LIKE 'puudub';
SELECT * FROM uudised;
END;
EXEC uuendaKirjeldus 'Tana on teine kevade paev';
EXEC uuendaKirjeldus @uuskirjeldus='uus kirjeldus';

--protseduur mis otsib ja naitab uudis esemese tahte jargi

CREATE PROCEDURE otsingUudiseTeema
@taht char(1)
As
Begin
Select * FROM uudised
WHERE uudiseTeema LIKE @taht +'%';
END;
EXEC otsingUudiseTeema 'w';
EXEC otsingUudiseTeema @taht = 'U';


--XAMPP/localhost
CREATE TABLE uudised(
uudisID int PRIMARY KEY AUTO_INCREMENT,
uudiseTeema varchar(50),
kuupaev date,
autor varchar(25),
kirjeldus text
);
INSERT INTO uudised(uudiseTeema, kuupaev, autor, kirjeldus)
Values(
'Udune ilm', '2025-02-06', 'postimees', 'Lounani oodatakse udune ilm')

-- Protseduuride lisa info on README failis
Begin
INSERT INTO uudised(
uudiseTeema, kuupaev, autor, kirjeldus)
Values(
@uusTeema, @Paev, @Autor, @kirjeldus);
SELECT * FROM uudised;

END
