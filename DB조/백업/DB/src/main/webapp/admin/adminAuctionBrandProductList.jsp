<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 200px">
			<h1 class="font-weight-semi-bold text-uppercase mb-3">옥션 등록</h1>
			<p class="m-0">
					${bname }
				</p>
			<div class="d-inline-flex">
				<p class="m-0">
					<a href="index.jsp">Home</a>
				</p>
			</div>
		</div>
	</div>

	<!-- Page Header End -->


	<!-- Shop Start -->
	<div id="my-container" class="container-fluid pt-5">



		<!-- Shop Product Start -->
		<div class="col-lg-9 col-md-12">
			<div class="row pb-3">


				<c:forEach var="CateGoriesList" items="${CateGoriesList }">
					<div class="col-lg-4 col-md-6 col-sm-12 pb-1">
						<div class="card product-item border-0 mb-4">
							<div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
								<a href="DBServlet?command=auction_brand_Product_Detail&pName=${CateGoriesList.pName}&bname=${CateGoriesList.bName}"><img class="img-fluid w-100" style="height: 280px" src="images/${CateGoriesList.imgUrl}" alt="">
								</a>
							</div>
							<div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
								<h6 class="text-truncate mb-3">${CateGoriesList.pName}</h6>
								<div class="d-flex justify-content-center">
									<%-- 통화 단위 지정 --%>
									<fmt:formatNumber value="${Integer.parseInt(CateGoriesList.price)}" pattern="###,###원" />
								</div>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
		</div>
		<!-- Shop Product End -->

	</div>

	<!-- Shop End -->


	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>