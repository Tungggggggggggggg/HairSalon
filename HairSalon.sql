-- T?o c? s? d? li?u
USE HairSalon;
GO

-- B?ng ng??i d�ng
CREATE TABLE NguoiDung (
    nguoi_dung_id INT IDENTITY(1,1) PRIMARY KEY,
    ten_dang_nhap NVARCHAR(50) NOT NULL UNIQUE,
    mat_khau NVARCHAR(255) NOT NULL,
    vai_tro NVARCHAR(50) CHECK (vai_tro IN ('Kh�ch', 'Kh�ch h�ng', 'Th? c?t', 'Nh�n vi�n', 'Qu?n l�', 'Qu?n tr? vi�n')),
    ngay_tao DATETIME DEFAULT GETDATE()
);
GO

-- B?ng d?ch v?
CREATE TABLE DichVu (
    dich_vu_id INT IDENTITY(1,1) PRIMARY KEY,
    ten_dich_vu NVARCHAR(100) NOT NULL,
    mo_ta NVARCHAR(MAX),
    gia DECIMAL(10, 2) NOT NULL,
    thoi_gian INT NOT NULL, -- Th?i gian d?ch v? t�nh b?ng ph�t
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
    trang_thai NVARCHAR(50) CHECK (trang_thai IN ('Ch? duy?t', '?� duy?t', 'B? t? ch?i', 'Ho�n th�nh')) DEFAULT 'Ch? duy?t',
    phan_hoi NVARCHAR(MAX),
    diem_loyalty INT DEFAULT 0,
    ngay_tao DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (nguoi_dung_id) REFERENCES NguoiDung(nguoi_dung_id),
    FOREIGN KEY (dich_vu_id) REFERENCES DichVu(dich_vu_id),
    FOREIGN KEY (tho_cuat_id) REFERENCES NguoiDung(nguoi_dung_id) -- Th? c?t c?ng l� ng??i d�ng
);
GO

-- B?ng theo d�i doanh thu
CREATE TABLE DoanhThu (
    doanh_thu_id INT IDENTITY(1,1) PRIMARY KEY,
    salon_id INT NOT NULL,
    tong_doanh_thu DECIMAL(10, 2) NOT NULL,
    thang_nam DATE NOT NULL,
    ngay_tao DATETIME DEFAULT GETDATE()
);
GO

-- B?ng qu?n l� l??ng v� hoa h?ng
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

-- B?ng h? tr? v� tr? gi�p
CREATE TABLE YeuCauHoTro (
    yeu_cau_id INT IDENTITY(1,1) PRIMARY KEY,
    nguoi_dung_id INT NOT NULL,
    loai_yeu_cau NVARCHAR(100) NOT NULL,
    mo_ta NVARCHAR(MAX),
    trang_thai NVARCHAR(50) CHECK (trang_thai IN ('M?', '?ang x? l�', '?� gi?i quy?t')) DEFAULT 'M?',
    ngay_tao DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (nguoi_dung_id) REFERENCES NguoiDung(nguoi_dung_id)
);
GO

-- B?ng th�ng tin salon
CREATE TABLE Salon (
    salon_id INT IDENTITY(1,1) PRIMARY KEY,
    ten_salon NVARCHAR(100) NOT NULL,
    dia_chi NVARCHAR(255) NOT NULL,
    so_dien_thoai NVARCHAR(15),
    ngay_tao DATETIME DEFAULT GETDATE()
);
GO