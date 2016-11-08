use mand3;

/* ---------- Part 3 * Creating the tables and constraints--------*/

create table bruker (
ID int not null,
fornavn varchar(30) not null,
etternavn varchar(30) not null,
epost varchar (40) not null,
constraint brukerPK primary key (ID)
);

create table student (
student_ID int not null,
innleveringer varchar (30),
varslinger varchar (30),
constraint studentPK primary key (student_ID)
);

create table foreleser (
moduler varchar (50),
tilganger boolean,
varslinger varchar(30)
);

create table besvarelse (
besvarelse_ID int not null,
modul_nummer int not null,
opplastet_fil boolean,
kommentar varchar (120),
vurderingsvarsel boolean,
dato date,
constraint besvarelsePK primary key (besvarelse_ID)
);

create table innlevering (
student_ID int not null,
besvarelse_ID int not null,
constraint innlevFK foreign key (student_ID) references student (student_ID),
constraint innlevFK2 foreign key (besvarelse_ID) references besvarelse (besvarelse_ID),
constraint innlevPK primary key (student_ID, besvarelse_ID)
);

create table vurdering (
besvarelse_ID int not null,
student_ID int not null,
vurdert_av varchar(50) not null,
karakter varchar(2),
kommentar varchar(120),
constraint vurderingFK foreign key (student_ID) references student (student_ID),
constraint vurderingFK2 foreign key (besvarelse_ID) references besvarelse (besvarelse_ID),
constraint vurderingPK primary key (besvarelse_ID, student_ID)
);

create table link (
link_id int not null,
beskrivelse varchar(30) not null,
ressurser varchar(50),
constraint linkPK primary key (link_id)
);

create table modul (
modul_nummer int not null,
lagd_av varchar(35) not null,
frist date not null,
link_id int,
varsel boolean, 
innhold varchar(120),
constraint modulPK primary key (modul_nummer),
constraint modulFK foreign key (link_id) references link (link_id)
);

/*-----------Part 4 * Adding test data-------------*/

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

