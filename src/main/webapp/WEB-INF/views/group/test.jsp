<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<div id="reload">
			<div id="calendar"></div>
		</div>
		<div>
			<form action="/group/test/" method="post">
				<div>
					<label for=""> cid </label>
					<input type="text" name="cid" />
				</div>
				<div>
					<label for=""> 색</label>
					<select name="color">
						<option>선택</option>
						<option value="#D25565" style="color: #d25565">빨간색</option>
						<option value="#9775fa" style="color: #9775fa">보라색</option>
						<option value="#ffa94d" style="color: #ffa94d">주황색</option>
						<option value="#74c0fc" style="color: #74c0fc">파란색</option>
						<option value="#f06595" style="color: #f06595">핑크색</option>
						<option value="#63e6be" style="color: #63e6be">연두색</option>
						<option value="#a9e34b" style="color: #a9e34b">초록색</option>
						<option value="#4d638c" style="color: #4d638c">남색</option>
						<option value="#495057" style="color: #495057">검정색</option>
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
				<div>
					<c:forEach items="${member}" var="member">
						<label><input type="checkbox" value="${member.user_id}"> ${member.user_id}</label>
					</c:forEach>
				</div>
				<button type="submit">전송</button>
				<button type="reset">리셋</button>
				<button class="modify">수정</button>
				<button class="delete">삭제</button>
			</form>
		</div>
		<script>
			document.addEventListener("DOMContentLoaded", function () {
				const Calendar = FullCalendar.Calendar
				const group = "${group}";
				console.log(group)
				console.log('${member}')

				const getEvent = (data) => {
					var result;
					$.ajax({
						type: "get",
						url: "/group/event/" + data,
						async: false,
						dataType: "json",
						success: (res) => {
							result = res;
						},
						error: (xhr, stauts, er) => console.log(xhr),
					});
					if (result !==null && result.length>0) 
						return calToEvent(result);
				};

				const calToEvent = (events) =>
					events.map((event) => ({
						...event,
						start: event.startDate,
						end: event.endDate,
					}));
			
				const event = getEvent(group);

				const fn = (e) => console.log(e.dateStr);
				const getFormData = () => ({
					cid: $('input[name="cid"]').val(),
					color: $('select[name="color"]').val(),
					title: $('input[name="title"]').val(),
					startDate: $('input[name="startDate"]').val(),
					endDate: $('input[name="endDate"]').val(),
					description_: $('input[name="description_"]').val(),
					location: $('input[name="location"]').val(),
					group_: $('input[name="group_"]').val(),
					user_: $('input[name="user_"]').val(),
				});
				
				const setData = (eventData) => {
					
					$('select[name="color"]').val(eventData.color)
					$('input[name="title"]').val(eventData.title)
					$('input[name="cid"]').val(eventData.cid)
					$('input[name="startDate"]').val(eventData.startDate)
					$('input[name="endDate"]').val(eventData.endDate)
					$('input[name="description_"]').val(eventData.description_)
					$('input[name="location"]').val(eventData.location)
					$('input[name="group_"]').val(eventData.group_)
					$('input[name="user_"]').val(eventData.user_)

				}
				
				
				const evnetClickHandler = (e) => {
					let cid = e.event._def.extendedProps.cid
					eventData = event.find(i=> i.cid === cid)
					console.log(eventData)
					setData(eventData)
					
					
				}
				
				
				
				$('button[type="submit"]').click(function (e) {
					e.preventDefault();
					let eventForm = getFormData();
					$.ajax({
						type: "post",
						url: "/group/test/",
						data: JSON.stringify(eventForm),
						contentType: "application/json; charset=utf-8",
						success: () => {
							$('button[type="reset"]').trigger("click")


						},
						error: (xhr, staturs, er) => {
							console.log(xhr);
						},
					}); //ajax
				});//submit click

				$('button.modify').click(function(e){
					e.preventDefault()
					let eventForm = getFormData()
					console.log(eventForm.cid)
					$.ajax({
						type:'put',
						url:'/group/test/'+eventForm.cid,
						data :JSON.stringify(eventForm),
						contentType: 'application/json; charset=utf-8',
						success : () => console.log( " yeah~~ "),
						error:  (xhr, status, er) => {
				              console.log(xhr)
			            }
					})//ajax
				})//button modify click
				
				$('button.delete').click(function(e){
					e.preventDefault()
					let cid = getFormData().cid
			        $.ajax({
			          type: 'delete',
			          url: '/group/test/'+cid,
			          success: () => {
			            console.log('gigi')
			          },
			          error: (xhr, status, er) => {
			            console.log(status)
			            
			          },
			        }) //ajax
					
				})//delete click

	
				
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
					events:event,
					eventClick: evnetClickHandler
				}); //calender
				calendar.render();
			}); //event
		</script>
	</body>
</html>
