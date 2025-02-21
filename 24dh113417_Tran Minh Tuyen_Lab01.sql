use master 
if exists(select * from sysdatabases where name='QLDiem')
drop database QLDiem
go
create database QLDiem
go
use QLDiem

create table KHOA
(
MaKhoa char(2) constraint PK_Khoa primary key,
TenKhoa nVarChar(20)
)

create table DMKHOA(
 MaKhoa char(2) constraint PK_Khoa primary key,
 TenKhoa nVarChar(20)
)

create table MONHOC
(
MaMH char(2) constraint PK_MONHOC primary key,
TenMH nVarchar(30),
SoTiet Tinyint
)

create table SINHVIEN
(
MaSV char(3) constraint PK_SINHVIEN primary key,
HoSV nvarchar(30),
TenSV Nvarchar(10),
Phai bit,
NgaySinh Date,
NoiSinh nvarchar(25),
 MaKH char(2) constraint FK_SINHVIEN_KHOA foreign key
 references KHOA(MaKhoa),
HocBong float
)

create table KETQUA
(
 MaSV char (3) constraint FK_KETQUA_SINHVIEN foreign key 
references SINHVIEN(MaSV),
MaMH char (2) constraint FK_KETQUA_MONHOC foreign key
 references MONHOC(MaMH),
LanThi Tinyint,
Diem Decimal(4, 2),
constraint PK_KetQua primary key (MaSV, MaMH, LanThi)
)ALTER TABLE KHOA ADD NamTL int;EXEC sp_columns KHOA;exec sp_databases
exec sp_tablesexec sp_columns DMKHOAexec sp_helpconstraint DMKHOA