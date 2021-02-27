<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>product form</title>
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
						<h2>Product Details</h2>
						<div class="col-md-12 compose-right">
							<div class="inbox-details-default">
								<div class="inbox-details-heading">Compose New Message</div>
								<div class="inbox-details-body">
									<div class="alert alert-info">${message }</div>
									<form:form action="admin/product/insert.htm" class="com-mail" modelAttribute="product" methods="POST">
										
										<label>Tên sản phẩm</label> 
										<form:input type="text" placeholder="ABC" path="name"/>
										<div><form:errors path="name" /></div>
										<label>Giá</label> 
										<form:input type="number" placeholder="123,000 VNĐ" path="price"/>
										<form:errors path="price" />
										<label>Số lượng</label> 
										<form:input type="number" placeholder="200" path="quantity"/>
										<form:errors path="quantity" />
										<label>Năm sản xuất</label> 
										<form:input type="number" placeholder="2010" path="year"/>
										<form:errors path="year" />
										<br>
										<label>Nguồn gốc</label> 
										<form:input type="text" placeholder="..." path="madein"/>
										<div><form:errors path="madein" /></div>
										<label>Hình ảnh</label> 
										<form:input type="text" placeholder="" path="url"/>
										<div><form:errors path="url" /></div>
										<label>Description</label>
										<form:textarea rows="6" placeholder="description..." path="description"/>
										<div><form:errors path="description" /></div>
										<label>Giới tính</label>
										<!-- Combobox -->
										<form:select path="sex.id" items="${sexs}" itemValue="id" itemLabel="name" />
										<label>Loại sản phẩm</label>
										<!-- Combobox -->
										<form:select path="brand.id" items="${brands}" itemValue="id" itemLabel="name" />
										
										<label>Show room</label>
										<!-- Combobox -->
										<form:select path="supplier.id" items="${showroom}" itemValue="id" itemLabel="name" />
										<label>Tình trạng</label>
										<!-- Combobox -->
										<form:select path="productstatus.id" items="${productStatus}" itemValue="id" itemLabel="name" />
										<br>
										<button type="submit">Save</button>
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
