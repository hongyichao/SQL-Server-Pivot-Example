

CREATE TABLE [dbo].[TestStudentInfo](
	[Id] [int] NOT NULL,
	[FirstName] [nchar](20) NULL,
	[LastName] [nchar](20) NULL,
	[SchoolName] [nchar](20) NULL,
 CONSTRAINT [PK_TestStudentInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


insert into TestStudentInfo values (1,'firstName1', 'lastName1','school1');
insert into TestStudentInfo values (2,'firstName2', 'lastName1','school2');


select * from TestStudentInfo

select p2.school1 as SchoolStatus1, p2.school2 as SchoolStatus2, case when p2.school1 = p2.school2 then 0 else 1 end as StatusChanged
from
(
select Schoolname, p.ColHeaders, p.StudentInfo 
from TestStudentInfo s
unpivot(

	StudentInfo for ColHeaders in (firstname, lastname)	 
)p) as ps
pivot(
	max(StudentInfo) for Schoolname in (school1, school2)	 
)p2