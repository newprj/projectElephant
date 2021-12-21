<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
		<script src="//code.jquery.com/jquery-3.6.0.js"></script>
		<script src="https://kit.fontawesome.com/eab4c34ae3.js" crossorigin="anonymous"></script>
		<meta charset="UTF-8" />
		<style>
			.container {
				display: flex;
				flex-wrap: wrap;
				justify-content: center;
			}
			.box {
				flex: 0 0 auto;
				border: 1px solid grey;
				border-radius: 10px;
				width: 200px;
				height: 200px;
				padding: 10px;
				margin: 10px;
				display: flex;
				flex-direction: column;
				align-items: center;
				justify-content: center;
			}
			.box > span {
				display: block;
			}
			.navcontainer {
				height: 60px;
			}
			.wrapper {
				display: flex;
			}
			.left,
			.right,
			.center {
				flex: 1;
			}
			.center {
				text-align: center;
			}
			.right {
				display: flex;
				justify-content: flex-end;
				margin: 10px;
				align-items: center;
				cursor: pointer;
				text-align: center;
			}
			.item {
				margin-left: 25px;
			}
		</style>
		<title>메인 페이지</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="porto by ThemesGround - An easy to use Personal Portfolio - Retina Ready and Responsive HTML5 theme">
	<meta name="author" content="ThemesGround">
	
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,600italic,700,700italic,800' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='/resources/stylesheet' type='text/css'>
	
	<link href="/resources/assets/css/bootstrap.css" rel="stylesheet">
	<link href="/resources/assets/css/bootstrap-theme.css" rel="stylesheet">
	<link href="/resources/assets/css/extension.css" rel="stylesheet">
	<link href="/resources/assets/css/font-awesome.css" rel="stylesheet">
	<link href="/resources/assets/css/simple-line-icons.css" rel="stylesheet">
	<link href="/resources/stylesheets/responsive-nav.css" rel="stylesheet">
	<link href="/resources/stylesheets/responsive-nav.css" rel="stylesheet">
	<link href="/resources/stylesheets/quotes.css" rel="stylesheet">
	<link href="/resources/stylesheets/services.css" rel="stylesheet">
	<link href="/resources/stylesheets/animate.css" rel="stylesheet">
	<link href="/resources/stylesheets/effects.css" rel="stylesheet">
	<link href="/resources/stylesheets/jquery.easy-pie-chart.css" rel="stylesheet">
	<link href="/resources/stylesheets/sidemenu.css" rel="stylesheet">
	<link href="/resources/stylesheets/slidingmenu.css" rel="stylesheet">
	<link href="/resources/stylesheets/metro-panel.css" rel="stylesheet">
	<link href="/resources/stylesheets/style.css" rel="stylesheet">
	</head>
	<body>
<<<<<<< HEAD
<<<<<<< HEAD
		<div>
			<div class="navcontainer">
				<div class="wrapper">
					<div class="left"></div>
					<div class="center">
						<h1 class="logo">코끼리</h1>
					</div>
					<div class="right">
						<c:if test="${user==null}">
							<div class="item"><a href="/user/register"> 가입</a></div>
							<div class="item"><a href="/user/login">로그인</a></div>
						</c:if>
						<c:if test="${user!=null}">
							<div class="mygroup">
								<c:choose>
									<c:when test="${empty myGroup}"
										>
										<span> 가입한 그룹이 없습니다 </span>
									</c:when>

									<c:otherwise>
										<select name="group_name">
											<c:forEach items="${myGroup}" var="mine">
												<option value="${mine.group_name}">
													${mine.group_name}
												</option>
											</c:forEach>
										</select>
										<button>go</button>
									</c:otherwise>
								</c:choose>
							</div>
							<button
								class="btn btn-primary"
								type="button"
								onclick="location.href='/user/logout' "
							>
								로그아웃
							</button>
							<button
								class="btn btn-info"
								type="button"
								onclick="location.href='/user/modify' "
							>
								회원정보 수정
							</button>
							<button
								class="btn btn-danger"
								type="button"
								onclick="location.href='/user/delete' "
							>
								회원탈퇴
							</button>
						</c:if>
					</div>
				</div>
			</div>
		</div>
