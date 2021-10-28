create table subject (
"id_Subject" serial primary key,
"SubjectName" varchar (255),
"SubjectComments" varchar (255),
"ActiveRecord" boolean default true
);

drop table subject;

insert into subject ("SubjectName", "SubjectComments") values ('Oleg','48 ���');

select * from subject;

create table days_taken_into_account (
"id_DTIA" serial primary key,
"id_Subject" integer,
"Data_DTIA" date,
"Comments" varchar (255),
"ActiveRecord" boolean default true,
FOREIGN KEY ("id_Subject") REFERENCES "subject" ("id_Subject")
);

drop table Days_taken_into_account;

insert into days_taken_into_account
("id_Subject", "Data_DTIA", "Comments")
values (1, '2021-10-24', '������� ������');

select * from days_taken_into_account;

update days_taken_into_account set "Comments" = '������� ������' where "Comments" = '������� ������';

create table events_on_day (
"id_EoD" serial primary key,
"id_DTIA" integer,
"TimeOfEvent" time,
"SYS_Pressure" integer,
"DIA_Pressure" integer,
"Pulse" integer,
"Comments" varchar (255),
"ActiveRecord" boolean default true,
FOREIGN KEY ("id_DTIA") REFERENCES days_taken_into_account ("id_DTIA")
);

drop table events_on_day;

insert into events_on_day
("id_DTIA", "TimeOfEvent", "SYS_Pressure", "DIA_Pressure", "Pulse", "Comments")
values (1, '6:00', 120, 80, 60, '������� ������ ������');

select * from events_on_day;

