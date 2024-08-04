CREATE DATABASE DA1_Nhom6_2
GO
--DROP DATABASE DA1_Nhom6_2
USE DA1_Nhom6_2
CREATE TABLE TAIKHOAN(
	MATK varchar(50) primary key,
	TenDangNhap nvarchar(50),
	MatKhau varchar(50),
	ChucVu nvarchar(50)
)
CREATE TABLE NHANVIEN(
	MANV varchar(50) primary key,
	MATK varchar(50),
	TenNV nvarchar(50),
	NgaySinh Date,
	GioiTinh int,
	SoDienThoai varchar(50),
	Email varchar(50),
	DiaChi nvarchar(250),
	ChucVu nvarchar(50),
	foreign key(MATK) references TAIKHOAN(MATK),
)

CREATE TABLE KHACHHANG(
	MAKH varchar(50) primary key,
	TenKhachHang nvarchar(50),
	GioiTinh int ,
	NgaySinh Date,
	CCCD varchar(50),
	SoDienThoai varchar(50),
	Email varchar(50),
	DiaChi nvarchar(250),
)

CREATE TABLE LOAIPHONG(
	MALP varchar(50) primary key,
	LoaiPhong nvarchar(50),
	Gia float,
	MoTa nvarchar(500),
	SONGUOIO INT
)
CREATE TABLE DICHVU(
	MADV varchar(50) primary key,
	TenDichVu nvarchar(250),
	Gia float,
	MoTa nvarchar(500),
	LoaiDichVu nvarchar(300)
)
CREATE TABLE PHONG(
	MA_P varchar(50) primary key,
	MALP varchar(50),
	TinhTrang nvarchar(50),
	Tang int,
	foreign key(MALP) references LOAIPHONG(MALP)	
)




CREATE TABLE HOADON(
	MAHD varchar(50) primary key,
	MAKH varchar(50) ,
	MANV varchar(50) ,
	SoDienThoai varchar(50) ,
	DiaChi nvarchar(500) ,
	SoPhongDat int ,
	TongTienDV float,
    TongTienPhong float,
	TrangThai nvarchar(100),
	NgayXuatDon date,
	NgayThanhToan date,
	TienCoc float,
	TongTien float,
	SoTienCanThanhToan float,
	foreign key(MAKH) references KHACHHANG(MAKH) ON DELETE SET NULL ,
	foreign key(MANV) references NHANVIEN(MANV)ON DELETE SET NULL
)
CREATE  TABLE HOADONCHITIET(
	MA_HDCT VARCHAR(50) primary key ,
	MA_P varchar(50) ,
	CheckIn DateTime ,
	CheckOut DateTime ,
	TienPhong float ,
	NgayThanhToan Date ,
	MAHD VARCHAR(50),
	foreign key(MAHD) references HOADON(MAHD),
	foreign key(MA_P) references PHONG(MA_P) ON DELETE SET NULL
)
CREATE  TABLE DATDICHVU(	
	MA_DDV VARCHAR(50) primary key,
	MA_P varchar(50),
	MADV varchar(50),
	TenDichVu nvarchar(300),
	SoLuong int,
	Gia float,
	NgayDat date,
	TongTien float,
	MaHD VARCHAR(50),
	foreign key(MA_P) references PHONG(MA_P) ON DELETE SET NULL,
	foreign key(MADV) references DICHVU(MADV) ON DELETE SET NULL,
	foreign key(MAHD) references HOADON(MAHD) 
)


------------ INSERT
insert into TAIKHOAN(MATK,TenDangNhap,MatKhau,ChucVu)
values('TK01',N'adim','123456',N'Quản Lý'),
('TK02',N'NhanVien1','123456',N'Nhân Viên'),
('TK03',N'NhanVien2','123456',N'Nhân Viên'),
('TK04',N'NhanVien3','123456',N'Nhân Viên'),
('TK05',N'NhanVien4','123456',N'Nhân Viên')
-- NHÂN VIÊN
insert into NHANVIEN(MANV,MATK,TenNV,NgaySinh,GioiTinh,SoDienThoai,Email,DiaChi,ChucVu)
values('NV01','TK01',N'Trần Văn An','7-15-1989','1','0356518431','TranAn1989@gmail.com',N'Nam Định',N'Quản Lý'),
('NV02','TK02',N'Nguyễn Thị Bưởi','3-6-1991','0','0355967720','NguyenBuoi1991@gmail.com',N'Hà Nội',N'Nhân Viên Thu Ngân'),
('NV03','TK03',N'Kim Văn Phú','6-21-1992','1','0388805168','KimPhu1992@gmail.com',N'Hà Nội',N'Nhân Viên Đặt Phòng'),
('NV04','TK04',N'Trần Văn Đạt','1-17-1990','1','0359788631','TranDat1990@gmail.com',N'Hải Dương',N'Nhân Viên Đặt Phòng'),
('NV05','TK05',N'Hoàng Thị Hoài','6-6-1995','0','039312449','HoangHoai1995@gmail.com',N'Phú Thọ',N'Nhân Viên Lễ Tân')

-- KHÁCH HÀNG
insert into KHACHHANG(MAKH,TenKhachHang,GioiTinh,NgaySinh,CCCD,SoDienThoai,Email,DiaChi)
values('KH01',N'Trần Văn Thuấn',1,'6-21-2001','036205011855','0354233242','Thuan2106@gmail.com',N'Nam Định'),
('KH02',N'Phạm Khánh Uyên',0,'7-17-2004','03647890872','0358776423','Uyen2004@gmail.com',N'Hà Nội'),
('KH03',N'Trần Tiến Đạt',1,'8-3-1990','03620789543','0354238765','TienDat1990@gmail.com',N'Cao Bằng'),
('KH04',N'Nguyễn Phương Mai',0,'7-7-1999','03646475775','0354888654','PhuongMai1999@gmail.com',N'Phú Thọ'),
('KH05',N'Hoàng văn Nhật',1,'5-3-2001','036206736648','0378886542','HoangNhat2001@gmail.com',N'Nam Định')

