-- Tạo cơ sở dữ liệu



-- Tạo bảng vai trò
CREATE TABLE VaiTro (
    vai_tro_id INT IDENTITY(1,1) PRIMARY KEY,
    ten_vai_tro NVARCHAR(50) UNIQUE
);
GO

-- Bảng người dùng
CREATE TABLE NguoiDung (
    nguoi_dung_id INT IDENTITY(1,1) PRIMARY KEY,
    ten_dang_nhap NVARCHAR(50) NOT NULL UNIQUE,
    mat_khau NVARCHAR(255) NOT NULL,
    vai_tro_id INT,
    ngay_tao DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (vai_tro_id) REFERENCES VaiTro(vai_tro_id)
);
GO

-- Bảng dịch vụ
CREATE TABLE DichVu (
    dich_vu_id INT IDENTITY(1,1) PRIMARY KEY,
    ten_dich_vu NVARCHAR(100) NOT NULL,
    mo_ta NVARCHAR(MAX),
    gia DECIMAL(10, 2) NOT NULL, 
    thoi_gian INT NOT NULL CHECK (thoi_gian > 0), 
    ngay_tao DATETIME DEFAULT GETDATE()
);
GO

-- Bảng thợ cắt tóc
CREATE TABLE ThoCat (
    tho_cat_id INT IDENTITY(1,1) PRIMARY KEY,
    ho_ten NVARCHAR(100) NOT NULL,
    so_dien_thoai NVARCHAR(15) NOT NULL,
    ngay_tao DATETIME DEFAULT GETDATE()
);
GO

-- Bảng đặt lịch
CREATE TABLE DatLich (
    dat_lich_id INT IDENTITY(1,1) PRIMARY KEY,
    nguoi_dung_id INT NOT NULL,
    dich_vu_id INT NOT NULL,
    tho_cat_id INT NOT NULL,
    ngay_gio_dat DATETIME NOT NULL,
    trang_thai NVARCHAR(50) CHECK (trang_thai IN (N'Chờ duyệt', N'Đã duyệt', N'Bị từ chối', N'Hoàn thành')) DEFAULT N'Chờ duyệt',
    FOREIGN KEY (nguoi_dung_id) REFERENCES NguoiDung(nguoi_dung_id),
    FOREIGN KEY (dich_vu_id) REFERENCES DichVu(dich_vu_id),
    FOREIGN KEY (tho_cat_id) REFERENCES ThoCat(tho_cat_id)
);
GO

-- Thêm dữ liệu cho bảng VaiTro
INSERT INTO VaiTro (ten_vai_tro)
VALUES (N'Khách hàng'), (N'Nhân viên'), (N'Quản trị viên');
GO

-- Thêm dữ liệu cho bảng NguoiDung
INSERT INTO NguoiDung (ten_dang_nhap, mat_khau, vai_tro_id)
VALUES 
    (N'khachhang1', N'matkhau1', 1),
    (N'nhanvien1', N'matkhau2', 2),
    (N'admin', N'admin123', 3);
GO

-- Thêm dữ liệu cho bảng DichVu
INSERT INTO DichVu (ten_dich_vu, mo_ta, gia, thoi_gian)
VALUES 
    (N'Cắt tóc chuyên nghiệp', N'Đội ngũ chuyên gia với nhiều năm kinh nghiệm.', 150000, 30),
    (N'Chăm sóc tóc', N'Sản phẩm chất lượng cao cho mái tóc khỏe mạnh.', 50000, 20),
    (N'Nhuộm tóc sáng tạo', N'Màu tóc bền, đẹp và an toàn.', 150000, 30),
    (N'Uốn tóc tạo kiểu', N'Tạo kiểu tóc bồng bềnh, đẹp tự nhiên.', 50000, 20);
GO

-- Thêm dữ liệu cho bảng ThoCat
INSERT INTO ThoCat (ho_ten, so_dien_thoai)
VALUES 
    (N'Trần Văn A', N'0909123456'),
    (N'Nguyễn Thị B', N'0912345678');
GO

-- Thêm dữ liệu cho bảng DatLich
INSERT INTO DatLich (nguoi_dung_id, dich_vu_id, tho_cat_id, ngay_gio_dat, trang_thai)
VALUES 
    (1, 1, 1, '2024-10-20 10:00:00', N'Chờ duyệt'),
    (1, 2, 2, '2024-10-21 14:00:00', N'Chờ duyệt');
GO


-- SET IDENTITY_INSERT NguoiDung ON;
-- SET IDENTITY_INSERT DichVu ON;
-- SET IDENTITY_INSERT ThoCat ON;
-- SET IDENTITY_INSERT DatLich ON;
-- SET IDENTITY_INSERT VaiTro ON;
