insert into bruker (ID, fornavn,etternavn, epost)
values 
('1', 'Erik','Dybfest', 'asdas@gmail.com'),
('2', 'Albert','Usikker', 'test@testmail.com'),
('3', 'Silje','Berg', 'asdasds@asdas.com'),
('4', 'Johannes','Solem', 'mailmail@mail.com')
;

insert into student (student_ID, innleveringer, varslinger)
values
('1', '2', null),
('2', '1', 'false'),
('3', '1', 'false'),
('4', '1', 'false');

insert into link (link_id, beskrivelse, ressurser)
values
('3', 'Informasjon om modul 1', null),
('2', 'Informasjon om modul 2', null),
('1', 'Informasjon om modul 3', null);

insert into modul (modul_nummer, lagd_av, frist, link_id, varsel, innhold)
values  
('1', 'Even', '2016.10.30', '3', null, null),
('2', 'Even', '2016.10.30', '2', null, 'Lag en kalkulator'),
('3', 'Hallgeir', '2016.10.30', '1', null, 'Lag en loop');

insert into besvarelse (besvarelse_ID, modul_nummer, opplastet_fil, kommentar, vurderingsvarsel, dato)
values
('1', '1', false, null, true, '2016.10.20'),
('2', '1', true, 'La ved fil', true, '2016.10.22'),
('3', '2', false, 'modulen var vanskelig', true, '2016.10.29');

insert into innlevering (student_ID, besvarelse_ID)
values
('1','1'),
('2','2'),
('1','3');

insert into vurdering (besvarelse_ID, student_ID, vurdert_av, karakter, kommentar)
values  
('1', '1', 'Hallgeir', 'B', 'bra jobbet'),
('2', '2', 'Even', 'A', 'helt ok besvarelse'),
('3', '1', 'Even', 'C', 'dette var pludrete');