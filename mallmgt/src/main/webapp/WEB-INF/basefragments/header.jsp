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
<c:choose>
<c:when test="${sessionScope.user == null}">
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
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/registration" style="color: white;">SignUp</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/loginView" style="color: white;">Login</a></li>
			</ul>
			</div>
			</div>
			</div>
			</nav>		
</c:when>
<c:otherwise>
<nav class="navbar" style="background: black !important;height: 60px !important;">
	<div class="container-fluid">
	<div style="display:flex; flex-direction: row;">
<div class="dropdown">
  <button class="btn btn-secondary menu-btn" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="background: transparent;
    border: none;padding-top: 10px;margin-left: -25px;">
    <i class="fa fa-bars" style="font-size: 20px;color:white;"></i>
  </button>
  <div class="dropdown-menu dropdown-menu-left animated slideInLeft" aria-labelledby="dropdownMenuButton" style="background-color:black;left: -2px;padding: 10px;margin-top: 8px;">
    <ul class="navbar-nav">
					<c:if test="${sessionScope.user.userRole == 'Admin'}">
						<a class="dropdown-item" href="${pageContext.request.contextPath}/userList" style="color: white; padding-left: 0px;">Manage Users </a>
     
    <a class="dropdown-item moviesdropdown" style="color: white; padding-left: 0px; margin-top: 5px;">
                                Movies
                            </a>
						<ul class="submenu moviessubmenu">
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/movieList" style="color:white;margin-left: -40px;">Manage Movies</a></li> 
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/movieGrid" style="color:white;margin-left: -40px;">Book Movie</a></li>
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/movieBookingList" style="color:white;margin-left: -40px;">Booking History</a></li>
								<li><a class="dropdown-item" href="${pageContext.request.contextPath}/paymentlist" style="color:white;margin-left: -40px;margin-bottom: 5px;">
									Payment History</a></li>		
						</ul>
							
						<a class="dropdown-item parkingdropdown" href="#" style="color: white; padding-left: 0px;margin-top: 5px;"> Parking </a>
							<ul class="submenu parkingsubmenu">
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/parkinglist" style="color:white;margin-left: -40px;">Manage Parking Space</a></li>
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/bookinglist" style="color:white;margin-left: -40px;">
									Booking History</a></li>
								<li><a class="dropdown-item" href="${pageContext.request.contextPath}/paymentlist" style="color:white; margin-left: -40px;margin-bottom: 5px;">
									Payment History</a></li>	
							</ul>
					
						<a class="dropdown-item fooddropdown" href="#" style="color: white; padding-left: 0px;margin-top: 5px;"> Food </a>
							<ul class="submenu foodsubmenu">
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/foodStallList" style="color:white;margin-left: -40px;">Manage Food Stalls</a></li>
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/foodBookingHistory" style="color:white;margin-left: -40px;">Booking History</a></li>
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/foodPaymentList" style="color:white;margin-left: -40px;margin-bottom: 5px;">
									Payment History</a></li>	
							</ul>
							
					<a class="dropdown-item" href="${pageContext.request.contextPath}/gameList" style="color:white; padding-left: 0px;margin-top: 5px;">Manage Games</a>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/shopList" style="color:white; padding-left: 0px; margin-top: 5px; margin-bottom:5px;">Manage Shops</a>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/dealList" style="color:white; padding-left: 0px; margin-top: 5px; margin-bottom:5px;">Manage Deals</a>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/eventList" style="color:white; padding-left: 0px;margin-top:5px;">Manage Events</a>		
					<a class="dropdown-item jobdropdown" href="#" style="color: white; padding-left: 0px;margin-top: 5px;"> Jobs </a>
							<ul class="submenu jobsubmenu">
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/jobList" style="color:white;margin-left: -40px;">Manage Jobs</a></li>
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/applyjobList" style="color:white;margin-left: -40px;margin-bottom: 5px;">Review
									Applications</a></li>
							</ul>						
					</c:if>

					<c:if test="${sessionScope.user.userRole == 'User'}">
						<a class="dropdown-item moviesdropdown" href="#" style="color: white; padding-left: 0px; margin-top: 5px;"> Movies </a>
							<ul class="submenu moviessubmenu">
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/movieGrid" style="color:white;margin-left: -40px;">Book
									Movie Ticket</a></li>
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/movieBookingList" style="color:white;margin-left: -40px;margin-bottom:5px;">Booking History</a></li>	
							</ul>		


						<a class="dropdown-item parkingdropdown" href="#" style="color: white; padding-left: 0px; margin-top: 5px;"> Parking </a>
							<ul class="submenu parkingsubmenu">
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/parkinglist" style="color:white;margin-left: -40px;">Book
									Parking Slot</a></li>
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/bookinglist" style="color:white;margin-left: -40px;margin-bottom:5px;">Booking History</a></li>
							</ul>
							
							
							<a class="dropdown-item fooddropdown" href="#" style="color: white; padding-left: 0px; margin-top: 5px;"> Food </a>
							<ul class="submenu foodsubmenu">
									<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/foodStallList" style="color:white;margin-left: -40px;">Food Stalls</a></li>
									<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/viewCart" style="color:white;margin-left: -40px;">Cart</a></li>
									<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/foodBookingHistory" style="color:white;margin-left: -40px; margin-bottom:5px;">Booking History</a></li>
								
							</ul>
							<a class="dropdown-item gamedropdown" href="#" style="color: white; padding-left: 0px; margin-top: 5px;"> Game </a>
							<ul class="submenu gamesubmenu">
								 <li><a class="dropdown-item" href="${pageContext.request.contextPath}/gameList" style="color:white;margin-left: -40px;">Game List</a></li>
								<li><a class="dropdown-item" href="${pageContext.request.contextPath}/gameRecharge" style="color:white;margin-left: -40px; margin-bottom: 5px;">Recharge Card</a></li>
							</ul>
							<a class="dropdown-item" style="color: white; padding-left: 0px; margin-top: 5px;"
									href="${pageContext.request.contextPath}/shopList">Shop List</a>
									
							<a class="dropdown-item" href="${pageContext.request.contextPath}/dealList" style="color: white; padding-left: 0px; margin-top: 5px;">Deal List</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/eventList" style="color: white; padding-left: 0px; margin-top: 5px;">Event List</a>
							<a class="dropdown-item jobdropdown" href="#" style="color: white;padding-left: 0px; margin-top: 5px;""> Job </a>
							<ul class="submenu jobsubmenu">
								 <li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/jobList" style="color:white;margin-left: -40px;">Job
									List</a></li>
									
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/applyjobList" style="color:white;margin-left: -40px; margin-bottom: 5px;">Job
									Application</a></li>
							</ul>
							<a class="dropdown-item" style="color: white; padding-left: 0px; margin-top: 5px;"
									href="${pageContext.request.contextPath}/dealList">Deal
									List</a>

						<a class="dropdown-item" style="color: white; padding-left: 0px; margin-top: 5px;"
									href="${pageContext.request.contextPath}/paymentlist">
									Payment History</a>
							
					</c:if>

					<c:if test="${sessionScope.user.userRole == 'FoodAdmin'}">
						
						
							<a class="dropdown-item fooddropdown" href="#" style="color: white; padding-left: 0px;margin-top: 5px;"> Food </a>
							<ul class="submenu foodsubmenu">
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/foodStallList" style="color:white;margin-left: -40px;">Manage Food Stalls</a></li>
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/foodBookingHistory" style="color:white;margin-left: -40px;">Booking History</a></li>
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/foodPaymentList" style="color:white;margin-left: -40px;margin-bottom: 5px;">
									Payment History</a></li>	
							</ul>
							
							
							
							
					</c:if>

				</ul>
			</div>
			</div>
			<div style="margin-left: 10px;">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/home" style="color: white;">MEME</a>
			</div>
			<div style="margin-left: 1400px; position: fixed;">
				<ul class="navbar-nav">
					<c:if test="${sessionScope.user != null}">
						    <li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false" style="color: white;"> <i class="fa fa-user" style="color:white; font-size: 20px;"></i> </a>
							<c:choose>
							<c:when test="${sessionScope.user.userRole=='FoodAdmin'}">
							<div class="dropdown-menu profile-dropdown" aria-labelledby="navbarDropdown">
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/foodmanagerEdit?id=${sessionScope.user.id}">
									View Profile</a> 
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/logout">Logout</a>
							</div>
							</c:when>
							<c:otherwise>
							<div class="dropdown-menu profile-dropdown" aria-labelledby="navbarDropdown">
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/userEdit?id=${sessionScope.user.id}">
									View Profile</a> 
								<a class="dropdown-item"
									href="${pageContext.request.contextPath}/logout">Logout</a>
							</div>
							</c:otherwise>
							</c:choose>
							</li>	
					</c:if>
				</ul>
  </div>
</div>
</div>
</nav>
</c:otherwise>
</c:choose>