=======
=======
	<!-- 가로 nav바 -->
	<nav class="menu visible-xs" id="sm">
	  <div class="sm-wrap">
	    <h1 class="sm-logo">Porto</h1>
	    <i class="icon-remove menu-close"></i>
	    <a class="scroll-link"  data-soffset="0" href="/group/">Home</a>
	    <a class="scroll-link"  data-soffset="0" href="/user/login">login</a>
	    <a class="scroll-link"  data-soffset="0" href="#portfolio">My study</a>
	    <a class="scroll-link"  data-soffset="0" href="/mypage/user">My Page</a>
	    <a class="scroll-link"  data-soffset="0" href="#profile">Profile Page</a>
	    <a class="scroll-link"  data-soffset="0" href="/qna/list">Q&A page</a>
	  </div>
	  <!-- Navigation Trigger Button -->
	  <div id="sm-trigger"></div>
	</nav>
	<!-- Sliding Navigation : ends -->
	
	<section id="mastwrap" class="sliding">
 

	<div id="sidebar-nav" class="sq-side-menu hidden-xs">
    <ul>
      <!-- Starting : Nav Block -->
      <li class="porto-bg-four">
        <a class="scroll-link" id="home-link" href="/group/" data-soffset="0">
          <div class="first">
            <div class="arrow-right"></div>
            <div class="content"><img alt="" title="" src="/resources/images/icons/home.png"/></div>
          </div>
          <div class="second">
            <div class="arrow-left"></div>
            <div class="content">Home</div>
          </div>
        </a>
      </li>
      <!-- Ending : Nav Block -->
      
      <!-- Starting : Nav Block -->
      <li class="porto-bg-one">
         <a class="scroll-link" id="about-link" href="/user/login" data-soffset="0">
          <div class="first">
            <div class="arrow-right"></div>
            <div class="content"><img alt="" title="" src="/resources/images/icons/01.png"/></div>
          </div>
          <div class="second">
            <div class="arrow-left"></div>
            <div class="content">Login</div>
          </div>
        </a>
      </li>
     <!-- Ending : Nav Block -->
      
      <!-- Starting : Nav Block -->
      <li class="porto-bg-two">
        <a class="scroll-link" id="portfolio-link" href="" data-soffset="0">
          <div class="first">
            <div class="arrow-right"></div>
            <div class="content"><img alt="" title="" src="/resources/images/icons/06.png"/></div>
          </div>
          <div class="second">
            <div class="arrow-left"></div>
            <div class="content">my study</div>
          </div>
        </a>
      </li>
      <!-- Ending : Nav Block -->
      
      <!-- Starting : Nav Block -->
      <li class="porto-bg-three">
        <a class="scroll-link" id="services-link" href="/mypage/user" data-soffset="0">
          <div class="first">
            <div class="arrow-right"></div>
            <div class="content"><img alt="" title="" src="/resources/images/icons/03.png"/></div>
          </div>
          <div class="second">
            <div class="arrow-left"></div>
            <div class="content">my page</div>
          </div>
        </a>
      </li>
      <!-- Ending : Nav Block -->
      
      
      
      <!-- Starting : Nav Block -->
      <li class="porto-bg-six">
        <a class="scroll-link" id="testimonials-link" href="/qna/list" data-soffset="0">
          <div class="first">
            <div class="arrow-right"></div>
            <div class="content"><img alt="" title="" src="/resources/images/icons/02.png"/></div>
          </div>
          <div class="second">
            <div class="arrow-left"></div>
            <div class="content">Q&A page</div>
          </div>
        </a>
      </li>
      <!-- Ending : Nav Block -->
      
      <!-- Starting : Nav Block -->
      <li class="porto-bg-five">
       <a class="scroll-link" id="profile-link" href="#profile" data-soffset="0">
          <div class="first">
            <div class="arrow-right"></div>
            <div class="content"><img alt="" title="" src="/resources/images/icons/04.png"/></div>
          </div>
          <div class="second">
            <div class="arrow-left"></div>
            <div class="content">Profile</div>
          </div>
        </a>
      </li>
      <!-- Ending : Nav Block -->
     
    </ul>
    <!-- end sq-side-menu ul -->
  </div>
  <!-- end sq-side-menu -->

	

<!-- HEADER : STARTS -->

