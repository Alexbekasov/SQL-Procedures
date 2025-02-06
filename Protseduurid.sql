CREATE DATABASE procTARgv24;

USE procTARgv24;
CREATE TABLE uudised(
uudisID int PRIMARY KEY identity (1,1),
uudiseTeema varchar(50),
kuupaev date,
autor varchar(25),
kirjeldus text
)

SELECT * FROM uudised;

INSERT INTO uudised(
uudiseTeema, kuupaev, autor, kirjeldus)
VALUES(
'udune ilm', '2025-02-06', 'postinees', 'Tana on ebahuvitav ilm');

---protseduuri loomine
---sisestav uudised tabelisse ja kohe naitab

CREATE Procedure lisaUudis
@uusTeema varchar(50),
@paev date,
@autor varchar (20),
@kirjeldus text
AS
BEGIN

INSERT INTO uudised(
uudiseTeema, kuupaev, autor, kirjeldus)
VALUES(
@uusTeema, @paev, @autor,@kirjeldus);
Select * from uudised;

END;
--kutse
Exec lisaUudis 'windows 11', '2025-02-06', 'õpetaja Pant', 'w11 ei tööta multimeedias';
-- teine kutse võimalus

Exec lisaUudis @uusTeema ='1.märts on juba kevad'
@paev='2025-02-06',
@autor='test',
@kirjeldus='puudub';


--protseduur, mis kustutab tabelist id järgi
CREATE PROCEDURE kustutaUudis
@id int
AS
BEGIN
Select * from uudised;
Delete from uudised where uudisID=@id;
Select * from uudised;
END;
--kutse
EXEC kustutaUudis 3;
EXEC kustutaUudis @id=3;

UPDATE uudised SET kirjeldus='uus kirjeldus'
WHERE kirjeldus Like'puudub';-- vvodit tam gde opisanie otsuvstvujet
SELECT * FROM uudised;
--protseduur mis uuendab andmed tabelis/UPDATE

CREATE Procedure uuendaKirjeldus
@uusKirjeldus text
AS
BEGIN
SELECT * FROM uudised;
UPDATE uudised SET kirjeldus=@uusKirjeldus
WHERE kirjeldus Like'puudub';-- vvodit tam gde opisanie otsuvstvujet
SELECT * FROM uudised;
END;
--kutse
EXEC uuendaKirjeldus 'uus tekst kirjelduses';
EXEC uuendaKirjeldus @uusKirjeldus = 'uus tekst kirjelduses';
--protseduur mis otsib ja naitab uudist esimese tahte jargi

CREATE PROCEDURE otsingUudiseTeema
@taht char(1)
AS
BEGIN
SELECT * FROM uudised
WHERE uudiseTeema LIKE @taht +'%'; -- budet iskatj tolko sostojashih iz odnoj bukvi. 
--protsent v '' potomu sto rabota s tekstom
END;
--kutse
EXEC otsingUudiseTeema 'w';

---------Xampp/localhost
CREATE TABLE uudised(
uudisID int PRIMARY KEY AUTO_INCREMENT,
uudiseTeema varchar(50),
kuupaev date,
autor varchar(25),
kirjeldus text
);
INSERT INTO uudised(
uudiseTeema, kuupaev, autor, kirjeldus)
VALUES(
'udune ilm', '2025-02-06', 'postinees', 'Tana on ebahuvitav ilm');


CALL lisauudis ('windows 11', '2025-02-06', 'õpetaja Pant', 'w11 ei tööta multimeedias');
