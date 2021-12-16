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
	</head>
	<body>
		<h1>스터디별 페이지</h1>
		${group_name}

		<p><a href="/group/"> 메인 </a></p>
		<c:choose>
			<c:when test="${board.size() > 0 }">
				<c:forEach items="${board}" var="board">
					<div>${board.title}</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div>등록된 공지글이 없습니다</div>
			</c:otherwise>
		</c:choose>
		<div>
			<a href="/group/board/${group_name}/1/10"> ${group_name} 게시판 </a>
		</div>

		<div class="event">
			<h4>최근일정</h4>
			<div>
				<h5>오늘의 일정</h5>
				<ul class="today" style="list-style: none"></ul>
				<h5>다가오는 일정</h5>
				<ul class="latest" style="list-style: none"></ul>
			</div>
			<a href="/group/test/${group_name}"> ... 일정 더보기 </a>
		</div>

		<div
			style="overflow-y: auto; width: 350px; height: 200px"
			class="chatContainer"
		>
			<div class="message"></div>
		</div>

		<div>
			<input class="message" type="text" />
			<div>
				<button class="getChat">입장</button>
				<button class="send">전송</button>
				<button class="close">퇴장</button>
			</div>
		</div>
	</body>

	<script>

		let loginUser = "${user}";
		let group = "${group_name}";

		$.getJSON("/group/getMemberlistByGroup/${group_name}", (list) => {
			let joinCheck = list.find((user) => user.user_id === loginUser);
			if (!joinCheck) {
				alert("그룹 회원만 접근 가능한 페이지입니다");
				location.href = "/group/";
			}
		});

		const today = new Date().toISOString().split("T")[0];

		console.log(today);

		$.getJSON("/group/getLatestEvent/${group_name}", (list) => {
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

		let socket = new SockJS(`http://localhost:8080/chat/\${group}`);
		console.log(socket);

		let msg = $("input.message");
		const sendMessage = () => {
			const sendTime = new Date().toLocaleTimeString();
			const data = {
				user: loginUser,
				group,
				msg: msg.val(),
				sendTime,
			};
			let jsonMSG = JSON.stringify(data);
			socket.send(jsonMSG);
		}; // sendMsg

		const onMessage = (message) => {
			console.log(message);
			const data = message.data;
			let sessionId;
			let messages;
			let time;

			let arr = data.split(":");

			sessionId = arr[0];
			messages = arr[1];
			time = arr.slice(-3).join(":");

			let msgElement = $(
				`<div><div><b>\${sessionId}</b> \${messages} <br/> \${time}</div></div>`
			);
			$("div.message").append(msgElement);
			$("div.chatContainer").scrollTop($("div.chatContainer")[0].scrollHeight);
		}; //onMessage

		const socketClose = (e) => {
			console.log("disconnect");
			const sendTime = new Date().toLocaleTimeString();
			const longMsg = $("div.message")[0].innerHTML;
			const data = {
				user: loginUser,
				group,
				msg: " 님이 퇴장했습니다 ",
				sendTime,
			};
			let jsonMSG = JSON.stringify(data);
			socket.send(jsonMSG);
			console.log(data);
			socket.close();
		};

		const onClose = (e, a) => {
			const sendTime = new Date().toLocaleTimeString();
			const longMsg = $("div.message")[0].innerHTML;
			const data = {
				user: loginUser,
				group,
				msg: "이것도 갔으면 좋겠어 ",
				sendTime,
			};
			let jsonMSG = JSON.stringify(data);
			socket.send(jsonMSG);
			console.log(data);
		}; // onClose

		const onOpen = (e) => {
			console.log(e);
			const sendTime = new Date().toLocaleTimeString();
			const data = {
				user: loginUser,
				group,
				msg: " 님이 입장했습니다 ",
				sendTime,
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

		$("button.close").click((e) => {
			socketClose();
		});

		window.onbeforeunload = function () {
			websocket.onclose = function () {}; // disable onclose handler first
			socketClose(e);
		};


		socket.onmessage = onMessage;
		socket.onclose = onClose;
		socket.onopen = onOpen;

		// 나중에 쓸꺼야
		console.log("${pageContext.request.serverName}"); // localhost
		console.log("${pageContext.request.serverPort}"); //8080
		console.log("${pageContext.request.contextPath}");
	</script>
</html>