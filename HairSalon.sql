-- Tạo cơ sở dữ liệu
CREATE DATABASE HairSalon;
GO

-- Sử dụng cơ sở dữ liệu
USE HairSalon;
GO

-- Bảng người dùng
CREATE TABLE NguoiDung (
    nguoi_dung_id INT IDENTITY(1,1) PRIMARY KEY,
    ten_dang_nhap NVARCHAR(50) NOT NULL UNIQUE,
    mat_khau NVARCHAR(255) NOT NULL,
    vai_tro NVARCHAR(50) CHECK (vai_tro IN (N'Khách', N'Khách hàng', N'Thợ cắt', N'Nhân viên', N'Quản lý', N'Quản trị viên')),
    ngay_tao DATETIME DEFAULT GETDATE()
);
GO

-- Bảng dịch vụ
CREATE TABLE DichVu (
    dich_vu_id INT IDENTITY(1,1) PRIMARY KEY,
    ten_dich_vu NVARCHAR(100) NOT NULL,
    mo_ta NVARCHAR(MAX),
    gia DECIMAL(10, 2) NOT NULL,
    thoi_gian INT NOT NULL, -- Thời gian dịch vụ tính bằng phút
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
    FOREIGN KEY (dich_vu_id) REFERENCES DichVu(dich_vu_id)
);
GO

-- Bảng thợ cắt
CREATE TABLE ThoCat (
    tho_cat_id INT IDENTITY(1,1) PRIMARY KEY,
    ten_tho NVARCHAR(100) NOT NULL,
    kinh_nghiem NVARCHAR(MAX),
    ngay_bat_dau DATETIME DEFAULT GETDATE()
);
GO

-- Bảng khách hàng
CREATE TABLE KhachHang (
    khach_hang_id INT IDENTITY(1,1) PRIMARY KEY,
    ho_ten NVARCHAR(100) NOT NULL,
    so_dien_thoai NVARCHAR(20) NOT NULL,
    email NVARCHAR(100),
    ngay_tao DATETIME DEFAULT GETDATE()
);
GO
