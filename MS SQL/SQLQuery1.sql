create table tbl_center(
center_id int not null identity,
center_code int,
center_name varchar(100)
constraint UN_center_id unique(center_id),
constraint PK_center_code primary key(center_code)
)

create table tbl_users(
user_id int identity,
user_name varchar(50),
user_password varchar(50),
user_role varchar(50),
user_center_code int
constraint PK_user_id primary key(user_id)
)

create table tbl_student(
st_registration varchar(50),
st_name varchar(100),
st_admission_year date,
st_semester1 bit,
st_semester2 bit,
st_semester3 bit,
st_center_code int,
constraint PK_st_registration primary key(st_registration)
)

create table tbl_DCSA1201(
subj_code varchar(50),
subj_name varchar(100),
subj_credit varchar(10),
constraint PK_subj_code primary key(subj_code)
)

create table tbl_DCSA1201_mark(
id_1201 int identity,
st_registration varchar(50),
subj_code varchar(50) default 'DCSA1201',
tma1 int,
tma2 int,
total_tma int,
experiment int,
record_book int,
viva int,
total_practical int,
st_center_code int,
submit_date date default SYSDATETIME(),
constraint PK_id_1201 primary key(id_1201)
)

create trigger trgDCSA1201_mark ON dbo.tbl_DCSA1201_mark
for insert
AS
declare @st_registration varchar(50);
declare @st_center_code int;

select @st_registration=i.st_registration from inserted i;
select @st_center_code=i.st_center_code from inserted i;

insert into tbl_DCSA1201_mark(
st_registration,st_center_code)
values(@st_registration,@st_center_code);

go

insert into tbl_student(
st_registration,st_name,st_semester1,st_semester2,st_semester3,st_center_code)
values('17-0-52-801-014','Nahian',1,0,0,890)

create trigger trgDCSA1201_mark ON dbo.tbl_student
for insert
AS
declare @st_registration varchar(50);
declare @st_center_code int;

select @st_registration=i.st_registration from inserted i;
select @st_center_code=i.st_center_code from inserted i;

insert into tbl_DCSA1201_mark(
st_registration,st_center_code)
values(@st_registration,@st_center_code);

go