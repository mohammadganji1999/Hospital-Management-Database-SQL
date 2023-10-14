create or alter trigger mytrigger1
on [dbo].[Patient]
after insert
as
insert into myLogin values(GETDATE(),'patient')

insert into Hospital.[dbo].[Patient] values('1009P', 'taha', 44 , 'male' , 'alborz emam','corona','1004')

create or alter trigger mytrigger2
on [dbo].[Doctor]
after insert
as
insert into myLogin values(GETDATE(),'doctor')

create or alter trigger mytrigger3
on [dbo].[Patient]
after update
as
insert into myupdate values(GETDATE(),'patient')



create or alter trigger mytrigger4
on [dbo].[Doctor]
after update
as
insert into myupdate values(GETDATE(),'doctor')

create or alter trigger mytrigger5
on [dbo].[Patient]
after delete
as
insert into mydelete values(GETDATE(),'patient')

create or alter trigger mytrigger6
on [dbo].[Doctor]
after delete
as
insert into mydelete values(GETDATE(),'doctor')

delete from Hospital.[dbo].[Patient] where PatientID='1009P'