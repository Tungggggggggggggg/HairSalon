<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <div class="sb-sidenav-menu-heading">Menu</div>
                <a class="nav-link" href="../staff">
                    <div class="sb-nav-link-icon"><i class="fas fa-calendar-alt"></i></div>
                    Lịch làm việc
                </a>

                <c:if test="${not empty loggedInStaff}">
                    <a class="nav-link" href="../Staff_Information/${loggedInStaff.id}">
                        <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                        Thông tin nhân viên: ${loggedInStaff.name}
                    </a>
                </c:if>

                <a class="nav-link" href="../Staff_Salary">
                    <div class="sb-nav-link-icon"><i class="fas fa-money-check-alt"></i></div>
                    Lương nhân viên
                </a>
            </div>
        </div>

    </nav>
</div>
