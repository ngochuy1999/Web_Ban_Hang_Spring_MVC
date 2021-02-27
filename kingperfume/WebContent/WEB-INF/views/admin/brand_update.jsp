<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
						<h2>Thêm thương hiệu</h2>
						<div class="col-md-12 compose-right">
							<div class="inbox-details-default">
								<div class="inbox-details-heading">Form thêm thương hiệu </div>
								<div class="inbox-details-body">
									<div class="alert alert-info">${message}</div>
									<form:form class="com-mail" modelAttribute="brand">
										<label>Id</label> 
										<input type="text" placeholder="name..." name="id" value="${brand.id}" readonly/>
										<label>Name</label> 
										<input type="text" placeholder="name..." name="name" value="${brand.name}"/>
										<div>
										<form:errors path="name" />
										</div>
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
