<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>Insert title here</title>
		<script src="//code.jquery.com/jquery-3.6.0.js"></script>
	</head>
	<body>
		<h1>스터디별 페이지</h1>
		${group_name}

		<div>
			<a href="/group/board/${group_name}"> 게시판 </a>
		</div>
		
		<p><a href="/group/"> 메인 </a></p>
		
		
		<div class="event"> 
			<h4> 최근일정</h4>
			<div>
				<h5> 오늘의 일정</h5>
				<ul class="today" style="list-style:none" >
				</ul>
				<h5> 다가오는 일정 </h5>
				<ul class="latest" style="list-style:none"></ul>
			</div>
			<a href="/group/test/${group_name}"> ... 일정 더보기 </a>
		</div>
	</body>

	<script>
		let loginUser = "${user}"
		
		if(! loginUser){
			console.log('로그인안됨')
			alert("로그인 해야 접근 가능합니다")
			location.href="/group/"
		}else{
			$.getJSON(
				"/group/getMemberlistByGroup/${group_name}", (list) =>{
					let joinCheck = list.find( user => user.user_id === loginUser)
					if(!joinCheck){
						alert("그룹 회원만 접근 가능한 페이지입니다")
						location.href="/group/"
					} 
				})
		}
		

		const today = new Date().toISOString().split("T")[0]
		
		console.log(today)
		$.getJSON("/group/getLatestEvent/${group_name}", (list) => {
			
			const todayEvent = list.filter(i => i.startDate === today)
			console.log(todayEvent)
			if(todayEvent.length==0 || todayEvent ==null){
				let noEvent = $('<li> 오늘의 일정이 없습니다 </li>')
				$('ul.today').append(noEvent)
			}
			
			todayEvent.map( event => {
				const { title, description_ } = event
				let todayLi = $(`<li> <strong> \${title} </strong> <span>\${description_} </span>  </li>`)
				$('ul.today').append(todayLi)
			})
			
			const latest_3event = list.filter(i => i.startDate !== today).sort( (a, b)=>{
				let aDate = new Date(a.startDate)
				let bDate = new Date(b.startDate)
				return aDate-bDate
			}).slice(0, 3)
			
			if(latest_3event.length==0 || latest_3event ==null){
				let noEvent = $('<li> 다가오는 일정이 없습니다 </li>')
				$('ul.latest').append(noEvent)
			}
			
			latest_3event.map( event => {
				const { title, description_} = event
				let eventLi = $(`<li> <strong> \${title} </strong> <span>\${description_} </span>  </li>`)
				$('ul.latest').append(eventLi)
			})
			
		})// getJSON
		
	
	
		
	</script>
</html>
