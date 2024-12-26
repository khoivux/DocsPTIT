USE btl_nhom26;
-- phim
create database btl_nhom26;
CREATE TABLE Phim(
    -- thuoc tinh
    MaPhim VARCHAR(10) NOT NULL,
    TenPhim VARCHAR(50) NOT NULL,
    ThoiLuong INT ,
    NgayKhoiChieu DATE ,
    DoanhThuUSD BIGINT ,
    -- khoa
    PRIMARY KEY (MaPhim)
);
INSERT INTO Phim VALUES
('P000001', 'Avengers: Endgame', 120, '2024-11-25',12000000),
('P000002', 'Captain Marvel', 120, '2024-11-26',3000000),
('P000003', 'Us', 120,'2024-11-27',2500000),
('P000004', 'How to Train Your Dragon: The Hidden World', 90,'2024-11-28',1000000),
('P000005', 'X-men: Dark Phoenix', 150, '2024-11-29',1700000),
('P000006', 'Alita: Battle Angel', 120,'2024-11-30',2000000),
('P000007', 'Glass', 120,'2024-12-01',2300000),
('P000008', 'Escape Room', 90,'2024-12-02',1200000),
('P000009', 'Happy Death Day 2U', 90,'2024-12-03',3400000),
('P000010', 'Cold Pursuit', 120, '2024-12-04',4500000),
('P000011', 'Green Book', 120, '2024-12-05',4500000),
('P000012', 'Ana and the Apocalypse', 90, '2024-11-25',2400000),
('P000013', 'Fantastic Beasts: The Crimes of Grindelwald', 150,'2024-11-26',3500000),
('P000014', 'Bohemian Rhapsody', 120, '2024-11-27',2300000),
('P000015', 'Robin Hood', 120, '2024-11-28', 2400000),
('P000016', 'Creed II', 90, '2024-11-29', 6000000),
('P000017', 'Fantastic Beasts and Where to Find Them', 150, '2024-11-30', 4000000),
('P000018', 'Diệp Vấn 3', 90, '2024-12-01', 3400000),
('P000019', 'Kungfu Panda 3', 120, '2024-12-02',5300000),
('P000020', 'Kungfu Panda 2', 90, '2024-12-03', 4500000),
('P000021', 'Kungfu Panda', 90, '2024-12-04', 5600000),
('P000022', 'How to Train Your Dragon 2', 120,'2024-12-05',3400000);

