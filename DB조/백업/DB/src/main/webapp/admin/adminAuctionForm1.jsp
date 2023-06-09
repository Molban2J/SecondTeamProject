<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>

	<!-- Page Header Start -->
	<div class="container bg-secondary mb-3" style="max-width: 800px;">
		<div
			class="d-flex flex-column align-items-center justify-content-center"
			style="min-height: 200px"
		>
			<h1 class="font-weight-semi-bold text-uppercase mb-3">옥션 등록</h1>
			<div class="d-inline-flex">
				<p class="m-0">
					<a href="index.jsp">Home</a>
				</p>
			</div>
		</div>
	</div>

	<!-- Categories Start -->
	<div class="container-fluid pt-5">
		<div class="row px-xl-5 pb-3">
			<div class="col-lg-4 col-md-6 pb-1">
				<div class="cat-item text-center" style="padding: 30px;">
					<p class="text-right"></p>
					<a href="DBServlet?command=AUCTION_BRAND_LIST&bname=balenciaga"
						class="cat-img position-relative overflow-hidden mb-3"
					> <img class="img-fluid" src="images/balenciagalogo.png" alt="">
					</a>
					<h5 class="font-weight-semi-bold m-0"></h5>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 pb-1">
				<div class="cat-item text-center" style="padding: 30px;">
					<p class="text-right"></p>
					<a href="DBServlet?command=AUCTION_BRAND_LIST&bname=hermes"
						class="cat-img position-relative overflow-hidden mb-3"
					> <img class="img-fluid" src="images/hermeslogo.png" alt="">
					</a>
					<h5 class="font-weight-semi-bold m-0"></h5>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 pb-1">
				<div class="cat-item text-center" style="padding: 30px;">
					<p class="text-right"></p>
					<a href="DBServlet?command=AUCTION_BRAND_LIST&bname=louisvuitton"
						class="cat-img position-relative overflow-hidden mb-3"
					> <img class="img-fluid" src="images/louisvuittonlogo.png" alt="">
					</a>
					<h5 class="font-weight-semi-bold m-0"></h5>
				</div>

			</div>
			<div class="col-lg-4 col-md-6 pb-1">
				<div class="cat-item text-center" style="padding: 30px;">
					<p class="text-right"></p>
					<a href="DBServlet?command=AUCTION_BRAND_LIST&bname=prada"
						class="cat-img position-relative overflow-hidden mb-3"
					> <img class="img-fluid" src="images/pradalogo.png" alt="">
					</a>
					<h5 class="font-weight-semi-bold m-0"></h5>
				</div>

			</div>
			<div class="col-lg-4 col-md-6 pb-1">
				<div class="cat-item text-center" style="padding: 30px;">
					<p class="text-right"></p>
					<a href="DBServlet?command=AUCTION_BRAND_LIST&bname=Saint Laurent"
						class="cat-img position-relative overflow-hidden mb-3"
					> <img class="img-fluid" src="images/saintlaurentlogo.png" alt="">
					</a>
					<h5 class="font-weight-semi-bold m-0"></h5>
				</div>

			</div>


		</div>
	</div>
	<!-- Categories End -->


	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>