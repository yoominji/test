<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="/WEB-INF/inc/user_head.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		$('.img-responsive').each(function() {
			var maxWidth = 150;
			var maxHeight = 130;
			var ratio = 0;
			var width = $(this).width();
			var height = $(this).height();

			$(this).css("height", maxHeight); //높이는 150으로 일정하게 유지

			if (width > maxWidth) {
				ratio = maxWidth / width;
				height = height * ratio;
				$(this).css("width", maxWidth);
			}

			if (height > maxHeight) {
				ratio = maxHeight / height;
				width = width * ratio;
				$(this).css("width", width);
			}

		});
	});
</script>
</head>
<body>
	<div class="container">
		<%@ include file="/WEB-INF/inc/user_topbar.jsp"%>

		<!-- 내용 영역 -->
		<div class="content">
			<!-- left_menu 시작 -->
			<div class="content">
				<div class="row">
					<div class="col-md-2 " role="navigation">
						<div class="left_menu">
							<ul class="tab" id="tab">
								<li class="active"><a href="#" class="tab01"> <img
										src="gallery_img/dogbtn.png" alt="강아지버튼" /></a></li>
								<li class="active"><a href="cat.html" class="tab01"> <img
										src="gallery_img/catbtn.png" alt="고양이버튼" /></a></li>
								<li class="active"><a href="celeb.html" class="tab01">
										<img src="gallery_img/celebbtn.png" alt="함께사진버튼" />
								</a></li>
							</ul>
						</div>
						<!--left_menu 끝-->
					</div>
					<!--사진1 -->
					<div class="col-sm-10 col-md-10 col-xs-10">
						<!-- 사진들 -->
						<div class="row">
							<div class="col-md-2">
								<a href="gallery_img/dog1.jpg" class="thumbnail"
									data-lightbox="photo" data-title="사진1"> <img
									src="gallery_img/dog1.jpg" class="img-responsive">
								</a>
							</div>
							<div class="col-md-2">
								<a href="gallery_img/dog2.jpg" class="thumbnail"
									data-lightbox="photo" data-title="사진2"> <img
									src="gallery_img/dog2.jpg" class="img-responsive">
								</a>
							</div>
							<div class="col-md-2">
								<a href="gallery_img/dog3.jpg" class="thumbnail"
									data-lightbox="photo" data-title="사진3"> <img
									src="gallery_img/dog3.jpg" class="img-responsive">
								</a>
							</div>
							<div class="col-md-2">
								<a href="gallery_img/dog4.jpg" class="thumbnail"
									data-lightbox="photo" data-title="사진4"> <img
									src="gallery_img/dog4.jpg" class="img-responsive">
								</a>
							</div>
							<div class="col-md-2">
								<a href="gallery_img/dog5.jpg" class="thumbnail"
									data-lightbox="photo" data-title="사진5"> <img
									src="gallery_img/dog5.jpg" class="img-responsive">
								</a>
							</div>
							<div class="col-md-2">
								<a href="gallery_img/dog6.jpg" class="thumbnail"
									data-lightbox="photo" data-title="사진5"> <img
									src="gallery_img/dog6.jpg" class="img-responsive">
								</a>
							</div>
						</div>
						<!-- 사진2 -->
						<div class="row">
							<div class="col-md-2">
								<a href="gallery_img/dog7.jpg" class="thumbnail"
									data-lightbox="photo" data-title="사진1"> <img
									src="gallery_img/dog7.jpg" class="img-responsive">
								</a>
							</div>
							<div class="col-md-2">
								<a href="gallery_img/dog8.jpg" class="thumbnail"
									data-lightbox="photo" data-title="사진2"> <img
									src="gallery_img/dog8.jpg" class="img-responsive">
								</a>
							</div>
							<div class="col-md-2">
								<a href="gallery_img/dog9.jpg" class="thumbnail"
									data-lightbox="photo" data-title="사진3"> <img
									src="gallery_img/dog9.jpg" class="img-responsive">
								</a>
							</div>
							<div class="col-md-2">
								<a href="gallery_img/dog10.jpg" class="thumbnail"
									data-lightbox="photo" data-title="사진4"> <img
									src="gallery_img/dog10.jpg" class="img-responsive">
								</a>
							</div>
							<div class="col-md-2">
								<a href="gallery_img/dog11.jpg" class="thumbnail"
									data-lightbox="photo" data-title="사진5"> <img
									src="gallery_img/dog11.jpg" class="img-responsive">
								</a>
							</div>
							<div class="col-md-2">
								<a href="gallery_img/dog12.jpg" class="thumbnail"
									data-lightbox="photo" data-title="사진5"> <img
									src="gallery_img/dog12.jpg" class="img-responsive">
								</a>
							</div>
						</div>
						<!--사진3 -->
						<div class="row">
							<div class="col-md-2">
								<a href="gallery_img/dog13.jpg" class="thumbnail"
									data-lightbox="photo" data-title="사진1"> <img
									src="gallery_img/dog13.jpg" class="img-responsive">
								</a>
							</div>
							<div class="col-md-2">
								<a href="gallery_img/dog14.jpg" class="thumbnail"
									data-lightbox="photo" data-title="사진2"> <img
									src="gallery_img/dog14.jpg" class="img-responsive">
								</a>
							</div>
							<div class="col-md-2">
								<a href="gallery_img/dog15.jpg" class="thumbnail"
									data-lightbox="photo" data-title="사진3"> <img
									src="gallery_img/dog15.jpg" class="img-responsive">
								</a>
							</div>
							<div class="col-md-2">
								<a href="gallery_img/dog16.jpg" class="thumbnail"
									data-lightbox="photo" data-title="사진4"> <img
									src="gallery_img/dog16.jpg" class="img-responsive">
								</a>
							</div>
							<div class="col-md-2">
								<a href="gallery_img/dog17.jpg" class="thumbnail"
									data-lightbox="photo" data-title="사진5"> <img
									src="gallery_img/dog17.jpg" class="img-responsive">
								</a>
							</div>
							<div class="col-md-2">
								<a href="gallery_img/dog18.jpg" class="thumbnail"
									data-lightbox="photo" data-title="사진5"> <img
									src="gallery_img/dog18.jpg" class="img-responsive">
								</a>
							</div>
						</div>
					</div>

					<!-- 목록 페이지 하단부의 쓰기버튼+검색폼+페이지 번호 공통 영역 include -->
					<%@ include file="/WEB-INF/inc/bbs_list_bottom.jsp"%>
				</div>

				<%@ include file="/WEB-INF/inc/footer.jsp"%>
			</div>
		</div>
	</div>
</body>
</html>