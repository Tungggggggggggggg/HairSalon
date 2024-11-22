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

-- Insert data into staff table
INSERT INTO staff (name, avatar, email, password, phone, address, experience, gender, birthday, role)
VALUES
  (N'Nguyễn Thị Hồng','NguyenThiHong.jpg','hong@gmail.com', 'password123', '0123-456-789', N'123 Đường Lê Lợi', 2, 'Nu', '1985-02-14', 'Admin'),
  (N'Trần Văn Minh', 'TranVanMinh.jpg','minh@gmail.com', 'password123', '0987-654-321', N'456 Đường Trần Phú', 3, 'Nam', '1990-06-21', 'NhanVien'),
  (N'Phạm Tuấn Anh','PhamTuanAnh.jpg' ,'tuananh@gmail.com', 'password123', '0912-345-678', N'789 Đường Hùng Vương', 4, 'Nam', '1987-09-13', 'NhanVien'),
  (N'Lê Thu Hà',  'LeThuHa.jpg' , 'thuha@gmail.com', 'password123', '0222-333-444', N'101 Đường Nguyễn Hệ', 5, 'Nu', '1982-11-05', 'NhanVien'),
  (N'Đặng Lan Ngọc','DangLanNgoc.jpg' ,'ngoclan@gmail.com', 'password123', '0111-222-333', N'202 Đường Trần Hưng Đạo', 1, 'Nu', '1995-04-18', 'NhanVien'),
  (N'Vũ Hữu Phước','VuHuuPhuoc.jpg' ,'phuoc@gmail.com', 'password123', '0777-888-999', N'303 Đường Bạch Đằng', 6, 'Nam', '1988-12-02', 'NhanVien'),
  (N'Trương Thị My','TruongThiMy.png' ,'my@gmail.com', 'password123', '0444-555-666', N'404 Đường Phan Đình Phùng', 7, 'Nu', '1993-08-07', 'NhanVien'),
  (N'Hoàng Quốc Bảo', 'HoangQuocBao.jpg','bao@gmail.com', 'password123', '0666-777-888', N'505 Đường Nguyễn Trãi', 8, 'Nam', '1986-01-25', 'NhanVien'),
  (N'Nguyễn Văn Chung','NguyenVanChung.jpg' ,'chung@gmail.com', 'password123', '0333-444-555', N'606 Đường Quang Trung', 9, 'Nam', '1984-03-30', 'NhanVien'),
  (N'Ngô Bá Vinh','NgoBaVinh.jpg' ,'vinh@gmail.com', 'password123', '0999-000-111', N'707 Đường Nguyễn Thái Học', 10, 'Nam', '1992-05-15', 'NhanVien');


-- Insert data into users table with 'created_date'
INSERT INTO users (name, email, phone, address, birthday, gender, created_date)
VALUES
    (N'Nguyễn Văn An', 'nguyenvanan@gmail.com', '0123456789', N'123 Đường A, Quận 1, TP.HCM', '1990-01-15', 'Nam', '2024-09-01 10:00:00'),
    (N'Trần Thị Bích', 'tranthibich@gmail.com', '0987654321', N'456 Đường B, Quận 2, TP.HCM', '1992-05-20', 'Nu', '2024-09-02 11:00:00'),
    (N'Lê Văn Cường', 'levancuong@gmail.com', '0912345678', N'789 Đường C, Quận 3, TP.HCM', '1988-12-05', 'Nam', '2024-09-03 09:30:00'),
    (N'Phạm Thị Dung', 'phamthidung@gmail.com', '0945678901', N'321 Đường D, Quận 4, TP.HCM', '1991-03-10', 'Nu', '2024-09-04 14:15:00'),
    (N'Hồang Văn E', 'hoangvane@gmail.com', '0956789012', N'654 Đường E, Quận 5, TP.HCM', '1985-07-25', 'Nam', '2024-09-05 16:45:00'),
    (N'Phạm Văn Fát', 'phamvanfat@gmail.com', '0967890123', N'987 Đường F, Quận 6, TP.HCM', '1993-09-18', 'Nam', '2024-09-06 08:30:00'),
    (N'Nguyễn Thị Giang', 'nguyenthigiang@gmail.com', '0978901234', N'159 Đường G, Quận 7, TP.HCM', '1994-11-22', 'Nu', '2024-09-07 12:00:00'),
    (N'Trần Văn Huy', 'tranvanhuy@gmail.com', '0989012345', N'753 Đường H, Quận 8, TP.HCM', '1987-04-17', 'Nam', '2024-09-08 09:45:00'),
    (N'Lê Thị Hoa', 'lethihoa@gmail.com', '0990123456', N'852 Đường I, Quận 9, TP.HCM', '1995-06-30', 'Nu', '2024-09-09 10:20:00'),
    (N'Đặng Văn Khoa', 'dangvankhoa@gmail.com', '0911123456', N'951 Đường J, Quận 10, TP.HCM', '1989-08-05', 'Nam', '2024-09-10 11:50:00');


