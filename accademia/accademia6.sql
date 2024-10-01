--1. Quanti sono gli strutturati di ogni fascia?
select posizione, count(*) as numero
from persona p
group by posizione;

--2. Quanti sono gli strutturati con stipendio ≥ 40000?
select count(stipendio)
from persona p
where p.stipendio >= 40000

--3. Quanti sono i progetti già finiti che superano il budget di 50000?
select count(budget)
from Progetto p
where p.budget > 50000
	and fine < current_date

--4. Qual è la media, il massimo e il minimo delle ore delle attività relative al progetto ‘Pegasus’ ?
SELECT AVG(ap.oreDurata) AS media_ore,
       MAX(ap.oreDurata) AS massimo_ore,
       MIN(ap.oreDurata) AS minimo_ore
FROM AttivitaProgetto ap
JOIN Progetto p ON ap.progetto = p.id
WHERE p.nome = 'Pegasus';

--5. Quali sono le medie, i massimi e i minimi delle ore giornaliere dedicate al progetto ‘Pegasus’ da ogni singolo docente?
SELECT AVG(ap.oreDurata) AS media_ore,
       MAX(ap.oreDurata) AS massimo_ore,
       MIN(ap.oreDurata) AS minimo_ore,
	   persona
FROM AttivitaProgetto ap
JOIN Progetto p ON ap.progetto = p.id
WHERE p.nome = 'Pegasus'
group by ap.persona;

--6. Qual è il numero totale di ore dedicate alla didattica da ogni docente?
SELECT anp.persona, 
		p.nome,
		p.cognome,
       SUM(oreDurata) AS totale_ore_didattica
FROM AttivitaNonProgettuale anp, Persona p
WHERE tipo = 'Didattica' AND p.id = anp.persona
GROUP BY anp.persona, p.nome, p.cognome

--7. Qual è la media, il massimo e il minimo degli stipendi dei ricercatori?
SELECT AVG(stipendio) AS media_stipendio,
       MAX(stipendio) AS massimo_stipendio,
       MIN(stipendio) AS minimo_stipendio
FROM Persona
WHERE posizione = 'Ricercatore';

--8. Quali sono le medie, i massimi e i minimi degli stipendi dei ricercatori, dei professori associati e dei professori ordinari?
SELECT posizione,AVG(stipendio) AS media_stipendio,
       MAX(stipendio) AS massimo_stipendio,
       MIN(stipendio) AS minimo_stipendio
FROM Persona
WHERE posizione in ('Ricercatore','Professore Associato','Professore Ordinario')
group by posizione;

--9. Quante ore ‘Ginevra Riva’ ha dedicato ad ogni progetto nel quale ha lavorato?
SELECT p.id AS id_progetto,
       p.nome AS nome_progetto,
       SUM(ap.oreDurata) AS totale_ore
FROM AttivitaProgetto ap
JOIN Persona pe ON ap.persona = pe.id
JOIN Progetto p ON ap.progetto = p.id
WHERE pe.nome = 'Ginevra'
  AND pe.cognome = 'Riva'
GROUP BY p.id, p.nome;

--10. Qual è il nome dei progetti su cui lavorano più di due strutturati?

--11. Quali sono i professori associati che hanno lavorato su più di un progetto?