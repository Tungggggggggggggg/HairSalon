

-- Insert data into users table
INSERT INTO staff (name, email, password, phone, address, experience, gender, birthday, role) VALUES
                                                                                                  ('Nguyễn Thị Hồng', 'hong@example.com', 'password123', '0123-456-789', '123 Đường Lê Lợi', 2, 'Nu', '1985-02-14', 'NhanVien'),
                                                                                                  ('Trần Văn Minh', 'minh@example.com', 'password123', '0987-654-321', '456 Đường Trần Phú', 3, 'Nam', '1990-06-21', 'NhanVien'),
                                                                                                  ('Phạm Tuấn Anh', 'tuananh@example.com', 'password123', '0912-345-678', '789 Đường Hùng Vương', 4, 'Nam', '1987-09-13', 'NhanVien'),
                                                                                                  ('Lê Thu Hà', 'thuha@example.com', 'password123', '0222-333-444', '101 Đường Nguyễn Huệ', 5, 'Nu', '1982-11-05', 'NhanVien'),
                                                                                                  ('Đặng Ngọc Lan', 'ngoclan@example.com', 'password123', '0111-222-333', '202 Đường Trần Hưng Đạo', 1, 'Nu', '1995-04-18', 'NhanVien'),
                                                                                                  ('Vũ Hữu Phước', 'phuoc@example.com', 'password123', '0777-888-999', '303 Đường Bạch Đằng', 6, 'Nam', '1988-12-02', 'NhanVien'),
                                                                                                  ('Trương Thị Mỹ', 'my@example.com', 'password123', '0444-555-666', '404 Đường Phan Đình Phùng', 7, 'Nu', '1993-08-07', 'Admin'),
                                                                                                  ('Hoàng Quốc Bảo', 'bao@example.com', 'password123', '0666-777-888', '505 Đường Nguyễn Trãi', 8, 'Nam', '1986-01-25', 'Admin'),
                                                                                                  ('Lý Minh Châu', 'minhchau@example.com', 'password123', '0333-444-555', '606 Đường Quang Trung', 9, 'Nu', '1984-03-30', 'Admin'),
                                                                                                  ('Ngô Bá Vinh', 'vinh@example.com', 'password123', '0999-000-111', '707 Đường Nguyễn Thái Học', 10, 'Nam', '1992-05-15', 'Admin');


-- chưa sửa
-- INSERT INTO notification ( message, notification_date)
-- VALUES
--     (N'Welcome to our platform!', '2024-10-01 08:30:00'),
--     (N'Your profile has been updated successfully.', '2024-10-02 09:15:00' ),
--     (N'You have a new friend request.', '2024-10-03 10:45:00' ),
--     (N'Don''t miss our latest features!', '2024-10-04 11:00:00'),
--     (N'Your subscription expires soon. Renew now!', '2024-10-05 12:30:00'),
--     (N'Password changed successfully.', '2024-10-06 14:00:00'),
--     (N'New message received from admin.', '2024-10-07 15:20:00'),
--     (N'System maintenance on Oct 10, 2024.', '2024-10-08 16:00:00'),
--     (N'Check out our new tutorial series!', '2024-10-09 18:15:00'),
--     (N'Account security alert: new login detected.', '2024-10-10 19:45:00');


-- Insert data into staff table
DECLARE @staff_id INT;
DECLARE @shift_date DATE = CAST(GETDATE() AS DATE);
DECLARE @end_date DATE = DATEADD(DAY, 6, @shift_date); -- 7 ngày tới

WHILE @shift_date <= @end_date
BEGIN
    -- Duyệt qua từng nhân viên (1 - 10)
    SET @staff_id = 1;
    WHILE @staff_id <= 10
BEGIN
        -- Chèn 9 ca làm việc mỗi ngày cho mỗi nhân viên
