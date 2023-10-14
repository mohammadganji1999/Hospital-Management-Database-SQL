

create or alter procedure myprocedure1
@Ag int,
@sex varchar(50),
@type_disease varchar(50)
as
begin
select [dbo].[Patient].[PatientID] ,Name ,Age,Gender ,Address 
from [dbo].[Patient]
where Gender =@sex  and Age < @Ag and Diseease =@type_disease
end

execute myprocedure1 80 , 'male' ,'Vomit'


///////////////////////////////////////////////////////////////

create or alter procedure myprocedure2
@ID varchar(10)
as
begin
select Name,[dbo].[Patient].PatientID,[dbo].[Bill].BillNumber,[dbo].[Lab].LabNumber
from [dbo].[Patient] join [dbo].[InPatient] on ([dbo].[Patient].[PatientID]=[dbo].[InPatient].[PatientID])
     join [dbo].[Lab] on ([dbo].[InPatient].[LabNumber]=[dbo].[Lab].[LabNumber])
	 join [dbo].[Bill] on ([dbo].[Bill].[PatientID]=[dbo].[Patient].[PatientID])
where [dbo].[Patient].[PatientID]=@ID

end

execute myprocedure2 '1003P' 


////////////////////////////////////////////////////////////////

create or alter procedure myprocedure3
@cost int,
@disease varchar(50)
as
begin
select Patient.[PatientID],SUM([DoctorCharge] +([RoomCharge]*[NumberOfDays]) +[LabCharge]) as ALL_COST
from [dbo].[Bill] join Patient on ([dbo].[Bill].PatientID=Patient.PatientID)
     where Patient.Diseease=@disease
group by Patient.[PatientID]
having SUM([DoctorCharge] +([RoomCharge]*[NumberOfDays]) +[LabCharge]) > @cost 
end

execute myprocedure3 400000,'Flue'