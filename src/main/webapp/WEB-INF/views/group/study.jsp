<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>Insert title here</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>

		<script
			type="text/javascript"
			src="/resources/assets/js/bootstrap.min.js"
		></script>

		<link
			rel="stylesheet"
			href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		/>
		<link href="/resources/assets/css/bootstrap.css" rel="stylesheet" />
		<link href="/resources/stylesheets/style.css" rel="stylesheet" />
		
		<script
			src="https://kit.fontawesome.com/eab4c34ae3.js"
			crossorigin="anonymous"
		></script>

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
			div.btn-group {
				display: flex;
				font-display: row;
			}
			#letter_modal {
				background: rgba(0, 0, 0, 0.8);
				display: none;
				position: fixed;
				width: 100%;
				height: 100%;
				left: 0;
				right: 0;
				right: 0;
				bottom: 0;
				z-index: 1;
			}
			#modal-content {
				position: absolute;
				display: felx;
				justify-content: cneter;
				align-items: center;
				top: 50%;
				left: 50%;
				transform: translate(-50%, -50%);
				background-color: white;
				border-radius: 4px;
			}
			.content-body {
				display: flex;
				min-height: 700px;
				padding: 10px 70px;
			}
			.content-left {
				flex: 1;
			}
			.content-center {
				flex: 4;
			}
			.content-right {
				flex: 2;
			}
			.notice-header {
				margin-bottom: 0;
				border-bottom: 1px solid rgba(0, 0, 0, 0.125);
				border-bottom-width: 1px;
				border-bottom-style: solid;
				border-bottom-color: rgba(0, 0, 0, 0.125);
			}
			.card {
				border: none;
			}
			.member li {
				padding: 10px 3em 8px 15px;
				margin-bottom: 10px;
			}
			.icon-wrap {
				color: #fff;
				background-color: #9cc96b;
				border-radius: 100px 100px 0;
				padding: 12px;
				display: flex;
				width: 50px;
				align-items: center;
				justify-content: center;
				height: 50px;
			}
			.h4 {
    font-size: 18px;
    display: inline-block;
    vertical-align: sub;
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
					/></a>
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
								<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									<c:choose>
										<c:when test="${empty myGroup}">
											<a class="dropdown-item">가입한 그룹이 없습니다 </a>
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
							<button class="btn btn-outline-info getChat">
								<i class="far fa-comment-dots"></i> 채팅
							</button>
						</div>
					</c:if>
				</div>
				<!-- right -->
			</div>
			<!--  head -->

			<div class="content-body">
				<div class="content-center">
					<div>
						<div
							style="display: flex; justify-content: space-between; width: 90%"
						>
						<div class="panel media pad-all">
							<div class="media-left">
								<span class="icon-wrap">
									<i class="fas fa-check"></i>
								</span>
							</div>
							<div class="media-body">
								<p class="text-2x mar-no text-thin text-right"></p>
								<p class="h4 mar-no text-right">&nbsp&nbsp${group.group_name} 공지사항</p>
							</div>
						</div>
								

							
							<div
								style="display: flex; flex-direction: row;  align-items: baseline;"
							>
								<div class="dropdown">
									<button
										class="btn btn-outline-info dropdown-toggle"
										type="button"
										id="dropdownMenuButton"
										data-toggle="dropdown"
										aria-haspopup="true"
										aria-expanded="false"
									>
										<i class="far fa-envelope"></i> 쪽지
									</button>
									<div
										class="dropdown-menu letter"
										aria-labelledby="dropdownMenuButton"
									>
										<c:forEach items="${group.userList}" var="users">
											<c:if test="${users.user_id ne user}">
												<a
													data-user="${users.user_id}"
													style="cursor: pointer"
													class="dropdown-item"
													>${users.user_id}</a
												>
											</c:if>
										</c:forEach>
									</div>
								</div>

								<button
									class="btn btn-outline-info"
									onclick="location.href='/group/board/${group_name}'"
								>
									<i class="fa fa-file-text-o"></i> 게시판
								</button>
							</div>
						</div>
					</div>
					<c:choose>
						<c:when test="${board.size() > 0 }">
							<c:forEach items="${board}" var="board">
								<div id="accordion" style="width: 90%">
									<div class="card">
										<div class="notice-header" id="heading">
											<h5 class="mb-0">
												<button
													class="btn btn-link collapsed"
													data-toggle="collapse"
													data-target="#${board.bno}"
													aria-expanded="false"
													aria-controls="collapse"
												>
													${board.title}
												</button>
											</h5>
										</div>
										<div
											id="${board.bno}"
											class="collapse"
											aria-labelledby="heading"
											data-parent="#accordion"
										>
											<div
												class="card-body"
												style="max-height: 380px; overflow-y: auto"
											>
												${board.content}
											</div>
										</div>
									</div>
								</div>
								<!-- arcodion -->
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div>
								<h4>등록된 공지글이 없습니다</h4>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="content-right">
				
					<div>
						
						<div class="panel media pad-all">
							<div class="media-left">
								<span class="icon-wrap">
									<i class="fa fa-calendar-o"></i>
								</span>
							</div>
							<div class="media-body">
								<p class="text-2x mar-no text-thin text-right"> </p>
								<p class="h4 mar-no text-right" style="display : flex;     justify-content: space-between;"> <span> &nbsp&nbsp 최근일정</span> <span> <a href="/group/test/${group_name}"></span> <i class="fa fa-calendar-o"></i> 일정 </a></span></p>
							</div>
						</div>
					</div>

				
					<div>
						<h5>오늘의 일정</h5>
						<ul class="today" style="list-style: none"></ul>
						<h5>다가오는 일정</h5>
						<ul class="latest" style="list-style: none"></ul>
					</div>
				</div>
			</div>
			<!-- content-body -->
		</div>
		<!-- wrapper -->
		<!-- 쪽지 모달 -->
		<div id="letter_modal">
			<div class="panel" id="modal-content">
				<div class="panel-heading">
					<h3 class="panel-title">Message</h3>
				</div>
				<div class="panel-body">
					<!-- Multiple Select Choosen -->
					<!--===================================================-->
					<form class="form-horizontal form-bordered letter">
						<div class="form-group nb">
							<label class="control-label col-md-4">보내는 사람</label>
							<div class="col-md-8">
								<input
									type="text"
									class="form-control"
									name="writeId"
									readonly
									style="margin-bottom: 2px !important"
								/>
							</div>
						</div>
						<div class="form-group nb">
							<label class="control-label col-md-4">받는사람</label>
							<div class="col-md-8">
								<input
									type="text"
									class="form-control"
									name="recipientId"
									style="margin-bottom: 2px !important"
								/>
							</div>
						</div>
						<div class="form-group nb">
							<label class="control-label col-md-4">내용</label>
							<div class="col-md-8">
								<textarea class="form-control" name="letterContent"></textarea>
							</div>
						</div>

						<div class="pad-top">
							<button class="btn btn-info" id="letterRegister">
								<i class="fa fa-send"></i> Send
							</button>
							<button class="btn btn-default closeModal">
								<i class="fa fa-remove"></i> Close
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>

		<script>
			let loginUser = "${user}";
			let group = "${group_name}";
			$("#${group.leader}").css("outline", "2px solid cornflowerblue");
			$.getJSON(`/group/getMemberlistByGroup/\${group}`, (list) => {
				let joinCheck = list.memberList.find(
					(user) => user.user_id === loginUser
				);
				if (!joinCheck) {
					alert("그룹 회원만 접근 가능한 페이지입니다");
					location.href = "/group/";
				}
			});
			const today = new Date().toISOString().split("T")[0];
			console.log(today);
			$.getJSON(`/group/getLatestEvent/\${group}`, (list) => {
				const todayEvent = list.filter((i) => i.startDate === today);
				console.log(todayEvent);
				if (todayEvent.length == 0 || todayEvent == null) {
					let noEvent = $("<li> 오늘의 일정이 없습니다 </li>");
					$("ul.today").append(noEvent);
				}
				todayEvent.map((event) => {
					const { title, description_ } = event;
					let todayLi = $(
						`<li> <strong> \${title} </strong> <span>\${description_} </span>  </li>`
					);
					$("ul.today").append(todayLi);
				});
				const latestEvent = list
					.filter((i) => i.startDate !== today)
					.sort((a, b) => {
						let aDate = new Date(a.startDate);
						let bDate = new Date(b.startDate);
						return aDate - bDate;
					})
					.slice(0, 10);
				if (latestEvent.length == 0 || latestEvent == null) {
					let noEvent = $("<li> 다가오는 일정이 없습니다 </li>");
					$("ul.latest").append(noEvent);
				}
				latestEvent.map((event) => {
					const { title, description_ } = event;
					let eventLi = $(
						`<li> <strong> \${title} </strong> <span>\${description_} </span>  </li>`
					);
					$("ul.latest").append(eventLi);
				});
			}); // getJSON
			// 채팅
			let popup;
			$("button.getChat").click((e) => {
				popup = window.open(
					`/chat_pop/\${group}`,
					"chatPop",
					"width=1110, height=625, top=150, left=200,scrollbars=no"
				);
				console.log(popup);
			});
			$("div.letter >a").click((e) => {
				$('input[name="recipientId').val($(e.target).data("user"));
				$("input[name='writeId']").val("${user}");
				$("#letter_modal").show();
			});
			const getLetter = () => ({
				writer: "${user}",
				recipient: $('input[name="recipientId').val(),
				content: $('textarea[name="letterContent"]').val(),
				reg_date: new Date(),
			});
			$("#letterRegister").click((e) => {
				e.preventDefault();
				const letter = getLetter();
				$.ajax({
					url: "/mypage/letterRegister",
					type: "post",
					data: JSON.stringify(letter),
					contentType: "application/json; charset=utf-8",
					dataType: "text",
					success: function (result) {
						$("#letter_modal").hide();
						console.log(" 쪽지 보내짐 ");
						$("letter").each((e) => {
							this.reset();
						});
					},
					error: function () {
						alert("실패");
					},
				});
			});
			$(".closeModal").click((e) => {
				e.preventDefault();
				$("#letter_modal").hide();
				console.log(" 쪽지 보내짐 ");
				$("letter").each((e) => {
					this.reset();
				});
			});
		
		</script>
	</body>
</html>