<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Home</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/slideshow-product.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<!-- Icon -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet">
<!--Carousel-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendor/owlcarousel/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendor/owlcarousel/css/owl.theme.default.min.css">
</head>

<body>

	<%@include file="../../resources/fragments/header.jsp"%>
	<main> <!--Slide Show-->
	<div class="section-1">
		<div class="container text-center">
			<div class="category-title">
				<h1 class="heading-1">DIOR</h1>
			</div>
		</div>
	</div>
	<div class="carousel slide carousel-multi-item mb-3"
		data-ride="carousel">
		<div class="carousel-inner">
			<div class="container">
				<div class="owl-carousel owl-theme">
					<c:forEach var="l" items="${listProductDior}">
						<div class="col-md-4 item" style="width: 5rem;">
							<div class="card">
								<img src="${l.url }" alt="Img1" class="card-img-top">
								<div class="card-body">
									<h4 class="card-title">${l.name }</h4>
									<p class="card-text">
										<span>Giá: </span> <fmt:formatNumber pattern ="#,###,###,###" value = "${l.price}"/> VNĐ
									</p>
									<a href="shopping-cart/add/${l.id}.htm" class="btn btn-danger ml-3">Mua ngay</a> <a
										href="detail/${l.id}.htm" class="btn btn-success ml-3">Xem
										chi tiết</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!--End Slide Show--> <!--Slide Show-->
	<div class="section-1">
		<div class="container text-center">
			<div class="category-title">
				<h1 class="heading-1">VERSACE</h1>
			</div>
		</div>
	</div>
	<div class="carousel slide carousel-multi-item mb-3"
		data-ride="carousel">
		<div class="carousel-inner">
			<div class="container">
				<div class="owl-carousel owl-theme">
					<c:forEach var="l" items="${listProductVersace}">
						<div class="col-md-4 item" style="width: 5rem;">
							<div class="card">
								<img src="${l.url }" alt="Img1" class="card-img-top">
								<div class="card-body">
									<h4 class="card-title">${l.name }</h4>
									<p class="card-text">
										<span>Giá: </span> <fmt:formatNumber pattern ="#,###,###,###" value = "${l.price}"/> VNĐ
									</p>
									<a href="shopping-cart/add/${l.id}.htm" class="btn btn-danger ml-3">Mua ngay</a> <a
										href="detail/${l.id}.htm" class="btn btn-success ml-3">Xem
										chi tiết</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!--End Slide Show--> <!--Slide Show-->
	<div class="section-1">
		<div class="container text-center">
			<div class="category-title">
				<h1 class="heading-1">CHANEL</h1>
			</div>
		</div>
	</div>
	<div class="carousel slide carousel-multi-item mb-3"
		data-ride="carousel">
		<div class="carousel-inner">
			<div class="container">
				<div class="owl-carousel owl-theme">
					<c:forEach var="l" items="${listProductChanel}">
						<div class="col-md-4 item" style="width: 5rem;">
							<div class="card">
								<img src="${l.url }" alt="Img1" class="card-img-top">
								<div class="card-body">
									<h4 class="card-title">${l.name }</h4>
									<p class="card-text">
										<span>Giá: </span> <fmt:formatNumber pattern ="#,###,###,###" value = "${l.price}"/> VNĐ
									</p>
									<a href="shopping-cart/add/${l.id}.htm" class="btn btn-danger ml-3">Mua ngay</a> <a
										href="detail/${l.id}.htm" class="btn btn-success ml-3">Xem
										chi tiết</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!--End Slide Show--> </main>

	<%@include file="../../resources/fragments/footer.jsp"%>

	<!--Bootsrap 4 js-->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<!--Animation-->
	<script src="https://unpkg.com/scrollreveal"></script>
	<!--Carousel-->
	<script defer
		src="${pageContext.request.contextPath}/resources/vendor/owlcarousel/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/owlcarousel/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/animation.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/slideshow-product.js"></script>
</body>

</html>