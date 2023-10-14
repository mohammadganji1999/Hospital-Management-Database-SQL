alter view view1 as
select [dbo].[Patient].PatientID,COUNT([dbo].[Patient].PatientID) as num_patient
from [dbo].[Patient] join [dbo].[Doctor] on ([dbo].[Patient].DoctorID= [dbo].[Doctor].DoctorID)
group by [dbo].[Patient].PatientID
having  COUNT([dbo].[Patient].PatientID) > 4


select *
from view1


///////////////////////////////////////////

CREATE VIEW view2 AS 
select [dbo].[Patient].PatientID,[dbo].[Doctor].DoctorID,[dbo].[Lab].LabNumber
from [dbo].[Lab] join [dbo].[Patient] on ([dbo].[Lab].PatientID=[dbo].[Patient].PatientID)
                 join [dbo].[Doctor] on ( [dbo].[Patient].DoctorID=[dbo].[Doctor].DoctorID)
where [dbo].[Lab].Date='2006-08-19 00:00:00.000' and [dbo].[Doctor].Address='tabriz atlas'

select *
from view2  



///////////////////////////////////////
create VIEW view3 AS
select Patient.Diseease , [dbo].[Room].RoomType
from Patient join [dbo].[InPatient] on ([dbo].[InPatient].PatientID=Patient.PatientID)
             join [dbo].[Room] on ([dbo].[InPatient].RoomNumber=[dbo].[Room].RoomNumber)
where [InPatient].RoomNumber='R1'

select *
from view3 