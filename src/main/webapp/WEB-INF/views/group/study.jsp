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
			<a href="/group/board/${group_name}"> ${group_name} 게시판 </a>
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

		$.getJSON(`/group/getMemberlistByGroup/\${group}`, (list) => {
			let joinCheck = list.memberList.find( user => user.user_id === loginUser)
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

	
		let popup
 		$('button.getChat').click((e) => {
			console.log("채팅팅팅")
			popup = window.open(`/chat_pop/\${group}`, "chatPop", "width=450, height=350, top=150, left=200")
 			console.log(popup)
 			
 			popup.onbeforeunload = (e) => {
				
 			};  


 		})
 		
 		
 		
 
		
	</script>
</html>