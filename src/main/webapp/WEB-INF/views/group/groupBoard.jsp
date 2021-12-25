<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		
		<script
			src="https://kit.fontawesome.com/eab4c34ae3.js"
			crossorigin="anonymous"
		></script>
		<link rel="preconnect" href="https://fonts.googleapis.com" />
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
		<link
			href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;500&display=swap"
			rel="stylesheet"
		/>

		<!-- 폰트 -->
		<script src="//code.jquery.com/jquery-3.6.0.js"></script>



		<script
			type="text/javascript"
			src="/resources/assets/js/bootstrap.min.js"
		></script>

		<link
		rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	/>

		<link href="/resources/assets/css/bootstrap.css" rel="stylesheet" />
		<link href="/resources/assets/css/bootstrap-theme.css" rel="stylesheet" />

		<link href="/resources/stylesheets/style.css" rel="stylesheet" />
		<link href="/resources/plugins/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" />
		<script src="/resources/plugins/bootstrap-select/bootstrap-select.min.js" ></script>



		<title>Insert title here</title>
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
				width: 1240px;
				
				height: 90%;
				background-color: white;
				box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11),
					0 1px 3px rgba(0, 0, 0, 0.08);
				overflow-x: hidden;
				overflow-y: hidden;
			}

			.group-image {
				display: block;
				height: 11rem; /* layout hack */
				background: #fff center center no-repeat;
				background-size: cover;
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

			.btn-group{
				display: flex;
				flex-direction: row;
				box-shadow: none;
			}
			.btn-group:hover{
				box-shadow: none;
			}
			.group-list {
				display: block;
				margin: 1rem auto;
				padding: 0;
				font-size: 0;
				text-align: center;
				list-style: none;
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

			.group-description {
				display: block;
				padding: 1em 0.5em;
				color: #515151;
				text-decoration: none;
			}

			.group-description > h2 {
				margin: 0 0 0.5em;
			}

			.group-description > p {
				margin: 0;
			}

			.pagination {
				display: flex;
				flex-flow: row nowrap;
				justify-content: center;
				align-items: center;
				color: #222;
			}

			.pagenate {
				display: inline-block;
				padding: 10px 18px;
				width: 40px;
				height: 40px;
				line-height: 40px;
				padding: 0;
				text-align: center;
			}

			a.current {
				background-color: #2ecc71;
				border-radius: 50%;
				color: #fff;
			}

			ul#portfolioFilter span {
				font-size: 14px;
				color: #333;
				font-family: "Montserrat", sans-serif;
			}
			.toolbar-right{
				float: right;
			}

		</style>
	</head>
	<body>
		<div class="wrapper">
			<div class="head">
				<div class="media-left">
					<a href="/group/">
					<img
						src="/resources/img/elephantIcon.png"
						style="height: 50px; width: 50px; border-radius: 50%"
					/>
				</a>
				</div>
				<div class="media-body">
					<h4 class="alert-title">${name}</h4>
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
							<c:choose>
								<c:when test="${empty myGroup}"
									>>
									<span> 가입한 그룹이 없습니다 </span>
								</c:when>
								<c:otherwise>
									<div class="dropdown">
										<button
											class="btn btn-outline-info dropdown-toggle"
											type="button"
											id="dropdownMenuButton"
											data-toggle="dropdown"
											aria-haspopup="true"
											aria-expanded="false"
										>
											내 그룹
										</button>
										<div
											class="dropdown-menu"
											aria-labelledby="dropdownMenuButton"
										>
											<c:forEach items="${myGroup}" var="mine">
												<a
													class="dropdown-item"
													href="/group/${mine.group_name}"
													>${mine.group_name}</a
												>
											</c:forEach>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
							<div class="dropdown">
								<button
									class="btn btn-outline-info dropdown-toggle"
									type="button"
									id="dropdownMenuButton"
									data-toggle="dropdown"
									aria-haspopup="true"
									aria-expanded="false"
								>
									MY
								</button>
								<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									<a class="dropdown-item" href="/mypage/user">마이페이지</a>
									<a class="dropdown-item" href="/user/modify">회원정보 수정</a>
									<a class="dropdown-item" href="/user/logout">로그아웃</a>
								</div>
							</div>
							<a href="/group/make">
								<button class="btn btn-outline-info">create</button>
							</a>
						</div>
					</c:if>
				</div>
				<!-- right -->
			</div>
			<!-- head  -->

			
				<div class="porto-bg-eleven common-pad">
					<article class="text-left">
						<div id="filter" class="clearfix">
							<div id="filter_wrapper">
								<ul id="portfolioFilter">
									<li class="active">
										<span
											class="${pageMaker.cri.sort == null ? 'current' : ''}"
											data-sort="recent"
										>
											최신순
										</span>
									</li>
									<li class="separator">/</li>
									<li>
										<span
											class="${pageMaker.cri.sort eq 'popular' ? 'current' : ''}"
											data-sort="popular"
										>
											지원자 많은 순
										</span>
									</li>
									<li class="separator">/</li>
									<li>
										<span
											class="${pageMaker.cri.sort eq 'viewCnt' ? 'current' : ''}"
											data-sort="viewCnt"
										>
											조회순
										</span>
									</li>
								</ul>
							</div>
						</div>
					</article>
				</div>

				<ul class="group-list">		
					<c:forEach items ="${group}" var="group">
						<li class="group">
							<div style="background-image: url(${group.profile});" class="group-image" ></div>
							<div class="group-description">
								<h2 class="group_name">  ${group.group_name} </h2>
								<p> ${group.leader}</p>
								<p> ${group.subject }</p>
								<hr>
								
								<span> <i class="fas fa-eye"></i> ${group.viewCnt} </span>
								<span> 🙋‍♀  ${group.applicantCnt} <i class="far fa-hand-peace"> ${group.joinedCnt}</i>/ ${group.member_number}</span>
								
							</div>
						</li>
					</c:forEach>
					</ul>
					<div class="pagination">
						<c:if test="${pageMaker.prev}">
							<a class="pagenate prev" href="${pageMaker.startPage-1}"> prev </a>
						</c:if>
						<c:forEach
							var="num"
							begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}"
						>
							<a
								class="pagenate ${pageMaker.cri.pageNum == num ? 'current': '' }"
								href="${num}"
								>${num}</a
							>
						</c:forEach>
						<c:if test="${pageMaker.next }">
							<a class="pagenate next" href="${pageMaker.endPage+1}"> next </a>
						</c:if>
					</div>

		</div><!-- wrapper -->
		<script>
			let pageNum = "${cri.pageNum}";
			let amount = "${cri.amount}";

			$(".group_name").click(function (e) {
				const group_name = e.target.innerText;
				location.href = `/group/gather/\${group_name}`;
			});

			let searchForm = $("form.searchForm");
			$("button.searchForm").click((e) => {
				e.preventDefault();
				let type = searchForm.find("option:selected").val();
				let keyword = $('input[name="keyword"]').val();
				let url = `/group/main/list/\${pageNum}/\${amount}/\${type}/\${keyword}`;
				let sort = $(".current").data("sort");
				if (sort == "recent") sort = "";
				if (!type) {
					alert("옵션 종류를 선택하세요 ");
				} else if (!keyword) {
					alert("검색 키워드를 입력하세요 ");
				} else {
					if (sort) url += `/\${sort}`;
					location.href = url;
				}
			}); // search button click

			$("#filter_wrapper li span").on("click", function () {
				const sort = $(this).data("sort");
				let url = `/group/main/list/`;
				if (sort !== "recent") {
					url += `\${pageNum}/\${amount}/\${sort}`;
				}
				location.href = url;
			});

			$("a.pagenate").click(function (e) {
				e.preventDefault();
				let type = "${cri.type}";
				let keyword = "${cri.keyword}";
				let sort = "${cri.sort}";

				let pageNum = $(this).attr("href");
				let url =
					type && keyword
						? `/group/main/list/\${pageNum}/\${amount}/\${type}/\${keyword}`
						: `/group/main/list/\${pageNum}/\${amount}`;
				url += sort ? `/\${sort}` : "";
				location.href = url;
			}); // a click
		</script>
	</body>
</html>
