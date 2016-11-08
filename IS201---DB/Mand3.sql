use mand3;

create table bruker (
ID int not null,
fornavn varchar(30) not null,
etternavn varchar(30) not null,
epost varchar (40) not null,
password varchar (20) not null,
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

