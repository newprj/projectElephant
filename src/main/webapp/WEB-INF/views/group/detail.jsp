<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>Insert title here</title>

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
		<script
			type="text/javascript"
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.4.1/cjs/popper.min.js"
		></script>

		<script
			type="text/javascript"
			src="/resources/assets/js/bootstrap.min.js"
		></script>

		<!--  파퍼 -->
		<link href="/resources/assets/css/bootstrap.css" rel="stylesheet" />
		<link href="/resources/assets/css/bootstrap-theme.css" rel="stylesheet" />
		<link
			rel="stylesheet"
			href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		/>
		<link href="/resources/stylesheets/style.css" rel="stylesheet" />
		<script
			src="https://kit.fontawesome.com/eab4c34ae3.js"
			crossorigin="anonymous"
		></script>
	</head>
	<style>
		body {
			background-color: #f6f9fc;
			font-family: "Noto Sans KR", sans-serif, -apple-system, BlinkMacSystemFont,
				"Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, "Open Sans",
				"Helvetica Neue", sans-serif;
			display: flex;
			flex-direction: column;
			align-items: center;
			padding: 50px 0;
		}

		div.wrapper {
			width: 70%;
			height: 90%;
			min-height: 500px;
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
		div.content {
			min-height: 150px;
			max-height: 700px;
			overflow-y: auto;
		}

		div.content > p > img {
			max-width: 80%;
		}

		div.title {
			padding-top: 30px;
			padding-bottom: 30px;
			color: inherit;
			border-bottom: 1px solid #7ec6da;
		}

		p.reply {
			display: flex;
			align-items: center;
			justify-content: space-between;
		}

		.uploadResult {
			display: block;
			width: 100%;
			min-height: 4rem;
			padding: 6px 12px;
			font-size: 14px;
			color: #555;
			background-color: #fff;
			background-image: none;
			border: 1px solid #ccc;
			border-radius: 4px;
			-webkit-box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%);
			box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%);
			transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
			margin-bottom: 5px;
		}

		.uploadResult > ul {
			list-style: none;
			display: flex;
			flex-direction: column;
		}

		.file-container {
			margin-top: 10px;
			margin-bottom: 10px;
		}

		div.button {
			display: flex;
			flex-flow: row nowrap;
			justify-content: center;
			align-items: center;
		}

		.btn {
			margin-left: 4px;
		}
		.writer{
			width: 100%;
			display: inline-block;
			margin: 0 0 20px 0;
			padding: 10px 0;
		}
    .media{
      display: flex;
      flex-direction: column;
      
    }
    .media >*{
      margin-left: auto;
    }
	</style>

	<body>
		<div class="wrapper">
			<div class="head">
				<div class="media-left">
					<img
						src="/resources/img/elephantIcon.png"
						style="height: 50px; width: 50px; border-radius: 50%"
						onclick="location.href='/group/'"
					/>
					<h1 class="logo" style="display: inline-block"></h1>
				</div>

				<div class="right">
					<div class="btn-group">
						<div>
							<c:if test="${user==null}">
								<div class="item btn btn-outline-info">
									<a href="/user/register"> 가입</a>
								</div>
								<div class="item btn btn-outline-info">
									<a href="/user/login">로그인</a>
								</div>
							</c:if>
						</div>
					</div>

					<c:if test="${user!=null}">
						<div class="btn-group">
							<c:if test="${one.leader eq user.user_id}">
								<form action="/cpage/list" method="post">
									<input type="hidden" name = "input" value="${one.group_name}">
									<button class="btn btn-outline-info cpage" > 그룹 관리 </button>
								</form>
							</c:if>
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
								<c:choose>
									<c:when test="${empty myGroup}"
										>
										<a
											class="dropdown-item"
											>가입한 그룹이 없습니다 </a
										>
									</c:when>
									<c:otherwise>
									<c:forEach items="${myGroup}" var="mine">
										<a
											class="dropdown-item"
											href="/group/${mine.group_name}"
											>${mine.group_name}</a
										>
											</c:forEach>
											</c:otherwise>
											</c:choose>
										</div>
									</div>
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
			<!--header-->
			<div style="padding: 0 10px">
				<div class="panel-body">
					<div class="title">
						<h1 style="padding-left: 10px">${one.group_name}</h1>
					</div>
				</div>
				<div class="panel-body">
					<div class="content-body">
						<div class="writer" >
							<div class="media">
								<h4>${one.leader}</h4>
								<span >
								  작성일
									<fmt:formatDate value="${one.regdate}" pattern="yyyy MM dd" />
								</span>
							</div>
						</div>
						<div class="view-mail content">${one.description}</div>
						<div class="signup" style='margin : 0 auto;'></div>
					</div>
				</div>
				<!-- pannel body -->
			</div>
			<div class="panel-footer text-right">
				<div class="button">
					<c:if test="${user.user_id eq one.leader}">
						<button class="btn btn-outline-info delete">그룹 삭제</button>
					</c:if>

					<c:if test="${user != null && user.user_id != one.leader}">
						<button class="btn btn-outline-info signup">지원하기</button>
					</c:if>

					<br />
					<c:if test="${user.user_id == 'admin'}">
						<button class="btn btn-outline-info auth">승인하기</button>
					</c:if>
				</div>
			</div>
		</div>
		<!-- wrapper-->
	</body>
	<script>
		const signupGroup = (data) => {
			$.ajax({
				type: "post",
				url: "/group/",
				data: JSON.stringify(data),
				contentType: "application/json; charset=utf-8",
				success: (res) => console.log(res),
				error: (xhr, status, er) => {
					console.log(xhr);
				},
			});
		};

		$(document).ready(function (e) {
			console.log("${one.leader}");
			console.log("${user}");
			const member_number = Number("${one.member_number}");

			let signupform = {};
			$("button.signup").click(function (e) {
				console.log(" 버튼이 눌림 사인업버튼 ");
				let memberMsg = $("<span> 이미 지원한 모임입니다 </span>");
				$("button.signup").remove();
				$("div.signup").append(memberMsg);

				signupform = {
					user_id: "${user.user_id}",
					group_name: "${one.group_name}",
					leader: "N",
					authorized: "N",
				};

				signupGroup(signupform);
			}); // 가입버튼 click

			$(".delete").click(function (e) {
				$.ajax({
					type: "delete",
					url: "/group/" + "${one.group_name}",
					success: () => {
						location.href = "/group/";
					},
					error: (xhr, status, er) => {
						console.log(status);
					},
				}); //ajax
			}); //delete button

			let joinedMember;
			$.getJSON("/group/getMemberlistByGroup/${group_name}", (list) => {
				
				if( "${one.leader}" !== "${user.user_id}" ){
					let msg = $("<span> 모집이 완료된 그룹입니다 </span> <br>");
					if (list.memberList.length >= member_number) {
						$("button.signup").remove();
						$("div.signup").append(msg);
						console.log("모집완료");
					}
					console.log(list);
					///이미 지원 한 그룹일 경우 버튼 노출 없애기
					let memberMsg = $("<span> 이미 지원한 모임입니다 </span>");
					list.allList.map(console.log);
					if (list.allList.some((i) => i.user_id === "${user.user_id}")) {
						$("button.signup").remove();
						$("div.signup").append(memberMsg);
						console.log("야....");
					}
				}else{
					$("button.signup").remove();
				}
			}); //getJson

			/* admin이 그룹 승인 */
			$(".auth").click(function () {
				var gno = "${one.gno}";
				var authorized = "Y";
				var gAuth = {
					gno: gno,
					authorized: authorized,
				};
				console.log("승인 버튼 누름" + JSON.stringify(gAuth));
				$.ajax({
					type: "post",
					url: "/mypage/auth",
					data: JSON.stringify(gAuth),
					contentType: "application/json; charset=utf-8",
					success: () => {
						console.log("승인 완료");
						alert("승인 완료");
						location.href = "/mypage/admin";
					},
					error: (xhr, status, er) => {
						console.log(status);
					},
				}); //ajax
			});
		});
	</script>
</html>