-- Insert data into booking table
INSERT INTO booking (customer_id, staff_id, staff_shift_id, date, appointment_time, status, created_date)
VALUES
    -- Tháng 9
    (1, 1, NULL, '2024-09-01', '09:00', 'HoanThanh', '2024-08-31 08:00:00'),
    (2, 2, NULL, '2024-09-02', '10:30', 'HoanThanh', '2024-08-31 09:15:00'),
    (3, 3, NULL, '2024-09-03', '14:00', 'DaHuy', '2024-08-31 10:20:00'),
    (4, 4, NULL, '2024-09-04', '11:00', 'HoanThanh', '2024-08-31 11:30:00'),
    (5, 5, NULL, '2024-09-05', '15:30', 'HoanThanh', '2024-08-31 12:45:00'),
    (6, 6, NULL, '2024-09-06', '13:00', 'HoanThanh', '2024-08-31 13:50:00'),
    (7, 7, NULL, '2024-09-07', '16:00', 'DaHuy', '2024-08-31 14:10:00'),
    (8, 8, NULL, '2024-09-08', '09:30', 'HoanThanh', '2024-08-31 15:25:00'),
    (9, 9, NULL, '2024-09-09', '10:00', 'HoanThanh', '2024-08-31 16:35:00'),
    (10, 10, NULL, '2024-09-10', '14:30', 'HoanThanh', '2024-08-31 17:40:00'),

    -- Tháng 10
    (1, 1, NULL, '2024-10-01', '09:00', 'HoanThanh', '2024-09-30 08:00:00'),
    (2, 2, NULL, '2024-10-02', '10:30', 'HoanThanh', '2024-09-30 09:15:00'),
    (3, 3, NULL, '2024-10-03', '14:00', 'DaHuy', '2024-09-30 10:20:00'),
    (4, 4, NULL, '2024-10-04', '11:00', 'HoanThanh', '2024-09-30 11:30:00'),
    (5, 5, NULL, '2024-10-05', '15:30', 'HoanThanh', '2024-09-30 12:45:00'),
    (6, 6, NULL, '2024-10-06', '13:00', 'HoanThanh', '2024-09-30 13:50:00'),
    (7, 7, NULL, '2024-10-07', '16:00', 'DaHuy', '2024-09-30 14:10:00'),
    (8, 8, NULL, '2024-10-08', '09:30', 'HoanThanh', '2024-09-30 15:25:00'),
    (9, 9, NULL, '2024-10-09', '10:00', 'HoanThanh', '2024-09-30 16:35:00'),
    (10, 10, NULL, '2024-10-10', '14:30', 'HoanThanh', '2024-09-30 17:40:00'),

    -- Tháng 11 (đến ngày 22)
    (1, 1, NULL, '2024-11-01', '09:00', 'HoanThanh', '2024-10-31 08:00:00'),
    (2, 2, NULL, '2024-11-02', '10:30', 'HoanThanh', '2024-10-31 09:15:00'),
    (3, 3, NULL, '2024-11-03', '14:00', 'DaHuy', '2024-10-31 10:20:00'),
    (4, 4, NULL, '2024-11-04', '11:00', 'HoanThanh', '2024-10-31 11:30:00'),
    (5, 5, NULL, '2024-11-05', '15:30', 'HoanThanh', '2024-10-31 12:45:00'),
    (6, 6, NULL, '2024-11-06', '13:00', 'HoanThanh', '2024-10-31 13:50:00'),
    (7, 7, NULL, '2024-11-07', '16:00', 'DaHuy', '2024-10-31 14:10:00'),
    (8, 8, NULL, '2024-11-08', '09:30', 'HoanThanh', '2024-10-31 15:25:00'),
    (9, 9, NULL, '2024-11-09', '10:00', 'HoanThanh', '2024-10-31 16:35:00'),
    (10, 10, NULL, '2024-11-10', '14:30', 'HoanThanh', '2024-10-31 17:40:00'),

    (1, 2, NULL, '2024-11-11', '09:30', 'HoanThanh', '2024-11-10 08:15:00'),
    (2, 3, NULL, '2024-11-12', '10:45', 'HoanThanh', '2024-11-10 09:25:00'),
    (3, 4, NULL, '2024-11-13', '14:15', 'HoanThanh', '2024-11-10 10:35:00'),
    (4, 5, NULL, '2024-11-14', '11:30', 'HoanThanh', '2024-11-10 11:45:00'),
    (5, 6, NULL, '2024-11-15', '15:00', 'HoanThanh', '2024-11-10 12:55:00'),
    (6, 7, NULL, '2024-11-16', '13:30', 'HoanThanh', '2024-11-10 14:05:00'),
    (7, 8, NULL, '2024-11-17', '16:15', 'HoanThanh', '2024-11-10 15:15:00'),
    (8, 9, NULL, '2024-11-18', '09:45', 'HoanThanh', '2024-11-10 16:25:00'),
    (9, 10, NULL, '2024-11-19', '10:15', 'HoanThanh', '2024-11-10 17:35:00'),
    (10, 1, NULL, '2024-11-20', '14:45', 'HoanThanh', '2024-11-10 18:45:00'),
    
    (1, 2, NULL, '2024-11-21', '09:00', 'HoanThanh', '2024-11-20 08:00:00'),
    (2, 3, NULL, '2024-11-22', '10:30', 'HoanThanh', '2024-11-20 09:15:00');


