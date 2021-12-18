<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
</head>
<body>
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
		${user.user_id}
	</body>


	<script>

	let socket = new SockJS("http://localhost:8080/chat/${group_name}");
	console.log(socket);
	
	const loginUser = "${user.user_id}"
	const group = "${group_name}"
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

	
	$('button.getChat').click((e) => {
		console.log("채팅팅팅")
		window.open("/chat_pop", "mypopup", "width=450, height=350, top=150, left=200")
		
	})
	
	
/* 	window.onbeforeunload = function () {
		websocket.onclose = function () {}; // disable onclose handler first
		socketClose(e);
	}; */


	socket.onmessage = onMessage;
	socket.onclose = onClose;
	socket.onopen = onOpen;

	
	
	</script>
</body>
</html>