<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<base href="${pageContext.servletContext.contextPath }/">
<body>
	<!--HEADER -->
	<header>
		<!--Top Header-->
		<nav class="navbar navbar-expand-lg bg-dark">
			<div class="collapse navbar-collapse">
				<!--Search-->
				<form:form class="form-inline my-2 my-lg-0" modelAttribute="product">
					<input class="form-control" type="text" placeholder="Tìm kiếm..." path="name"/>
					<a class="btn btn-outline-light my-2 my-sm-0" type="submit" href="find.htm">
						<i class="fas fa-search"></i>						
					</a>
				</form:form>
			</div>
			<div class="col-md-3"></div>
			<a href="index.htm" class="navbar-brand" style="margin-right: 6rem;font-size: 1.5rem;">KingPerfume<span
				style="color: #00E8E8;">Shop</span></a>
			<!-- Collapse button -->
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target=".navbarMenu" aria-controls="navbarMenu"
				aria-expanded="false" aria-label="Toggle Navigation">
				<span class="navbar-toggle-icon"><i class="fas fa-bars fa-1x"></i></span>
			</button>
			<!--End Collapse button-->
			<div class="col-md-3 ml-3"></div>
			<div class="collapse navbar-collapse navbarMenu">
				<a class="btn shopping-cart" href="shopping-cart.htm"><i
					class="fas fa-shopping-cart fa-x text-white"></i><span
					class="cart-number">${sessionScope.myCartNum!=null?sessionScope.myCartNum:0}</span></a>
				<c:if test="${sessionScope.usersession==null}">
					<a class="btn menu-right-btn text-white" href="sign-in.htm"><i
						class="fas fa-user fa-x fa-fw"></i></a>
				</c:if>
				<c:if test="${sessionScope.usersession!=null}">
					<a class="btn menu-right-btn text-white" href="account-info.htm"><i
						class="fas fa-user fa-x fa-fw"></i></a>
					<a class="btn menu-right-btn text-white" href="logout.htm"><i
						class="fas fa-sign-out-alt fa-x fa-fw"></i></a>
				</c:if>
			</div>
		</nav>
		<!--End top header-->

		<!--Bottom Header-->
		<nav
			class="navbar navbar-expand-lg navbar-light bg-dark navbar-inverse">
			<div class="collapse navbar-collapse"></div>
			<div class="collapse navbar-collapse navbarMenu">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a href="index.htm"
						class="nav-link">Trang chủ <span class="sr-only">(current)</span></a>
					</li>
					<li class="nav-item"><a href="about.htm" class="nav-link">Giới thiệu</a></li>
					<li class="dropdown nav-item"><a href="product.htm" class="nav-link">Sản phẩm</a>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							<c:forEach var="l" items="${listBrand}">
								<a class="dropdown-item" href="/${l.name}" />${l.name}</a>
							</c:forEach>
						</div></li>
					<li class="nav-item"><a href="shop.htm" class="nav-link">Cửa hàng</a></li>
					<li class="nav-item"><a href="contact.htm" class="nav-link">Liên hệ</a></li>
				</ul>
			</div>
		</nav>
		<!--End Bottom Header-->
	</header>
	<!--END HEADER-->
</body>
</html>