<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<link href="/resources/static/fullcalendar/main.css" rel="stylesheet" />


	<script src="/resources/static/fullcalendar/main.js"></script>
	<script src="/resources/static/fullcalendar/moment.js"></script>
<script src="https://unpkg.com/@popperjs/core@2"></script><!-- tippy 사용 위찬 연결-->
<script src="https://unpkg.com/tippy.js@6"></script><!-- tippy 사용 위찬 연결-->

	
	<script src="//code.jquery.com/jquery-3.6.0.js"></script>
	<style>
		.modal{
				background: rgba(0,0,0,0.8); 
				display: none;
				position: fixed;
				width: 100%;
				height:100%;
				left :0;
				right : 0;
				right: 0;
				bottom: 0;
				z-index: 1;
				
			}
			.modal_content{
				position: absolute;
				display : felx;
				justify-content:cneter;
				align-items : center;
				
				top: 50%;
				left: 50%;
				transform: translate(-50%, -50%);
				background-color : white;
			}
			.modal_content *{
				padding : 2px;
			}
			button[type=reset]{
				display : none;			
			}


			
	</style>
	<head>
		<meta charset="UTF-8" />
		<title>Insert title here</title>
	</head>
	<body>
	<h1> 일정 캘린더 </h1>
	<div> <!-- 캘린더 div  -->
		<div id="reload">
			<div id="calendar"></div>
		</div>
	</div>
	
	
	<div class="modal">
		<div class="modal_content">
		
			<form action="/group/test/" method="post">
				<div><span>X</span></div>
				<div>
					<label for=""> cid </label>
					<input type="text" name="cid" />
				</div>
				<div>
					<label for=""> 색</label>
					<select name="color">
						<option value=''>선택</option>
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
					<label> 종료일자 </label>
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
					<input type="text" name="group_" value="${group.group_name}" readonly/>
				</div>
				<div>
				<label> 멤버 </label>
				<input type="text" name="user_" value="${user}"/>
				</div>
				<div>
					<c:forEach items="${member}" var="member">
						<label><input type="checkbox" name="member" value="${member.user_id}"/>
						${member.user_id}</label>
					</c:forEach>
				</div>
			<div>
				<button type="submit">전송</button>
				<button type="reset">리셋</button>
				<button class="modify">수정</button>
				<button class="delete">삭제</button>
			</div>
			</form>
		</div>
		</div>
		<button class="ddd"> ㅇㅇ </button>
		<script>
			document.addEventListener("DOMContentLoaded", function () {
				
				const modal = $('.modal')
				const Calendar = FullCalendar.Calendar
				const group = "${group.group_name}";
				const loginUser ="${user}"
				
				$.getJSON(
					"/group/getMemberlistByGroup/"+group, (list) =>{
						console.log(list)
						console.log(loginUser)
						let joinCheck = list.memberList.find( user => user.user_id === loginUser)
						if(!joinCheck){
							alert("그룹 회원만 접근 가능한 페이지입니다")
							location.href="/group/"
						}
					})
				
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
					if (result !==null && result.length>0) 
						return calToEvent(result);
				};

				const calToEvent = (events) =>
					events.map((event) => ({
						...event,
						id : event.cid,
						start: event.startDate,
						end: event.endDate,
						editable: true,
					}));
			
				let event = getEvent(group);
				
				// 이벤트 폼데이터 => 객체 반환을 위한 함수
				const getFormData = () => {
					let members =[]
					$('input[name="member"]:checked').map((idx, member) =>
						members.push(member.value)
					)

					return{
						cid: $('input[name="cid"]').val(),
						color: $('select[name="color"]').val(),
						title: $('input[name="title"]').val(),
						startDate: $('input[name="startDate"]').val(),
						endDate: $('input[name="endDate"]').val(),
						description_: $('input[name="description_"]').val(),
						location: $('input[name="location"]').val(),
						group_: $('input[name="group_"]').val(),
						user_: $('input[name="user_"]').val(),		
						member_: members.join(",")
					}	
				};
				
				// 이벤트 클릭 했을 때 폼에 데이터 등록위한 함수
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
					if(eventData.member_) eventData.member_.split(",").map(member => 
						$('input[name="member"][value='+member+']').prop("checked",true))
				}
				
				//이벤트 클릭 핸들러 
				const eventClickHandler = (e) => {
					modal.show()
					$('button.modify').show()
					$('button.delete').show()
					$('button[type="submit"]').hide()
					
					let cid = e.event._def.extendedProps.cid
					event = getEvent(group);
					let eventData = event.find(i=> i.cid === cid)
					setData(eventData)

				}
				
				//날짜 클릭 핸들러 => 모달 띄움
				const dateClickHandler = (e) => {
					console.log(e.dateStr)
					$('input[name="startDate"]').val(e.dateStr)
					$('button.modify').hide()
					$('button.delete').hide()
					$('button[type="submit"]').show()
					$('input[name="member"][value=${user}]').prop("checked",true)
					modal.show()
				}
				
				// 이벤트 호버했을 때 설명 띄움
				const eventHoverHandeler = (info) => {
					console.log(info)
					let desc = info.event._def.extendedProps.description_
					let title = info.event._def.title
					let member = info.event._def.extendedProps.member_
				
					let str = '<div class="tippy"><div><span>'+ desc+ '</span> </div><div>'
					if(member) member.split(",").map( (mem) => str += '<span class="mem">'+mem+'</span>')
					str += '</div></div>'
					tippy(info.el, {
			      content: str,
			      allowHTML: true,
			                
			       })
			    
				}

				
				
				// 빈 함수 쓸려나? // 처음 이벤트가 렌더될때 호출됨 
				const eventMountHandler =() => {
					
				}
				
				// 이벤트 드래그 , 리사이즈 했을때 날짜 수정
				const evnetDropAndResizeHandler = (e) =>{
					
					let cid = e.event._def.extendedProps.cid
					let newDates= {
					    startDate: e.event.startStr,
					    endDate: e.event.endStr
						  }
					$.ajax({
						type:'put',
						url:'/group/test/'+cid,
						data :JSON.stringify(newDates),
						contentType: 'application/json; charset=utf-8',
						success : () => {
							modal.hide()
						},
						error:  (xhr, status, er) => {
				              console.log(xhr)
			            }
					})//ajax 
				}	
				
				// 모달창 x버튼
				$('form span').click(() =>{
					modal.hide()
					$('button[type="reset"]').trigger("click")
				})
				
				
				// 이벤트 전송함수
				const eventSubmit = (data) => {
					let resCid
					$.ajax({
						type: "post",
						url: "/group/test/",
						data: JSON.stringify(data),
						async: false,
						contentType: "application/json; charset=utf-8",
						success: (res) => {
							modal.hide();
							resCid = res
						},
						error: (xhr, staturs, er) => {
							console.log(xhr);
						},
					}); //ajax	
					return resCid
				}
				
				//이벤트 삭제 함수
				const eventDelete = (cid) => {
			        $.ajax({
			          type: 'delete',
			          url: '/group/test/'+cid,
			          success: () => {
			        	 console.log( " delete ")
			        	
			          },
			          error: (xhr, status, er) => {
			            console.log(status)
			          },
			        }) //ajax
				}
				
				// 이벤트 수정 핸들러
				$('button.modify').click(function(e){
					e.preventDefault()
					let eventForm = getFormData();
					let cid = eventForm.cid
					// 삭제
					eventDelete(cid)
					let ev = calendar.getEventById(cid)
		        	ev.remove()
		        	// 다시 전송
					cid = eventSubmit(eventForm);
					calendar.addEventSource(calToEvent([{...eventForm, cid}]))
					$('button[type="reset"]').trigger("click")
					
				})
				
				// 이벤트 삭제 핸들러
				$('button.delete').click(function(e){
					e.preventDefault()
					modal.hide()
					
					let cid = getFormData().cid
					
					eventDelete(cid);
					let ev = calendar.getEventById(cid)

		        	ev.remove()
		        	$('button[type="reset"]').trigger("click")
				})//delete click
				
				//이벤트 전송 핸들러
				$('button[type="submit"]').click(function (e) {
					
					e.preventDefault();
					let eventForm = getFormData();
					delete eventForm.member_
					delete eventForm.cid
					delete eventForm.endDate
					if( Object.values(eventForm).filter(val => val=='').length > 0) {
						alert(" 모두 입력 해주세요 ")
					}else{
						let eventForm = getFormData();
						
						let cid = eventSubmit(eventForm);
						let newEvent = calToEvent([{...eventForm, cid}])
						calendar.addEventSource(newEvent) 
						$('button[type="reset"]').trigger("click")
					}
				});//submit click
				
				// 캘린더 렌더
				var calendarEl = document.getElementById("calendar");
				var calendar = new FullCalendar.Calendar(calendarEl, {
					headerToolbar: {
						left: "prev,today,next",
						center: "title",
						right: "dayGridMonth,listMonth",
					},
					events:event,
					navLinks: true, // 세부 일정 보기 
					eventStartEditable : true ,
					selectable: true,
					dayMaxEvents: true,
					progressiveEventRendering : true,
					dateClick :dateClickHandler,
					eventDidMount: eventMountHandler,
					eventResize : evnetDropAndResizeHandler,
					eventClick: eventClickHandler,
					eventMouseEnter: eventHoverHandeler,
					eventDrop:evnetDropAndResizeHandler
				}); //calender
				calendar.render();
			}); //event
		</script>
	</body>
</html>


