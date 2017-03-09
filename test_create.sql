-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2017-03-09 01:17:50.133

-- tables
-- Table: KetQua
CREATE TABLE KetQua (
    MaSV nvarchar  NOT NULL,
    MaMH nvarchar  NOT NULL,
    DiemThi float(3)  NOT NULL,
    KetQua_MaSV nvarchar  NOT NULL,
    MonHoc_2_MaMH nvarchar  NOT NULL,
    CONSTRAINT KetQua_pk PRIMARY KEY  (MaSV)
);

-- Table: Khoa
CREATE TABLE Khoa (
    MaKhoa nvarchar  NOT NULL,
    TenKhoa nvarchar  NOT NULL,
    SoCBGD int  NOT NULL,
    CONSTRAINT Khoa_pk PRIMARY KEY  (MaKhoa)
);

-- Table: Lop
CREATE TABLE Lop (
    MaLop nvarchar  NOT NULL,
    TenLop nvarchar(max)  NOT NULL,
    MaKhoa nvarchar  NOT NULL,
    Khoa_MaKhoa nvarchar  NOT NULL,
    CONSTRAINT Lop_pk PRIMARY KEY  (MaLop)
);

-- Table: MonHoc
CREATE TABLE MonHoc (
    MaMH nvarchar  NOT NULL,
    TenMH nvarchar  NOT NULL,
    SoTiet int  NOT NULL,
    CONSTRAINT MonHoc_pk PRIMARY KEY  (MaMH)
);

-- Table: SinhVien
CREATE TABLE SinhVien (
    MaSV nvarchar  NOT NULL,
    HoTen varchar(50)  NOT NULL,
    Nu int  NOT NULL,
    NgaySinh datetime  NOT NULL,
    MaLop nvarchar  NOT NULL,
    HocBong varchar(50)  NOT NULL,
    Tinh int  NOT NULL,
    Lop_MaLop nvarchar  NOT NULL,
    KetQua_MaSV nvarchar  NOT NULL,
    CONSTRAINT SinhVien_pk PRIMARY KEY  (MaSV)
);

-- foreign keys
-- Reference: KetQua_MonHoc (table: KetQua)
ALTER TABLE KetQua ADD CONSTRAINT KetQua_MonHoc
    FOREIGN KEY (MaMH)
    REFERENCES MonHoc (MaMH);

-- Reference: Lop_Khoa (table: Lop)
ALTER TABLE Lop ADD CONSTRAINT Lop_Khoa
    FOREIGN KEY (Khoa_MaKhoa)
    REFERENCES Khoa (MaKhoa);

-- Reference: SinhVien_KetQua (table: SinhVien)
ALTER TABLE SinhVien ADD CONSTRAINT SinhVien_KetQua
    FOREIGN KEY (MaSV)
    REFERENCES KetQua (MaSV);

-- Reference: SinhVien_Lop (table: SinhVien)
ALTER TABLE SinhVien ADD CONSTRAINT SinhVien_Lop
    FOREIGN KEY (Lop_MaLop)
    REFERENCES Lop (MaLop);

-- End of file.