-- Insert data into booking_service table
INSERT INTO booking_service (booking_id, service_id)
VALUES
    -- Tháng 9
    (1, 1),  
    (1, 7),  
    (2, 2),  
    (2, 8),  
    (3, 3),  
    (4, 4),  
    (4, 9),  
    (5, 5),  
    (6, 6),  
    (7, 10), 
    (8, 11), 
    (9, 12), 
    (10, 13), 
    (10, 14), 
    (10, 15), 
    (10, 16), 

    -- Tháng 10
    (11, 1),
    (11, 2),
    (12, 3),
    (13, 4),
    (13, 5),
    (14, 6),
    (15, 7),
    (16, 8),
    (17, 9),
    (18, 10),
    (19, 11),
    (20, 12),
    (21, 13),
    (22, 14),
    (23, 15),
    (24, 16),

    -- Tháng 11
    (25, 1),
    (25, 2),
    (26, 3),
    (27, 4),
    (27, 5),
    (28, 6),
    (29, 7),
    (30, 8),
    (31, 9),
    (32, 10),
    (33, 11),
    (34, 12),
    (35, 13),
    (36, 14),
    (37, 15),
    (38, 16),
    (39, 1),
    (40, 2),
    (41, 1),
    (42, 8);

-- Insert data into invoice table
INSERT INTO invoice (booking_id, invoice_date, total_amount, payment_method, payment_status)
VALUES
    -- Hóa đơn cho tháng 9
    (1, '2024-09-01', 50000 + 50000, 'TienMat', 'DaThanhToan'),      
    (2, '2024-09-02', 100000 + 150000, 'The', 'DaThanhToan'),       
    (3, '2024-09-03', 50000, 'ChuyenKhoan', 'ChuaThanhToan'),        
    (4, '2024-09-04', 200000 + 200000, 'TienMat', 'DaThanhToan'),    
    (5, '2024-09-05', 200000, 'The', 'DaThanhToan'),                 
    (6, '2024-09-06', 200000, 'ChuyenKhoan', 'ChuaThanhToan'),        
    (7, '2024-09-07', 150000, 'TienMat', 'DaThanhToan'),             
    (8, '2024-09-08', 150000 + 200000, 'The', 'DaThanhToan'),        
    (9, '2024-09-09', 500000, 'ChuyenKhoan', 'ChuaThanhToan'),        
    (10, '2024-09-10', 400000 + 500000 + 250000 + 400000, 'TienMat', 'DaThanhToan'), 

    -- Hóa đơn cho tháng 10
    (11, '2024-10-01', 50000 + 100000, 'TienMat', 'DaThanhToan'),    
    (12, '2024-10-02', 100000 + 150000, 'The', 'DaThanhToan'),       
    (13, '2024-10-03', 50000 + 200000, 'ChuyenKhoan', 'ChuaThanhToan'), 
    (14, '2024-10-04', 200000 + 200000, 'TienMat', 'DaThanhToan'),   
    (15, '2024-10-05', 200000 + 200000, 'The', 'DaThanhToan'),        
    (16, '2024-10-06', 200000, 'ChuyenKhoan', 'ChuaThanhToan'),       
    (17, '2024-10-07', 150000, 'TienMat', 'DaThanhToan'),            
    (18, '2024-10-08', 150000 + 200000, 'The', 'DaThanhToan'),       
    (19, '2024-10-09', 500000, 'ChuyenKhoan', 'ChuaThanhToan'),       
    (20, '2024-10-10', 400000 + 500000 + 250000 + 400000, 'TienMat', 'DaThanhToan'), 

    -- Hóa đơn cho tháng 11
    (21, '2024-11-01', 50000 + 100000, 'TienMat', 'DaThanhToan'),    
    (22, '2024-11-02', 100000 + 150000, 'The', 'DaThanhToan'),       
    (23, '2024-11-03', 50000 + 200000, 'ChuyenKhoan', 'ChuaThanhToan'), 
    (24, '2024-11-04', 200000 + 200000, 'TienMat', 'DaThanhToan'),   
    (25, '2024-11-05', 200000 + 200000, 'The', 'DaThanhToan'),        
    (26, '2024-11-06', 200000, 'ChuyenKhoan', 'ChuaThanhToan'),       
    (27, '2024-11-07', 150000, 'TienMat', 'DaThanhToan'),            
    (28, '2024-11-08', 150000 + 200000, 'The', 'DaThanhToan'),       
    (29, '2024-11-09', 500000, 'ChuyenKhoan', 'ChuaThanhToan'),       
    (30, '2024-11-10', 400000 + 500000 + 250000 + 400000, 'TienMat', 'DaThanhToan'), 

    (31, '2024-11-11', 50000 + 100000, 'TienMat', 'DaThanhToan'),    
    (32, '2024-11-12', 100000 + 150000, 'The', 'DaThanhToan'),       
    (33, '2024-11-13', 50000 + 200000, 'ChuyenKhoan', 'ChuaThanhToan'), 
    (34, '2024-11-14', 200000 + 200000, 'TienMat', 'DaThanhToan'),   
    (35, '2024-11-15', 200000 + 200000, 'The', 'DaThanhToan'),        
    (36, '2024-11-16', 200000, 'ChuyenKhoan', 'ChuaThanhToan'),       
    (37, '2024-11-17', 150000, 'TienMat', 'DaThanhToan'),            
    (38, '2024-11-18', 150000 + 200000, 'The', 'DaThanhToan'),       
    (39, '2024-11-19', 500000, 'ChuyenKhoan', 'ChuaThanhToan'),       
    (40, '2024-11-20', 400000 + 500000 + 250000 + 400000, 'TienMat', 'DaThanhToan'); 


