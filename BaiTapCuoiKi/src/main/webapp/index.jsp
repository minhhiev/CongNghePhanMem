<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Team Java</title>
<%@ include file="all_component/allCss.jsp"%>
<style type="text/css">

.crd-ho:hover {
	background-color: #fcf7f7;
}

.bg-cl {
	background-color: #ffff1a;
}

.bg-cl:hover {
	background-color: #ff751a;
	text-decoration: none;
}

#home img{
	width: 100%;
	height: 100vh;
	background-size: cover;
	background-position: top 1px center;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: flex-start;
}

.about {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(18rem,auto));
	gap: 2rem;
}

.about-img img {
	border-radius: 3rem 0 3rem 3rem;
}

.about-text span {
	font-size: 1 rem;
	text- transform: uppercase;
	font-weight: 500;
	color: var(]-main-color);
}

.about-text p {
	font-size: 0.938rem;
	margin: 1rem 0 1rem;
}

</style>
</head>
<body style="background-color: #f7f7f7;">

	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%@include file="all_component/navbar.jsp"%>
	
	<section id="home">
		
		<img src="image/bg.png" alt="">
		
	</section> <br>
	
	<div class="container-fluid back-image">
		<h2 class="text-center text-danger"></h2>
	</div>

	<!-- Start vip room  -->
	<div class="container text-center mt-5 py-5">
		<h3 class="text-center">VIP</h3>
		<hr class="mx-auto">
        <p>Here you can see our VIP products</p>
		<div class="row">
			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getVipBooks();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="cart-body">
						<image alt="" src="book/<%=b.getPhotoName()%>"
							style="width:150px; height:150px" class="image-thumblin ml-5">
						<p class="text-center text-danger ml-1"><%=b.getBookName()%></p>
						<p class="text-center text-danger ml-1"><%=b.getAuthor()%></p>
						<p class="text-center text-danger ml-1">

							<%
							if (b.getBookCategory().equals("Old")) {
							%>
							Categories:<%=b.getBookCategory()%></p>
						<div class="row">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fa-solid fa-dollar-sign"></i></a>
						</div>
						<%
						} else {
						%> Categories: <%=b.getBookCategory()%></p>
						<div class="row">

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-secondary btn-sm ml-3">Booking</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-secondary btn-sm ml-3">Booking</a>
							<%
							}
							%>
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a>
								
								
								 <a href=""
								class="btn btn-secondary btn-sm ml-1"><%=b.getPrice()%><i
								class="fa-solid fa-dollar-sign"></i></a>
						</div>
						<%
						}
						%>
						
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-1">
			<a href="all_vip_room.jsp"
				class="btn btn-success btn-sm text-white">View All</a>
		</div>

	</div>
	<!-- End vip room -->

	<!-- Start type1 -->
	<div class="container text-center mt-5 py-5">
		<h3 class="text-center">TYPE1</h3>
		<hr class="mx-auto">
        <p>Here you can see our TYPE1 products</p>
		<div class="row">

			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getTyp1Book();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="cart-body">
						<image alt="" src="book/<%=b.getPhotoName()%>"
							style="width:150px; height:150px"
							class="image-thumblin btn-sm ml-5">
						<p class="text-center text-danger ml-1">LOT: <%=b.getBookName()%></p>
						<p class="text-center text-danger ml-1">NUMBER: <%=b.getAuthor()%></p>
						<p class="text-center text-danger ml-1">
							TYPE:
							<%=b.getBookCategory()%></p>
						<div class="row">

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-secondary btn-sm ml-3">Booking</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-secondary btn-sm ml-3">Booking</a>
							<%
							}
							%>

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-secondary btn-sm ml-1"><%=b.getPrice()%> <i
								class="fa-solid fa-dollar-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-1">
			<a href="all_type1_room.jsp" class="btn btn-success btn-sm text-white">View
				All</a>
		</div>

	</div>
	<!-- End New Book -->

	<hr>

	<!-- Start Old Book -->
	<div class="container text-center mt-5 py-5">
		<h3 class="text-center">TYPE2</h3>
		<hr class="mx-auto">
        <p>Here you can see our TYPE2 products</p>
		<div class="row">
			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list3 = dao2.getTyp2Books();
			for (BookDtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="cart-body">
						<image alt="" src="book/<%=b.getPhotoName()%>"
							style="width:150px; height:150px"
							class="image-thumblin btn-sm ml-5">
					    <p class="text-center text-danger ml-1">LOT: <%=b.getBookName()%></p>
						<p class="text-center text-danger ml-1">TYPE: <%=b.getAuthor()%></p>
						<p class="text-center text-danger ml-1">
							Type:
							<%=b.getBookCategory()%></p>
						<div class="row">

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-secondary btn-sm ml-3">Booking</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-secondary btn-sm ml-3">Booking</a>
							<%
							}
							%>

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-secondary btn-sm ml-1"><%=b.getPrice()%> <i
								class="fa-solid fa-dollar-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-1">
			<a href="all_type2_room.jsp" class="btn btn-success btn-sm text-white">View
				All</a>
		</div>

	</div>
	<!-- End Old Book -->
	
	<section id="services" class="my-5 pb-5">
      <div class="container text-center mt-5 py-5">
        <h3>Services</h3>
        <hr class="mx-auto">
        <p>Here you can see our featured products</p>
      </div>
      
      <div class="about container" id="about">
        <div class="about-img">
        	<img class="img-fluid mb-3" src="image/services/8.jpg" alt="">
        </div>
        <div class="about-text">
         	<span> ROMAN SWIMMING FOOL</span>
         	<p> Features Our beautiful Roman style outdoor pool, including  children pool, located on the 1st floor, and opens daily from 6:00am to 8:00pm. Towels are available at the pool.</p>
         	<p>Please note that swimming in the pool is entirely at your own risk. Parents must supervise their children at all times. </p>
        	<p>The pool is closed for cleaning after 8:00pm </p>
      </div> <br>
      
       <div class="about-img">
        	<img class="img-fluid mb-3" src="image/services/9.jpg" alt="">
        </div>
        <div class="about-text">
         	<span> FITNESS CENTER</span>
         	<p> Location Annex Building-1st Floor Operation hours 6:00am-9:00pm</p>
         	<p>Free of charge for our hotel guest </p>
        	<p>With a fully-aquiped gym, free fitness roomfor members, you will easy to stay in shape wwhile you're here</p>
      </div> <br>
      
       <div class="about-img">
        	<img class="img-fluid mb-3" src="image/services/11.jpg" alt="">
        </div>
        <div class="about-text">
        <span> TOUR </span>
         	<p>Besides travel by resort tour and discovery tour, Vietnam Booking also has countless other types of tours, ensuring to serve all needs
         	 as well as suitable for many ages such as:
         	 festival tour, honeymoon tour, Group tours, team building tours, pilgrimage tours, football tours, cheap tours.</p>
      </div> <br>
      
    </section>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>