
-- Insert data into users table
INSERT INTO staff (name, avatar ,email, password, phone, address, experience, gender, birthday, role)
VALUES
  (N'Nguyễn Thị Hồng','NguyenThiHong.jpg','hong@gmail.com', 'password123', '0123-456-789', N'123 Đường Lê Lợi', 2, 'Nu', '1985-02-14', 'NhanVien'),
  (N'Trần Văn Minh', 'TranVanMinh.jpg','minh@gmail.com', 'password123', '0987-654-321', N'456 Đường Trần Phú', 3, 'Nam', '1990-06-21', 'NhanVien'),
  (N'Phạm Tuấn Anh','PhamTuanAnh.jpg' ,'tuananh@gmail.com', 'password123', '0912-345-678', N'789 Đường Hùng Vương', 4, 'Nam', '1987-09-13', 'NhanVien'),
  (N'Lê Thu Hà',  'LeThuHa.jpg' , 'thuha@gmail.com', 'password123', '0222-333-444', N'101 Đường Nguyễn Hệ', 5, 'Nu', '1982-11-05', 'NhanVien'),
  (N'Đặng Lan Ngọc','DangLanNgoc.jpg' ,'ngoclan@gmail.com', 'password123', '0111-222-333', N'202 Đường Trần Hưng Đạo', 1, 'Nu', '1995-04-18', 'NhanVien'),
  (N'Vũ Hữu Phước','VuHuuPhuoc.jpg' ,'phuoc@gmail.com', 'password123', '0777-888-999', N'303 Đường Bạch Đằng', 6, 'Nam', '1988-12-02', 'NhanVien'),
  (N'Trương Thị My','TruongThiMy.jpg' ,'my@gmail.com', 'password123', '0444-555-666', N'404 Đường Phan Đình Phùng', 7, 'Nu', '1993-08-07', 'NhanVien'),
  (N'Hoàng Quốc Bảo', 'HoangQuocBao.jpg','bao@gmail.com', 'password123', '0666-777-888', N'505 Đường Nguyễn Trãi', 8, 'Nam', '1986-01-25', 'NhanVien'),
  (N'Nguyễn Văn Chung','NguyenVanChung.jpg' ,'chung@gmail.com', 'password123', '0333-444-555', N'606 Đường Quang Trung', 9, 'Nam', '1984-03-30', 'NhanVien'),
  (N'Ngô Bá Vinh','NgoBaVinh.jpg' ,'vinh@gmail.com', 'password123', '0999-000-111', N'707 Đường Nguyễn Thái Học', 10, 'Nam', '1992-05-15', 'NhanVien');

-- Thêm nhiều dữ liệu hơn vào bảng users
INSERT INTO users (name, email, phone, address, birthday, gender, created_date)
VALUES
    (N'Nguyễn Văn Khánh', 'khanh@gmail.com', '0911111111', N'12 Đường Lê Lợi', '1991-07-15', 'Nam', '2024-11-20 09:30:00'),
    (N'Lê Thị Lan', 'lan@gmail.com', '0912222222', N'34 Đường Trần Phú', '1989-05-20', 'Nu', '2024-11-20 10:00:00'),
    (N'Hoàng Văn Bình', 'binh@gmail.com', '0913333333', N'56 Đường Quang Trung', '1992-11-11', 'Nam', '2024-11-20 10:30:00'),
    (N'Ngô Thị Thủy', 'thuy@gmail.com', '0914444444', N'78 Đường Nguyễn Du', '1994-03-30', 'Nu', '2024-11-20 11:00:00'),
    (N'Trần Minh Tâm', 'tam@gmail.com', '0915555555', N'90 Đường Phan Đình Phùng', '1987-02-25', 'Nam', '2024-11-20 11:30:00'),
    (N'Phạm Thị Hoa', 'hoa@gmail.com', '0916666666', N'101 Đường Nguyễn Trãi', '1995-06-12', 'Nu', '2024-11-20 12:00:00'),
    (N'Lý Văn Quân', 'quan@gmail.com', '0917777777', N'123 Đường Hùng Vương', '1985-12-01', 'Nam', '2024-11-20 12:30:00'),
    (N'Nguyễn Thị Ánh', 'anh@gmail.com', '0918888888', N'234 Đường Lê Hồng Phong', '1993-08-19', 'Nu', '2024-11-20 13:00:00'),
    (N'Đỗ Mạnh Hùng', 'hung@gmail.com', '0919999999', N'345 Đường Trần Hưng Đạo', '1990-10-10', 'Nam', '2024-11-20 13:30:00'),
    (N'Trương Thị Vân', 'van@gmail.com', '0900000000', N'456 Đường Hai Bà Trưng', '1997-04-04', 'Nu', '2024-11-20 14:00:00');