<!-- 상단 nav바 -->
<!-- HOME : STARTS -->
	<section id="home">
	<section id="metro-panel" class="fx fx-bounceIn">

      <!-- stripe:starts  -->
      <div class="stripe clearfix">

        <!-- Tile : Starts -->
        <div class="tile tile-01 transparent">
        
        </div>
       <!-- Tile : Ends -->


        <!-- Tile : Starts -->
        <div class="tile tile-01 thumb">
        <div class="tile-nav flipX">
            <img alt="" title="" class="img1" src="/resources/images/tiles/profile-img1.jpg">
            <img alt="" title="" class="img2" src="/resources/images/tiles/profile-img.jpg">
          </div>
        </div>
       <!-- Tile : Ends -->

        <!-- Tile : Starts -->
        <div class="tile nav-tile tile-01  porto-bg-one">
          <a class="tile-nav scroll-link" href="/user/login" data-soffset="0">
            <div class="nav-hover porto-bg-four">
                <h5>로그인</h5>
             </div>
            <span>Login</span>
            <img alt="" title="" src="/resources/images/icons/01.png"/>
          </a>
        </div>
       <!-- Tile : Ends -->

        <!-- Tile : Starts -->
        <div class="tile tile-01 thumb">
          <div class="tile-nav flipX">
            <img alt="" title="" class="img1" src="/resources/images/tiles/03a.jpg">
            <img alt="" title="" class="img2" src="/resources/images/tiles/03b.jpg">
          </div>
        </div>
       <!-- Tile : Ends -->

        <!-- Tile : Starts -->
        <div class="tile nav-tile tile-01  porto-bg-two">
          <a class="tile-nav scroll-link" href="#portfolio" data-soffset="0">
            <div class="nav-hover porto-bg-four">
                <h5>나의 스터디 그룹</h5>
             </div>
            <span>My Study</span>
            <img alt="" title="" src="/resources/images/icons/06.png"/>
          </a>
        </div>
       <!-- Tile : Ends -->

        <!-- Tile : Starts -->
         <div class="tile transparent">
        </div>
       <!-- Tile : Ends -->


       <!-- Tile : Starts -->
        <div class="slogan tile-03   text-left">
          <div class="inner">
            <h1>코끼리</h1>
          <h3>끼리끼리 코딩</h3>
          </div>
        </div>
       <!-- Tile : Ends -->
        
       <!-- Tile : Starts -->
        <div class="tile nav-tile tile-01  porto-bg-three">
          <a class="tile-nav scroll-link" href="/mypage/user" data-soffset="0">
            <div class="nav-hover porto-bg-four">
                <h5>마이 페이지</h5>

             </div>
            <span>My Pege</span>
            <img alt="" title="" src="/resources/images/icons/03.png"/>
          </a>
        </div>
       <!-- Tile : Ends -->

        <!-- Tile : Starts -->
        <div class="tile tile-01 thumb">
          <div class="tile-nav flipX">
            <img alt="" title="" class="img1" src="/resources/images/tiles/02a.jpg">
            <img alt="" title="" class="img2" src="/resources/images/tiles/02b.jpg">
          </div>
        </div>
       <!-- Tile : Ends -->

        <!-- Tile : Starts -->
        <div class="tile tile-01 thumb">
          <div class="tile-nav flipY">
            <img alt="" title="" class="img1" src="/resources/images/tiles/05a.jpg">
            <img alt="" title="" class="img2" src="/resources/images/tiles/05b.jpg">
          </div>
        </div>
       <!-- Tile : Ends -->

        <!-- Tile : Starts -->
         <div class="tile nav-tile tile-01 porto-bg-six">
          <a class="tile-nav scroll-link" href="/qna/list" data-soffset="0">
            <div class="nav-hover porto-bg-four">
                <h5>질문</h5>

             </div>
            <span>Q&A page</span>
            <img alt="" title="" src="/resources/images/icons/02.png"/>
          </a>
        </div>
       <!-- Tile : Ends -->

       


        <!-- Tile : Starts -->
        <div class="tile tile-01 thumb">
          <div class="tile-nav flipX">
            <img alt="" title="" class="img1" src="/resources/images/tiles/01a.jpg">
            <img alt="" title="" class="img2" src="/resources/images/tiles/01b.jpg">
          </div>
        </div>
       <!-- Tile : Ends -->

                
        <!-- Tile : Starts -->
        <div class="tile nav-tile tile-01 porto-bg-five">
          <a href="#profile" class="tile-nav">
            <div class="nav-hover porto-bg-four">
                <h5>Our Professional Skills and Education</h5>

             </div>
            <span>Profile Page</span>
            <img alt="" title="" src="/resources/images/icons/04.png"/>
          </a>
        </div>
       <!-- Tile : Ends -->
        <!-- Tile : Starts -->
         <div class="tile tile-01 thumb">
          <div class="tile-nav flipY">
            <img alt="" title="" class="img1" src="/resources/images/tiles/06a.jpg">
            <img alt="" title="" class="img2" src="/resources/images/tiles/06b.jpg">
          </div>
        </div>
       <!-- Tile : Ends -->

        
      </div>
      <!-- stripe :ends-->

          
  </section>
