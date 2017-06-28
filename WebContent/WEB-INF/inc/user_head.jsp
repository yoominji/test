<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<title>Pet Studio</title>
<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet">
<!-- 나눔고딕 웹 폰트 적용 -->
<link href="${pageContext.request.contextPath}/assets/css/nanumfont.css" rel="stylesheet">
<!-- 반응형 웹을 지원하지 않을 경우 -->
<!--<link href="assets/css/non-responsive.css" rel="stylesheet">-->
<!-- 공통 CSS -->
<link href="${pageContext.request.contextPath}/assets/css/user.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/user_sub.css" rel="stylesheet">
<!-- lightbox plugin -->
<link href="${pageContext.request.contextPath}/assets/plugins/lightbox/css/lightbox.min.css" rel="stylesheet" />
<!-- IE8 이하 버전 지원 -->
<!--[if lt IE 9]>
  <script src="${pageContext.request.contextPath}/assets/js/html5shiv.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/respond.min.js"></script>
<![endif]-->
<!-- IE10 반응형 웹 버그 보완 -->
<!--[if lt IE 9]>
  <link href="${pageContext.request.contextPath}/assets/css/ie10.css" rel="stylesheet">
  <script src="${pageContext.request.contextPath}/assets/js/ie10.js"></script>
<![endif]-->
<!-- Javascript -->
<script src="${pageContext.request.contextPath}/assets/js/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

<!-- 구글 맵 -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDuHZf5NrzzNt9njZowZCxydInW9EmHhuA"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/gmaps/gmaps.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/gmaps/gmaps_helper.js"></script>

<!-- validate 플러그인 참조 -->
<script src="${pageContext.request.contextPath}/assets/plugins/validate/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/validate/additional-methods.min.js"></script>

<!-- sweet alert -->
<link href="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert.css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert.min.js"></script>

<!-- 다음 우편번호 검색 스크립트 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/daumPostCode.js"></script>

<!-- chkeditor -->
<script src="http://cdn.ckeditor.com/4.5.8/standard/ckeditor.js"></script>

<!-- Multi-column -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/multi-column/ie-row-fix.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/multi-column/multi-columns-row.css" />

<!-- handlebars -->
<script src="${pageContext.request.contextPath}/assets/plugins/handlebars/handlebars-v4.0.5.js"></script>

<!-- ajax -->
<script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
<link href="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.css" rel="stylesheet">

<!-- ajax-form -->
<script src="${pageContext.request.contextPath}/assets/plugins/ajax-form/jquery.form.min.js"></script>