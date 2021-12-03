<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<link href="/resources/static/fullcalendar/main.css" rel="stylesheet" />

	<script src="/resources/static/fullcalendar/main.js"></script>
	<script src="//code.jquery.com/jquery-3.6.0.js"></script>
	<head>
		<meta charset="UTF-8" />
		<title>Insert title here</title>
		
	</head>
	<body>


		<div id="calendar"></div>
		<div>
			<form action="/group/test/" method="post">
				<div>
					<label for=""> 색</label>
					<select name="color">
						<option>선택</option>
						<option value="red">급한 일정</option>
						<option value="blue">일정</option>
						<option value="green">약속</option>
					</select>
				</div>
				<div>
					<label> title </label>
					<input type="text" name="title" />
				</div>
				<div>
					<label> 시작일자 </label>
					<input type="date" name="startDate" />
				</div>
				<div>
					<labe> 종료일자 </labe>
					<input type="date" name="endDate" />
				</div>
				<div>
					<label> 상세설명 </label>
					<input type="text" name="description_" />
				</div>
				<div>
					<label> 지역 </label>
					<input type="text" name="location" />
				</div>
				<div>
					<label> group </label>
					<input type="text" name="group_" value="${group}" />
				</div>
				<label> 유저 </label>
				<input type="text" name="user_" />
				<button>전송</button>
			</form>
		</div>
		<script>
			
			document.addEventListener("DOMContentLoaded", function () {
				const group = "${group}";

				const getEvent = (data) => {
					let result
					$.ajax({
						type: "get",
						url: `/group/event/${data}`,
						async : false,
				        dataType:'json',
						success: res => result = res,
						error: (xhr, stauts, er) => console.log(xhr),
					});
					return result
				}

				const calToEvent = ( events )=>
					events.map( event => ({...event, start : event.startDate, end : event.endDate}))
				
				
				const events = getEvent(group)
				console.log(getEvent(group))
				
				
				var calendarEl = document.getElementById("calendar");
				var calendar = new FullCalendar.Calendar(calendarEl, {
					headerToolbar: {
						left: "prev,today,next",
						center: "title",
						right: "dayGridMonth,timeGridWeek,listMonth",
					},
					dateClick: fn,
					navLinks: true,
					editable: true,
					dayMaxEvents: true,
					//events: calToEvent(events),
				}); //calender
				calendar.render();
				
				
				
			}); //event

			const event = [
				{
					title: "test",
					start: "2021-12-02",
					groupId: "test1",
					content: "테스트 컨텐츠 ",
				}
			];

			const fn = (e) => console.log(e.dateStr);
			$('button').click(function(e){
				e.preventDefault()
				let form = $('form').serialize()
				console.log(form)
			
				e.preventDefault()
				$.ajax({
					type:'post',
					url : "/group/test/",
					data : JSON.stringify(form),
					contentType: 'application/json; charset=utf-8',
					success : () => console.log(" post done "),
					error:(xhr, staturs, er) =>{
						console.log(xhr)
					}
				})//ajax 
				})
			
	
		</script>
	</body>
</html>