CREATE TABLE TheLoaiPhim(
	-- thuoc tinh
	TheLoai VARCHAR(12) NOT NULL,
	MaPhim VARCHAR(10) NOT NULL,
	-- khoa
	PRIMARY KEY(TheLoai, MaPhim),
	FOREIGN KEY(MaPhim) REFERENCES Phim(MaPhim) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO TheLoaiPhim VALUES
	('Hành động', 'P000001'),
	('Viễn tưởng', 'P000001'),
	('Phiêu lưu', 'P000001'),
	('Hành động', 'P000002'),
	('Viễn tưởng', 'P000002'),
	('Kinh dị', 'P000003'),
	('Khoa học', 'P000003'),
	('Hoạt hình', 'P000004'),
	('Phiêu lưu', 'P000004'),
	('Khoa học', 'P000004'),
	('Hành động', 'P000005'),
	('Viễn tưởng', 'P000005'),
	('Hành động', 'P000006'),
	('Khoa học', 'P000006'),
	('Kinh dị', 'P000007'),
	('Khoa học', 'P000007'),
	('Hành động', 'P000008'),
	('Khoa học', 'P000008'),
	('Hành động', 'P000009'),
	('Tâm lý', 'P000009'),
	('Hành động', 'P000010'),
	('Tâm lý', 'P000010'),
	('Hài hước', 'P000011'),
	('Tâm lý', 'P000011'),
	('Hành động', 'P000012'),
	('Kinh dị', 'P000012'),
	('Viễn tưởng', 'P000013'),
	('Phiêu lưu', 'P000013'),
	('Hài hước', 'P000014'),
	('Âm nhạc', 'P000014'),
	('Viễn tưởng', 'P000014'),
	('Phiêu lưu', 'P000015'),
	('Hành động', 'P000015'),
	('Hành động', 'P000016'),
	('Tâm lý', 'P000016'),
	('Viễn tưởng', 'P000017'),
	('Phiêu lưu', 'P000017'),
	('Hành động', 'P000018'),
	('Hài hước', 'P000018'),
	('Tình cảm', 'P000018'),
	('Hoạt hình', 'P000019'),
	('Gia đình', 'P000019'),
	('Hoạt hình', 'P000020'),
	('Gia đình', 'P000020'),
	('Hoạt hình', 'P000021'),
	('Gia đình', 'P000021'),
	('Hoạt hình', 'P000022'),
	('Phiêu lưu', 'P000022');
    
CREATE TABLE DaoDienPhim(
	-- thuoc tinh
	DaoDien VARCHAR(25) NOT NULL,
	MaPhim VARCHAR(10) NOT NULL,
	-- khoa
	PRIMARY KEY(DaoDien, MaPhim),
	FOREIGN KEY(MaPhim) REFERENCES Phim(MaPhim) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO DaoDienPhim VALUES
('Anthony Russo', 'P000001'),
('Joe Russo', 'P000001'),
('Anna Boden', 'P000002'),
('Ryan Fleck', 'P000002'),
('Jordan Peele', 'P000003'),
('Dean DeBlois', 'P000004'),
('Simon Kinberg', 'P000005'),
('Jennifer Lee', 'P000005'),
('Robert Rodriguez', 'P000006'),
('M. Night Shyamalan', 'P000007'),
('Adam Robitel', 'P000008'),
('Christopher Landon', 'P000009'),
('Hans Petter Moland', 'P000010'),
('Peter Farrelly', 'P000011'),
('John McPhail', 'P000012'),
('Chris Buck', 'P000012'),
('David Yates', 'P000013'),
('Bryan Singer', 'P000014'),
('Otto Bathurst', 'P000015'),
('Chris Sanders', 'P000015'),
('Steven Caple Jr.', 'P000016'),
('David Yates', 'P000017'),
('Wilson Yip', 'P000018'),
('Jennifer Yuh Nelson', 'P000019'),
('Jennifer Yuh Nelson', 'P000020'),
('Don Hall', 'P000020'),
('Mark Osborne', 'P000021'),
('Dean DeBlois', 'P000022');




-- phong chieu

CREATE TABLE Phong(
	-- thuoc tinh
	MaPhong VARCHAR(25) NOT NULL,
    TenPhong VARCHAR(50),
    LoaiPhong VARCHAR(50),
    Tang INT,
    SucChua INT,
    -- khoa
    PRIMARY KEY(MaPhong)
);
INSERT INTO Phong VALUES
('PH001', 'Phòng 1', 'IMAX', 1, 200),
('PH002', 'Phòng 2', '4DX', 1, 150),
('PH003', 'Phòng 3', 'Standard', 2, 100),
('PH004', 'Phòng 4', 'Standard', 2, 100),
('PH005', 'Phòng 5', '3D', 3, 120),
('PH006', 'Phòng 6', 'Standard', 3, 90),
('PH007', 'Phòng 7', 'IMAX', 1, 180),
('PH008', 'Phòng 8', '4DX', 2, 140),
('PH009', 'Phòng 9', 'VIP', 3, 80),
('PH010', 'Phòng 10', 'Standard', 2, 95);

-- ghe
CREATE TABLE Ghe(
	-- thuoc tinh
	MaGhe VARCHAR(12) NOT NULL,
	LoaiGhe VARCHAR(10) ,
    HangGhe VARCHAR(10),
    MaPhong VARCHAR (25) NOT NULL,
	-- khoa
	PRIMARY KEY(MaGhe, MaPhong),
	FOREIGN KEY(MaPhong) REFERENCES Phong(MaPhong) ON DELETE CASCADE ON UPDATE CASCADE
);
-- Dữ liệu cho 10 phòng
INSERT INTO Ghe VALUES
-- Phòng P001
('G001', 'Đơn', 'A - VIP', 'PH001'),
('G002', 'Đôi', 'B - VIP', 'PH001'),
('G003', 'Đơn', 'C - Thường', 'PH001'),
('G004', 'Đơn', 'C - Thường', 'PH001'),
-- Phòng P002
('G005', 'Đơn', 'A - VIP', 'PH002'),
('G006', 'Đơn', 'A - VIP', 'PH002'),
('G007', 'Đôi', 'B - Thường', 'PH002'),
('G008', 'Đôi', 'C - Thường', 'PH002'),
-- Phòng P003
('G009', 'Đơn', 'A - VIP', 'PH003'),
('G010', 'Đôi', 'B - Thường', 'PH003'),
('G011', 'Đơn', 'C - Thường', 'PH003'),
('G012', 'Đơn', 'D - VIP', 'PH003'),
-- Phòng P004
('G013', 'Đôi', 'A - VIP', 'PH004'),
('G014', 'Đơn', 'A - VIP', 'PH004'),
('G015', 'Đôi', 'B - Thường', 'PH004'),
('G016', 'Đơn', 'C - Thường', 'PH004'),
-- Phòng P005
('G017', 'Đơn', 'A - VIP', 'PH005'),
('G018', 'Đơn', 'A - VIP', 'PH005'),
('G019', 'Đôi', 'B - Thường', 'PH005'),
('G020', 'Đơn', 'C - Thường', 'PH005'),
-- Phòng P006
('G021', 'Đơn', 'A - VIP', 'PH006'),
('G022', 'Đơn', 'A - VIP', 'PH006'),
('G023', 'Đôi', 'B - Thường', 'PH006'),
('G024', 'Đơn', 'C - Thường', 'PH006'),
-- Phòng P007
('G025', 'Đơn', 'A - VIP', 'PH007'),
('G026', 'Đơn', 'A - VIP', 'PH007'),
('G027', 'Đôi', 'B - Thường', 'PH007'),
('G028', 'Đơn', 'C - Thường', 'PH007'),
-- Phòng P008
('G029', 'Đơn', 'A - VIP', 'PH008'),
('G030', 'Đôi', 'B - Thường', 'PH008'),
('G031', 'Đôi', 'B - Thường', 'PH008'),
('G032', 'Đơn', 'C - Thường', 'PH008'),
-- Phòng P009
('G033', 'Đơn', 'A - VIP', 'PH009'),
('G034', 'Đôi', 'B - Thường', 'PH009'),
('G035', 'Đôi', 'B - Thường', 'PH009'),
('G036', 'Đơn', 'C - Thường', 'PH009'),
-- Phong P010
('G037', 'Đơn', 'A - VIP', 'PH010'),
('G038', 'Đơn', 'A - VIP', 'PH010'),
('G039', 'Đôi', 'B - Thường', 'PH010'),
('G040', 'Đơn', 'C - Thường', 'PH010');

-- san pham
CREATE TABLE SanPham(
	-- thuoc tinh
	MaSanPham VARCHAR(8) NOT NULL,
	TenSanPham VARCHAR(35),
	Gia INT,

	-- khoa
	PRIMARY KEY (MaSanPham)
);
INSERT INTO SanPham VALUES
('SP001', 'Nuoc cam', 15000),
('SP002', 'Tra chanh', 10000),
('SP003', 'Pesi', 15000),
('SP004', 'Coca Cola', 15000),
('SP005', 'Bong Ngo Thuong M', 30000),
('SP006', 'Bong Ngo Thuong L', 40000),
('SP007', 'Bong Ngo Phomai Muoi M', 40000),
('SP008', 'Bong Ngo Phomai Muoi L', 50000);

-- khach hang:
CREATE TABLE Khachhang(
	MaKhachHang VARCHAR(50) NOT NULL,
    HoTen VARCHAR(50),
    NgaySinh DATE,
    Sdt VARCHAR(50),
    Email VARCHAR(50),
    
    PRIMARY KEY(MaKhachHang),
    
    CHECK(Email LIKE '%@gmail.com')
);

INSERT INTO Khachhang VALUES
('KH001', 'Nguyễn Văn An', '1999-05-15', '0912345678', 'nguyenvanan@gmail.com'),
('KH002', 'Trần Thị Bích', '1998-08-22', '0938765432', 'tranthibich@gmail.com'),
('KH003', 'Lê Văn Cường', '2004-12-01', '0923456789', 'levancuong@gmail.com'),
('KH004', 'Phạm Văn Dũng', '2003-07-09', '0965432109', 'phamvandung@gmail.com'),
('KH005', 'Hoàng Thị Hoa', '2004-03-30', '0943210987', 'hoangthihoa@gmail.com'),
('KH006', 'Đặng Văn Phúc', '2000-06-12', '0912345555', 'dangvanphuc@gmail.com'),
('KH007', 'Ngô Thị Lệ', '2001-11-11', '0936789123', 'ngothile@gmail.com'),
('KH008', 'Bùi Văn Hòa', '2002-02-02', '0921123344', 'buivanhoa@gmail.com'),
('KH009', 'Vũ Thị Linh', '2001-09-29', '0912349988', 'vuthilinh@gmail.com'),
('KH010', 'Phan Văn Khánh', '1999-04-18', '0956789456', 'phanvankhanh@gmail.com');


-- Nhan vien
CREATE TABLE NhanVien(
	MaNhanVien VARCHAR(50) NOT NULL,
    HoTen VARCHAR(50),
    NgaySinh DATE,
    Sdt VARCHAR(50),
    Email VARCHAR(50),
    ViTri VARCHAR(50),
    
    PRIMARY KEY(MaNhanVien),
    
    CHECK(Email LIKE '%@gmail.com')
);

INSERT INTO NhanVien VALUES
('NV001', 'Lê Văn Tài', '1990-05-15', '0912345678', 'levantai@gmail.com', 'Quản lý'),
('NV002', 'Trần Văn Thắng', '2002-08-22', '0938765432', 'tranvanthang@gmail.com', 'Nhân viên bán vé'),
('NV003', 'Ngô Thị Lan', '1992-12-01', '0923456789', 'ngothilan@gmail.com', 'Kỹ thuật viên'),
('NV004', 'Đặng Hữu Phúc', '2000-07-09', '0965432109', 'danghuuphuc@gmail.com', 'Nhân viên phục vụ'),
('NV005', 'Phạm Vũ Bình', '2001-03-30', '0943210987', 'phamvubinh@gmail.com',  'Nhân viên kiểm soát vé'),
('NV006', 'Trần Văn Khải', '2001-06-12', '0912345555', 'tranvankhai@gmail.com',  'Nhân viên bán vé'),
('NV007', 'Vũ Thị Thanh', '1995-11-11', '0936789123', 'vuthithanh@gmail.com',  'Kế toán'),
('NV008', 'Bùi Quang Nam', '1991-02-02', '0921123344', 'buiquangnam@gmail.com',  'Quản lý'),
('NV009', 'Nguyễn Hữu Bảo', '2004-09-29', '0912349988', 'nguyenhuubao@gmail.com', 'Nhân viên phục vụ'),
('NV010', 'Phan Thanh Sơn', '1992-04-18', '0956789456', 'phanthanhson@gmail.com', 'Nhân viên kỹ thuật'),
('NV011', 'Lê Thị Thu', '2003-11-22', '0987789456', 'lethithu@gmail.com', 'Nhân viên bán vé'),
('NV012', 'Hoàng Văn Quý', '1990-07-13', '0913445567', 'hoangvanquy@gmail.com',  'Quản lý'),
('NV013', 'Phạm Minh Triết', '1992-01-19', '0945543212', 'phamminhtriet@gmail.com', 'Kỹ thuật viên'),
('NV014', 'Lê Hữu Phước', '2001-09-05', '0912325654', 'lehuuphuoc@gmail.com',  'Nhân viên phục vụ'),
('NV015', 'Nguyễn Nhật Hạ', '2002-06-30', '0923675894', 'nguyennhatha@gmail.com',  'Nhân viên kiểm soát vé'),
('NV016', 'Đinh Đức Lợi', '2003-03-21', '0955674891', 'dinhducloi@gmail.com', 'Nhân viên bán vé'),
('NV017', 'Nguyễn Thị Kim', '1993-04-04', '0975673442', 'nguyenthikim@gmail.com', 'Kế toán'),
('NV018', 'Phạm Văn Quang', '1992-10-11', '0916567889', 'phamvanquang@gmail.com', 'Nhân viên kỹ thuật'),
('NV019', 'Trần Thị Thuỳ', '2001-12-15', '0947663445', 'tranthithuy@gmail.com','Nhân viên bán vé'),
('NV020', 'Bùi Đức Minh', '1993-10-20', '0972347788', 'buiminhduc@gmail.com', 'Quản lý');

-- nhan vien quan ly
CREATE TABLE NhanVienQuanLy(
	MaQuanLY VARCHAR(50),
    LuongCung INT,
    
    PRIMARY KEY (MaQuanLy),
    FOREIGN KEY(MaQuanLy) REFERENCES NhanVien(MaNhanVien) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO NhanVienQuanLy VALUES
('NV001',2000000),
('NV008',2000000),
('NV012',2000000),
('NV020',2000000);


-- nhan vien khac
CREATE TABLE NhanVienThuong(
	MaNVThuong VARCHAR(50),
    LuongTheoGio INT,
    
    PRIMARY KEY (MaNVThuong),
    FOREIGN KEY(MaNVThuong) REFERENCES NhanVien(MaNhanVien) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO NhanVienThuong VALUES
('NV002',25000),
('NV003',30000),
('NV004',15000),
('NV005',20000),
('NV006',25000),
('NV007',30000),
('NV009',15000),
('NV010',30000),
('NV011',25000),
('NV013',30000),
('NV014',15000),
('NV015',20000),
('NV016',25000),
('NV017',30000),
('NV018',30000),
('NV019',25000);


-- loai ca lam
CREATE TABLE LoaiCaLam(
	MaLoaiCaLam VARCHAR(50) NOT NULL,
    ThoiGianBatDau TIME,
    ThoiGianKetThuc TIME,
    
    PRIMARY KEY (MaLoaiCaLam),
    
    CHECK (ThoiGianBatDau < ThoiGianKetThuc)
);

INSERT INTO LoaiCaLam VALUES
('CaSang', '08:00:00', '12:00:00'),
('CaChieu', '13:00:00', '17:00:00'),
('CaToi', '18:00:00', '22:00:00');

-- ca lam viec
CREATE TABLE CaLam(
	MaCaLam VARCHAR(50) NOT NULL,
    MaLoaiCaLam VARCHAR(50) NOT NULL,
    Ngay DATE,
    
    PRIMARY KEY(MaCaLam),
    FOREIGN KEY(MaLoaiCaLam) REFERENCES LoaiCaLam(MaLoaiCaLam) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO CaLam VALUES
('CL001', 'CaSang', '2024-11-25'),
('CL002', 'CaChieu', '2024-11-25'),
('CL003', 'CaToi', '2024-11-25'),
('CL004', 'CaSang', '2024-11-26'),
('CL005', 'CaChieu', '2024-11-26'),
('CL006', 'CaToi', '2024-11-26'),
('CL007', 'CaSang', '2024-11-27'),
('CL008', 'CaChieu', '2024-11-27'),
('CL009', 'CaToi', '2024-11-27'),
('CL010', 'CaSang', '2024-11-28'),
('CL011', 'CaChieu', '2024-11-28'),
('CL012', 'CaToi', '2024-11-28'),
('CL013', 'CaSang', '2024-11-29'),
('CL014', 'CaChieu', '2024-11-29'),
('CL015', 'CaToi', '2024-11-29'),
('CL016', 'CaSang', '2024-11-30'),
('CL017', 'CaChieu', '2024-11-30'),
('CL018', 'CaToi', '2024-11-30'),
('CL019', 'CaSang', '2024-12-01'),
('CL020', 'CaChieu', '2024-12-01'),
('CL021', 'CaToi', '2024-12-01'),
('CL022', 'CaSang', '2024-12-02'),
('CL023', 'CaChieu', '2024-12-02'),
('CL024', 'CaToi', '2024-12-02'),
('CL025', 'CaSang', '2024-12-03'),
('CL026', 'CaChieu', '2024-12-03'),
('CL027', 'CaToi', '2024-12-03'),
('CL028', 'CaSang', '2024-12-04'),
('CL029', 'CaChieu', '2024-12-04'),
('CL030', 'CaToi', '2024-12-04'),
('CL031', 'CaSang', '2024-12-05'),
('CL032', 'CaChieu', '2024-12-05'),
('CL033', 'CaToi', '2024-12-05');



-- hoa don 
CREATE TABLE HoaDon(
	MaHoaDon VARCHAR(50) NOT NULL,
    HinhThucThanhToan VARCHAR(50),
    ThanhTien INT,
    ThoiGianThanhToan DATETIME,
    MaKhachHang VARCHAR(50),
    
    PRIMARY KEY(MaHoaDon),
    FOREIGN KEY(MaKhachHang) REFERENCES KhachHang(MaKhachHang) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO HoaDon VALUES 
('HD001', 'Chuyển khoản', 135000, '2024-11-25 09:45:00', 'KH001'),
('HD002', 'Tiền mặt', 120000, '2024-11-25 13:15:00', 'KH002'),
('HD003', 'Chuyển khoản', 230000, '2024-11-26 14:00:00', 'KH003'),
('HD004', 'Tiền mặt', 190000, '2024-11-26 19:15:00', 'KH004'),
('HD005', 'Chuyển khoản', 295000, '2024-11-27 08:40:00', 'KH005'),
('HD006', 'Tiền mặt', 220000, '2024-11-27 19:10:00', 'KH006'),
('HD007', 'Chuyển khoản', 105000, '2024-11-28 13:45:00', 'KH007'),
('HD008', 'Tiền mặt', 220000, '2024-11-28 19:40:00', 'KH008'),
('HD009', 'Chuyển khoản', 315000, '2024-11-29 08:50:00', 'KH009'),
('HD010', 'Tiền mặt', 255000, '2024-11-29 19:15:00', 'KH010'),
('HD011', 'Chuyển khoản', 140000, '2024-11-30 13:45:00', 'KH001'),
('HD012', 'Tiền mặt', 135000, '2024-11-30 18:45:00', 'KH002'),
('HD013', 'Chuyển khoản', 370000, '2024-12-01 14:35:00', 'KH003'),
('HD014', 'Tiền mặt', 250000, '2024-12-01 19:15:00', 'KH004'),
('HD015', 'Chuyển khoản', 180000, '2024-12-02 09:00:00', 'KH005'),
('HD016', 'Tiền mặt', 295000, '2024-12-02 18:15:00', 'KH006'),
('HD017', 'Chuyển khoản', 330000, '2024-12-03 08:00:00', 'KH007'),
('HD018', 'Tiền mặt', 130000, '2024-12-03 13:30:00', 'KH008'),
('HD019', 'Chuyển khoản', 325000, '2024-12-04 18:50:00', 'KH009'),
('HD020', 'Tiền mặt', 220000, '2024-12-05 19:25:00', 'KH010');


-- bao gom cua hon don va san pham
CREATE TABLE BaoGom(
    MaHoaDon VARCHAR(50) NOT NULL,
    MaSanPham VARCHAR(50) NOT NULL,
    SoLuong INT,
    
    PRIMARY KEY (MaHoaDon, MaSanPham),
    FOREIGN KEY (MaHoaDon) REFERENCES HoaDon(MaHoaDon) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (MaSanPham) REFERENCES SanPham(MaSanPham) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO BaoGom VALUES
('HD001', 'SP001', 2),
('HD001', 'SP003', 1),
('HD002', 'SP002', 3),
('HD002', 'SP005', 1),
('HD003', 'SP004', 2),
('HD003', 'SP006', 1),
('HD004', 'SP007', 2),
('HD004', 'SP008', 1),
('HD005', 'SP003', 3),
('HD005', 'SP008', 2),
('HD006', 'SP001', 1),
('HD006', 'SP004', 2),
('HD007', 'SP002', 1),
('HD007', 'SP007', 1),
('HD008', 'SP006', 2),
('HD008', 'SP008', 1),
('HD009', 'SP003', 1),
('HD009', 'SP005', 2),
('HD010', 'SP004', 3),
('HD010', 'SP007', 1),
('HD011', 'SP002', 1),
('HD011', 'SP007', 1),
('HD012', 'SP001', 2),
('HD012', 'SP008', 1),
('HD013', 'SP003', 1),
('HD013', 'SP008', 2),
('HD014', 'SP001', 1),
('HD014', 'SP003', 2),
('HD015', 'SP004', 1),
('HD015', 'SP007', 3),
('HD016', 'SP005', 1),
('HD016', 'SP008', 2),
('HD017', 'SP002', 3),
('HD017', 'SP006', 1),
('HD018', 'SP003', 1),
('HD018', 'SP004', 2),
('HD019', 'SP001', 2),
('HD019', 'SP006', 1),
('HD020', 'SP005', 2),
('HD020', 'SP006', 1);

-- lam bao gom ca lam va nhan vien
CREATE TABLE Lam(
	MaNV VARCHAR(50) NOT NULL,
    MaCaLam VARCHAR(50) NOT NULL,
    
    PRIMARY KEY (MaNV, MaCaLam),
    FOREIGN KEY (MaNV) REFERENCES NhanVienThuong(MaNVThuong) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (MaCaLam) REFERENCES CaLam(MaCaLam) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO Lam VALUES
('NV002','CL001'),
('NV002','CL002'),
('NV002','CL007'),
('NV002','CL012'),
('NV003','CL003'),
('NV003','CL007'),
('NV003','CL020'),
('NV004','CL004'),
('NV004','CL014'),
('NV004','CL020'),
('NV004','CL024'),
('NV004','CL030'),
('NV005','CL001'),
('NV005','CL011'),
('NV005','CL021'),
('NV006','CL002'),
('NV006','CL011'),
('NV006','CL012'),
('NV006','CL022'),
('NV007','CL007'),
('NV007','CL017'),
('NV009','CL001'),
('NV009','CL009'),
('NV009','CL019'),
('NV009','CL029'),
('NV009','CL033'),
('NV010','CL004'),
('NV010','CL005'),
('NV010','CL008'),
('NV011','CL005'),
('NV011','CL006'),
('NV011','CL007'),
('NV011','CL017'),
('NV013','CL002'),
('NV013','CL008'),
('NV013','CL009'),
('NV013','CL018'),
('NV015','CL005'),
('NV015','CL013'),
('NV015','CL023'),
('NV015','CL027'),
('NV015','CL028'),
('NV016','CL015'),
('NV016','CL016'),
('NV016','CL025'),
('NV016','CL026'),
('NV017','CL027'),
('NV017','CL030'),
('NV017','CL031'),
('NV018','CL025'),
('NV018','CL026'),
('NV018','CL030'),
('NV018','CL031'),
('NV018','CL032'),
('NV018','CL033'),
('NV019','CL005'),
('NV019','CL015'),
('NV019','CL025'),
('NV019','CL030'),
('NV019','CL033');

-- suat chieu
CREATE TABLE SuatChieu(
	MaSuatChieu VARCHAR(50) NOT NULL,
    NgayChieu DATE,
    GioBatDau TIME,
    GioKetThuc TIME,
    MaQuanLy VARCHAR(50) NOT NULL,
    MaPhim VARCHAR(50) NOT NULL,
    MaPhong VARCHAR(50) NOT NULL,
    
    PRIMARY KEY(MaSuatChieu),
    FOREIGN KEY (MaQuanLy) REFERENCES NhanVienQuanLy(MaQuanLy) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (MaPhim) REFERENCES Phim(MaPhim) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (MaPhong) REFERENCES Phong(MaPhong) ON DELETE CASCADE ON UPDATE CASCADE,
    
    CHECK (GioBatDau < GioKetThuc)
);

INSERT INTO SuatChieu VALUES
('SC001', '2024-11-25', '10:00:00', '12:00:00', 'NV001', 'P000001', 'PH001'),
('SC002', '2024-11-25', '13:30:00', '15:30:00', 'NV008', 'P000001', 'PH002'),
('SC003', '2024-11-25', '18:00:00', '19:30:00', 'NV012', 'P000012', 'PH003'),
('SC004', '2024-11-25', '09:00:00', '10:30:00', 'NV020', 'P000012', 'PH004'),
('SC005', '2024-11-26', '08:00:00', '10:00:00', 'NV020', 'P000002', 'PH005'),
('SC006', '2024-11-26', '14:30:00', '16:30:00', 'NV001', 'P000002', 'PH006'),
('SC007', '2024-11-26', '09:00:00', '11:30:00', 'NV008', 'P000013', 'PH007'),
('SC008', '2024-11-26', '19:30:00', '22:00:00', 'NV012', 'P000013', 'PH008'),
('SC009', '2024-11-27', '09:00:00', '11:00:00', 'NV020', 'P000003', 'PH009'),
('SC010', '2024-11-27', '14:30:00', '16:30:00', 'NV020', 'P000003', 'PH010'),
('SC011', '2024-11-27', '13:00:00', '15:00:00', 'NV001', 'P000014', 'PH001'),
('SC012', '2024-11-27', '19:30:00', '21:30:00', 'NV008', 'P000014', 'PH002'),
('SC013', '2024-11-28', '08:00:00', '09:30:00', 'NV012', 'P000004', 'PH003'),
('SC014', '2024-11-28', '20:00:00', '21:30:00', 'NV020', 'P000004', 'PH004'),
('SC015', '2024-11-28', '09:30:00', '11:30:00', 'NV020', 'P000015', 'PH005'),
('SC016', '2024-11-28', '14:00:00', '16:00:00', 'NV001', 'P000015', 'PH001'),
('SC017', '2024-11-29', '08:00:00', '10:30:00', 'NV008', 'P000005', 'PH002'),
('SC018', '2024-11-29', '13:00:00', '15:30:00', 'NV020', 'P000005', 'PH003'),
('SC019', '2024-11-29', '09:00:00', '10:30:00', 'NV020', 'P000016', 'PH004'),
('SC020', '2024-11-29', '19:30:00', '21:00:00', 'NV001', 'P000016', 'PH005'),
('SC021', '2024-11-30', '14:00:00', '16:00:00', 'NV001', 'P000006', 'PH006'),
('SC022', '2024-11-30', '19:30:00', '21:30:00', 'NV008', 'P000006', 'PH007'),
('SC023', '2024-11-30', '08:00:00', '10:30:00', 'NV012', 'P000017', 'PH008'),
('SC024', '2024-11-30', '19:00:00', '21:30:00', 'NV020', 'P000017', 'PH009'),
('SC025', '2024-12-01', '15:00:00', '17:00:00', 'NV008', 'P000007', 'PH010'),
('SC026', '2024-12-01', '18:00:00', '20:00:00', 'NV001', 'P000007', 'PH001'),
('SC027', '2024-12-01', '14:00:00', '15:30:00', 'NV008', 'P000018', 'PH002'),
('SC028', '2024-12-01', '19:30:00', '21:00:00', 'NV012', 'P000018', 'PH003'),
('SC029', '2024-12-02', '13:00:00', '14:30:00', 'NV020', 'P000008', 'PH004'),
('SC030', '2024-12-02', '18:00:00', '19:30:00', 'NV020', 'P000008', 'PH005'),
('SC031', '2024-12-02', '09:30:00', '11:30:00', 'NV001', 'P000019', 'PH006'),
('SC032', '2024-12-02', '18:30:00', '20:30:00', 'NV008', 'P000019', 'PH007'),
('SC033', '2024-12-03', '09:00:00', '10:30:00', 'NV012', 'P000009', 'PH008'),
('SC034', '2024-12-03', '14:00:00', '15:30:00', 'NV020', 'P000009', 'PH009'),
('SC035', '2024-12-03', '08:30:00', '10:00:00', 'NV001', 'P000020', 'PH010'),
('SC036', '2024-12-03', '14:00:00', '15:30:00', 'NV001', 'P000020', 'PH001'),
('SC037', '2024-12-04', '13:00:00', '15:00:00', 'NV008', 'P000010', 'PH002'),
('SC038', '2024-12-04', '19:00:00', '21:00:00', 'NV012', 'P000010', 'PH003'),
('SC039', '2024-12-04', '18:00:00', '19:30:00', 'NV020', 'P000021', 'PH004'),
('SC040', '2024-12-04', '20:00:00', '21:30:00', 'NV020', 'P000021', 'PH005'),
('SC041', '2024-12-05', '10:00:00', '12:00:00', 'NV001', 'P000011', 'PH006'),
('SC042', '2024-12-05', '14:00:00', '16:00:00', 'NV008', 'P000011', 'PH007'),
('SC043', '2024-12-05', '14:00:00', '16:00:00', 'NV012', 'P000022', 'PH008'),
('SC044', '2024-12-05', '19:30:00', '21:30:00', 'NV001', 'P000022', 'PH009');

-- ve
CREATE TABLE Ve(
	MaVe VARCHAR(50) NOT NULL,
    Gia INT,
    MaNVBanve VARCHAR(50) NOT NULL,
    MaSuatChieu VARCHAR(50) NOT NULL,
    MaHoaDon VARCHAR(50) NOT NULL,
    MaGhe VARCHAR(50) NOT NULL,
    MaPhong VARCHAR (50) NOT NULL,
    
    PRIMARY KEY(MaVe),
    FOREIGN KEY (MaNVBanve) REFERENCES NhanVienThuong(MaNVThuong) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (MaSuatChieu) REFERENCES SuatChieu(MaSuatChieu) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (MaHoaDon) REFERENCES HoaDon(MaHoaDon) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (MaGhe, MaPhong) REFERENCES Ghe(MaGhe, MaPhong) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO Ve VALUES
('V001', 45000, 'NV002', 'SC001', 'HD001', 'G002','PH001'),
('V002', 45000, 'NV002', 'SC001', 'HD001', 'G002','PH001'),
('V003', 60000, 'NV006', 'SC002', 'HD002', 'G005','PH002'),
('V004', 85000, 'NV011', 'SC006', 'HD003', 'G023','PH006'),
('V005', 85000, 'NV011', 'SC006', 'HD003', 'G023','PH006'),
('V006', 60000, 'NV016', 'SC008', 'HD004', 'G032','PH008'),
('V007', 50000, 'NV019', 'SC009', 'HD005', 'G034','PH009'),
('V008', 50000, 'NV019', 'SC009', 'HD005', 'G034','PH009'),
('V009', 50000, 'NV019', 'SC009', 'HD005', 'G036','PH009'),
('V010', 80000, 'NV002', 'SC012', 'HD006', 'G007','PH002'),
('V011', 80000, 'NV002', 'SC012', 'HD006', 'G007','PH002'),
('V012', 55000, 'NV006', 'SC016', 'HD007', 'G001','PH001'),
('V013', 45000, 'NV011', 'SC014', 'HD008', 'G015','PH004'),
('V014', 45000, 'NV011', 'SC014', 'HD008', 'G015','PH004'),
('V015', 60000, 'NV016', 'SC019', 'HD009', 'G013','PH004'),
('V016', 60000, 'NV016', 'SC019', 'HD009', 'G013','PH004'),
('V017', 60000, 'NV016', 'SC019', 'HD009', 'G015','PH004'),
('V018', 60000, 'NV016', 'SC019', 'HD009', 'G015','PH004'),
('V019', 85000, 'NV019', 'SC020', 'HD010', 'G019','PH005'),
('V020', 85000, 'NV019', 'SC020', 'HD010', 'G019','PH005'),
('V021', 45000, 'NV002', 'SC021', 'HD011', 'G023','PH006'),
('V022', 45000, 'NV002', 'SC021', 'HD011', 'G023','PH006'),
('V023', 55000, 'NV006', 'SC024', 'HD012', 'G036','PH009'),
('V024', 85000, 'NV011', 'SC025', 'HD013', 'G037','PH010'),
('V025', 85000, 'NV011', 'SC025', 'HD013', 'G038','PH010'),
('V026', 85000, 'NV011', 'SC025', 'HD013', 'G040','PH010'),
('V027', 60000, 'NV016', 'SC028', 'HD014', 'G010','PH003'),
('V028', 60000, 'NV016', 'SC028', 'HD014', 'G010','PH003'),
('V029', 45000, 'NV019', 'SC031', 'HD015', 'G021','PH006'),
('V030', 55000, 'NV002', 'SC032', 'HD016', 'G025',"PH007"),
('V031', 55000, 'NV002', 'SC032', 'HD016', 'G027',"PH007"),
('V032', 55000, 'NV002', 'SC032', 'HD016', 'G027','PH007'),
('V033', 65000, 'NV006', 'SC035', 'HD017', 'G038','PH010'),
('V034', 65000, 'NV006', 'SC035', 'HD017', 'G039','PH010'),
('V035', 65000, 'NV006', 'SC035', 'HD017', 'G039','PH010'),
('V036', 65000, 'NV006', 'SC035', 'HD017', 'G040','PH010'),
('V037', 85000, 'NV011', 'SC036', 'HD018', 'G002','PH001'),
('V038', 85000, 'NV016', 'SC038', 'HD019', 'G010','PH003'),
('V039', 85000, 'NV016', 'SC038', 'HD019', 'G010','PH003'),
('V040', 85000, 'NV016', 'SC038', 'HD019', 'G011','PH003'),
('V041', 60000, 'NV019', 'SC044', 'HD020', 'G034','PH009'),
('V042', 60000, 'NV019', 'SC044', 'HD020', 'G034','PH009');
INSERT INTO Ve VALUES
('V001', 45000, 'NV002', 'SC001', 'HD001', 'G002','PH001'),
('V002', 45000, 'NV002', 'SC001', 'HD001', 'G002','PH001'),
('V003', 60000, 'NV006', 'SC002', 'HD002', 'G005','PH002'),
('V004', 85000, 'NV011', 'SC006', 'HD003', 'G023','PH006'),
('V005', 85000, 'NV011', 'SC006', 'HD003', 'G023','PH006'),
('V006', 60000, 'NV016', 'SC008', 'HD004', 'G032','PH008'),
('V007', 50000, 'NV019', 'SC009', 'HD005', 'G034','PH009'),
('V008', 50000, 'NV019', 'SC009', 'HD005', 'G034','PH009'),
('V009', 50000, 'NV019', 'SC009', 'HD005', 'G036','PH009'),
('V010', 80000, 'NV002', 'SC012', 'HD006', 'G007','PH002'),
('V011', 80000, 'NV002', 'SC012', 'HD006', 'G007','PH002'),
('V012', 55000, 'NV006', 'SC016', 'HD007', 'G001','PH001'),
('V013', 45000, 'NV011', 'SC014', 'HD008', 'G015','PH004'),
('V014', 45000, 'NV011', 'SC014', 'HD008', 'G015','PH004'),
('V015', 60000, 'NV016', 'SC019', 'HD009', 'G013','PH004'),
('V016', 60000, 'NV016', 'SC019', 'HD009', 'G013','PH004'),
('V017', 60000, 'NV016', 'SC019', 'HD009', 'G015','PH004'),
('V018', 60000, 'NV016', 'SC019', 'HD009', 'G015','PH004'),
('V019', 85000, 'NV019', 'SC020', 'HD010', 'G019','PH005'),
('V020', 85000, 'NV019', 'SC020', 'HD010', 'G019','PH005'),
('V021', 45000, 'NV002', 'SC021', 'HD011', 'G023','PH006'),
('V022', 45000, 'NV002', 'SC021', 'HD011', 'G023','PH006'),
('V023', 55000, 'NV006', 'SC024', 'HD012', 'G036','PH009'),
('V024', 85000, 'NV011', 'SC025', 'HD013', 'G037','PH010'),
('V025', 85000, 'NV011', 'SC025', 'HD013', 'G038','PH010'),
('V026', 85000, 'NV011', 'SC025', 'HD013', 'G040','PH010'),
('V027', 60000, 'NV016', 'SC028', 'HD014', 'G010','PH003'),
('V028', 60000, 'NV016', 'SC028', 'HD014', 'G010','PH003'),
('V029', 45000, 'NV019', 'SC031', 'HD015', 'G021','PH006'),
('V030', 55000, 'NV002', 'SC032', 'HD016', 'G025',"PH007"),
('V031', 55000, 'NV002', 'SC032', 'HD016', 'G027',"PH007"),
('V032', 55000, 'NV002', 'SC032', 'HD016', 'G027','PH007'),
('V033', 65000, 'NV006', 'SC035', 'HD017', 'G038','PH010'),
('V034', 65000, 'NV006', 'SC035', 'HD017', 'G039','PH010'),
('V035', 65000, 'NV006', 'SC035', 'HD017', 'G039','PH010'),
('V036', 65000, 'NV006', 'SC035', 'HD017', 'G040','PH010'),
('V037', 85000, 'NV011', 'SC036', 'HD018', 'G002','PH001'),
('V038', 85000, 'NV016', 'SC038', 'HD019', 'G010','PH003'),
('V039', 85000, 'NV016', 'SC038', 'HD019', 'G010','PH003'),
('V040', 85000, 'NV016', 'SC038', 'HD019', 'G011','PH003'),
('V041', 60000, 'NV019', 'SC044', 'HD020', 'G034','PH009'),
('V042', 60000, 'NV019', 'SC044', 'HD020', 'G034','PH009');