</section>
<!-- HOME : ENDS -->
	

<!-- PORTFOLIO : STARTS -->
<section id="portfolio" class="page-section">

      <section class="container">
<div class="block row">
        <div class="row">
          <article class="col-md-12 text-left">
            <h2 class="page-heading">제목</h2>
            <div class="liner"><span></span></div>
          </article>
        </div>

        <div class="row add-top add-bottom">
          <article class="col-md-12 text-left">
            <p class="welcome-text">설명</p>
          </article>
        </div>

    	<div class="porto-bg-eleven common-pad">

          <article class="text-left ">
            <!-- Container element for a single portfolio item. Do not remove! -->


            <!-- Filter -->
             <div id="filter" class="clearfix">
                  <div id="filter_wrapper">
                       <ul id="portfolioFilter">
                           <li class="active"><a href="#" class="all"><span class="current">All</span></a></li>
                           <li class="separator">/</li>
                           <li><a href="#" class="category1"><span>my group</span></a></li>
                           
                       </ul>
                  </div>
             </div>
             <!-- End: Filter -->
          </article>
    </div>


        <div class="">
          <section id="portfolio-wrap" class="clearfix">

    
    
     

     <!-- Thumbnails -->
     <div id="portfolio_thumbs">
     
          <ul class="sortablePortfolio clearfix">

              <!-- 1st thumb -->
              <li data-type="category1" class="simple-bg-one">
                  <!-- Thumbnail -->
                  <a href="#" class="more_info">
                     <img alt="simple" title="simple" src="/resources/images/portfolio_thumbs/portfolio1.jpg"/>
                     <img alt="simple" title="simple" src="/resources/images/portfolio_thumbs/portfolio1_rollover.jpg" class="rollover" />
                  </a>
                  <!-- Info -->
                  <div class="item_info">
                       <h3><a href="#" class="more_info"><span class="porto-bg-one">Project TItle</span></a></h3>
                       <p><span>image slider</span></p>
                  </div>
              </li>
              
              <!-- 2nd thumb -->
              <li data-type="category2" class="simple-bg-two">
                  <!-- Thumbnail -->
                  <a href="#" class="more_info">
                     <img alt="simple" title="simple" src="/resources/images/portfolio_thumbs/portfolio1.jpg"/>
                     <img alt="simple" title="simple" src="/resources/images/portfolio_thumbs/portfolio1_rollover.jpg" class="rollover" />
                  </a>
                  <!-- Info -->
                  <div class="item_info">
                       <h3><a href="#" class="more_info"><span class="porto-bg-two">Project TItle</span></a></h3>
                       <p><span>youtube</span></p>
                  </div>
              </li>
              
              <!-- 3rd thumb -->
              <li data-type="category3" class="simple-bg-three">
                  <!-- Thumbnail -->
                  <a href="#" class="more_info">
                     <img alt="simple" title="simple" src="/resources/images/portfolio_thumbs/portfolio1.jpg"/>
                     <img alt="simple" title="simple" src="/resources/images/portfolio_thumbs/portfolio1_rollover.jpg" class="rollover" />
                  </a>
                  <!-- Info -->
                  <div class="item_info">
                       <h3><a href="#" class="more_info"><span class="porto-bg-three">Project TItle</span></a></h3>
                       <p><span>vimeo</span></p>
                  </div>
              </li>
              
              <!-- 4th thumb -->
              <li data-type="category1" class="simple-bg-four">
                  <!-- Thumbnail -->
                  <a href="#" class="more_info">
                     <img alt="simple" title="simple" src="/resources/images/portfolio_thumbs/portfolio1.jpg"/>
                     <img alt="simple" title="simple" src="/resources/images/portfolio_thumbs/portfolio1_rollover.jpg" class="rollover" />
                  </a>
                  <!-- Info -->
                  <div class="item_info">
                       <h3><a href="#" class="more_info"><span class="porto-bg-four">Project TItle</span></a></h3>
                       <p><span>image slider</span></p>
                  </div>
              </li>
              
              <!-- 5th thumb -->
              <li data-type="category4" class="simple-bg-five">
                  <!-- Thumbnail -->
                  <a href="#" data-gal="prettyPhoto[gallery]">
                     <img alt="simple" title="simple" src="/resources/images/portfolio_thumbs/portfolio1.jpg"/>
                     <img alt="simple" title="simple" src="/resources/images/portfolio_thumbs/portfolio1_rollover.jpg" class="rollover" />
                  </a>
                  <!-- Info -->
                  <div class="item_info">
                       <h3><a href="#" data-gal="prettyPhoto[gallery]"><span class="porto-bg-five">Project TItle</span></a></h3>
                       <p><span>lightbox image</span></p>
                  </div>
              </li>
              
              <!-- 6th thumb -->
              <li data-type="category2" class="simple-bg-six">
                  <!-- Thumbnail -->
                  <a href="#" class="more_info">
                     <img alt="simple" title="simple" src="/resources/images/portfolio_thumbs/portfolio1.jpg"/>
                     <img alt="simple" title="simple" src="/resources/images/portfolio_thumbs/portfolio1_rollover.jpg" class="rollover" />
                  </a>
                  <!-- Info -->
                  <div class="item_info">
                       <h3><a href="#" class="more_info"><span class="porto-bg-six">Project TItle</span></a></h3>
                       <p><span>youtube</span></p>
                  </div>
              </li>
              
              <!-- 7th thumb -->
              <li data-type="category5" class="simple-bg-seven">
                  <!-- Thumbnail -->
                  <a href="#" data-gal="prettyPhoto[gallery]">
                     <img alt="simple" title="simple" src="/resources/images/portfolio_thumbs/portfolio1.jpg"/>
                     <img alt="simple" title="simple" src="/resources/images/portfolio_thumbs/portfolio1_rollover.jpg" class="rollover" />
                  </a>
                  <!-- Info -->
                  <div class="item_info">
                       <h3><a href="#" data-gal="prettyPhoto[gallery]"><span class="porto-bg-seven">Project TItle</span></a></h3>
                       <p><span>lightbox video</span></p>
                  </div>
              </li>
              
              <!-- 8th thumb -->
              <li data-type="category1" class="simple-bg-eight">
                  <!-- Thumbnail -->
                  <a href="#" class="more_info">
                     <img alt="simple" title="simple" src="/resources/images/portfolio_thumbs/portfolio1.jpg"/>
                     <img alt="simple" title="simple" src="/resources/images/portfolio_thumbs/portfolio1_rollover.jpg" class="rollover" />
                  </a>
                  <!-- Info -->
                  <div class="item_info">
                       <h3><a href="#" class="more_info"><span class="porto-bg-eight">Project TItle</span></a></h3>
                       <p><span>photography</span></p>
                  </div>
              </li>
              
              <!-- 9th thumb -->
              <li data-type="category3" class="simple-bg-one">
                  <!-- Thumbnail -->
                  <a href="#" class="more_info">
                     <img alt="simple" title="simple" src="/resources/images/portfolio_thumbs/portfolio1.jpg"/>
                     <img alt="simple" title="simple" src="/resources/images/portfolio_thumbs/portfolio1_rollover.jpg" class="rollover" />
                  </a>
                  <!-- Info -->
                  <div class="item_info">
                       <h3><a href="#" class="more_info"><span class="porto-bg-nine">Project TItle</span></a></h3>
                       <p><span>vimeo</span></p>
                  </div>
              </li>
              
              <!-- 10th thumb -->
              <li data-type="category2" class="simple-bg-two">
                  <!-- Thumbnail -->
                  <a href="#" class="more_info">
                     <img alt="simple" title="simple" src="/resources/images/portfolio_thumbs/portfolio1.jpg"/>
                     <img alt="simple" title="simple" src="/resources/images/portfolio_thumbs/portfolio1_rollover.jpg" class="rollover" />
                  </a>
                  <!-- Info -->
                  <div class="item_info">
                       <h3><a href="#" class="more_info"><span class="porto-bg-ten">Project TItle</span></a></h3>
                       <p><span>youtube</span></p>
                  </div>
              </li>
              
              <!-- 11th thumb -->
              <li data-type="category1" class="simple-bg-three">
                  <!-- Thumbnail -->
                  <a href="#" class="more_info">
                     <img alt="simple" title="simple" src="/resources/images/portfolio_thumbs/portfolio1.jpg"/>
                     <img alt="simple" title="simple" src="/resources/images/portfolio_thumbs/portfolio1_rollover.jpg" class="rollover" />
                  </a>
                  <!-- Info -->
                  <div class="item_info">
                       <h3><a href="#" class="more_info"><span class="porto-bg-one">Project TItle</span></a></h3>
                       <p><span>photography</span></p>
                  </div>
              </li>
              
              <!-- 12th thumb -->
              <li data-type="category2" class="simple-bg-four">
                  <!-- Thumbnail -->
                  <a href="#" class="more_info">
                     <img alt="simple" title="simple" src="/resources/images/portfolio_thumbs/portfolio1.jpg"/>
                     <img alt="simple" title="simple" src="/resources/images/portfolio_thumbs/portfolio1_rollover.jpg" class="rollover" />
                  </a>
                  <!-- Info -->
                  <div class="item_info">
                       <h3><a href="#" class="more_info"><span class="porto-bg-twelve">Project TItle</span></a></h3>
                       <p><span>youtube</span></p>
                  </div>
              </li>
              

          </ul>

     </div>
     <!-- End: Thumbnails -->
            
   
  		</section>  
        </div>
		</div>
      </section>  
