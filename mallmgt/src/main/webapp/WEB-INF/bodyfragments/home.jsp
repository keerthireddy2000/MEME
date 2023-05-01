<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<style><%@include file="/WEB-INF/css/home.css"%></style>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>

<div class="d-flex justify-content-center align-items-center">

<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="margin-top: 120px;width: 1000px;">
<ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
     <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="5"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="6"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="7"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active" style="height: 400px;">
       <a href="${pageContext.request.contextPath}/movieGrid">
           <img class="d-block w-100" src="https://media.istockphoto.com/id/1043434654/photo/film-reels-with-retro-cinema-tickets-movie-clapper-and-red-theater-seats-on-wooden-background.jpg?b=1&s=170667a&w=0&k=20&c=IjQoE6OpNJSIOwDooYcZqgsVDibYbokZ8ZGrPeupixk=" 
              class="w-100" style="height: 400px;"/>
               <div class="carousel-caption d-none d-md-block">
			    <h3>Movie Booking</h3>
			    <p style="color:white; margin-top: 10px;">Book your movie ticket...</p>
			  </div>
            </a> 
    </div>
    <div class="carousel-item" style="height: 400px;">
     <a href="${pageContext.request.contextPath}/parkinglist">
              <img class="d-block w-100" src="https://www.keflatwork.com/wp-content/uploads/2020/04/shutterstock_401478484.jpg"
              class="w-100" style="height: 400px;"/>
               <div class="carousel-caption d-none d-md-block">
			    <h3>Parking Space Booking</h3>
			    <p style="color:white;margin-top: 10px;">Book your parking space...</p>
			  </div>
              </a>
    </div>
    <div class="carousel-item" style="height: 400px;">
     <a href="${pageContext.request.contextPath}/foodStallList">
              <img class="d-block w-100" src="https://img.freepik.com/premium-photo/food-with-delivery-set-dishes-diet-top-view-free-space-your-text-black-background_187166-3086.jpg"
              class="w-100" style="height: 400px;"/>
              <div class="carousel-caption d-none d-md-block">
			    <h3>Food Pre-Ordering</h3>
			    <p style="color:white; margin-top: 10px;">Pre-order your food...</p>
			  </div>
              </a>
    </div>
    
     <div class="carousel-item" style="height: 400px;">
     <a href="${pageContext.request.contextPath}/eventList">
              <img class="d-block w-100" src="https://cdn.pixabay.com/photo/2017/12/08/11/53/event-party-3005668__340.jpg"
              class="w-100" style="height: 400px;"/>
               <div class="carousel-caption d-none d-md-block">
			    <h3>Events</h3>
			    <p style="color:white; margin-top: 10px;">Get to know about the happening events...</p>
			  </div>
              </a>
    </div>
    
    <div class="carousel-item" style="height: 400px;">
     <a href="${pageContext.request.contextPath}/gameList">
              <img class="d-block w-100" src="https://sbam.in/wp-content/uploads/2021/11/game.jpg"
              class="w-100" style="height: 400px;"/>
               <div class="carousel-caption d-none d-md-block">
			    <h3>Games</h3>
			    <p style="color:white; margin-top: 10px;">Get to know about the gaming zone...</p>
			  </div>
              </a>
    </div>
    
     <div class="carousel-item" style="height: 400px;">
     <a href="${pageContext.request.contextPath}/dealList">
              <img class="d-block w-100" src="https://us.123rf.com/450wm/zoaarts/zoaarts2001/zoaarts200100268/140305957-vector-illustration-of-flash-sale-label-modern-promo-banner-element-with-bolt.jpg?ver=6"
              class="w-100" style="height: 400px;"/>
                <div class="carousel-caption d-none d-md-block">
			    <h3>Flash Deals</h3>
			    <p style="color:white; margin-top: 10px;">Grab the latest deals...</p>
			  </div>
              </a>
              
    </div>
    
     <div class="carousel-item" style="height: 400px;">
     <a href="${pageContext.request.contextPath}/shopList">
              <img class="d-block w-100" src="https://static.trip101.com/main_pics/200886/medium.jpg"
              class="w-100" style="height: 400px;"/>
                <div class="carousel-caption d-none d-md-block">
			    <h3 >Shop Specifics</h3>
			    <p style="color:white; margin-top: 10px;">Get to know about the shop details...</p>
			  </div>
              </a>
    </div>
    
     <div class="carousel-item" style="height: 400px;">
     <a href="${pageContext.request.contextPath}/jobList">
              <img class="d-block w-100" src="https://villageofgreenwich.com/wp-content/uploads/2018/11/AceAutoNowHiring.jpg"
              class="w-100 h-50" style="height: 400px;"/>
              <div class="carousel-caption d-none d-md-block">
			    <h3>Job Opportunities</h3>
			    <p style="color:white;margin-top: 10px;">Get to know about the latest job opportunities...</p>
			  </div>
              </a>
    </div>
    
  </div>
  <a class="carousel-control-prev"  href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next"  href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</div>
</body>
</html>