-- Thêm dữ liệu vào bảng booking
INSERT INTO booking (customer_id, staff_id, staff_shift_id, date, appointment_time, status, created_date)
VALUES
    (1, 1, NULL, '2024-11-23', '09:00:00', 'DaDat', '2024-11-20 09:00:00'),
    (2, 2, NULL, '2024-11-23', '10:30:00', 'DaDat', '2024-11-20 10:00:00'),
    (3, 3, NULL, '2024-11-24', '14:00:00', 'HoanThanh', '2024-11-20 14:00:00'),
    (4, 4, NULL, '2024-11-25', '13:30:00', 'DaDat', '2024-11-21 13:00:00'),
    (5, 5, NULL, '2024-11-25', '15:00:00', 'DaHuy', '2024-11-21 15:00:00'),
    (6, 6, NULL, '2024-11-26', '09:30:00', 'HoanThanh', '2024-11-22 09:00:00'),
    (7, 7, NULL, '2024-11-26', '11:00:00', 'DaDat', '2024-11-22 10:00:00'),
    (8, 8, NULL, '2024-11-27', '14:30:00', 'DaHuy', '2024-11-22 14:00:00'),
    (9, 9, NULL, '2024-11-28', '16:00:00', 'DaDat', '2024-11-22 15:00:00'),
    (10, 10, NULL, '2024-11-29', '17:30:00', 'HoanThanh', '2024-11-22 16:00:00');

-- Thêm dữ liệu vào bảng booking_service (liên kết giữa booking và service)
INSERT INTO booking_service (booking_id, service_id)
VALUES
    (1, 1), (1, 7),
    (2, 2),
    (3, 4), (3, 10),
    (4, 5),
    (5, 6),
    (6, 11),
    (7, 13),
    (8, 9), (8, 14),
    (9, 15),
    (10, 16);

-- Thêm dữ liệu vào bảng staff_salary
INSERT INTO staff_salary (staff_id, month, year, base_salary, bonus, total_salary, create_date, update_date, status)
VALUES
    (6, 10, 2024, 4500000, 500000, 5000000, '2024-10-31 10:00:00', '2024-11-01 10:00:00', 'DaThanhToan'),
    (7, 10, 2024, 4000000, 400000, 4400000, '2024-10-31 10:30:00', '2024-11-01 10:30:00', 'DaThanhToan'),
    (8, 10, 2024, 6000000, 300000, 6300000, '2024-10-31 11:00:00', '2024-11-01 11:00:00', 'DaThanhToan'),
    (9, 10, 2024, 5500000, 500000, 6000000, '2024-10-31 11:30:00', '2024-11-01 11:30:00', 'DaThanhToan'),
    (10, 10, 2024, 5000000, 200000, 5200000, '2024-10-31 12:00:00', '2024-11-01 12:00:00', 'ChuaThanhToan'),
    (1, 10, 2024, 4000000, 300000, 4300000, '2024-10-31 12:30:00', '2024-11-01 12:30:00', 'DaThanhToan'),
    (2, 10, 2024, 4500000, 400000, 4900000, '2024-10-31 13:00:00', '2024-11-01 13:00:00', 'DaThanhToan'),
    (3, 10, 2024, 4700000, 300000, 5000000, '2024-10-31 13:30:00', '2024-11-01 13:30:00', 'DaThanhToan'),
    (4, 10, 2024, 4800000, 200000, 5000000, '2024-10-31 14:00:00', '2024-11-01 14:00:00', 'ChuaThanhToan'),
    (5, 10, 2024, 5000000, 100000, 5100000, '2024-10-31 14:30:00', '2024-11-01 14:30:00', 'DaThanhToan');

-- Thêmdữ liệu vào bảng feedbacklist
INSERT INTO feedbacklist (user_name, phone, email, feedback_date, message)
VALUES
    (N'Nguyễn Văn Khánh', '0911111111', 'khanh@gmail.com', '2024-11-20 10:00:00', N'Dịch vụ rất tốt, tôi cảm thấy hài lòng.'),
    (N'Lê Thị Lan', '0912222222', 'lan@gmail.com', '2024-11-20 10:30:00', N'Nhân viên rất chu đáo, dịch vụ tuyệt vời.'),
    (N'Hoàng Văn Bình', '0913333333', 'binh@gmail.com', '2024-11-20 11:00:00', N'Thời gian chờ hơi lâu, nhưng chất lượng rất tốt.'),
    (N'Ngô Thị Thủy', '0914444444', 'thuy@gmail.com', '2024-11-20 11:30:00', N'Mọi thứ đều ổn, tôi sẽ quay lại.'),
    (N'Trần Minh Tâm', '0915555555', 'tam@gmail.com', '2024-11-20 12:00:00', N'Tôi rất thích cách làm việc của nhân viên.'),
    (N'Phạm Thị Hoa', '0916666666', 'hoa@gmail.com', '2024-11-20 12:30:00', N'Dịch vụ chuyên nghiệp, giá cả hợp lý.'),
    (N'Lý Văn Quân', '0917777777', 'quan@gmail.com', '2024-11-20 13:00:00', N'Không gian thoải mái, nhân viên thân thiện.'),
    (N'Nguyễn Thị Ánh', '0918888888', 'anh@gmail.com', '2024-11-20 13:30:00', N'Thời gian làm nhanh, chất lượng tốt.'),
    (N'Đỗ Mạnh Hùng', '0919999999', 'hung@gmail.com', '2024-11-20 14:00:00', N'Tôi sẽ giới thiệu salon này cho bạn bè.'),
    (N'Trương Thị Vân', '0900000000', 'van@gmail.com', '2024-11-20 14:30:00', N'Dịch vụ tận tâm, tôi rất hài lòng.');

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