INSERT INTO staff_shift (shift_date, time, status, staff_id) VALUES
                                                                 (@shift_date, '08:00 - 09:30', 'Trong', @staff_id),
                                                                 (@shift_date, '09:30 - 11:00',  'Trong', @staff_id),
                                                                 (@shift_date, '11:00 - 12:30',  'Trong', @staff_id),

                                                                 (@shift_date, '14:00 - 15:30',  'Trong', @staff_id),
                                                                 (@shift_date, '15:30 - 17:00',  'Trong', @staff_id),
                                                                 (@shift_date, '17:00 - 18:30',  'Trong', @staff_id),
                                                                 (@shift_date, '18:30 - 20:00',  'Trong', @staff_id),
                                                                 (@shift_date, '20:00 - 21:30',  'Trong', @staff_id);
-- Tăng staff_id để tiếp tục với nhân viên tiếp theo
SET @staff_id = @staff_id + 1;
END
    -- Tăng ngày lên 1
    SET @shift_date = DATEADD(DAY, 1, @shift_date);
END

-- Dữ liệu cho tháng 9 năm 2024
INSERT INTO revenue (number_of_bookings, summary_date, total_revenue, total_services) VALUES
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
INSERT INTO revenue (number_of_bookings, summary_date, total_revenue, total_services) VALUES
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
INSERT INTO revenue (number_of_bookings, summary_date, total_revenue, total_services) VALUES
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
INSERT INTO service (name, description, price, duration_minutes) VALUES
                                                                     ('Cắt tóc nam cơ bản', 'Dịch vụ cắt tóc nam đơn giản, nhanh chóng', 30.00, 20),
                                                                     ('Cắt tóc nam cao cấp', 'Cắt tóc và tạo kiểu chuyên nghiệp cho nam', 50.00, 40),
                                                                     ('Nhuộm tóc nam', 'Nhuộm tóc với màu sắc thời trang dành cho nam', 100.00, 60),
                                                                     ('Nhuộm phủ bạc nam', 'Dành cho nam muốn che phủ tóc bạc', 80.00, 45),
                                                                     ('Tạo kiểu tóc nam', 'Tạo kiểu tóc thời trang cho các dịp đặc biệt', 60.00, 30),
                                                                     ('Cạo và tỉa râu', 'Cạo và tỉa râu tạo sự gọn gàng', 20.00, 15),
                                                                     ('Combo Cắt tóc - Gội đầu - Sấy', 'Bao gồm cắt tóc, gội đầu và sấy khô', 45.00, 30),
                                                                     ('Combo Nhuộm tóc - Gội đầu - Sấy', 'Bao gồm nhuộm tóc, gội đầu và sấy khô', 120.00, 70),
                                                                     ('Chăm sóc da mặt nam', 'Làm sạch và chăm sóc da mặt dành riêng cho nam giới', 50.00, 30),
                                                                     ('Massage đầu thư giãn', 'Gội đầu kèm massage thư giãn da đầu', 30.00, 25),
                                                                     ('Combo Tạo kiểu - Cạo râu - Gội đầu', 'Combo chăm sóc tóc và râu, tạo phong cách lịch lãm', 70.00, 50);


-- chưa sửa
-- -- Insert data into booking table
-- INSERT INTO booking (customer_id, staff_id, staff_shift_id, date, status) VALUES
-- (1, 3, 1, '2023-10-10', 'CONFIRMED'),
-- (2, 4, 2, '2023-10-11', 'COMPLETED'),
-- (5, 7, 3, '2023-10-12', 'CANCELED'),
-- (6, 10, 4, '2023-10-13', 'PENDING'),
-- (8, 3, 5, '2023-10-14', 'CONFIRMED'),
-- (9, 4, 6, '2023-10-15', 'COMPLETED'),
-- (1, 7, 7, '2023-10-16', 'CANCELED'),
-- (2, 10, 8, '2023-10-17', 'PENDING'),
-- (5, 3, 9, '2023-10-18', 'CONFIRMED'),
-- (6, 4, 10, '2023-10-19', 'COMPLETED');

-- Insert data into revenue table