-- Insert data into feedbacklist table
INSERT INTO feedbacklist (user_name, phone, email, message, feedback_date)
VALUES
    (N'Nguyễn Văn An', '0123456789', 'nguyenvanan@gmail.com', N'Rất hài lòng với dịch vụ cắt tóc.', '2024-09-15 14:30:00'),
    (N'Trần Thị Bích', '0987654321', 'tranthibich@gmail.com', N'Cần cải thiện thời gian chờ.', '2024-09-16 10:45:00'),
    (N'Lê Văn Cường', '0912345678', 'levancuong@gmail.com', N'Giá cả hợp lý và nhân viên thân thiện.', '2024-09-17 09:20:00'),
    (N'Phạm Thị Dung', '0945678901', 'phamthidung@gmail.com', N'Dịch vụ massage thư giãn tuyệt vời.', '2024-09-18 11:10:00'),
    (N'Hồang Văn E', '0956789012', 'hoangvane@gmail.com', N'Tôi muốn thêm nhiều dịch vụ mới.', '2024-09-19 12:00:00'),
    (N'Phạm Văn Fát', '0967890123', 'phamvanfat@gmail.com', N'Tôi gặp vấn đề với hóa đơn.', '2024-09-20 13:30:00'),
    (N'Nguyễn Thị Giang', '0978901234', 'nguyenthigiang@gmail.com', N'Dịch vụ nhanh chóng và hiệu quả.', '2024-09-21 14:50:00'),
    (N'Trần Văn Huy', '0989012345', 'tranvanhuy@gmail.com', N'Nhân viên thân thiện nhưng cần cải thiện kỹ năng.', '2024-09-22 15:20:00'),
    (N'Lê Thị Hoa', '0990123456', 'lethihoa@gmail.com', N'Không hài lòng với kiểu tóc mới.', '2024-09-23 16:10:00'),
    (N'Đặng Văn Khoa', '0911123456', 'dangvankhoa@gmail.com', N'Tôi sẽ giới thiệu bạn bè đến.', '2024-09-24 17:00:00'),

    -- Thêm phản hồi bổ sung
    (N'Nguyễn Thị Linh', '0123456780', 'nguyenthilinh@gmail.com', N'Rất hài lòng với dịch vụ.', '2024-09-25 10:15:00'),
    (N'Trần Văn Long', '0987654320', 'tranvanlong@gmail.com', N'Dịch vụ tuyệt vời nhưng chờ lâu.', '2024-09-26 11:30:00'),
    (N'Lê Thị Minh', '0912345670', 'lethiminh@gmail.com', N'Nhân viên chuyên nghiệp.', '2024-09-27 12:45:00');

