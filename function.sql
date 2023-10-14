CREATE FUNCTION function1 (@ID int)
RETURNS TABLE
AS
RETURN
(
select [dbo].[Patient].Name,[dbo].[Patient].PatientID,[dbo].[Bill].BillNumber,[dbo].[Lab].LabNumber
from [dbo].[Patient] join [dbo].[InPatient] on ([dbo].[Patient].[PatientID]=[dbo].[InPatient].[PatientID])
     join [dbo].[Lab] on ([dbo].[InPatient].[LabNumber]=[dbo].[Lab].[LabNumber])
	 join [dbo].[Bill] on ([dbo].[Bill].[PatientID]=[dbo].[Patient].[PatientID])
	 join [dbo].[Doctor] on ([dbo].[Doctor].DoctorID=[dbo].[Patient].DoctorID)
where [dbo].[Doctor].DoctorID=@ID
);
GO

SELECT * FROM function1 ('1002');


/////////////////////////////////////////

IF OBJECT_ID (N'function2', N'IF') IS NOT NULL
 DROP FUNCTION function2;
GO
CREATE FUNCTION function2 (@ID int)
RETURNS TABLE
AS
RETURN
(
select  [dbo].[Room].RoomType
from [dbo].[Room]
where [dbo].[Room].RoomNumber=@ID
);
GO

SELECT * FROM function2 (2);

////////////////////////////////////////////////

IF OBJECT_ID (N'function3', N'IF') IS NOT NULL
 DROP FUNCTION function3;
GO
CREATE FUNCTION function3 (@cost int)
RETURNS TABLE
AS
RETURN
(
select Patient.[PatientID],SUM([DoctorCharge]) as cost2
from [dbo].[Bill] join Patient on ([dbo].[Bill].PatientID=Patient.PatientID)
     where Patient.Diseease='Cholera'
group by Patient.[PatientID]
having SUM([DoctorCharge]) > @cost  
);
GO

SELECT * FROM function3 (30000);