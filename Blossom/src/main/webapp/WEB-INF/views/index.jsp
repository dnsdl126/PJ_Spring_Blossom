<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "include/header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/common.css">
<script src="https://kit.fontawesome.com/66fbac40f5.js" crossorigin="anonymous"></script>
<style type="text/css">
		* {box-sizing:border-box}


/*top버튼*/
.top_btn{
	bottom: 115px;
	background-color: #40BF75;
	display: none;
}
.fix_btn {
    position: fixed;
    right: 50px;
    color: white;
    width: 70px;
    height: 70px;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 30px;
    cursor: pointer;
    box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2), 0 4px 20px 0 rgba(0,0,0,0.2);
}

/* Slideshow container */
.slideshow-container {
   max-width: 1276px;
    position: relative;
    margin: auto;
}

/* Hide the images by default */
.mySlides {
 	 display: none;
 	 padding: 0 10;
}

/* Next & previous buttons */
.prev, .next {
	  cursor: pointer;
	  position: absolute;
	  top: 50%;
	  width: auto;
	  margin-top: -22px;
	  padding: 16px;
	  color: white;
	  font-weight: bold;
	  font-size: 18px;
	  transition: 0.6s ease;
	  border-radius: 0 3px 3px 0;
	  user-select: none;
}
 
/* Position the "next button" to the right */
.next {
	  right: 0;
	  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  	  background-color: rgba(0,0,0,0.8);
}



/* Number text (1/3 etc) */
.numbertext {
	  color: #f2f2f2;
	  font-size: 12px;
	  padding: 8px 12px;
	  position: absolute;
	  top: 0;
}

/* The dots/bullets/indicators */
.dot {
	  cursor: pointer;
	  height: 15px;
	  width: 15px;
	  margin: 0 2px;
	  background-color: #bbb;
	  border-radius: 50%;
	  display: inline-block;
	  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  	  background-color: #717171;
}

/* Fading animation */
.fade {
	  -webkit-animation-name: fade;
	  -webkit-animation-duration: 1.5s;
	  animation-name: fade;
	  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
	  from {opacity: .4}
	  to {opacity: 1}
	}

@keyframes fade {
	  from {opacity: .4}
	  to {opacity: 1}
}

/*메인 카테고리 리스트*/
.container {
	margin-right: auto;
    margin-left: auto;
    box-sizing: border-box;
    width: 1274px;
    max-width: 100%;
    box-sizing: border-box;
    min-height: 1px;
   
}
.shortcut__list {
	flex-wrap: nowrap;
    margin: 30px 0 20px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    box-sizing: border-box;

}
 /*아이콘 효과 */
.event {
	position: relative;
    display: inline-block;
}
.event:hover:before, .event:hover:after {
	width: 95%;
	height: 95%;
}
.event:before {
	width: 95%;
    height: 95%;
    border-top: 1px solid white;
    border-bottom: 1px solid white;
    width: 0;
}



.event:after {
	width: 95%;
    height: 95%;
    border-left: 1px solid white;
    border-right: 1px solid white;
    height: 0;
}

.event:before, .event:after {
    content: '';
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%);
    transition: all .8s;
    -webkit-transition: all .8s;
}

.row {
	
}
.shortcut__list__item {
    display: inline-block;
    padding: 0 10px;
    
}
.shortcut__list__item__link__image {
	width: 100%
}
.shortcut__list__item__link__image__img {
	width: 100%;
    background-color: transparent;
    border-radius: 10px;
    box-shadow: 0 2px 8px 2px rgba(20,23,28,.15);
}
.shortcut__list__item__link__title {
	margin: 6px 0 7px;
    font-size: 15px;
    display: block;
    text-align: center;
    color: #000;
    font-size: 14px;
    margin: 4px 0 10px;
    font-weight: 500;
}
/* 인기 상품 */
 .best_container {
 	  
    box-sizing: border-box;
    width: 1276px;
    max-width: 100%;
    box-sizing: border-box;    
    padding: 0 10px;
    margin: auto;
}
   
 }
 .best_container_name {
 	margin-bottom: 20px;
 }
 .best_container_name {
 	font-size: 13px;
 	color: #000;
 	font-weight: 700;
 	padding-right: 10px;
 	padding-left: 10px;
 	max-width: 100%;
    position: relative;
    width: 100%;
    min-height: 1px;
    box-sizing: border-box
 }
 .best_item {
   width: 300px;
    /* margin: 0 auto; */
    box-sizing: border-box;
    height: 392px;
    width: 300px;
   
		}
.best_itme_img{

	position: relative;
    background-color: #f5f5f5;
    padding-bottom: 100%;
    border-radius: 4px;
    height: 240px;
    overflow: hidden;
    border-radius: 10px;
    margin-left: 10px;
   
          
 }	

 
.production-item__header__name {
	display: block;
    color: #757575;
    word-break: break-all;
    font-size: 11px;
    font-weight: 400;
    line-height: 13px;
    text-align: center;
}	
.production-item__header__name_memo {
	display: block;
    max-height: 34px;
    margin-top: 5px;
    word-break: break-all;
    font-size: 13px;
    font-weight: 400;
    line-height: 17px;
    color: #000;
    transition: opacity .1s;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    word-wrap: break-word;
    text-align: center;
}
.production-item__header__name_price {
	 display: block;
    font-size: 17px;
    line-height: 23px;
    font-weight: 700;
    color: #000;
    text-align: center;
}
.text_img {
	display: flex;
	justify-content: space-around;
}

	</style>
