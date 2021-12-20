<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
		<script src="//code.jquery.com/jquery-3.6.0.js"></script>
		<script src="https://kit.fontawesome.com/eab4c34ae3.js" crossorigin="anonymous"></script>
		<meta charset="UTF-8" />
		<style>
			.container {
				display: flex;
				flex-wrap: wrap;
				justify-content: center;
			}
			.box {
				flex: 0 0 auto;
				border: 1px solid grey;
				border-radius: 10px;
				width: 200px;
				height: 200px;
				padding: 10px;
				margin: 10px;
				display: flex;
				flex-direction: column;
				align-items: center;
				justify-content: center;
			}
			.box > span {
				display: block;
			}
			.navcontainer {
				height: 60px;
			}
			.wrapper {
				display: flex;
			}
			.left,
			.right,
			.center {
				flex: 1;
			}
			.center {
				text-align: center;
			}
			.right {
				display: flex;
				justify-content: flex-end;
				margin: 10px;
				align-items: center;
				cursor: pointer;
				text-align: center;
			}
			.item {
				margin-left: 25px;
			}
		</style>
		<title>Insert title here</title>
	</head>
	<body>
		<div>
			<div class="navcontainer">
				<div class="wrapper">
					<div class="left"></div>
					<div class="center">
						<h1 class="logo">코끼리</h1>
					</div>
					<div class="right">
						<c:if test="${user==null}">
							<div class="item"><a href="/user/register"> 가입</a></div>
							<div class="item"><a href="/user/login">로그인</a></div>
						</c:if>
						<c:if test="${user!=null}">
							<div class="mygroup">
								<c:choose>
									<c:when test="${empty myGroup}"
										>
										<span> 가입한 그룹이 없습니다 </span>
									</c:when>

									<c:otherwise>
										<select name="group_name">
											<c:forEach items="${myGroup}" var="mine">
												<option value="${mine.group_name}">
													${mine.group_name}
												</option>
											</c:forEach>
										</select>
										<button>go</button>
									</c:otherwise>
								</c:choose>
							</div>
							<button
								class="btn btn-primary"
								type="button"
								onclick="location.href='/user/logout' "
							>
								로그아웃
							</button>
							<button
								class="btn btn-info"
								type="button"
								onclick="location.href='/user/modify' "
							>
								회원정보 수정
							</button>
							<button
								class="btn btn-danger"
								type="button"
								onclick="location.href='/user/delete' "
							>
								회원탈퇴
							</button>
						</c:if>
					</div>
				</div>
			</div>
		</div>

		<h1>메인 페이지</h1>
		<a href="/group/make">
			<c:if test="${user!=null}">
				<button>create</button>
			</c:if>
		</a>
		<button class="latest"> 최신 </button>
		<button class="pop"> 인기 </button>
		<br/>
		
		<span> 모집 중인 그룹 </span> 
		<div class="container recruit">
			<c:forEach items="${group}" var="group">
				
				<div class="box">
					<span class="group_name"> ${group.group_name} </span>
					<span> ${group.leader}</span>
					<span> ${group.subject }</span>
					<span> <i class="fas fa-eye"></i> ${group.viewCnt} </span>
					<span> 🙋‍♀  ${group.applicantCnt} <i class="far fa-hand-peace"> ${group.joinedCnt}</i>/ ${group.member_number}</span>
				</div>
			</c:forEach>

		</div>
		<a href ="/group/main/list">
		<span>....모집중인 그룹 모두 보기 </span>
		</a>
	
	<p> 모집이 완료된 그룹 </p>
		<div class="container complete">
			<c:forEach items="${completed}" var="group">
				
				<div class="box">
					<span class="group_name"> ${group.group_name} </span>
					<span> ${group.leader}</span>
					<span> ${group.subject }</span>
					<span> ${group.member_number}</span>
					<span> <i class="fas fa-eye"></i> ${group.viewCnt} </span>
					<span> 🙋‍♀  ${group.applicantCnt}  <i class="far fa-hand-peace"> ${group.joinedCnt}</i></span>
				</div>
			</c:forEach>

		</div>
	</body>

	<script>
		$(document).ready(function (e) {
			$(".group_name").click(function (e) {
				const group_name = e.target.innerText;
				location.href = "/group/gather/" + group_name;
			});

			$("div.mygroup button").click(function (e) {
				e.preventDefault();
				let group_name = $('select[name="group_name"]').val();
				location.href = `/group/\${group_name}`;
			});
			
			$("button.latest").click((e) => {
				location.reload();
			})
			
			//인기순 정렬   
			$('button.pop').click((e) => {
				console.log("눌림")
				$.getJSON("/group/main/getGroupAll", (list) =>{
						$('div.recruit').children().remove()
						console.log(list)
						list.sort((b, a) => a.applicantCnt - b.applicantCnt).slice(0,20)
							.map( group => {
								const groupEle = $(`<div class="box">
										<span class="group_name"> \${group.group_name} </span>
										<span> \${group.leader}</span>
										<span> \${group.subject }</span>
										<span> <i class="fas fa-eye"></i> \${group.viewCnt} </span>
										<span> 🙋‍♀ \${group.applicantCnt} <i class="far fa-hand-peace"> \${group.joinedCnt}</i>/ \${group.member_number}</span>
									</div>`)
									$('div.recruit').append(groupEle)
							})
				})//getJSON
			})// button.pop.click
		});
	</script>
</html>