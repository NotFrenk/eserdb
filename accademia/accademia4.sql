--1. Quali sono i cognomi distinti di tutti gli strutturati?
select distinct cognome
from persona
where TRUE;

--2. Quali sono i Ricercatori (con nome e cognome)?
select id, nome, cognome
from persona
where posizione = 'Ricercatore'

--3. Quali sono i Professori Associati il cui cognome comincia con la lettera ‘V’ ?
select id, nome, cognome 
from persona
where posizione = 'Professore Associato' and cognome like 'V%'

--4. Quali sono i Professori (sia Associati che Ordinari) il cui cognome comincia con la lettera ‘V’ ?
select id, nome, cognome 
from persona
where (posizione = 'Professore Associato'or posizione = 'Professore Ordinario')
and cognome like 'V%'

--5. Quali sono i Progetti già terminati alla data odierna?
select id, nome, inizio, fine, budget 
from progetto
where TRUE;

--6. Quali sono i nomi di tutti i Progetti ordinati in ordine crescente di data di inizio?
select id, nome
from progetto
where TRUE
order by inizio asc

--7. Quali sono i nomi dei WP ordinati in ordine crescente (per nome)?
select id, nome
from wp
where TRUE
order by nome asc

--8. Quali sono (distinte) le cause di assenza di tutti gli strutturati?
select distinct tipo
from Assenza
where TRUE;

--9. Quali sono (distinte) le tipologie di attività di progetto di tutti gli strutturati?
select distinct tipo
from AttivitaProgettuale
where TRUE;

--10. Quali sono i giorni distinti nei quali del personale ha effettuato attività non pro-gettuali di tipo ‘Didattica’ ? Dare il risultato in ordine crescente.
select distinct giorno
from AttivitaNonProgettuale
where tipo = 'Didattica'
order by giorno asc;
