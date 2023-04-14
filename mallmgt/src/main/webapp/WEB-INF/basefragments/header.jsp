<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style><%@include file="/WEB-INF/css/header.css"%></style>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<nav class="navbar navbar-expand-lg navbar-light bg-light" style="background: black !important;">
	<div class="container-fluid">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/home" style="color: white;">MEME</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav" style="justify-content: space-between;">
			<div class="float-left">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="${pageContext.request.contextPath}/home" style="color: white;">Home</a>
					</li>

					<c:if test="${sessionScope.user == null}">
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/registration" style="color: white;">SignUp</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/loginView" style="color: white;">Login</a></li>
					</c:if>

					<c:if test="${sessionScope.user.userRole == 'Admin'}">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false" style="color: white;"> Users </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/registration">Add
									User</a> <a class="dropdown-item"
									href="${pageContext.request.contextPath}/userList">User
									List</a>
							</div></li>


						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false" style="color: white;"> Movies </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/movie">Add Movie</a> <a
									class="dropdown-item"
									href="${pageContext.request.contextPath}/movieList">Movies
									List</a> <a class="dropdown-item"
									href="${pageContext.request.contextPath}/movieGrid">Movies
									Booking View</a>

							</div></li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false" style="color: white;"> Parking </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/parking">Add
									Parking</a> <a class="dropdown-item"
									href="${pageContext.request.contextPath}/parkinglist">View
									List</a>
							</div></li>
					
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false" style="color: white;"> Food </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/foodStall">Add
									Stall</a> <a class="dropdown-item"
									href="${pageContext.request.contextPath}/foodStallList">Stall
									List</a>
								<!-- 	<a class="dropdown-item"
									href="${pageContext.request.contextPath}/viewFoodMenu">Add Food Menu</a>
									
									<a class="dropdown-item"
									href="${pageContext.request.contextPath}/foodMenu">View Food Menu</a>  -->
									
									<!-- <a class="dropdown-item"
									href="${pageContext.request.contextPath}/viewCart">Food Cart</a> -->	
							</div></li>
							
					<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false" style="color: white;"> Game </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/game">Add
									Game</a> <a class="dropdown-item"
									href="${pageContext.request.contextPath}/gameList">Game
									List</a>
									
								<!-- <a class="dropdown-item"
									href="${pageContext.request.contextPath}/gameRecharge">Recharge</a>  -->	
									
							</div></li>
							


						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false" style="color: white;"> Shop </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/shop">Add
									Shop</a> <a class="dropdown-item"
									href="${pageContext.request.contextPath}/shopList">Shop
									List</a>
							</div></li>
							
							
								<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false" style="color: white;"> Event </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/event">Add
									Event</a> <a class="dropdown-item"
									href="${pageContext.request.contextPath}/eventList">Event
									List</a>
							</div></li>
							
							
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false" style="color: white;"> Job </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/job">Add
									Job</a> <a class="dropdown-item"
									href="${pageContext.request.contextPath}/jobList">Job
									List</a>
									
								<!-- 	<a class="dropdown-item"
									href="${pageContext.request.contextPath}/applyjobList">Job
									Application</a>  -->
									
							</div></li>							
									<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false" style="color: white;"> Deal </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/deal">Add
									Deal</a> <a class="dropdown-item"
									href="${pageContext.request.contextPath}/dealList">Deal
									List</a>									
							</div></li>



						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false" style="color: white;"> Bookings History </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/movieBookingList">Movie
									Booking</a> <a class="dropdown-item"
									href="${pageContext.request.contextPath}/bookinglist">Parking
									Booking</a>
									
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/foodBookingHistory">Food Booking</a>
							</div></li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false" style="color: white;"> Payment History </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/paymentlist">
									Payment History</a>
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/foodPaymentList">
									Food Payment History</a>	
									
							</div></li>

					</c:if>

					<c:if test="${sessionScope.user.userRole == 'User'}">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false" style="color: white;"> Movies </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/movieList">Movies
									List</a> <a class="dropdown-item"
									href="${pageContext.request.contextPath}/movieGrid">Book
									Movie Ticket</a>

							</div></li>


						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false" style="color: white;"> Parking </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/parkinglist">Book
									Parking Slot</a>
							</div></li>
							
							
								<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false" style="color: white;"> Food </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							

									<a class="dropdown-item"
									href="${pageContext.request.contextPath}/foodStallList">View Food Stalls</a>
									
									<a class="dropdown-item"
									href="${pageContext.request.contextPath}/viewCart">Food Cart</a>
								
									
							</div></li>
							
							
									<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false" style="color: white;"> Game </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								 <a class="dropdown-item"
									href="${pageContext.request.contextPath}/gameList">Game
									List</a>
									
									<a class="dropdown-item"
									href="${pageContext.request.contextPath}/gameRecharge">Recharge</a>
									
							</div></li>
							
								<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false" style="color: white;"> Shop </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								 <a class="dropdown-item"
									href="${pageContext.request.contextPath}/shopList">Shop
									List</a>
							</div></li>
							
							
								<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false" style="color: white;"> Event </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								 <a class="dropdown-item"
									href="${pageContext.request.contextPath}/eventList">Event
									List</a>
							</div></li>
							
							
									<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false" style="color: white;"> Job </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								 <a class="dropdown-item"
									href="${pageContext.request.contextPath}/jobList">Job
									List</a>
									
									<!-- <a class="dropdown-item"
									href="${pageContext.request.contextPath}/applyjobList">Job
									Application</a>  -->
									
							</div></li>
							
								<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false" style="color: white;"> Deal </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								 <a class="dropdown-item"
									href="${pageContext.request.contextPath}/dealList">Deal
									List</a>									
							</div></li>
							

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false" style="color: white;"> Bookings History </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/movieBookingList">Movie
									Booking</a> <a class="dropdown-item"
									href="${pageContext.request.contextPath}/bookinglist">Parking
									Booking</a>
									
									<a class="dropdown-item"
									href="${pageContext.request.contextPath}/foodBookingHistory">Food Booking</a>
									
							</div></li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false" style="color: white;"> Payment History </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/paymentlist">
									Payment History</a>
							</div></li>

					</c:if>



				</ul>
			</div>
			<div class="float-right" style="margin-left: 100px">
				<ul class="navbar-nav">
					<c:if test="${sessionScope.user != null}">
					 	 <!--  <li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/logout" style="color: white;">Logout</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/userEdit?id=${sessionScope.user.id}" style="color: white;">My
								Profile</a></li>  -->
						    <li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false" style="color: white;"> <i class="fa fa-user" style="color:white; font-size: 20px;"></i> </a>
							
							<div class="dropdown-menu profile-dropdown" aria-labelledby="navbarDropdown">
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/userEdit?id=${sessionScope.user.id}">
									View Profile</a> <a class="dropdown-item"
									href="${pageContext.request.contextPath}/logout">Logout</a>

							</div></li>	
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</nav>