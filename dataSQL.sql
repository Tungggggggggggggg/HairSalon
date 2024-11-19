
-- Insert data into users table
INSERT INTO staff (name, avatar ,email, password, phone, address, experience, gender, birthday, role)
VALUES
  (N'Nguyễn Thị Hồng','NguyenThiHong.jpg','hong@example.com', 'password123', '0123-456-789', N'123 Đường Lê Lợi', 2, 'Nu', '1985-02-14', 'NhanVien'),
  (N'Trần Văn Minh', 'TranVanMinh.jpg','minh@example.com', 'password123', '0987-654-321', N'456 Đường Trần Phú', 3, 'Nam', '1990-06-21', 'NhanVien'),
  (N'Phạm Tuấn Anh','PhamTuanAnh.jpg' ,'tuananh@example.com', 'password123', '0912-345-678', N'789 Đường Hùng Vương', 4, 'Nam', '1987-09-13', 'NhanVien'),
  (N'Lê Thu Hà',  'LeThuHa.jpg' , 'thuha@example.com', 'password123', '0222-333-444', N'101 Đường Nguyễn Hệ', 5, 'Nu', '1982-11-05', 'NhanVien'),
  (N'Đặng Lan Ngọc','DangLanNgoc.jpg' ,'ngoclan@example.com', 'password123', '0111-222-333', N'202 Đường Trần Hưng Đạo', 1, 'Nu', '1995-04-18', 'NhanVien'),
  (N'Vũ Hữu Phước','VuHuuPhuoc.jpg' ,'phuoc@example.com', 'password123', '0777-888-999', N'303 Đường Bạch Đằng', 6, 'Nam', '1988-12-02', 'NhanVien'),
  (N'Trương Thị My','TruongThiMy.jpg' ,'my@example.com', 'password123', '0444-555-666', N'404 Đường Phan Đình Phùng', 7, 'Nu', '1993-08-07', 'NhanVien'),
  (N'Hoàng Quốc Bảo', 'HoangQuocBao.jpg','bao@example.com', 'password123', '0666-777-888', N'505 Đường Nguyễn Trãi', 8, 'Nam', '1986-01-25', 'NhanVien'),
  (N'Nguyễn Văn Chung','NguyenVanChung.jpg' ,'chung@example.com', 'password123', '0333-444-555', N'606 Đường Quang Trung', 9, 'Nam', '1984-03-30', 'NhanVien'),
  (N'Ngô Bá Vinh','NgoBaVinh.jpg' ,'vinh@example.com', 'password123', '0999-000-111', N'707 Đường Nguyễn Thái Học', 10, 'Nam', '1992-05-15', 'NhanVien');



-- Dữ liệu cho tháng 9 năm 2024
INSERT INTO revenue
    (number_of_bookings, summary_date, total_revenue, total_services)
VALUES
    (20, '2024-09-01', 15000000, 30),
    (18, '2024-09-02', 13500000, 25),
    (22, '2024-09-03', 16500000, 32),
    (25, '2024-09-04', 18750000, 40),
    (19, '2024-09-05', 14250000, 28),
    (23, '2024-09-06', 17250000, 35),
    (27, '2024-09-07', 20250000, 43),
    (21, '2024-09-08', 15750000, 33),
    (24, '2024-09-09', 18000000, 39),
    (26, '2024-09-10', 19500000, 42),
    (28, '2024-09-11', 21000000, 45),
    (30, '2024-09-12', 22500000, 48),
    (25, '2024-09-13', 18750000, 40),
    (18, '2024-09-14', 13500000, 27),
    (22, '2024-09-15', 16500000, 34),
    (26, '2024-09-16', 19500000, 42),
    (29, '2024-09-17', 21750000, 46),
    (20, '2024-09-18', 15000000, 30),
    (27, '2024-09-19', 20250000, 44),
    (23, '2024-09-20', 17250000, 37),
    (30, '2024-09-21', 22500000, 50),
    (19, '2024-09-22', 14250000, 30),
    (25, '2024-09-23', 18750000, 40),
    (28, '2024-09-24', 21000000, 47),
    (22, '2024-09-25', 16500000, 36),
    (24, '2024-09-26', 18000000, 38),
    (26, '2024-09-27', 19500000, 42),
    (27, '2024-09-28', 20250000, 44),
    (20, '2024-09-29', 15000000, 30),
    (23, '2024-09-30', 17250000, 35);

-- Dữ liệu cho tháng 10 năm 2024
INSERT INTO revenue
    (number_of_bookings, summary_date, total_revenue, total_services)
VALUES
    (22, '2024-10-01', 16500000, 34),
    (25, '2024-10-02', 18750000, 40),
    (19, '2024-10-03', 14250000, 29),
    (23, '2024-10-04', 17250000, 36),
    (26, '2024-10-05', 19500000, 42),
    (28, '2024-10-06', 21000000, 45),
    (30, '2024-10-07', 22500000, 50),
    (21, '2024-10-08', 15750000, 33),
    (24, '2024-10-09', 18000000, 39),
    (27, '2024-10-10', 20250000, 44),
    (20, '2024-10-11', 15000000, 30),
    (25, '2024-10-12', 18750000, 40),
    (22, '2024-10-13', 16500000, 35),
    (19, '2024-10-14', 14250000, 28),
    (23, '2024-10-15', 17250000, 36),
    (26, '2024-10-16', 19500000, 42),
    (28, '2024-10-17', 21000000, 45),
    (30, '2024-10-18', 22500000, 50),
    (24, '2024-10-19', 18000000, 39),
    (21, '2024-10-20', 15750000, 32),
    (25, '2024-10-21', 18750000, 40),
    (29, '2024-10-22', 21750000, 46),
    (23, '2024-10-23', 17250000, 37),
    (26, '2024-10-24', 19500000, 42),
    (20, '2024-10-25', 15000000, 30),
    (22, '2024-10-26', 16500000, 34),
    (28, '2024-10-27', 21000000, 45),
    (30, '2024-10-28', 22500000, 50),
    (24, '2024-10-29', 18000000, 39),
    (27, '2024-10-30', 20250000, 44),
    (19, '2024-10-31', 14250000, 30);

