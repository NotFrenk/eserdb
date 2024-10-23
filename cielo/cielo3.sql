--1. Qual è la durata media, per ogni compagnia, dei voli che partono da un aeroporto situato in Italia?
SELECT v.comp AS compagnia,
	avg(v.durataMinuti) as durataMedia
from Volo v
join ArrPart ap on v.comp = ap.comp and v.codice = ap.codice
join LuogoAeroporto la on ap.partenza = la.aeroporto
where la.nazione = 'Italy'
group by v.comp;

--2. Quali sono le compagnie che operano voli con durata media maggiore della durata media di tutti i voli?
select 
	v.comp as compagnia,
	avg(v.durataMinuti) as DurataMesiaCompagnia
from Volo v
group by v.comp
having
	avg(v.durataMinuti)>(
		select avg(v2.durataMinuti)
		from volo v2
		)

--3. Quali sono le città dove il numero totale di voli in arrivo è maggiore del numero medio dei voli in arrivo per ogni città?

--4. Quali sono le compagnie aeree che hanno voli in partenza da aeroporti in Italia 
--con una durata media inferiore alla durata media di tutti i voli in partenza da aeroporti in Italia?
--5. Quali sono le città i cui voli in arrivo hanno una durata media che differisce di più
--di una deviazione standard dalla durata media di tutti i voli? Restituire città durate medie dei voli in arrivo.
--6. Quali sono le nazioni che hanno il maggior numero di città dalle quali partono voli diretti in altre nazioni?