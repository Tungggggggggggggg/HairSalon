<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <div class="sb-sidenav-menu-heading">Menu</div>

                <a class="nav-link" href="/admin">
                    <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                    Trang chính
                </a>

                <a class="nav-link" href="/admin/customer_management">
                    <div class="sb-nav-link-icon"><i class="fas fa-users"></i></div>
                    Quản lý khách hàng
                </a>

                <a class="nav-link" href="/admin/booking_management">
                    <div class="sb-nav-link-icon"><i class="fas fa-calendar-alt"></i></div>
                    Quản lý lịch hẹn
                </a>

                <a class="nav-link" href="/admin/staff_management">
                    <div class="sb-nav-link-icon"><i class="fas fa-user-tie"></i></div>
                    Quản lý nhân viên
                </a>

                <a class="nav-link" href="/admin/service_management">
                    <div class="sb-nav-link-icon"><i class="fas fa-cut"></i></div>
                    Quản lý dịch vụ
                </a>

                <a class="nav-link" href="/admin/revenue_management">
                    <div class="sb-nav-link-icon"><i class="fas fa-dollar-sign"></i></div>
                    Quản lý doanh thu
                </a>

                <!-- <a class="nav-link" href="/admin/response_management">
                    <div class="sb-nav-link-icon"><i class="fas fa-comments"></i></div>
                    Quản lý phản hồi
                </a> -->

                <a class="nav-link" href="/admin/salary_management">
                    <div class="sb-nav-link-icon"><i class="fas fa-money-check-alt"></i></div>
                    Quản lý lương
                </a>

            </div>
        </div>
        <div class="sb-sidenav-footer">
            <div class="small">Logged in as:</div>
            Admin Shop
        </div>
    </nav>
</div>