-- Tiếp tục dữ liệu cho tháng 11 năm 2024
INSERT INTO revenue
    (number_of_bookings, summary_date, total_revenue, total_services)
VALUES
    (18, '2024-11-01', 13500000, 25),
    (15, '2024-11-02', 11250000, 20),
    (22, '2024-11-03', 16000000, 35),
    (25, '2024-11-04', 18750000, 40),
    (20, '2024-11-05', 15000000, 30),
    (22, '2024-11-06', 16500000, 35),
    (28, '2024-11-07', 21000000, 45),
    (30, '2024-11-08', 22500000, 50),
    (24, '2024-11-09', 18000000, 40),
    (26, '2024-11-10', 19500000, 42),
    (27, '2024-11-11', 20250000, 43),
    (29, '2024-11-12', 21750000, 46),
    (21, '2024-11-13', 15750000, 32),
    (23, '2024-11-14', 17250000, 37),
    (26, '2024-11-15', 19500000, 42),
    (20, '2024-11-16', 15000000, 30),
    (28, '2024-11-17', 21000000, 45),
    (30, '2024-11-18', 22500000, 50),
    (22, '2024-11-19', 16500000, 35),
    (24, '2024-11-20', 18000000, 39),
    (25, '2024-11-21', 18750000, 40),
    (27, '2024-11-22', 20250000, 42),
    (23, '2024-11-23', 17250000, 35),
    (29, '2024-11-24', 21750000, 46),
    (21, '2024-11-25', 15750000, 32),
    (26, '2024-11-26', 19500000, 40),
    (30, '2024-11-27', 22500000, 50),
    (28, '2024-11-28', 21000000, 47),
    (24, '2024-11-29', 18000000, 39),
    (22, '2024-11-30', 16500000, 34);



-- Insert data into service table
INSERT INTO service (avatar, name, description, price, duration_minutes)
VALUES
    ('Cattocnamcoban.jpg', N'Cắt tóc nam cơ bản', N'Cắt tóc gọn gàng, nhanh chóng.', 50000, 20),
    ('Cattocnucoban.jpg', N'Cắt tóc nữ cơ bản', N'Tỉa tóc, tạo kiểu đơn giản.', 100000, 30),
    ('Cattoctreem.jpg', N'Cắt tóc trẻ em', N'Dành cho trẻ nhỏ, nhẹ nhàng và an toàn.', 50000, 25),
    ('Cattoctaokieuthoitrang.jpg', N'Cắt tóc tạo kiểu thời trang', N'Phong cách cá nhân, phù hợp xu hướng.', 200000, 40),
    ('Nhuomtocthoitrang.jpg', N'Nhuộm tóc thời trang', N'Các màu sáng, highlight hoặc balayage.', 200000, 60),
    ('Nhuomphubac.jpg', N'Nhuộm phủ bạc', N'Dành cho khách hàng muốn che tóc bạc.', 200000, 60),
    ('Goidauthuong.jpg', N'Gội đầu thông thường', N'Làm sạch tóc, da đầu.', 50000, 20),
    ('Goidaukhemmassage.jpg', N'Gội đầu kèm massage thư giãn', N'Massage da đầu, giảm căng thẳng.', 150000, 30),
    ('Utocphuchoi.jpg', N'Ủ tóc phục hồi', N'Sử dụng sản phẩm dưỡng chuyên sâu.', 200000, 40),
    ('Taokieudongian.jpg', N'Tạo kiểu đơn giản', N'Dành cho các dịp thường ngày.', 150000, 30),
    ('Taokieudutiec.jpg', N'Tạo kiểu dự tiệc', N'Kiểu tóc cầu kỳ, sang trọng cho sự kiện.', 200000, 60),
    ('Uonxoanlon.jpg', N'Uốn xoăn lọn to/nhỏ', N'Tạo sóng bồng bềnh hoặc uốn cổ điển.', 500000, 75),
    ('Duoitocthangtunhien.jpg', N'Duỗi tóc thẳng tự nhiên', N'Làm tóc thẳng và bóng mượt.', 400000, 90),
    ('Duoitockeratin.jpg', N'Duỗi tóc keratin', N'Duỗi phục hồi, giảm xơ rối.', 500000, 120),
    ('Combotocgoisay.jpg', N'Combo cắt tóc - gội đầu - sấy tóc', N'Trọn gói dịch vụ cơ bản.', 250000, 75),
    ('Combonam.jpg', N'Combo tạo kiểu - cạo râu - gội đầu', N'Phong cách lịch lãm cho nam.', 400000, 100);




