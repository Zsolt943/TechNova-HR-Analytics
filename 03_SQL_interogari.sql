/*============================================
Proiect final Data Analyst - TechNova Solutions
Etapa 3 – Interogări SQL
===============================================
*/


/* =========================================================
   B. CREAREA BAZEI DE DATE
   ========================================================= */

-- 1. Creează baza de date technova_hr dacă nu există deja.
IF DB_ID(N'technova_hr') IS NULL
BEGIN
    CREATE DATABASE technova_hr;
END;
GO

USE technova_hr;
GO

-- 2. Datele departamente.csv, angajati_curat.csv și evaluari_curat.csv doar manual am putut sa importez, prin Tasks -> Flat File

-- 3. Importuri verificate (așteptat: 8,480,...).
SELECT COUNT(*) AS numar_departamente
FROM dbo.departamente

SELECT COUNT(*) AS numar_angajati
FROM dbo.angajati

SELECT COUNT(*) AS numar_evaluari
FROM dbo.evaluari


/* =========================================================
   B. INTEROGARI OBLIGATORII
   ========================================================= */

/* 1. Care este numărul total de angajați, câți sunt activi și câți au plecat? */

SELECT
    COUNT(*) AS total_angajati,
    SUM(CASE WHEN plecat = 0 THEN 1 ELSE 0 END) AS angajati_activi,
    SUM(CASE WHEN plecat = 1 THEN 1 ELSE 0 END) AS angajati_plecati
FROM angajati


/* 2. Câți angajați are fiecare departament, ordonați descrescător? */

SELECT
    d.id_departament,
    d.nume_departament,
    COUNT(a.id_angajat) AS numar_angajati
FROM dbo.departamente d
LEFT JOIN dbo.angajati a
    ON d.id_departament = a.id_departament
GROUP BY
    d.id_departament,
    d.nume_departament
ORDER BY numar_angajati DESC


/* 3. Care este salariul mediu, minim și maxim pentru fiecare nivel? */

SELECT 
    a.nivel,
    AVG(a.salariu_brut_lunar) AS salariul_mediu,
    MIN(a.salariu_brut_lunar) AS salariul_minim,
    MAX(a.salariu_brut_lunar) AS salariul_maxim
FROM angajati a
GROUP BY a.nivel


/* 4. Care este rata de plecare (%) pentru fiecare departament? */

SELECT
    d.nume_departament,
    COUNT(a.id_angajat) AS total_angajati,
    SUM(CASE WHEN a.plecat = 1 THEN 1 ELSE 0 END) AS angajati_plecati,
    CASE
        WHEN COUNT(a.id_angajat) = 0 THEN 0
        ELSE
            100.0 * SUM(CASE WHEN a.plecat = 1 THEN 1 ELSE 0 END)
            / COUNT(a.id_angajat)
    END AS rata_plecare_procent
FROM departamente d
LEFT JOIN angajati a
    ON d.id_departament = a.id_departament
GROUP BY d.id_departament, d.nume_departament
ORDER BY rata_plecare_procent DESC


/* 5. Care sunt departamentele cu o rată de plecare mai mare de 20%? */

SELECT
    d.nume_departament,
    COUNT(a.id_angajat) AS total_angajati,
    SUM(CASE WHEN a.plecat = 1 THEN 1 ELSE 0 END) AS angajati_plecati,
    100.0 * SUM(CASE WHEN a.plecat = 1 THEN 1 ELSE 0 END)
        / COUNT(a.id_angajat) AS rata_plecare_procent
FROM dbo.departamente d
INNER JOIN dbo.angajati a
    ON d.id_departament = a.id_departament
GROUP BY d.id_departament, d.nume_departament
HAVING
    100.0 * SUM(CASE WHEN a.plecat = 1 THEN 1 ELSE 0 END)
        / COUNT(a.id_angajat) > 20


/* 6. Care este salariul mediu pe gen în fiecare departament? */

SELECT
    d.nume_departament,
    AVG(a.salariu_brut_lunar) as salariu_mediu,
    a.gen
FROM departamente d
INNER JOIN angajati a ON d.id_departament = a.id_departament
GROUP BY d.nume_departament,a.gen
ORDER BY d.nume_departament ASC


/* 7. Care sunt primii 10 cei mai bine plătiți angajați activi? */

SELECT TOP 10
    nume,
    prenume,
    nume_departament,
    nivel,
    salariu_brut_lunar
FROM angajati
WHERE plecat = 0
ORDER BY salariu_brut_lunar DESC


/* 8. Care sunt motivele plecării, numărul angajaților și procentul din totalul plecărilor? */

SELECT
    COALESCE(a.motiv_plecare, N'Necunoscut') AS motiv_plecare,
    COUNT(*) AS numar_angajati,
    100.0 * COUNT(*) /
        (SELECT COUNT(*)
         FROM angajati
         WHERE plecat = 1) AS procent_din_total
FROM angajati a
WHERE a.plecat = 1
GROUP BY a.motiv_plecare
ORDER BY numar_angajati DESC


/* 9. Care sunt angajații al căror salariu este mai mare decât media departamentului lor? */

SELECT
    a.nume,
    a.prenume,
    a.nivel,
    a.salariu_brut_lunar,
    d.nume_departament
FROM angajati a
INNER JOIN departamente d
    ON a.id_departament = d.id_departament
WHERE a.salariu_brut_lunar >
    (
        SELECT AVG(a2.salariu_brut_lunar)
        FROM angajati a2
        WHERE a2.id_departament = a.id_departament
    )
ORDER BY a.salariu_brut_lunar DESC


/* 10. Care sunt angajații fără nicio evaluare, câți sunt și ce status au? */

SELECT
    a.id_angajat,
    a.nume,
    a.prenume,
    a.status,
    COUNT(*) OVER() AS total_angajati_fara_evaluare
FROM angajati a
LEFT JOIN evaluari e
    ON a.id_angajat = e.id_angajat
WHERE e.id_evaluare IS NULL
ORDER BY a.status, a.nume


/* 11. Câte evaluări există în 2025 pe categorii de satisfacție? */

SELECT 
    COUNT(*) as evaluari_total,
    satisfactie_angajat
FROM evaluari 
WHERE an_evaluare = 2025
GROUP BY satisfactie_angajat


/* 12. Care sunt scorul mediu de performanță, bonusul mediu și orele suplimentare medii pe departament în 2025? */

SELECT
    d.nume_departament,
    AVG(CAST(e.scor_performanta AS DECIMAL(10,2))) AS scor_mediu_performanta,
    AVG(e.procent_bonus) AS bonus_mediu,
    AVG(e.ore_suplimentare_lunare) AS ore_suplimentare_medii
FROM evaluari e
INNER JOIN angajati a
    ON e.id_angajat = a.id_angajat
INNER JOIN departamente d
    ON a.id_departament = d.id_departament
WHERE e.an_evaluare = 2025
GROUP BY d.id_departament, d.nume_departament
ORDER BY d.nume_departament
    