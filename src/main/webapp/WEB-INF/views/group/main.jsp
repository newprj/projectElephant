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

		<link href="/resources/assets/css/bootstrap.css" rel="stylesheet" />
		<link href="/resources/assets/css/bootstrap-theme.css" rel="stylesheet" />
		<link href="/resources/css/bootstrap.min.css" rel="stylesheet" />

		<link href="/resources/assets/css/extension.css" rel="stylesheet" />
		<link href="/resources/stylesheets/style.css" rel="stylesheet" />
		<script src="//code.jquery.com/jquery-3.6.0.js"></script>
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

			div.head > div {
				flex: 1;
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
					<h1 class="logo">코끼리</h1>
				</div>
				<div class="center"></div>
				<div class="right">
					<c:if test="${user==null}">
						<div class="item btn btn-default">
							<a href="/user/register"> 가입</a>
						</div>
						<div class="item btn btn-default">
							<a href="/user/login">로그인</a>
						</div>
					</c:if>
					<c:if test="${user!=null}">
						<div class="mygroup">
							<c:choose>
								<c:when test="${empty myGroup}"
									>>
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
									<button class="btn btn-default go">go</button>
								</c:otherwise>
							</c:choose>
							<a href="/group/make">
								<button class="btn btn-default">create</button>
							</a>
						</div>
						<button
							class="btn btn-default"
							type="button"
							onclick="location.href='/mypage/user' "
						>
							마이 사이트
						</button>
						<button
							class="btn btn-default"
							type="button"
							onclick="location.href='/user/logout' "
						>
							로그아웃
						</button>
						<button
							class="btn btn-default"
							type="button"
							onclick="location.href='/user/modify' "
						>
							회원정보 수정
						</button>
						<button
							class="btn btn-default"
							type="button"
							onclick="location.href='/user/delete' "
						>
							회원탈퇴
						</button>
					</c:if>
				</div>
				<!-- right -->
			</div>
			<!-- head -->
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

			$("button.go").click(function (e) {
				e.preventDefault();
				let group_name = $('select[name="group_name"]').val();
				location.href = `/group/\${group_name}`;
			});

			$("button.latest").click((e) => {
				location.reload();
			});

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
