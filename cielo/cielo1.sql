--Definire in SQL le seguenti interrogazioni, in cui si chiedono tutti risultati distinti:
--1. Quali sono i voli (codice e nome della compagnia) la cui durata supera le 3 ore?
select codice, comp
from volo
where durataMinuti > 180;

--2. Quali sono le compagnie che hanno voli che superano le 3 ore?
select distinct comp
from volo
where durataMinuti > 180;

--3. Quali sono i voli (codice e nome della compagnia) che partono dall’aeroporto con codice ‘CIA’ ?
select codice, comp
from ArrPart
where partenza = 'CIA';

--4. Quali sono le compagnie che hanno voli che arrivano all’aeroporto con codice ‘FCO’ ?
select distinct comp
from ArrPart
where arrivo = 'FCO';

--5. Quali sono i voli (codice e nome della compagnia) che partono dall’aeroporto ‘FCO’ e arrivano all’aeroporto ‘JFK’ ?
select codice, comp
from ArrPart
where partenza = 'FCO' and arrivo = 'JFK';


--6. Quali sono le compagnie che hanno voli che partono dall’aeroporto ‘FCO’ e atterrano all’aeroporto ‘JFK’ ?
select distinct comp
from ArrPart
where partenza = 'FCO' and arrivo = 'JFK';


--7. Quali sono i nomi delle compagnie che hanno voli diretti dalla città di ‘Roma’ alla città di ‘New York’ ?
select distinct comp
from ArrPart AP, LuogoAeroporto arrivo, LuogoAeroporto partenza
where partenza.citta = 'Roma' and arrivo.citta = 'New York' 
	and AP.partenza = partenza.aeroporto and AP.arrivo = arrivo.aeroporto;

--8. Quali sono gli aeroporti (con codice IATA, nome e luogo) nei quali partono voli della compagnia di nome ‘MagicFly’ ?
select distinct aeroporto, comp, citta 
from ArrPart, LuogoAeroporto
where ArrPart.comp = 'MagicFly' and ArrPart.partenza = LuogoAeroporto.aeroporto;

--9. Quali sono i voli che partono da un qualunque aeroporto della città di ‘Roma’ e
--atterrano ad un qualunque aeroporto della città di ‘New York’ ? Restituire: codice del volo, nome della compagnia, e aeroporti di partenza e arrivo.
select ap.codice as codice, 
		 ap.comp as compagnia,


from Arrpart ap, LuogoAeroporto lap, LuogoAeroporto laa, aeroporto aerop_p, aeroporto aerop_arr
where ap.partenza = lap.aeroporto
	and lap.citta = 'Roma'
	and 



--10. Quali sono i possibili piani di volo con esattamente un cambio (utilizzando solo
--voli della stessa compagnia) da un qualunque aeroporto della città di ‘Roma’ ad un
--qualunque aeroporto della città di ‘New York’ ? Restituire: nome della compagnia,
--codici dei voli, e aeroporti di partenza, scalo e arrivo.
select 
from arrpart v1, arrpart v2
where v1.arrivo

11. Quali sono le compagnie che hanno voli che partono dall’aeroporto ‘FCO’, atter-
rano all’aeroporto ‘JFK’, e di cui si conosce l’anno di fondazione?