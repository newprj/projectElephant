<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<link href="/resources/static/fullcalendar/main.css" rel="stylesheet" />
		<!--  <script src="//code.jquery.com/jquery-3.6.0.js"></script> -->
		<script src="/resources/static/fullcalendar/main.js"></script>
		

		<meta charset="UTF-8" />
		<title>Insert title here</title>

		<script>
			
			const event = [
				{
					title : 'test',
					start : '2021-12-02',
					groupId : 'test1'
					content : "테스트 컨텐츠 "
			
				}
			]
			document.addEventListener("DOMContentLoaded", function () {
				var calendarEl = document.getElementById("calendar");
				var calendar = new FullCalendar.Calendar(calendarEl, {
					
					headerToolbar: {
            			left: 'prev,today,next',
						center: "title",
            			right: 'dayGridMonth,timeGridWeek,listMonth'
					},
					dateClick: fn,
					navLinks: true,
					editable: true,
					dayMaxEvents: true,
					events : event,
				}); //calender
				calendar.render();
			}); //event

			const fn = (e) => console.log(e.dateStr);
		</script>
	</head>
	<body>
		<div id="calendar"></div>
	</body>
</html>
