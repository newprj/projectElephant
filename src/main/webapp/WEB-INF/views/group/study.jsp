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
		<style>
		body{
      background-color: #f6f9fc;
      font-family: 'Noto Sans KR', sans-serif, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif; 
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 50px 0;
    }
    div.wrapper{ 
  		width : 85%;
  		height :90%;
      background-color: white;
      box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11), 0 1px 3px rgba(0,0,0,0.08); 
		  overflow-x:hidden; 
		  overflow-y:auto; 
		  display: flex;
      flex-direction: row;
      align-items: center;
    }
    div.left{
    	flex : 1;
    	height : 100%;
    	width : 30%;
			background-size: cover;
    }
    div.center{
    	flex: 3;
    }
    div.right{
    	flex : 1;
    }
    
    </style>
	</head>
	<body>
	<div class="wrapper">
		<div style="background-image: url(${group.profile})" class="left">
		 	뭐 아무것도 안나오니? ${group.profile}
		</div>
		<div class="center">
			<div class="title">
				<h3> ${group_name} </h3>
			</div>
			<div class="member">
		
			</div>
	
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
		
			<div>
				<div>
					<button class="getChat"> 채팅 입장</button>
				</div>
			</div>
	</div>
	<div class="right">
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
			list.memberList.map((member) => {
				let memElement =$(`<div>\${member.user_id}</div>`)
				$('div.member').append(memElement)
			})
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

			popup = window.open(`/chat_pop/\${group}`, "chatPop", "width=1040, height=600, top=150, left=200")
 			console.log(popup)


 		})
 		
 		
 		
 
		
	</script>
</html>