</section>
<!-- PORTFOLIO : ENDS -->


	 
	
	</section>
	<!-- mastwrap : ends -->
	
	<script src="/resources/javascripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="/resources/javascripts/jquery.easing.1.3.js" type="text/javascript"></script>
	<script src="/resources/assets/js/bootstrap.js" ></script> 
	<script src="/resources/assets/js/bootstrap.min.js" ></script> 
	<script src="/resources/javascripts/responsive-nav.js" type="text/javascript" ></script>
	<script src="/resources/javascripts/jquery.stellar.js"></script>
	<script src="/resources/javascripts/prettyPhoto.js"></script>
	<script src="/resources/javascripts/flexslider.js"></script>
	<script src="/resources/javascripts/waypoints.min.js"></script>
	<script src="/resources/javascripts/jquery.tweet.js"></script>
	<script src="/resources/javascripts/portfolio.js"></script>
	<script src="/resources/javascripts/form-validation.js"></script>
	<script src="/resources/javascripts/responsive-nav.js"></script>
	<script src="/resources/javascripts/jquery.easy-pie-chart.js"></script>
	<script src="/resources/javascripts/jquery.cbpQTRotator.js"></script>
	<script src="/resources/javascripts/classie.js"></script>
	<script src="/resources/javascripts/jquery.fittext.js"></script>
	<script src="/resources/javascripts/jquery.flickr.js"></script>
	<script src="/resources/javascripts/effects.js"></script>
	<script src="/resources/javascripts/scroll.js"></script>
	<script src="/resources/javascripts/slidingmenu.js"></script>
	<script src="/resources/javascripts/script.js"></script>
		
