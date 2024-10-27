
-- 1. Create users table
CREATE TABLE users (
                       id BIGINT PRIMARY KEY IDENTITY(1,1),
                       name NVARCHAR(255) NOT NULL,
                       email NVARCHAR(255) UNIQUE NOT NULL,
                       password NVARCHAR(255) NOT NULL,
                       phone NVARCHAR(50),
                       address NVARCHAR(255),
                       gender NVARCHAR(10),
                       birthday NVARCHAR(10), -- Có thể thay đổi thành DATE nếu cần
                       role NVARCHAR(10) CHECK (role IN ('CUSTOMER', 'STAFF', 'ADMIN')) NOT NULL
);

-- 2. Create staff table
CREATE TABLE staff (
                       id BIGINT PRIMARY KEY IDENTITY(1,1),
                       user_id BIGINT NOT NULL,
                       name NVARCHAR(255),
                       experience NVARCHAR(255),
                       specialty NVARCHAR(255),
                       status NVARCHAR(12) CHECK (status IN ('AVAILABLE', 'UNAVAILABLE')),
                       CONSTRAINT FK_Staff_User FOREIGN KEY (user_id) REFERENCES users(id)
);

-- 3. Create service table
CREATE TABLE service (
                         id BIGINT PRIMARY KEY IDENTITY(1,1),
                         name NVARCHAR(255) NOT NULL,
                         description NVARCHAR(500),
                         price DECIMAL(18, 2) NOT NULL,
                         duration_minutes INT NOT NULL
);

-- 4. Create booking table
CREATE TABLE booking (
                         id BIGINT PRIMARY KEY IDENTITY(1,1),
                         customer_id BIGINT NOT NULL,
                         staff_id BIGINT NOT NULL,
                         service_id BIGINT NOT NULL,
                         booking_date DATETIME NOT NULL,
                         status NVARCHAR(10) CHECK (status IN ('PENDING', 'CONFIRMED', 'COMPLETED', 'CANCELED')),
                         CONSTRAINT FK_Booking_Customer FOREIGN KEY (customer_id) REFERENCES users(id),
                         CONSTRAINT FK_Booking_Staff FOREIGN KEY (staff_id) REFERENCES staff(id),
                         CONSTRAINT FK_Booking_Service FOREIGN KEY (service_id) REFERENCES service(id)
);

-- 5. Create revenue table
CREATE TABLE revenue (
                         id BIGINT PRIMARY KEY IDENTITY(1,1),
                         booking_id BIGINT NOT NULL,
                         service_id BIGINT NOT NULL,
                         staff_id BIGINT NOT NULL,
                         customer_id BIGINT NOT NULL,
                         revenue_amount DECIMAL(18, 2),
                         revenue_date DATETIME NOT NULL,
                         CONSTRAINT FK_Revenue_Booking FOREIGN KEY (booking_id) REFERENCES booking(id),
                         CONSTRAINT FK_Revenue_Service FOREIGN KEY (service_id) REFERENCES service(id),
                         CONSTRAINT FK_Revenue_Staff FOREIGN KEY (staff_id) REFERENCES staff(id),
                         CONSTRAINT FK_Revenue_Customer FOREIGN KEY (customer_id) REFERENCES users(id)
);

-- 6. Create payments table
CREATE TABLE payments (
                          id BIGINT PRIMARY KEY IDENTITY(1,1),
                          booking_id BIGINT UNIQUE, -- Khóa ngoại liên kết với bảng booking
                          amount DECIMAL(18, 2) NOT NULL,
                          payment_date DATETIME NOT NULL,
                          status NVARCHAR(6) CHECK (status IN ('PAID', 'UNPAID')),
                          method NVARCHAR(50),
                          CONSTRAINT FK_Payment_Booking FOREIGN KEY (booking_id) REFERENCES booking(id)
);

-- 7. Create notification table
CREATE TABLE notification (
                              id BIGINT PRIMARY KEY IDENTITY(1,1),
                              user_id BIGINT NOT NULL,
                              message NVARCHAR(255),
                              notification_date DATETIME NOT NULL,
                              status NVARCHAR(6) CHECK (status IN ('UNREAD', 'READ')),
                              CONSTRAINT FK_Notification_User FOREIGN KEY (user_id) REFERENCES users(id)
);

-- 8. Create staff_salary table
CREATE TABLE staff_salary (
                              salary_id BIGINT PRIMARY KEY IDENTITY(1,1),
                              staff_id BIGINT NOT NULL,
                              month INT NOT NULL,
                              year INT NOT NULL,
                              base_salary DECIMAL(18, 2) NOT NULL,
                              bonus DECIMAL(18, 2) NOT NULL,
                              total_salary AS (base_salary + bonus) PERSISTED, -- Tính toán tự động
                              status NVARCHAR(6) CHECK (status IN ('PAID', 'UNPAID')),
                              CONSTRAINT FK_StaffSalary_Staff FOREIGN KEY (staff_id) REFERENCES staff(id)
);
