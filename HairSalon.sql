USE HairSalon;
GO

-- Bang nguoi dung
CREATE TABLE NguoiDung (
    nguoi_dung_id INT IDENTITY(1,1) PRIMARY KEY,
    ten_dang_nhap NVARCHAR(50) NOT NULL UNIQUE,
    mat_khau NVARCHAR(255) NOT NULL,
    vai_tro NVARCHAR(50) CHECK (vai_tro IN ('Khach', 'Khach hang', 'Tho cat', 'Nhan vien', 'Quan ly', 'Quan tri vien')),
    ngay_tao DATETIME DEFAULT GETDATE()
);
GO

-- Bang dich vu
CREATE TABLE DichVu (
    dich_vu_id INT IDENTITY(1,1) PRIMARY KEY,
    ten_dich_vu NVARCHAR(100) NOT NULL,
    mo_ta NVARCHAR(MAX),
    gia DECIMAL(10, 2) NOT NULL,
    thoi_gian INT NOT NULL, -- Thoi gian dich vu tinh bang phut
    ngay_tao DATETIME DEFAULT GETDATE()
);
GO

-- Bang dat lich
CREATE TABLE DatLich (
    dat_lich_id INT IDENTITY(1,1) PRIMARY KEY,
    nguoi_dung_id INT NOT NULL,
    dich_vu_id INT NOT NULL,
    tho_cuat_id INT NOT NULL,
    ngay_gio_dat DATETIME NOT NULL,
    trang_thai NVARCHAR(50) CHECK (trang_thai IN ('Cho duyet', 'da duyet', 'Bi tu choi', 'Hoan thanh')) DEFAULT 'Cho duyet',
    phan_hoi NVARCHAR(MAX),
    diem_loyalty INT DEFAULT 0,
    ngay_tao DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (nguoi_dung_id) REFERENCES NguoiDung(nguoi_dung_id),
    FOREIGN KEY (dich_vu_id) REFERENCES DichVu(dich_vu_id),
    FOREIGN KEY (tho_cat_id) REFERENCES NguoiDung(nguoi_dung_id) -- Tho cat cung là nguoi dung
);
GO

-- Bang theo doi doanh thu
CREATE TABLE DoanhThu (
    doanh_thu_id INT IDENTITY(1,1) PRIMARY KEY,
    salon_id INT NOT NULL,
    tong_doanh_thu DECIMAL(10, 2) NOT NULL,
    thang_nam DATE NOT NULL,
    ngay_tao DATETIME DEFAULT GETDATE()
);
GO

-- Bang quan ly luong va hoa hong
CREATE TABLE LuongVaHoaHong (
    luong_id INT IDENTITY(1,1) PRIMARY KEY,
    tho_cuat_id INT NOT NULL,
    luong_coban DECIMAL(10, 2) NOT NULL,
    ti_le_hoa_hong DECIMAL(5, 2) NOT NULL, -- Ty le hoa hong
    thang_nam DATE NOT NULL,
    ngay_tao DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (tho_cuat_id) REFERENCES NguoiDung(nguoi_dung_id)
);
GO

-- Bang ho tro va tro giup
CREATE TABLE YeuCauHoTro (
    yeu_cau_id INT IDENTITY(1,1) PRIMARY KEY,
    nguoi_dung_id INT NOT NULL,
    loai_yeu_cau NVARCHAR(100) NOT NULL,
    mo_ta NVARCHAR(MAX),
    trang_thai NVARCHAR(50) CHECK (trang_thai IN ('Mo', 'Dang xu ly', 'Da giai quyet')) DEFAULT 'Mo',
    ngay_tao DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (nguoi_dung_id) REFERENCES NguoiDung(nguoi_dung_id)
);
GO

-- Bang thong tin salon
CREATE TABLE Salon (
    salon_id INT IDENTITY(1,1) PRIMARY KEY,
    ten_salon NVARCHAR(100) NOT NULL,
    dia_chi NVARCHAR(255) NOT NULL,
    so_dien_thoai NVARCHAR(15),
    ngay_tao DATETIME DEFAULT GETDATE()
);
GO