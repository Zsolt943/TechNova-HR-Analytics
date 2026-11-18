# TechNova Solutions 

## 1. Scopul proiectului

Scopul acestui proiect este analiza datelor de resurse umane din cadrul companiei TechNova Solutions, pentru a identifica tendințele privind fluctuația personalului, distribuția angajaților, nivelurile salariale, satisfacția și performanța acestora.

Proiectul urmărește să ofere departamentului HR informații relevante și recomandări bazate pe date, care pot contribui la reducerea fluctuației de personal și la îmbunătățirea proceselor interne.

## 2. Descrierea datelor

Proiectul utilizează trei seturi principale de date:

| Fișier | Descriere |
|---|---|
| `angajati_curat.csv` | Informații despre angajați: departament, funcție, nivel, salariu, status și date de angajare/plecare |
| `departamente.csv` | Informații despre departamente: denumire, oraș și buget anual |
| `evaluari_curat.csv` | Informații despre evaluări: performanță, satisfacție, ore suplimentare, training și bonusuri |

Datele analizate includ:
- 480 de angajați;
- 8 departamente;
- 365 de angajați activi;
- 115 angajați plecați.

## 3. Curățarea și pregătirea datelor

În etapa de pregătire au fost identificate și tratate următoarele probleme:

- Valori lipsă în coloana `id_departament`: au fost identificate 8 cazuri.
- Date calendaristice salvate inițial ca text sau în formate diferite: au fost convertite la tipul Date.
- Salarii invalide: au fost verificate valorile zero, negative și valorile mai mari de 30.000 lei.
- Valorile salariale lipsă au fost tratate folosind mediana corespunzătoare departamentului și nivelului.
- Înregistrările duplicate au fost verificate și eliminate.

După curățare, datele au fost pregătite pentru analiza în Python, SQL Server și Power BI.

## 4. KPI-uri analizate

Următorii indicatori au fost calculați în Power BI folosind măsuri DAX:

| KPI | Valoare | Descriere |
|---|---:|---|
| Total Angajati | 480 | Numărul distinct de angajați |
| Angajati Activi | 365 | Numărul angajaților activi |
| Plecari | 115 | Numărul angajaților plecați |
| Rata Fluctuatie % | 23,96% | Procentul plecărilor din totalul angajaților |
| Salariu Mediu | 6.590 lei | Salariul brut lunar mediu |

## 5. Rezultatele analizei – Întrebări de business

### 5.1. Care sunt departamentele și nivelurile cu cea mai mare rată de plecare?

Analiza a evidențiat următoarele departamente cu cele mai mari rate de plecare:

| Departament | Angajați | Plecări | Rata plecării |
|---|---:|---:|---:|
| Vânzări | 84 | 33 | 39,29% |
| Suport Clienți | 85 | 27 | 31,76% |
| Juridic | 16 | 4 | 25,00% |
| Marketing | 43 | 10 | 23,26% |
| Financiar | 36 | 7 | 19,44% |
| Operațiuni | 79 | 13 | 16,46% |
| IT | 112 | 18 | 16,07% |
| Resurse Umane | 25 | 3 | 12,00% |

Departamentul Vânzări are cea mai mare rată de plecare, de 39,29%, urmat de Suport Clienți, cu 31,76%.

La nivelul nivelurilor profesionale, categoria cu cea mai mare rată de plecare este [NIVEL], cu [X]%.

Aceste rezultate sugerează că departamentul HR ar trebui să acorde prioritate retenției angajaților din Vânzări și Suport Clienți.

### 5.2. Prin ce se deosebesc angajații care au plecat de cei care au rămas?

Din totalul de 480 de angajați, 115 au plecat din companie, ceea ce reprezintă o rată de fluctuație de 23,96%. Numărul angajaților activi este de 365.

### 5.3. De ce spun angajații că pleacă?

Principalele motive de plecare identificate sunt:

| Motivul plecării | Număr angajați | Procent |
|---|---:|---:|
| Salariu mai bun în altă parte | 31 | 26,96% |
| Echilibru viață-muncă | 24 | 20,87% |
| Lipsa oportunităților de promovare | 18 | 15,65% |
| Relația cu managerul | 15 | 13,04% |
| Nespecificat | 12 | 10,43% |
| Relocare | 8 | 6,96% |
| Pensionare | 7 | 6,09% |

Cel mai frecvent motiv de plecare este salariul mai bun oferit de o altă companie, menționat de 31 de angajați (26,96%).

Al doilea motiv este lipsa echilibrului dintre viața profesională și cea personală, cu 24 de angajați (20,87%).

Aceste rezultate indică faptul că nivelul salarial, condițiile de muncă și oportunitățile de dezvoltare profesională sunt aspecte importante pentru retenția personalului.

