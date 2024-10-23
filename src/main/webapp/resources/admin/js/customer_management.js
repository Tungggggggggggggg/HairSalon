        // Khởi tạo bảng dữ liệu với Simple DataTables và thiết lập ngôn ngữ tiếng Việt
        const datatablesSimple = new simpleDatatables.DataTable("#datatablesSimple", {
            perPageSelect: false, // Ẩn phần chọn số lượng mục mỗi trang
            searchable: true,
            fixedHeight: true,
            labels: {
                placeholder: "Tìm kiếm...",
                noRows: "Không có dữ liệu",
                info: "Hiển thị {start} đến {end} của {rows} mục",
                pagination: {
                    previous: "Trước",
                    next: "Tiếp theo"
                }
            }
        });

        // Hàm mở modal và thiết lập dữ liệu
        function openModal(type, id = '', name = '', email = '', phone = '', status = '') {
            const modalTitle = document.getElementById('customerModalLabel');
            const customerId = document.getElementById('customerId');
            const customerName = document.getElementById('customerName');
            const customerEmail = document.getElementById('customerEmail');
            const customerPhone = document.getElementById('customerPhone');

            if (type === 'new') {
                modalTitle.textContent = 'Thêm mới khách hàng';
                customerId.value = '';
                customerName.value = '';
                customerEmail.value = '';
                customerPhone.value = '';
            } else if (type === 'edit') {
                modalTitle.textContent = 'Chỉnh sửa khách hàng';
                customerId.value = id;
                customerName.value = name;
                customerEmail.value = email;
                customerPhone.value = phone;
            }
        }