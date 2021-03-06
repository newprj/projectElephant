<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html>
	<link href="/resources/static/fullcalendar/main.css" rel="stylesheet" />

	<script src="/resources/static/fullcalendar/main.js"></script>
	<script src="/resources/static/fullcalendar/moment.js"></script>
	<script src="https://unpkg.com/@popperjs/core@2"></script>
	<!-- tippy 사용 위찬 연결-->
	<script src="https://unpkg.com/tippy.js@6"></script>
	<!-- tippy 사용 위찬 연결-->

	<script src="//code.jquery.com/jquery-3.6.0.js"></script>
	<script
	src="https://kit.fontawesome.com/eab4c34ae3.js"
	crossorigin="anonymous"
></script>

<link href="/resources/css/style.css" rel="stylesheet" />
<link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
<script src="/resources/js/bootstrap.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


	<style>
		body {
			background-color: #f6f9fc;
			font-family: "Noto Sans KR", sans-serif, -apple-system, BlinkMacSystemFont,
				"Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, "Open Sans",
				"Helvetica Neue", sans-serif;
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
		.modal {
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
		.modal_content {
			position: absolute;
			display: felx;
			justify-content: cneter;
			align-items: center;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			background-color: white;
			border-radius: 10px;
		}

		button[type="reset"] {
			display: none;
		}
		.btn-group{
			display: flex;

		}
		.panel-body .form-horizontal .form-group {
			margin-bottom: 15px;
		}
		.panel-body .row, .panel-body .form-horizontal .form-group {
			margin-right: -15px;
				margin-left: -15px;
		}

	</style>
	<head>
		<meta charset="UTF-8" />
		<title>Insert title here</title>
	</head>
	<body>
		<body>
			<div class="wrapper">
				<div class="head">
					<div class="media-left">
						<img
							src="/resources/img/elephantIcon.png"
							style="height: 50px; width: 50px; border-radius: 50%; cursor: pointer;"
							onclick="location.href='/group/${group.group_name}'"
						/>
						<h1 class="logo" style="display: inline-block;">  </h1>
					</div>
	
					<div class="right">
				
						
					</div>
					<!-- right -->
				</div>
				<!-- head -->
				
			
				<div class="container" style="margin-bottom: 30px;">
					<!-- 캘린더 div  -->
					<div id="reload">
						<div id="calendar"></div>
					</div>
				</div>
		

				</div>
				<!-- wrapper  -->
	
				<div class="modal">
					<div class="modal_content">
			<div class="panel panel-bordered panel-warning" style="margin-bottom: 0px;">
				<div class="panel-heading ui-sortable-handle" style="background-color: #f0ad4e;">
						<div class="panel-control">
								<button class="btn btn-warning" 
									onclick="$('.modal').hide()"
									data-dismiss="panel" ><i class="fa fa-times"></i></button>
						</div>
				
				</div>
				<div class="panel-body">
					<form class="form-horizontal">
						<div class="panel-body">
							<input name="cid" type="hidden">
							<input type="hidden" name="user_" value="${user}"/>
								<div class="form-group">
										<label class="col-sm-3 control-label" for="title">title</label>
										<div class="col-sm-9">
												<input type="text"  id="title" class="form-control" name="title">
										</div>
								</div>
								<div class="form-group">
										<label class="col-sm-3 control-label" for="group">그룹</label>
										<div class="col-sm-9">
												<input type="text"  id="group" class="form-control" name="group_" value="${group.group_name}" readonly>
										</div>
								</div>
								<div class="form-group" style="margin-top: 3px;">
									<label class="col-sm-3 control-label" for="color"> 일정 종류 </label>
									<div class="col-sm-9">
									<select name="color" class="col-sm-9">
										<option value="">선택</option>
										<option value="#D25565" style="color: #d25565"> 회의 </option>
										<option value="#9775fa" style="color: #9775fa"> 모임  </option>
										<option value="#ffa94d" style="color: #ffa94d"> 정기일정 </option>
										<option value="#74c0fc" style="color: #74c0fc"> 이벤트 </option>
										<option value="#f06595" style="color: #f06595"> 연습 </option>
										<option value="#63e6be" style="color: #63e6be"> 컨퍼런스 </option>
										<option value="#a9e34b" style="color: #a9e34b"> 외부모임 </option>
										<option value="#4d638c" style="color: #4d638c"> 외부일정 </option>
									</select>
									</div>
								</div>
								<div class="form-group">
										<label class="col-sm-3 control-label" for="demo-hor-startDate">시작 일자 </label>
										<div class="col-sm-9">
												<input type="date" name="startDate" id="demo-hor-startDate" class="form-control">
										</div>
								</div>
								<div class="form-group">
										<label class="col-sm-3 control-label" for="demo-hor-endDate">종료 일자 </label>
										<div class="col-sm-9">
												<input type="date" name="endDate" id="demo-hor-endDate" class="form-control">
										</div>
								</div>
								<div class="form-group">
										<label class="col-sm-3 control-label" for="demo-hor-description_">상세설명 </label>
										<div class="col-sm-9">
												<input type="text" name="description_" id="demo-hor-description_" class="form-control">
										</div>
								</div>
								<div class="form-group">
										<label class="col-sm-3 control-label" for="demo-hor-location">장소 </label>
										<div class="col-sm-9">
												<input type="text" name="location" id="demo-hor-location" class="form-control">
										</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label" for="demo-hor-location"> 멤버 </label>
										<div class="col-sm-offset-3 col-sm-9">
											<c:forEach items="${member}" var="member">
												<label class="form-checkbox form-normal form-primary">
												<input type="checkbox" name="member" value="${member.user_id}"> ${member.user_id}
												</label>
												</c:forEach>
										</div>
								</div>
						</div>
						<div class="text-right" >

							<button  class="btn btn-info" type="submit">전송</button>
							<button  class="btn btn-info" type="reset">리셋</button>
							<button class="modify btn btn-info">수정</button>
							<button class="delete btn btn-info">삭제</button>
					</div>
				</form>
				</div>
		</div>
		</div>
		</div>


		<script>
			document.addEventListener("DOMContentLoaded", function () {
				const modal = $(".modal");
				const Calendar = FullCalendar.Calendar;
				const group = "${group.group_name}";
				const loginUser = "${user}";

				$.getJSON("/group/getMemberlistByGroup/" + group, (list) => {
					console.log(list);
					console.log(loginUser);
					let joinCheck = list.memberList.find(
						(user) => user.user_id === loginUser
					);
					if (!joinCheck) {
						alert("그룹 회원만 접근 가능한 페이지입니다");
						location.href = "/group/";
					}
				});
			
					$('input[name="member"]').each((i, c) =>{
						$(c).click((e) =>{
							$(e.target).prop('checked') ? $(e.target).closest('label').addClass('active')
																	: $(e.target).closest('label').removeClass('active')
						})
					})



				$("span.goGroup").click((e) => {
					location.href = `/group/${group.group_name}`;
				});

				// 이벤트 렌더 위해 가지고 옴 => 이거 클로저 가능할것같은데
				
				const getEvent = (data) => {
					let result;
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
					if (result !== null && result.length > 0) return calToEvent(result);
				};

				const calToEvent = (events) =>
					events.map((event) => ({
						...event,
						id: event.cid,
						start: event.startDate,
						end: event.endDate,
						editable: true,
					}));

				let event = getEvent(group);

				// 이벤트 폼데이터 => 객체 반환을 위한 함수
				const getFormData = () => {
					let members = [];
					$('input[name="member"]:checked').map((idx, member) =>
						members.push(member.value)
					);

					return {
						cid: $('input[name="cid"]').val(),
						color: $('select[name="color"]').val(),
						title: $('input[name="title"]').val(),
						startDate: $('input[name="startDate"]').val(),
						endDate: $('input[name="endDate"]').val(),
						description_: $('input[name="description_"]').val(),
						location: $('input[name="location"]').val(),
						group_: $('input[name="group_"]').val(),
						user_: $('input[name="user_"]').val(),
						member_: members.join(","),
					};
				};

				// 이벤트 클릭 했을 때 폼에 데이터 등록위한 함수
				const setData = (eventData) => {
					$('select[name="color"]').val(eventData.color);
					$('input[name="title"]').val(eventData.title);
					$('input[name="cid"]').val(eventData.cid);
					$('input[name="startDate"]').val(eventData.startDate);
					$('input[name="endDate"]').val(eventData.endDate);
					$('input[name="description_"]').val(eventData.description_);
					$('input[name="location"]').val(eventData.location);
					$('input[name="group_"]').val(eventData.group_);
					$('input[name="user_"]').val(eventData.user_);
					if (eventData.member_){
						eventData.member_
							.split(",")
							.map((member) =>{
								$('input[name="member"][value=' + member + "]").prop(
									"checked",
									true
								)
								$('input[name="member"][value=' + member + "]").closest('label')
								.addClass('active')
							})
						}
					}
							

					
				
			

				//이벤트 클릭 핸들러
				const eventClickHandler = (e) => {
					modal.show();
					$("button.modify").show();
					$("button.delete").show();
					$('button[type="submit"]').hide();

					let cid = e.event._def.extendedProps.cid;
					event = getEvent(group);
					let eventData = event.find((i) => i.cid === cid);
					setData(eventData);
				};

				//날짜 클릭 핸들러 => 모달 띄움

				const dateClickHandler = (e) => {
					console.log(e.dateStr);
					$('input[name="startDate"]').val(e.dateStr);
					$("button.modify").hide();
					$("button.delete").hide();
					$('button[type="submit"]').show();
					$('input[name="member"][value=${user}]').prop("checked", true);
					modal.show();
				};

				// 이벤트 호버했을 때 설명 띄움
				const eventHoverHandeler = (info) => {
					console.log(info);
					let desc = info.event._def.extendedProps.description_;
					let title = info.event._def.title;
					let member = info.event._def.extendedProps.member_;

					let str =
						'<div class="tippy"><div><span>' + desc + "</span> </div><div>";
					if (member)
						member
							.split(",")
							.map((mem) => (str += '<span class="mem">' + mem + "</span>"));
					str += "</div></div>";
					tippy(info.el, {
						content: str,
						allowHTML: true,
					});
				};

				// 빈 함수 쓸려나? // 처음 이벤트가 렌더될때 호출됨
				const eventMountHandler = () => {};

				// 이벤트 드래그 , 리사이즈 했을때 날짜 수정
				
				const evnetDropAndResizeHandler = (e) => {
					let cid = e.event._def.extendedProps.cid;
					let newDates = {
						startDate: e.event.startStr,
						endDate: e.event.endStr,
					};
					$.ajax({
						type: "put",
						url: "/group/test/" + cid,
						data: JSON.stringify(newDates),
						contentType: "application/json; charset=utf-8",
						success: () => {
							modal.hide();
						},
						error: (xhr, status, er) => {
							console.log(xhr);
						},
					}); //ajax
				};

				// 모달창 x버튼
				$("form span").click(() => {
					modal.hide();
					$('button[type="reset"]').trigger("click");
				});

				// 이벤트 전송함수
				const eventSubmit = (data) => {
					let resCid;
					$.ajax({
						type: "post",
						url: "/group/test/",
						data: JSON.stringify(data),
						async: false,
						contentType: "application/json; charset=utf-8",
						success: (res) => {
							modal.hide();
							resCid = res;
						},
						error: (xhr, staturs, er) => {
							console.log(xhr);
						},
					}); //ajax
					return resCid;
				};

				//이벤트 삭제 함수
				const eventDelete = (cid) => {
					$.ajax({
						type: "delete",
						url: "/group/test/" + cid,
						success: () => {
							console.log(" delete ");
						},
						error: (xhr, status, er) => {
							console.log(status);
						},
					}); //ajax
				};

				// 이벤트 수정 핸들러
				$("button.modify").click(function (e) {
					e.preventDefault();
					let eventForm = getFormData();
					let cid = eventForm.cid;
					// 삭제
					eventDelete(cid);
					let ev = calendar.getEventById(cid);
					ev.remove();
					// 다시 전송
					cid = eventSubmit(eventForm);
					calendar.addEventSource(calToEvent([{ ...eventForm, cid }]));
					$('button[type="reset"]').trigger("click");
				});

				// 이벤트 삭제 핸들러
				$("button.delete").click(function (e) {
					e.preventDefault();
					modal.hide();

					let cid = getFormData().cid;

					eventDelete(cid);
					let ev = calendar.getEventById(cid);

					ev.remove();
					$('button[type="reset"]').trigger("click");
				}); //delete click

				//이벤트 전송 핸들러
				$('button[type="submit"]').click(function (e) {
					e.preventDefault();
					let eventForm = getFormData();
					delete eventForm.member_;
					delete eventForm.cid;
					delete eventForm.endDate;
					if (Object.values(eventForm).filter((val) => val == "").length > 0) {
						alert(" 모두 입력 해주세요 ");
					} else {
						let eventForm = getFormData();
						console.log(eventForm)
						let cid = eventSubmit(eventForm);
						let newEvent = calToEvent([{ ...eventForm, cid }]);
						calendar.addEventSource(newEvent);
						$('button[type="reset"]').trigger("click");
					}
				}); //submit click

				// 캘린더 렌더
				var calendarEl = document.getElementById("calendar");
				var calendar = new FullCalendar.Calendar(calendarEl, {
					headerToolbar: {
						left: "prev,today,next",
						center: "title",
						right: "dayGridMonth,listMonth",
					},
					events: event,
					navLinks: true, 
					eventStartEditable: true,
					selectable: true,
					dayMaxEvents: true,
					progressiveEventRendering: true,
					dateClick: dateClickHandler,
					eventDidMount: eventMountHandler,
					eventResize: evnetDropAndResizeHandler,
					eventClick: eventClickHandler,
					eventMouseEnter: eventHoverHandeler,
					eventDrop: evnetDropAndResizeHandler,
				}); //calender
				calendar.render();
		
		
			});
		</script>
	</body>
</html>