-- LO?I PHÒNG
insert into LOAIPHONG(MALP,LoaiPhong,Gia,MoTa, SONGUOIO)
values('LP01',N'Phòng Thường','500000',N'Giường Đơn', 1),
('LP02',N'Vip','1000000',N'Giường Đơn',1),
('LP03',N'Hoàng Đế','2000000',N'Giường Đơn',1),
('LP04',N'Phòng Thường','800000',N'Giường Đôi', 2),
('LP05',N'Vip','2000000',N'Giường Đôi',2),
('LP06',N'Hoàng Đế','5000000',N'Giường Đôi',2)

--PHÒNG
insert into PHONG(MA_P,MALP,TinhTrang,Tang)
values('P01','LP01',N'Trống',1),
('P02','LP02',N'Trông',1),
('P03','LP03',N'Trống',2),
('P04','LP04',N'Trống',2),
('P05','LP05',N'Trống',3)	

-- D?CH V?
insert into DICHVU(MADV,TenDichVu,Gia,MoTa,LoaiDichVu)
values('DV01',N'Dịch Vụ Dọn Phòng','40000',N'Quét dọn phòng, sắp xếp lại đồ đạc',N'DV Thường+Vip'),
('DV02',N'Dịch Vụ Giặt Là','30000',N'Giặt Quần áo',N'DV Thường+Vip'),
('DV03',N'Dịch Vụ Ăn Uống','70000',N'Món Ăn Tự Chọn ở Quầy',N'DV Thường+Vip'),
('DV04',N'Dịch Vụ Quầy Bar','20000000',N'Tổ Chức Tiệc Đêm',N'DV VIP'),
('DV05',N'Dịch Vụ Xe Đưa Đón','50000',N'Đưa đón khách bằng xe khách sạn',N'DV Thường+Vip'),
('DV_ComBo1',N'Dịch Vụ Dọn Phòng+Giặt Là+Ăn Uống','140000',N'Dọn Phòng+Phục Vụ Ăn Uống',N'DV Thường+Vip')

-- HÓA Đơn
insert into HOADON(MAHD,MAKH,MANV,SoDienThoai,DiaChi,SoPhongDat,TongTienDV,TongTienPhong,TrangThai,NgayXuatDon,NgayThanhToan,TienCoc,TongTien,SoTienCanThanhToan)
values('HD01','KH01','NV02','0354233242',N'Nam Định',1,'40000','1040000','Đã Thanh Toán','07-19-2024','07-19-2024','100000','940000','940000'),
('HD02','KH02','NV03','0356785433',N'Hà Nội',1,'140000','1140000','Đã Thanh Toán','07-20-2024','07-20-2024','100000','1040000','1040000'),
('HD03','KH03','NV03','0378765522',N'Ninh Bình',1,'50000','1050000','Đã Thanh Toán','07-20-2024','07-20-2024','100000','950000','950000'),
('HD04','KH04','NV02','0398724533',N'Phú Thọ',1,'140000','1990000','Đã Thanh Toán','07-21-2024','07-21-2024','200000','1790000','1790000'),
('HD05','KH05','NV02','0373547774',N'Hải Dương',1,'140000','1990000','Đã Thanh Toán','07-22-2024','07-22-2024','200000','1790000','1790000')

-- đặt dịch vụ

insert into DATDICHVU(MA_DDV,MA_P,MADV,TenDichVu,SoLuong,Gia,NgayDat,TongTien,MaHD)
values('DDV01','P01','DV01',N'Dịch Vụ Dọn Phòng',1,'40000','7-18-2024','40000','HD01'),
('DDV02','P02','DV_ComBo1',N'Dịch Vụ Dọn Phòng+Giặt Là +Ăn Uống',1,'140000','7-19-2024','140000','HD02'),
('DDV03','P03','DV05',N'Dịch Vụ Xe Đưa Đón',1,'50000','7-19-2024','50000','HD03'),
('DDV04','P04','DV_ComBo1',N'Dịch Vụ Dọn Phòng+Giặt Là +Ăn Uống',1,'140000','7-20-2024','140000','HD04'),
('DDV05','P05','DV_ComBo1',N'Dịch Vụ Dọn Phòng+Giặt Là +Ăn Uống',1,'140000','7-21-2024','140000','HD05')

-- hóa đơn chi tiết
insert into HOADONCHITIET(MA_HDCT,MAHD,MA_P,CheckIn,CheckOut,TienPhong,NgayThanhToan)
values('HDCT01','HD01','P01','07-19-2024 14:00:00','07-20-2024 14:00:00','940000','07-20-2024'),
('HDCT02','HD02','P02','07-18-2024 14:00:00','07-19-2024 14:00:00','1040000','07-19-2024'),
('HDCT03','HD03','P03','07-20-2024 14:00:00','07-21-2024 14:00:00','950000','07-21-2024'),
('HDCT04','HD04','P04','07-21-2024 14:00:00','07-22-2024 14:00:00','1790000','07-22-2024'),
('HDCT05','HD05','P05','07-21-2024 14:00:00','07-22-2024 14:00:00','1790000','07-22-2024')
---------SELECT

SELECT * FROM TAIKHOAN
SELECT * FROM NHANVIEN
SELECT * FROM KHACHHANG
SELECT * FROM LOAIPHONG
SELECT * FROM PHONG
SELECT * FROM DICHVU
SELECT * FROM DATDICHVU
SELECT * FROM HOADON
SELECT * FROM HOADONCHITIET


