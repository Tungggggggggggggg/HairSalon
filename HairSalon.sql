-- T?o c? s? d? li?u
USE HairSalon;
GO

-- B?ng ng??i dùng
CREATE TABLE NguoiDung (
    nguoi_dung_id INT IDENTITY(1,1) PRIMARY KEY,
    ten_dang_nhap NVARCHAR(50) NOT NULL UNIQUE,
    mat_khau NVARCHAR(255) NOT NULL,
    vai_tro NVARCHAR(50) CHECK (vai_tro IN ('Khách', 'Khách hàng', 'Th? c?t', 'Nhân viên', 'Qu?n lý', 'Qu?n tr? viên')),
    ngay_tao DATETIME DEFAULT GETDATE()
);
GO

-- B?ng d?ch v?
CREATE TABLE DichVu (
    dich_vu_id INT IDENTITY(1,1) PRIMARY KEY,
    ten_dich_vu NVARCHAR(100) NOT NULL,
    mo_ta NVARCHAR(MAX),
    gia DECIMAL(10, 2) NOT NULL,
    thoi_gian INT NOT NULL, -- Th?i gian d?ch v? tính b?ng phút
    ngay_tao DATETIME DEFAULT GETDATE()
);
GO

-- B?ng ??t l?ch
CREATE TABLE DatLich (
    dat_lich_id INT IDENTITY(1,1) PRIMARY KEY,
    nguoi_dung_id INT NOT NULL,
    dich_vu_id INT NOT NULL,
    tho_cuat_id INT NOT NULL,
    ngay_gio_dat DATETIME NOT NULL,
    trang_thai NVARCHAR(50) CHECK (trang_thai IN ('Ch? duy?t', '?ã duy?t', 'B? t? ch?i', 'Hoàn thành')) DEFAULT 'Ch? duy?t',
    phan_hoi NVARCHAR(MAX),
    diem_loyalty INT DEFAULT 0,
    ngay_tao DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (nguoi_dung_id) REFERENCES NguoiDung(nguoi_dung_id),
    FOREIGN KEY (dich_vu_id) REFERENCES DichVu(dich_vu_id),
    FOREIGN KEY (tho_cuat_id) REFERENCES NguoiDung(nguoi_dung_id) -- Th? c?t c?ng là ng??i dùng
);
GO

-- B?ng theo dõi doanh thu
CREATE TABLE DoanhThu (
    doanh_thu_id INT IDENTITY(1,1) PRIMARY KEY,
    salon_id INT NOT NULL,
    tong_doanh_thu DECIMAL(10, 2) NOT NULL,
    thang_nam DATE NOT NULL,
    ngay_tao DATETIME DEFAULT GETDATE()
);
GO

-- B?ng qu?n lý l??ng và hoa h?ng
CREATE TABLE LuongVaHoaHong (
    luong_id INT IDENTITY(1,1) PRIMARY KEY,
    tho_cuat_id INT NOT NULL,
    luong_coban DECIMAL(10, 2) NOT NULL,
    ti_le_hoa_hong DECIMAL(5, 2) NOT NULL, -- T? l? hoa h?ng
    thang_nam DATE NOT NULL,
    ngay_tao DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (tho_cuat_id) REFERENCES NguoiDung(nguoi_dung_id)
);
GO

-- B?ng h? tr? và tr? giúp
CREATE TABLE YeuCauHoTro (
    yeu_cau_id INT IDENTITY(1,1) PRIMARY KEY,
    nguoi_dung_id INT NOT NULL,
    loai_yeu_cau NVARCHAR(100) NOT NULL,
    mo_ta NVARCHAR(MAX),
    trang_thai NVARCHAR(50) CHECK (trang_thai IN ('M?', '?ang x? lý', '?ã gi?i quy?t')) DEFAULT 'M?',
    ngay_tao DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (nguoi_dung_id) REFERENCES NguoiDung(nguoi_dung_id)
);
GO

-- B?ng thông tin salon
CREATE TABLE Salon (
    salon_id INT IDENTITY(1,1) PRIMARY KEY,
    ten_salon NVARCHAR(100) NOT NULL,
    dia_chi NVARCHAR(255) NOT NULL,
    so_dien_thoai NVARCHAR(15),
    ngay_tao DATETIME DEFAULT GETDATE()
);
GO