>>>>>>> refs/remotes/origin/heeju
	<div>
    <div class="navcontainer">
      <div class="wrapper">	
        <div class="left"></div>
        <div class="center">
          <h1 class="logo"> 코끼리 </h1>
        </div>
        <div class="right">
    		
    		<c:if test="${user==null}">
          <div class="item"><a href="/user/register"> 가입</a>  </div>
          <div class="item"><a href="/user/login">로그인</a>  </div>
          </c:if>
          <c:if test="${user!=null}">
          	<div class="mygroup">
          	<c:choose>
          	<c:when test="${empty myGroup}">>
          			<span> 가입한 그룹이 없습니다 </span>
          	</c:when>
          	
          	<c:otherwise>
          	<select name="group_name">
          		<c:forEach items="${myGroup}" var="mine">	
								<option value="${mine.group_name}" >${mine.group_name}</option>
          		</c:forEach>
          	</select>
          	<button > go </button>
          	</c:otherwise>
          </c:choose>
          	</div>
          		<button type="button" onclick="location.href='/mypage/user' ">마이 사이트</button>
          		<button class="btn btn-primary" type="button" onclick="location.href='/user/logout' ">로그아웃</button>
      			<button class="btn btn-info" type="button" onclick="location.href='/user/modify' ">회원정보 수정</button>
      			<button class="btn btn-danger" type="button" onclick="location.href='/user/delete' ">회원탈퇴</button>
          </c:if>
          
        </div>
      </div>
    </div>
  </div>
