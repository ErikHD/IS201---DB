use mand3;
/* Endringer for implementasjon 202 */
alter table foreleser
add ansattID int not null first,
add constraint foreleserPK primary key (ansattID),
add ID int not null after ansattID,
add constraint foreleserPK foreign key (ID) references bruker (ID);

insert into bruker (ID, fornavn,etternavn, epost, password)
values 
('5', 'Hallgeir','Nilsen', 'hallgeirnilsen@uia.com', 'hallgeir123'),
('6', 'Even','Larsen', 'evenlarsen@uia.com', 'even123');

insert into foreleser
values 
('1','5','2, 3, 4','1',null),
('2','6','5, 6, 7','1',null)