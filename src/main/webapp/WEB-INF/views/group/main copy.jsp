<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<style></style>
		<title>메인 페이지</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta
			name="description"
			content="porto by ThemesGround - An easy to use Personal Portfolio - Retina Ready and Responsive HTML5 theme"
		/>
		<meta name="author" content="ThemesGround" />

		<link rel="preconnect" href="https://fonts.googleapis.com" />
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
		<link
			href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;500&display=swap"
			rel="stylesheet"
		/>
		<link
			href="https://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,600italic,700,700italic,800"
			rel="stylesheet"
			type="text/css"
		/>
		<link
			href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
			rel="/resources/stylesheet"
			type="text/css"
		/>
		<!--  폰트  -->
		<script src="//code.jquery.com/jquery-3.6.0.js"></script>

		<link href="/resources/assets/css/bootstrap.css" rel="stylesheet" />
		<link href="/resources/assets/css/bootstrap-theme.css" rel="stylesheet" />

		<link href="/resources/assets/css/extension.css" rel="stylesheet" />
		<link href="/resources/stylesheets/style.css" rel="stylesheet" />

		<link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
		<script src="/resources/js/bootstrap.js"></script>
		<script src="/resources/js/bootstrap.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<script
			src="https://kit.fontawesome.com/eab4c34ae3.js"
			crossorigin="anonymous"
		></script>

		<link href="/resources/stylesheets/responsive-nav.css" rel="stylesheet" />
		<script src="/resources/javascripts/slidingmenu.js"></script>
		<link href="/resources/stylesheets/slidingmenu.css" rel="stylesheet" />

		<style>
			body {
				background-color: #f6f9fc;
				font-family: "Noto Sans KR", sans-serif, -apple-system,
					BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell,
					"Open Sans", "Helvetica Neue", sans-serif;
				display: flex;
				flex-direction: column;
				align-items: center;
				padding: 50px 0;
			}

			div.wrapper {
				width: 70%;
				height: 90%;
				background-color: white;
				box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11),
					0 1px 3px rgba(0, 0, 0, 0.08);
				overflow-x: hidden;
				overflow-y: hidden;
			}

			div.head {
				color: #000;
				border-left: 5px solid #5ec2dd;
				padding: 10px 3em 8px 15px;
				margin-bottom: 10px;
				display: flex;
				align-items: center;
				justify-content: space-between;
			}
			.navbar {
				display: flex;
				flex-direction: row;
				list-style: none;
			}
			a {
				text-decoration: none;
			}

			.group-list {
				max-width: 1240px;
				margin: 0 auto;
				display: block;
				margin: 1rem auto;
				padding: 0;
				font-size: 0;
				text-align: center;
				list-style: none;
				overflow-x: hidden;
				overflow-y: hidden;
				padding-bottom: 3rem;
			}

			.group {
				display: inline-block;
				width: 90%;
				max-width: 300px;
				margin: 1rem;
				font-size: 1rem;
				text-decoration: none;
				overflow: hidden;
				box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11),
					0 1px 3px rgba(0, 0, 0, 0.08);
				transition: transform 0.1s ease-in-out, box-shadow 0.1s;
			}

			.group:hover {
				transform: translateY(-0.5rem) scale(1.0125);
				box-shadow: 0 0.5em 3rem -1rem rgba(0, 0, 0, 0.5);
			}

			.group-image {
				display: flex;
				padding: 0;
				height: 14rem;
				background: #fff center center no-repeat;
				background-size: cover;
			}

			.group-image:hover {
				backdrop-filter: blur(10px);
			}

			.group-description {
				display: flex;
				align-items: center;
				justify-content: center;
				flex-direction: column;
				border-top: 6rem;
				z-index: -1;
				width: 100%;
				height: 100%;
			}

			.group-description:hover {
				z-index: 3;
				font-family: "Noto Sans KR", sans-serif;
				text-align: center;
				-webkit-backdrop-filter: blur(10px);
				backdrop-filter: blur(10px);
			}

			.group-description > h2 {
				margin: 0 0 0.5em;
			}

			.group-description > p {
				margin: 0;
				color: black;
			}

			ul#portfolioFilter span {
				cursor: pointer;
				font-size: 14px;
				color: #333;
				font-family: "Montserrat", sans-serif;
			}

			div.link {
				display: flex;
				justify-content: center;
				color: #222;
			}
			.btn-group {
				display: flex;
				flex-direction: row;
			}
		</style>
	</head>

	<body>
		<div class="wrapper">
			<div class="head">
				<div class="media-left">
					<img
						src="/resources/img/elephantIcon.png"
						style="height: 50px; width: 50px; border-radius: 50%"
					/>
					<h1 class="logo" style="display: inline-block"></h1>
				</div>

				<div class="right">
					<div class="btn-group">
						<div>
							<c:if test="${user==null}">
								<div class="item btn btn-default">
									<a href="/user/register"> 가입</a>
								</div>
								<div class="item btn btn-default">
									<a href="/user/login">로그인</a>
								</div>
							</c:if>
						</div>
					</div>
					<c:if test="${user!=null}">
						<div class="btn-group">
							<div class="dropdown">
								<button
									class="btn btn-default dropdown-toggle"
									type="button"
									id="dropdownMenuButton"
									data-toggle="dropdown"
								>
									내 그룹
									<span class="caret"></span>
								</button>
								<ul role="menu" class="dropdown-menu dropdown-menu-right">
									<c:choose>
										<c:when test="${empty myGroup}">
											<li><a class="dropdown-item">가입 그룹 없음</a></li>
										</c:when>
										<c:otherwise>
											<c:forEach items="${myGroup}" var="mine">
												<li>
													<a
														class="dropdown-item"
														href="/group/${mine.group_name}"
														>${mine.group_name}</a
													>
												</li>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</ul>
							</div>

							<div class="dropdown">
								<button
									class="btn btn-default dropdown-toggle"
									type="button"
									id="dropdownMenuButton"
									data-toggle="dropdown"
								>
									MY<span class="caret"></span>
								</button>
								<ul role="menu" class="dropdown-menu dropdown-menu-right">
									<li>
										<a class="dropdown-item" href="/mypage/user">마이페이지</a>
									</li>
									<li>
										<a class="dropdown-item" href="/user/modify"
											>회원정보 수정</a
										>
									</li>
									<li>
										<a class="dropdown-item" href="/user/logout">로그아웃</a>
									</li>
								</ul>
							</div>
							<a href="/group/make">
								<button class="btn btn-default">create</button>
							</a>
						</div>
					</c:if>
				</div>
				<!-- right -->
			</div>
			<!-- head -->

			<nav class="navbar navbar-default megamenu">
				<div class="navbar-header">
					<button
						type="button"
						data-toggle="collapse"
						data-target="#defaultmenu"
						class="navbar-toggle"
					>
						<span class="icon-bar"></span><span class="icon-bar"></span
						><span class="icon-bar"></span>
					</button>
				</div>
				<div id="defaultmenu" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li>
							<a href="/mypage/user"> Home </a>
						</li>

						<li>
							<a href="/mypage/userGroup"> Group</a>
						</li>

						<li>
							<a href="/mypage/userQna"> Q&amp;A </a>
						</li>

						<li>
							<a href="/mypage/allMessage"> Message </a>
						</li>
						<li>
							<a href="/mypage/calendar"> Calendar </a>
						</li>

						<!-- end standard drop down -->
					</ul>
					<!-- end nav navbar-nav -->
				</div>
				<!-- end #navbar-collapse-1 -->
			</nav>

			<div class="porto-bg-eleven common-pad">
				<article class="text-left">
					<div id="filter" class="clearfix">
						<div id="filter_wrapper">
							<ul id="portfolioFilter">
								<li class="active">
									<span data-sort="recent" class="current"> 최신순 </span>
								</li>
								<li class="separator">/</li>
								<li><span data-sort="pop"> 지원자 많은 순 </span></li>
								<li class="separator">/</li>
								<li><span data-sort="complete"> 모집이 완료된 그룹 </span></li>
							</ul>
						</div>
					</div>
				</article>
			</div>
			<!-- 정렬 바 -->
			<ul class="group-list">
				<c:forEach items="${group}" var="group">
					<li class="group">
						<a href="/group/gather/${group.group_name}">
							<div
								style="background-image: url(${group.profile})"
								class="group-image"
							>
								<div class="group-description">
									<h2 class="group_name">${group.group_name}</h2>
									<p>${group.subject }</p>
								</div>
							</div>
						</a>
					</li>
				</c:forEach>
			</ul>
			<div class="link">
				<a href="/group/main/list">
					<span>....모집중인 그룹 모두 보기 </span>
				</a>
			</div>
		</div>
		<!-- wrapper  -->
		<nav class="menu" id="sm">
			<div class="sm-wrap">
				<h1 class="sm-logo">Porto</h1>
				<i class="icon-remove menu-close"></i>
				<a class="scroll-link" data-soffset="0" href="/group/">Home</a>
				<a class="scroll-link" data-soffset="0" href="/user/login">login</a>
				<a class="scroll-link" data-soffset="0" href="#portfolio">Portfolio</a>
				<a class="scroll-link" data-soffset="0" href="/mypage/user">My Page</a>
				<a class="scroll-link" data-soffset="0" href="#profile">Profile Page</a>
				<a class="scroll-link" data-soffset="0" href="/qna/list"
					>Q&amp;A page</a
				>
			</div>
			<!-- Navigation Trigger Button -->
			<div id="sm-trigger" class=""></div>
		</nav>
	</body>

	<script>
		$(document).ready(function (e) {
			const getPop = () => {
				$.getJSON("/group/main/getGroupAll", (list) => {
					$(".group-list").children().remove();
					list.recruiting
						.sort((b, a) => a.applicantCnt - b.applicantCnt)
						.slice(0, 12)
						.map((group) => {
							const groupEle = $(`<li class="group">
									<a href="/group/gather/\${group.group_name}">	
									<div style="background-image: url(\${group.profile})" class="group-image" >
									<div class="group-description">
										<h2 class="group_name">\${group.group_name}</h2>
										<p>\${group.subject }</p>
									</div>
								</div>
								</a>
							</li>`);
							$(".group-list").append(groupEle);
						});
				}); //getJSON
			}; //getPop

			const getCompleted = () => {
				$.getJSON("/group/main/getGroupAll", (list) => {
					if (list.completed == null || list.completed.length < 1) {
						alert("모집이 완료된 그룹이 없습니다 ");
						return false;
					}
					$(".group-list").children().remove();
					list.completed.map((group) => {
						const groupEle = $(`<li class="group">
								<a href="/group/gather/\${group.group_name}">	
								<div style="background-image: url(\${group.profile})" class="group-image" >
								<div class="group-description">
									<h2 class="group_name">\${group.group_name}</h2>
									<p>\${group.subject }</p>
								</div>
							</div>
							</a>
						</li>`);
						$(".group-list").append(groupEle);
					});
				}); //getJSON
			};

			$("#filter_wrapper li span").on("click", function () {
				$("span.current").removeClass("current");
				$(this).addClass("current");
				const sort = $(this).data("sort");
				sort === "recent"
					? location.reload()
					: sort === "pop"
					? getPop()
					: getCompleted();
			});
		});
	</script>
</html>
