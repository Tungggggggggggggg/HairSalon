<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <div class="sb-sidenav-menu-heading">Menu</div>
                <a class="nav-link" href="${pageContext.request.contextPath}/staff">
                    <div class="sb-nav-link-icon"><i class="fas fa-calendar-alt"></i></div>
                    Lịch làm việc
                </a>

                <c:if test="${not empty loggedInStaff}">
                    <a class="nav-link" href="${pageContext.request.contextPath}/staff/information">
                        <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                        Thông tin nhân viên: ${loggedInStaff.name}
                    </a>

                    <a class="nav-link" href="${pageContext.request.contextPath}/staff/salary">
                        <div class="sb-nav-link-icon"><i class="fas fa-money-check-alt"></i></div>
                        Lương nhân viên
                    </a>

                    <a class="nav-link" href="${pageContext.request.contextPath}/staff/bookings">
                        <div class="sb-nav-link-icon"><i class="fas fa-calendar-alt"></i></div>
                        Lịch hẹn
                    </a>
                </c:if>

            </div>
        </div>

    </nav>
</div>
