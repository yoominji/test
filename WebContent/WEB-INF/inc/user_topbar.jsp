<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!-- 로고와 버튼 시작 -->
<div class="row">
    <div class="col-md-5">&nbsp;</div>
    <div class="col-md-3">
        <a href="${pageContext.request.contextPath}/main.do"><img src="${pageContext.request.contextPath}/assets/img/logo2.png" /></a>
    </div>
    <div class="col-md-1">&nbsp;</div>
    <div class="col-md-3">
        <div class="btn-group member-menu pull-right">
        <c:choose>
			<c:when test="${loginInfo == null}">
				<!-- 로그인(메뉴 우측) -->
				<a href="${pageContext.request.contextPath}/member/login.do" class="btn btn-default">로그인</a>
	            <a href="${pageContext.request.contextPath}/member/join.do" class="btn btn-default">회원가입</a>
	            <a href="${pageContext.request.contextPath}/member/mypage.do" class="btn btn-default">마이페이지</a>
				<!--// 로그인(메뉴 우측) -->
			</c:when>
			<c:otherwise>
				<!-- 로그인 된 경우 -->
				<a href="${pageContext.request.contextPath}/member/logout.do" class="btn btn-default">로그아웃</a>
	            <a href="${pageContext.request.contextPath}/member/mypage.do" class="btn btn-default">마이페이지</a>
				<!--// 로그인 된 경우 -->
			</c:otherwise>
		</c:choose>
            
        </div>
    </div>
</div>
<!-- 로고와 버튼 끝 -->
<!-- 여백 -->
<div class="space"></div>
<!-- 메뉴바 시작 -->
<div class="navbar navbar-default" role="navigation">
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
        </button>
        <!-- 반응형 메뉴 버튼 끝 -->
    </div>
    <!-- 로고 영역 끝 -->
    <!-- 메뉴 영역 시작 -->
    <div class="navbar-collapse collapse">
        <!-- 메뉴 항목 시작 -->
        <ul class="nav navbar-nav">
            <li class="dropdown">
                <a href="${pageContext.request.contextPath}/aboutus/intro.do" class="dropdown-toggle" data-toggle="dropdown">ABOUT US <b class="caret"></b></a>
                <ul class="dropdown-menu nav-dropdown">
                    <li><a href="${pageContext.request.contextPath}/aboutus/intro.do">소개</a></li>
                    <li><a href="${pageContext.request.contextPath}/aboutus/directions.do">오시는 길</a></li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="${pageContext.request.contextPath}/information/guide.do" class="dropdown-toggle" data-toggle="dropdown">INFORMATION <b class="caret"></b></a>
                <ul class="dropdown-menu nav-dropdown">
                    <li><a href="${pageContext.request.contextPath}/information/guide.do">이용안내</a></li>
                    <li><a href="${pageContext.request.contextPath}/information/view.do">전경</a></li>
                    <li><a href="${pageContext.request.contextPath}/information/clothes.do">의상안내</a></li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="${pageContext.request.contextPath}/bbs/document_list.do?bbsType=gallery&category=dog" class="dropdown-toggle" data-toggle="dropdown">GALLERY <b class="caret"></b></a>
                <ul class="dropdown-menu nav-dropdown">
                    <li><a href="${pageContext.request.contextPath}/bbs/document_list.do?bbsType=gallery&category=dog">DOG</a></li>
                    <li><a href="${pageContext.request.contextPath}/bbs/document_list.do?bbsType=gallery&category=cat">CAT</a></li>
                    <li><a href="${pageContext.request.contextPath}/bbs/document_list.do?bbsType=gallery&category=celeb">CELEB</a></li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="${pageContext.request.contextPath}/schedule/booking.do" class="dropdown-toggle" data-toggle="dropdown">SCHEDULE <b class="caret"></b></a>
                <ul class="dropdown-menu nav-dropdown">
                    <li><a href="${pageContext.request.contextPath}/schedule/booking.do">예약하기</a></li>
                    <li><a href="${pageContext.request.contextPath}/schedule/calendar.do">예약현황</a></li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="${pageContext.request.contextPath}/bbs/document_list.do?bbsType=notice" class="dropdown-toggle" data-toggle="dropdown">BOARD <b class="caret"></b></a>
                <ul class="dropdown-menu nav-dropdown">
                    <li><a href="${pageContext.request.contextPath}/bbs/document_list.do?bbsType=notice">공지사항</a></li>
                    <li><a href="${pageContext.request.contextPath}/bbs/document_list.do?bbsType=qna">질의응답</a></li>
                </ul>
            </li>
        </ul>
        <!-- 메뉴 항목 끝 -->
    </div>
    <!-- 메뉴 영역 끝 -->
</div>
<!-- 메뉴바 끝 -->