</head>
<body>
<%@ include file = "include/Modal.jsp"%>
<!-- Slideshow container -->
<div class="slideshow-container">

  <!-- Full-width images with number and caption text -->
  <div class="mySlides fade">
    <div class="numbertext">1 / 4</div>
    <img src="${path}/resources/img/mainbaner_01.png" style="width:100%">
   
  </div>

  <div class="mySlides fade">
    <div class="numbertext">2 / 4</div>
    <img src="${path}/resources/img/mainbaner_02.png" style="width:100%">
   
  </div>

  <div class="mySlides fade">
    <div class="numbertext">3 / 4</div>
    <img src="${path}/resources/img/mainbaner_03.png" style="width:100%">
   
  </div>
  

  <!-- Next and previous buttons -->
  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
  <a class="next" onclick="plusSlides(1)">&#10095;</a>
</div>
<br>

<!-- The dots/circles -->
<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span>
  <span class="dot" onclick="currentSlide(2)"></span>
  <span class="dot" onclick="currentSlide(3)"></span>
  
</div>


<div class="top_btn fix_btn"><i class="fas fa-arrow-up"></i></div>	

<nav class="container shortcut">
		<ul class="row shortcut__list">
			<li class="shortcut__list__item">
				<a href="" class="shortcut__list__item__link">
					<div class="shortcut__list__item__link__image event"> 

						<img src="${path}/resources/img/newitem.png" class="shortcut__list__item__link__image__img">
						
					</div>
					<div class="shortcut__list__item__link__title">신상</div>
				</a>
			</li>
			<li class="shortcut__list__item">
				<a href="" class="shortcut__list__item__link">
					<div class="shortcut__list__item__link__image event"> 
						<img src="${path}/resources/img/sale.png" class="shortcut__list__item__link__image__img">
					</div>
					<div class="shortcut__list__item__link__title">세일제품</div>
				</a>
			</li>
			<li class="shortcut__list__item">
				<a href="" class="shortcut__list__item__link">
					<div class="shortcut__list__item__link__image event"> 
						<img src="${path}/resources/img/hotsale.png" class="shortcut__list__item__link__image__img">
					</div>
					<div class="shortcut__list__item__link__title">오늘의특가</div>
				</a>
			</li>
			<li class="shortcut__list__item">
				<a href="" class="shortcut__list__item__link">
					<div class="shortcut__list__item__link__image event"> 
						<img src="${path}/resources/img/bestitem.png" class="shortcut__list__item__link__image__img">
					</div>
					<div class="shortcut__list__item__link__title">베스트 아이템</div>
				</a>
			</li>
			<li class="shortcut__list__item">
				<a href="" class="shortcut__list__item__link">
					<div class="shortcut__list__item__link__image event"> 
						<img src="${path}/resources/img/event.png" class="shortcut__list__item__link__image__img">
					</div>
					<div class="shortcut__list__item__link__title">이벤트</div>
				</a>
			</li>

			
		</ul>
	</nav>
	<section class="best_container ">
		<header class="best_container_name">
			<h2>베스트 상품</h2>
		</header>		
		<div class="text_img">
	    <c:forEach items="${BestPdt}" var="pdt">
		<div class="best_item">
			<div class="best_itme_img">
				<a href="">
				<img style="background-image: url(${path}/resources/img/${pdt.p_img}); background-size: cover; width : 300px;
	height : 300px; background-position: center center;"></a>				
			</div>
			<div class="content_memo">
				<h1 class="production-item__header">
					<span class="production-item__header__name">
						${pdt.ptype}
					</span>
					<span class="production-item__header__name_memo">
						${pdt.pmemo}
					</span>
					<span class="production-item__header__name_price" >
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${pdt.price}"/>
						원
					</span>
				</h1>
			</div>			
		</div>
			</c:forEach>				
       </div>


	</section>
	<section class="best_container ">
		<header class="best_container_name">
			<h2>새로운 상품</h2>
		</header>		
		<div class="text_img">
	    <c:forEach items="${NewPdt}" var="pdt">
		<div class="best_item">
			<div class="best_itme_img">
				<a href=""><img style="background-image: url(${path}/resources/img/${pdt.p_img}); background-size: cover; width : 300px;
	height : 300px; background-position: center center; "></a>				
			</div>
			<div class="content_memo">
				<h1 class="production-item__header">
					<span class="production-item__header__name">
						${pdt.ptype}
					</span>
					<span class="production-item__header__name_memo">
						${pdt.pmemo}
					</span>
					<span class="production-item__header__name_price" >
					<fmt:formatNumber type="number" maxFractionDigits="3" value="${pdt.price}"/>원
					</span>
				</h1>
			</div>			
		</div>
			</c:forEach>				
       </div>


	</section>
		
</body>
</html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
var slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
}

// Thumbnail image controls
function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
}

$(document).ready(function() {
	$('.bar_wrap').find('.bar_fill').each(function() {
		var widthVal = $(this).text();
		 $(this).animate({width:widthVal}, 1000);
	 });

	// Scroll top 버튼 생성 및 Top 으로 이동 
	$(window).scroll(function(){ // 스크롤이 움직이면 
		
		if(document.body.scrollTop > 80 || document.documentElement.scrollTop > 80) {
			$('.top_btn').fadeIn().css("display","flex");
		
	} else {
		$('.top_btn').fadeOut();
	}
	});
	$('.top_btn').click(function(){
		$('html, body').animate({scrollTop : 0}, 800);
	});
});


</script>