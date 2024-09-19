--1. Quali sono il nome, la data di inizio e la data di fine dei WP del progetto di nome ‘Pegasus’ ?
select wp.nome, wp.inizio, wp.fine
from WP, progetto
where wp.progetto = progetto.id and progetto.nome = 'Pegasus'

--2. Quali sono il nome, il cognome e la posizione degli strutturati che hanno almeno una attività nel progetto ‘Pegasus’, ordinati per cognome decrescente?
select distinct persona.nome, persona.cognome, posizione
from persona
join attivitaprogetto on persona.id =attivitaprogetto.persona
join progetto on attivitaprogetto.progetto = progetto.id
where progetto.nome = 'Pegasus'
order by persona.cognome DESC;

--3. Quali sono il nome, il cognome e la posizione degli strutturati che hanno più di una attività nel progetto ‘Pegasus’ ?
select distinct s.nome, s.cognome, s.posizione
from progetto p,
      join attivitaprogetto al
         on p.id = al. progetto
      join attivitaprogetto a2
         on p.id = a2.progetto
      join persona s
         on s.id =a1.persona
         and 
where 
      and a1.id <> a2.id
      and p.nome = 'Pegasus'
--4. Quali sono il nome, il cognome e la posizione dei Professori Ordinari che hanno fatto almeno una assenza per malattia?
select distinct nome, cognome, posizione
from persona p 
   join assenza a on p.id = a.persona
where p.posizione = 'Professore Ordinario'
   and a.topo = 'Malattia'

--5. Quali sono il nome, il cognome e la posizione dei Professori Ordinari che hanno fatto più di una assenza per malattia?
select distinct nome, cognome, posizione
from assenza a1, assenza a2, persnoa s 
where a1.id <> a2.id 
   and a1.persona = a2.persona
   and a1.pesona = s.id
   and s.posizione = 'Professore Ordinario';

--6. Quali sono il nome, il cognome e la posizione dei Ricercatori che hanno almeno un impegno per didattica?
select distinct p.nome, p.cognome , p.posizione
from persona p 
   join attivitanonprogettuale anp on p.id = anp.persona
where p.posizione = 'Ricercatore'
   and anp.tipo = 'Didattica';

--7. Quali sono il nome, il cognome e la posizione dei Ricercatori che hanno più di un impegno per didattica?
select p.nome, p.cognome, p.posizione
from persona p
	join attivitanonprogettuale anp on p.id = anp.persona
where p.posizione = 'Ricercatore'
	and

--8. Quali sono il nome e il cognome degli strutturati che nello stesso giorno hanno sia attività progettuali che attività non progettuali?
select distinct p.nome, p.cognome
from persona p
	join attivitaprogetto ap on p.id = ap.persona
	join AttivitaNonProgettuale anp on p.id = anp.persona
where ap.giorno = anp.giorno;

--9. Quali sono il nome e il cognome degli strutturati che nello stesso giorno hanno sia 
--attività progettuali che attività non progettuali? Si richiede anche di proiettare il
--giorno, il nome del progetto, il tipo di attività non progettuali e la durata in ore di entrambe le attività.
--10. Quali sono il nome e il cognome degli strutturati che nello stesso giorno sono assenti e hanno attività progettuali?
--11. Quali sono il nome e il cognome degli strutturati che nello stesso giorno sono 
--assenti e hanno attività progettuali? Si richiede anche di proiettare il giorno, il
--nome del progetto, la causa di assenza e la durata in ore della attività progettuale.
--12. Quali sono i WP che hanno lo stesso nome, ma appartengono a progetti diversi?