-- Insert data into feedback_type table
INSERT INTO feedback_type (feedbacklist_id, feedback_type)
VALUES
    (1, N'Dịch vụ'),
    (1, N'Nhân viên'),
    (2, N'Thời gian'),
    (3, N'Giá cả'),
    (4, N'Dịch vụ'),
    (5, N'Dịch vụ'),
    (6, N'Hóa đơn'),
    (7, N'Dịch vụ'),
    (8, N'Nhân viên'),
    (9, N'Dịch vụ'),
    (10, N'Dịch vụ'),
    (11, N'Dịch vụ'),
    (11, N'Nhân viên'),
    (12, N'Thời gian'),
    (13, N'Nhân viên');


-- Insert data into revenue table based on completed bookings
WITH RevenueData AS (
    SELECT 
        b.date AS summaryDate,
        SUM(s.price) AS totalRevenue,
        COUNT(DISTINCT b.id) AS numberOfBookings,
        COUNT(bs.service_id) AS totalServices
    FROM 
        booking b
        INNER JOIN booking_service bs ON b.id = bs.booking_id
        INNER JOIN service s ON bs.service_id = s.id
    WHERE 
        b.status = 'HoanThanh' 
        AND b.date BETWEEN '2024-09-01' AND '2024-11-22'
    GROUP BY 
        b.date
)
INSERT INTO revenue (summary_date, total_revenue, number_of_bookings, total_services)
SELECT 
    rd.summaryDate,
    rd.totalRevenue,
    rd.numberOfBookings,
    rd.totalServices
