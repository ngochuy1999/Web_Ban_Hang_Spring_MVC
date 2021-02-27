<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>category form</title>
<style type="text/css">
*[id$=errors]{
	color:red;
	font-style: italic;
}
</style>
</head>
<body>
	<div class="page-container">

		<div class="left-content">

			<div class="mother-grid-inner">

				<jsp:include page="header.jsp"></jsp:include>

				<div class="inner-block">
					<div class="inbox">
						<h2>Cập nhật sản phẩm</h2>
						<div class="col-md-12 compose-right">
							<div class="inbox-details-default">
								<div class="inbox-details-heading">Form thêm sản phẩm</div>
								<div class="inbox-details-body">
									<div class="alert alert-info">${message}</div>
									
									<form:form class="com-mail"  action="admin/product/update/${product.id}.htm" modelAttribute="product" method="POST">
										<label>Id</label> 
										<input type="text" name="id" value="${product.id}" readonly/>
										<label>Tên sản phẩm</label>
										<input type="text" name="name" value="${product.name}"/>
										<div><form:errors path="name" /></div>
										<label>Giá</label> 
										<input type="number" name="price" value="${product.price}"/>
										<form:errors path="price" />
										<label>Số lượng</label>
										<input type="number" name="quantity" value="${product.quantity}"/>
										<form:errors path="quantity" />
										<label>Năm</label>
										<input type="number" name="year" value="${product.year}"/>
										<form:errors path="year" />
										<br>
										<label>Nguồn gốc</label>
										<input type="text" name="madein" value="${product.madein}"/>
										<div><form:errors path="madein" /></div> 
										<label>Hình ảnh</label> 
										<img src="${product.url}">
										<input type="text" name="url" value="${product.url}"/>
										<div><form:errors path="url" /></div>
										<label>Description</label>
										<textarea rows="6" name="description"><c:out value="${product.description}"/></textarea>
										<div><form:errors path="description" /></div>
										<label>Giới tính</label>
										<!-- Combobox -->
										<form:select path="sex.id" items="${sexs}" itemValue="id" itemLabel="name" />
										<form:errors path="sex.id" />
										<label>Thương hiệu</label>
										<!-- Combobox -->
										<form:select path="brand.id" items="${brands}" itemValue="id" itemLabel="name" />
										<form:errors path="brand.id" />
										<label>Show room</label>
										<!-- Combobox -->
										<form:select path="supplier.id" items="${showroom}" itemValue="id" itemLabel="name" />
										<form:errors path="supplier.id" />
										<label>Tình trạng</label>
										<!-- Combobox -->
										<form:select path="productstatus.id" items="${productStatus}" itemValue="id" itemLabel="name" />
										<form:errors path="productstatus.id" />
										<br>
										<button type="submit">Cập nhật</button>
									</form:form>
								</div>
							</div>
						</div>

						<div class="clearfix"></div>
					</div>
				</div>

				<jsp:include page="footer.jsp"></jsp:include>

			</div>

		</div>

		<jsp:include page="navigation.jsp"></jsp:include>

	</div>
</body>
</html>