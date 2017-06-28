<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!-- 메뉴바 시작 -->
<div class="navbar navbar-inverse" role="navigation">
    <!-- 로고 영역 시작 -->
    <div class="navbar-header">
        <!-- 반응형 메뉴 버튼 시작 -->
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">메뉴열기</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <!-- 반응형 메뉴 버튼 끝 -->
    </div>
    <!-- 로고 영역 끝 -->
    <!-- 메뉴 영역 시작 -->
    <div class="navbar-collapse collapse">
        <!-- 메뉴 항목 시작 -->
        <ul class="nav navbar-nav">
            <li class="dropdown">
                <a href="${pageContext.request.contextPath}/admin/member/member_list.do" class="dropdown-toggle" data-toggle="dropdown">회원관리 <b class="caret"></b></a>
                <ul class="dropdown-menu nav-dropdown">
                    <li><a href="${pageContext.request.contextPath}/admin/member/member_list.do">회원정보</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/member/member_out.do">탈퇴신청</a></li>
                </ul>
            </li>
            <li><a href="${pageContext.request.contextPath}/admin/bbs/document_list.do?bbsType=gallery&category=dog">갤러리</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/schedule/calendar.do">예약관리</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/bbs/document_list.do?bbsType=notice">공지사항</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/bbs/document_list.do?bbsType=qna">질의응답</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/logout.do">로그아웃</a></li>
        </ul>
        <!-- 메뉴 항목 끝 -->
    </div>
    <!-- 메뉴 영역 끝 -->
</div>
<!-- 메뉴바 끝 -->