>>>>>>> refs/remotes/origin/heeju
		<h1>메인 페이지</h1>
		<a href="/group/make">
			<c:if test="${user!=null}">
				<button>create</button>
			</c:if>
		</a>
		<button class="latest"> 최신 </button>
		<button class="pop"> 인기 </button>
		<br/>
		
		<span> 모집 중인 그룹 </span> 
		<div class="container recruit">
			<c:forEach items="${group}" var="group">
				
				<div class="box">
					<span class="group_name"> ${group.group_name} </span>
					<span> ${group.leader}</span>
					<span> ${group.subject }</span>
					<span> <i class="fas fa-eye"></i> ${group.viewCnt} </span>
					<span> 🙋‍♀  ${group.applicantCnt} <i class="far fa-hand-peace"> ${group.joinedCnt}</i>/ ${group.member_number}</span>
				</div>
			</c:forEach>

		</div>
		<a href ="/group/main/list">
		<span>....모집중인 그룹 모두 보기 </span>
		</a>
	
	<p> 모집이 완료된 그룹 </p>
		<div class="container complete">
			<c:forEach items="${completed}" var="group">
				
				<div class="box">
					<span class="group_name"> ${group.group_name} </span>
					<span> ${group.leader}</span>
					<span> ${group.subject }</span>
					<span> ${group.member_number}</span>
					<span> <i class="fas fa-eye"></i> ${group.viewCnt} </span>
					<span> 🙋‍♀  ${group.applicantCnt}  <i class="far fa-hand-peace"> ${group.joinedCnt}</i></span>
				</div>
			</c:forEach>

		</div>
	</body>

	<script>
		$(document).ready(function (e) {
			$(".group_name").click(function (e) {
				const group_name = e.target.innerText;
				location.href = "/group/gather/" + group_name;
			});

			$("div.mygroup button").click(function (e) {
				e.preventDefault();
				let group_name = $('select[name="group_name"]').val();
				location.href = `/group/\${group_name}`;
			});
			
			$("button.latest").click((e) => {
				location.reload();
			})
			
			//인기순 정렬   
			$('button.pop').click((e) => {
				console.log("눌림")
				$.getJSON("/group/main/getGroupAll", (list) =>{
						$('div.recruit').children().remove()
						console.log(list)
						list.sort((b, a) => a.applicantCnt - b.applicantCnt).slice(0,20)
							.map( group => {
								const groupEle = $(`<div class="box">
										<span class="group_name"> \${group.group_name} </span>
										<span> \${group.leader}</span>
										<span> \${group.subject }</span>
										<span> <i class="fas fa-eye"></i> \${group.viewCnt} </span>
										<span> 🙋‍♀ \${group.applicantCnt} <i class="far fa-hand-peace"> \${group.joinedCnt}</i>/ \${group.member_number}</span>
									</div>`)
									$('div.recruit').append(groupEle)
							})
				})//getJSON
			})// button.pop.click
		});
		
		/* 디자인 */
		
		var navigation = responsiveNav("#nav", { // Selector: The ID of the wrapper
	          animate: true, // Boolean: Use CSS3 transitions, true or false
	          transition: 400, // Integer: Speed of the transition, in milliseconds
	          label: "Menu", // String: Label for the navigation toggle
	          insert: "after", // String: Insert the toggle before or after the navigation
	          customToggle: "", // Selector: Specify the ID of a custom toggle
	          openPos: "relative", // String: Position of the opened nav, relative or static
	          jsClass: "js", // String: 'JS enabled' class which is added to <html> el
	          init: function(){}, // Function: Init callback
	          open: function(){}, // Function: Open callback
	          close: function(){} // Function: Close callback
	        });
		
		
		 $( function() {
		       

		        $( '#cbp-qtrotator' ).cbpQTRotator();

		      } );
	</script>
</html>