### 5.4. Există diferențe salariale importante între departamente, niveluri sau genuri?

Analiza salariilor a evidențiat diferențe între departamente și genuri.

Exemple de salarii medii lunare:

| Departament | Gen | Salariu mediu |
|---|---|---:|
| IT | F | 9.404,55 lei |
| IT | M | 9.155,26 lei |
| Financiar | F | 6.307,14 lei |
| Financiar | M | 8.031,67 lei |
| Juridic | F | 6.800,00 lei |
| Juridic | M | 8.481,25 lei |
| Resurse Umane | F | 5.430,00 lei |
| Resurse Umane | M | 6.945,00 lei |
| Suport Clienți | F | 4.585,78 lei |
| Suport Clienți | M | 4.527,21 lei |

De exemplu, în departamentul Juridic, salariul mediu pentru bărbați este de 8.481,25 lei, comparativ cu 6.800 lei pentru femei.

În IT, salariul mediu este de peste 9.100 lei pentru ambele genuri, în timp ce în Suport Clienți media este de aproximativ 4.500 lei.

Aceste diferențe trebuie interpretate ținând cont de nivelul profesional, funcție și responsabilitățile angajaților. Pentru o comparație salarială completă este necesară și analiza pe niveluri profesionale.

### 5.5. Trei recomandări concrete pentru departamentul HR

**1. Îmbunătățirea retenției în departamentele cu fluctuație ridicată**

Departamentul Vânzări are o rată de plecare de 39,29%, iar Suport Clienți de 31,76%. HR ar trebui să analizeze condițiile de muncă, volumul de activitate și cauzele plecărilor din aceste departamente și să implementeze măsuri specifice de retenție.

**2. Îmbunătățirea echilibrului dintre viața profesională și cea personală**

24 de angajați (20,87%) au indicat lipsa echilibrului dintre viața profesională și cea personală ca motiv de plecare. Compania ar putea introduce programe de lucru flexibile, monitorizarea orelor suplimentare și o distribuire mai echilibrată a sarcinilor.

**3. Dezvoltarea oportunităților de promovare și îmbunătățirea relației cu managerii**

18 angajați (15,65%) au menționat lipsa oportunităților de promovare, iar 15 angajați (13,04%) au indicat relația cu managerul. Se recomandă introducerea unor programe de dezvoltare profesională, discuții periodice despre carieră și programe de formare pentru manageri.

## 6. Instrumente și tehnologii utilizate

| Instrument | Utilizare | Versiune |
|---|---|---|
| Microsoft Excel | Curățarea și pregătirea inițială a datelor | Excel 2019 |
| Python | Analiza și explorarea datelor | [VERSIUNE PYTHON] |
| pandas | Manipularea și analiza datelor | [VERSIUNE PANDAS] |
| matplotlib | Vizualizarea datelor | [VERSIUNE MATPLOTLIB] |
| Microsoft SQL Server | Stocarea datelor și interogări SQL | SQL Server 2025 Standard Developer Edition |
| SQL Server Management Studio | Administrarea bazei de date și executarea interogărilor | SSMS 22 |
| Power BI Desktop | Modelul de date, măsurile DAX și dashboard-ul | [VERSIUNE POWER BI] |

## 7. Structura proiectului și instrucțiuni de rulare

Pentru reproducerea analizei, fișierele trebuie utilizate în următoarea ordine:

1. **Excel – Curățarea datelor:** se pregătesc și se verifică fișierele sursă.
2. **Python – `02_Python_analiza.ipynb`:** se încarcă și se analizează seturile de date curățate.
3. **SQL Server – `03_SQL_interogari.sql`:** se creează baza de date, se importă tabelele și se execută interogările SQL.
4. **Power BI – `04_PowerBI_dashboard.pbix`:** se încarcă datele, se verifică relațiile, se creează măsurile DAX și se vizualizează rezultatele prin dashboard.

Fișierele CSV necesare trebuie să fie disponibile în locația indicată în proiect sau într-o locație actualizată în conexiunile Power BI.

## 8. Concluzie

Analiza datelor HR din cadrul TechNova Solutions arată că 115 din 480 de angajați au părăsit compania, reprezentând o rată de fluctuație de 23,96%.

Cele mai ridicate rate de plecare au fost înregistrate în departamentele Vânzări (39,29%) și Suport Clienți (31,76%).

Principalul motiv de plecare a fost salariul mai bun oferit de alte companii (26,96%), urmat de lipsa echilibrului dintre viața profesională și cea personală (20,87%).

Rezultatele oferă departamentului HR o bază pentru identificarea problemelor și implementarea unor măsuri concrete de retenție.

