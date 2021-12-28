<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
		<script
			src="https://kit.fontawesome.com/eab4c34ae3.js"
			crossorigin="anonymous"
		></script>
		<link
			href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
			rel="stylesheet"
		/>
		<link href="/resources/assets/css/bootstrap.css" rel="stylesheet" />
		<link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
	</head>
	<style>
		body {
			background-color: #f4f7f6;

			font-family: "Noto Sans KR", sans-serif;
		}

		.container {
			padding: 0;
		}
		.text-right {
			text-align: right !important;
		}
		.list-unstyled {
			padding-inline-start: 0;
		}

		.card {
			min-height: 600px;
			max-height: 600px;
			background: #fff;
			transition: 0.5s;
			border: 0;
			border-radius: 0.55rem;
			position: relative;
			width: 100%;
			box-shadow: 0 1px 2px 0 rgb(0 0 0 / 10%);
		}

		.chat-app .people-list {
			width: 280px;
			position: absolute;
			left: 0;
			top: 0;
			padding: 20px;
			z-index: 7;
		}

		.chat-app .chat {
			min-height: 600px;
			max-height: 600px;
			margin-left: 280px;
			border-left: 1px solid #eaeaea;
		}

		.people-list {
			-moz-transition: 0.5s;
			-o-transition: 0.5s;
			-webkit-transition: 0.5s;
			transition: 0.5s;
		}

		.people-list .chat-list li {
			padding: 10px 0px;
			list-style: none;
			border-radius: 3px;
		}

		.people-list .chat-list li:hover {
			background: #efefef;
			cursor: pointer;
		}

		.people-list .chat-list li .name {
			font-size: 15px;
		}

		.people-list .chat-list img {
			width: 45px;
			border-radius: 50%;
		}

		.people-list img {
			float: left;
			border-radius: 50%;
		}

		.people-list .about {
			float: left;
			padding-left: 8px;
		}

		.people-list .status {
			color: #999;
			font-size: 13px;
		}

		.chat .chat-header {
			padding: 15px 20px;
			border-bottom: 2px solid #f4f7f6;
			background-color: rgb(239, 239, 250);
		}

		.chat .chat-header img {
			float: left;
			border-radius: 40px;
			width: 40px;
		}

		.chat .chat-header .chat-about {
			float: left;
			padding-left: 10px;
		}

		.chat .chat-history {
			min-height: 440px;
			max-height: 440px;
			overflow-x: hidden;
			overflow-y: auto;
			padding: 20px;
			border-bottom: 2px solid #fff;
		}

		.chat .chat-history ul {
			padding: 0;
		}

		.chat .chat-history ul li {
			list-style: none;
			margin-bottom: 30px;
		}

		.chat .chat-history ul li:last-child {
			margin-bottom: 0px;
		}

		.chat .chat-history .message-data {
			margin-bottom: 15px;
		}

		.chat .chat-history .message-data img {
			border-radius: 40px;
			width: 40px;
		}

		.chat .chat-history .message-data-time {
			color: #434651;
			padding-left: 6px;
		}

		.chat .chat-history .message {
			color: #444;
			padding: 18px 20px;
			line-height: 26px;
			font-size: 16px;
			border-radius: 7px;
			display: inline-block;
			position: relative;

		}

		.chat .chat-history .message:after {
			bottom: 100%;
			left: 7%;
			border: solid transparent;
			content: " ";
			height: 0;
			width: 0;
			position: absolute;
			pointer-events: none;
			border-bottom-color: #fff;
			border-width: 10px;
			margin-left: -10px;
		}

		.chat .chat-history .my-message {
			background: #efefef;
		}

		.chat .chat-history .my-message:after {
			bottom: 100%;
			left: 30px;
			border: solid transparent;
			content: " ";
			height: 0;
			width: 0;
			position: absolute;
			pointer-events: none;
			border-bottom-color: #efefef;
			border-width: 10px;
			margin-left: -10px;
		}

		.chat .chat-history .other-message {
			background: #e8f1f3;
			text-align: right;
		}

		.chat .chat-history .other-message:after {
			border-bottom-color: #e8f1f3;
			left: 70%;
		}

		.chat .chat-message {
			padding: 20px;
		}

		.online,
		.offline,
		.me {
			margin-right: 2px;
			font-size: 8px;
			vertical-align: middle;
		}

		.online {
			color: #86c541;
		}

		.offline {
			color: #e47297;
		}

		.me {
			color: #1d8ecd;
		}

		.float-right {
			float: right;
		}

		.clearfix:after {
			visibility: hidden;
			display: block;
			font-size: 0;
			content: " ";
			clear: both;
			height: 0;
		}

		@media only screen and (max-width: 767px) {
			.chat-app .people-list {
				height: 465px;
				width: 100%;
				overflow-x: auto;
				background: #fff;
				left: -400px;
				display: none;
			}
			.chat-app .people-list.open {
				left: 0;
			}
			.chat-app .chat {
				margin: 0;
			}
			.chat-app .chat .chat-header {
				border-radius: 0.55rem 0.55rem 0 0;
			}
			.chat-app .chat-history {
				height: 300px;
				overflow-x: auto;
			}
		}

		@media only screen and (min-width: 768px) and (max-width: 992px) {
			.chat-app .chat-list {
				height: 650px;
				overflow-x: auto;
			}
			.chat-app .chat-history {
				height: 600px;
				overflow-x: auto;
			}
		}

		@media only screen and (min-device-width: 768px) and (max-device-width: 1024px) and (orientation: landscape) and (-webkit-min-device-pixel-ratio: 1) {
			.chat-app .chat-list {
				height: 480px;
				overflow-x: auto;
			}
			.chat-app .chat-history {
				height: calc(100vh - 350px);
				overflow-x: auto;
			}
		}
		.input-group {
			display: flex;
			font-display: row;
		}
		li.notice{
			text-align: -webkit-center !important;
		}
	</style>

	<body>
		<div>
			<div class="container">
				<div class="row clearfix">
					<div class="col-lg-12">
						<div class="card chat-app">
							<div id="plist" class="people-list">
								<ul class="list-unstyled chat-list mt-2 mb-0"></ul>
							</div>
							<div class="chat">
								<div class="chat-header clearfix">
									<div class="row">
										<div class="col-lg-6">
											<a
												href="javascript:void(0);"
												data-toggle="modal"
												data-target="#view_info"
											>
												<img
													src="/resources/img/elephantIcon.png"
													alt="avatar"
												/>
											</a>
											<div class="chat-about">
												<h3 class="m-b-0">${group_name}</h3>
											</div>
										</div>
										<div class="col-lg-6 hidden-sm text-right"></div>
									</div>
								</div>
								<div class="chat-history">
									<ul class="m-b-0"></ul>
								</div>
								<div class="chat-message clearfix">
									<div class="input-group mb-0">
										<input type="text" class="form-control message col-sm-6" />
										<button class="send btn btn-default">
											<i class="fa fa-send"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<script>
				let socket = new SockJS("http://localhost:8080/chat/${group_name}");
				console.log(socket);
				const loginUser = "${user.user_id}";
				const group = "${group_name}";
				let msg = $("input.message");
				let userprofile = {}
				$.getJSON("/group/getMemberlistByGroup/" + group, (list) => {
					console.log(list);
					console.log(loginUser);
					list.memberList.map((user) => {
						let img =
							user.profile !== null
								? user.profile
								: "/resources/img/lion.png";
						userprofile[user.user_id] = img;
						const memberElement = $(
							`<li class="clearfix">
                <img src=\${img} alt="avatar">
                <div class="about">
                <div class="name">\${user.user_id}</div>
                <div class="status"> <i class="fa fa-circle" id=\${user.user_id} aria-hidden="true"></i> </div>
                </div></li>`
						);
						$("ul.list-unstyled").append(memberElement);
					}); //map
					console.log(userprofile)
				}); //getJSON

				const sendMessage = () => {
					const sendTime = new Date().toLocaleTimeString();
					const data = {
						user: loginUser,
						group,
						msg: msg.val(),
						sendTime,
						type: "send",
					};
					let jsonMSG = JSON.stringify(data);
					socket.send(jsonMSG);
				}; // sendMsg

				const onMessage = (message) => {
					const arr = message.data.split("-");
					let msgElement;
					let [users, sessionId, messages, time, type] = arr;
					users = arr[0].replace(/[[\]\s]/g, "").split(",");
					if (type == "open") {
						users
							.filter((user) => user !== "")
							.map((user) => $(`#\${user}`).css({ color: "red " }));
							msgElement = $(
								`<li class="clearfix notice"> \${sessionId} 님이 입장했습니다 </li>`
							)
					} else if (type == "close"){
						$(`#\${sessionId}`).css({
							color: "#999",
						});
						msgElement = $(
								`<li class="clearfix notice"> \${sessionId} 님이 퇴장했습니다 </li>`
							)
					}	else {
						if (sessionId === loginUser) {
							msgElement = $(
								`<li class="clearfix">
									<div class="message-data text-right">
											<span class="message-data-time">\${time}</span>
									</div>
									<div class="message my-message float-right">\${messages}</div>
							 </li>`
							);
						} else {
							let img = userprofile[sessionId]
							msgElement = $(`
									 <li class="clearfix">
											<div class="message-data">
												<span class="message-data-time">\${time}</span>
												<img src="\${img}" alt="avatar">
											</div>
											<div class="message other-message">\${messages}</div>
									</li>`);
						}
					}
					$(".chat .chat-history ul").append(msgElement);
					$(".chat .chat-history").scrollTop(
						$(".chat .chat-history")[0].scrollHeight
					);
				}; //onMessage

				const socketClose = (e) => {
					console.log("disconnect");
					const sendTime = new Date().toLocaleTimeString();

					const data = {
						user: loginUser,
						group,
						msg: " 님이 퇴장했습니다 ",
						sendTime,
						type: "close",
					};
					let jsonMSG = JSON.stringify(data);
					socket.send(jsonMSG);
					console.log(data);
					socket.close();
				};

				const onClose = (e, a) => {}; // onClose

				const onOpen = (e) => {
					console.log(e);
					const sendTime = new Date().toLocaleTimeString();
					const data = {
						user: loginUser,
						group,
						msg: " 님이 입장했습니다 ",
						sendTime,
						type: "open",
					};
					let jsonMSG = JSON.stringify(data);
					socket.send(jsonMSG);
				}; //open

				$("button.send").click(function (e) {
					sendMessage();
					msg.val("");
				});

				$("input").keyup((e) => {
					if (e.keyCode === 13) {
						$("button.send").trigger("click");
					}
				});

				$(window).on("beforeunload", function () {
					socketClose();
				});

				socket.onmessage = onMessage;
				socket.onclose = onClose;
				socket.onopen = onOpen;
			</script>
		</div>
	</body>
</html>