FROM 
    RevenueData rd
WHERE NOT EXISTS (
    SELECT 1 FROM revenue r 
    WHERE r.summary_date = rd.summaryDate
);


-- Insert data into staff_salary table
-- Lương cho tháng 5 năm 2024
INSERT INTO staff_salary (staff_id, month, year, base_salary, bonus, total_salary, create_date, update_date, status)
VALUES
    (1, 9, 2024, 5000000.00, 500000.00, 5500000.00, '2024-09-30 17:00:00', '2024-09-30 17:00:00', 'DaThanhToan'),
    (2, 9, 2024, 6000000.00, 600000.00, 6600000.00, '2024-09-30 17:00:00', '2024-09-30 17:00:00', 'ChuaThanhToan'),
    (3, 9, 2024, 5500000.00, 450000.00, 5950000.00, '2024-09-30 17:00:00', '2024-09-30 17:00:00', 'DaThanhToan'),
    (4, 9, 2024, 5800000.00, 420000.00, 6220000.00, '2024-09-30 17:00:00', '2024-09-30 17:00:00', 'DaThanhToan'),
    (5, 9, 2024, 5000000.00, 300000.00, 5300000.00, '2024-09-30 17:00:00', '2024-09-30 17:00:00', 'ChuaThanhToan'),
    (6, 9, 2024, 6500000.00, 700000.00, 7200000.00, '2024-09-30 17:00:00', '2024-09-30 17:00:00', 'DaThanhToan'),
    (7, 9, 2024, 4800000.00, 520000.00, 5320000.00, '2024-09-30 17:00:00', '2024-09-30 17:00:00', 'DaThanhToan'),
    (8, 9, 2024, 6200000.00, 600000.00, 6800000.00, '2024-09-30 17:00:00', '2024-09-30 17:00:00', 'ChuaThanhToan'),
    (9, 9, 2024, 7000000.00, 800000.00, 7800000.00, '2024-09-30 17:00:00', '2024-09-30 17:00:00', 'DaThanhToan'),
    (10, 9, 2024, 5500000.00, 450000.00, 5950000.00, '2024-09-30 17:00:00', '2024-09-30 17:00:00', 'ChuaThanhToan'),

    -- Lương cho tháng 10 năm 2024
    (1, 10, 2024, 5000000.00, 550000.00, 5550000.00, '2024-10-31 17:00:00', '2024-10-31 17:00:00', 'DaThanhToan'),
    (2, 10, 2024, 6000000.00, 650000.00, 6650000.00, '2024-10-31 17:00:00', '2024-10-31 17:00:00', 'ChuaThanhToan'),
    (3, 10, 2024, 5500000.00, 500000.00, 6000000.00, '2024-10-31 17:00:00', '2024-10-31 17:00:00', 'DaThanhToan'),
    (4, 10, 2024, 5800000.00, 450000.00, 6250000.00, '2024-10-31 17:00:00', '2024-10-31 17:00:00', 'DaThanhToan'),
    (5, 10, 2024, 5000000.00, 350000.00, 5350000.00, '2024-10-31 17:00:00', '2024-10-31 17:00:00', 'ChuaThanhToan'),
    (6, 10, 2024, 6500000.00, 750000.00, 7250000.00, '2024-10-31 17:00:00', '2024-10-31 17:00:00', 'DaThanhToan'),
    (7, 10, 2024, 4800000.00, 600000.00, 5400000.00, '2024-10-31 17:00:00', '2024-10-31 17:00:00', 'DaThanhToan'),
    (8, 10, 2024, 6200000.00, 700000.00, 6900000.00, '2024-10-31 17:00:00', '2024-10-31 17:00:00', 'ChuaThanhToan'),
    (9, 10, 2024, 7000000.00, 900000.00, 7900000.00, '2024-10-31 17:00:00', '2024-10-31 17:00:00', 'DaThanhToan'),
    (10, 10, 2024, 5500000.00, 500000.00, 6000000.00, '2024-10-31 17:00:00', '2024-10-31 17:00:00', 'ChuaThanhToan');
