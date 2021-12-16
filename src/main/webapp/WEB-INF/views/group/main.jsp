<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<script src="//code.jquery.com/jquery-3.6.0.js"></script>
		<meta charset="UTF-8" />
		<style>
			.container {
				display: flex;
				flex-wrap: wrap;
				justify-content: center;
			}
			.box {
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
										>>
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
		<button>내 그룹 보기</button>
		<span> 모집 중인 그룹 </span>
		<div class="container">
			<c:forEach items="${group}" var="group">
				
				<div class="box">
					<span class="group_name"> ${group.group_name} </span>
					<span> ${group.leader}</span>
					<span> ${group.subject }</span>
					<span> ${group.member_number}</span>
				</div>
			</c:forEach>

			<form method="get" action="./detail">
				<input type="hidden" name="group_name" />
			</form>
		</div>
	</body>
	
	<p> 모집이 완료된 그룹 </p>
		<div class="container">
			<c:forEach items="${completed}" var="group">
				
				<div class="box">
					<span class="group_name"> ${group.group_name} </span>
					<span> ${group.leader}</span>
					<span> ${group.subject }</span>
					<span> ${group.member_number}</span>
				</div>
			</c:forEach>

			<form method="get" action="./detail">
				<input type="hidden" name="group_name" />
			</form>
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
		});
	</script>
</html>