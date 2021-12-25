<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8" />
		<title>Insert title here</title>
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
				font-family: "Noto Sans KR", sans-serif, -apple-system,
					BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell,
					"Open Sans", "Helvetica Neue", sans-serif;
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
				overflow-y: auto;
        padding-bottom: 3rem;
			}
			.pagination {
				display: flex;
				flex-flow: row nowrap;
				justify-content: center;
				align-items: center;
				color: #222;
			}

			.pagenate {
				display: inline-block;
				padding: 10px 18px;
				width: 35px;
				height: 35px;
				line-height: 35px;
				padding: 0;
				text-align: center;
			}
			a.current {
				background-color: #5ec2dd;
				border-radius: 50%;
				color: #fff;
			}
			div.head{
				color: #000;
    			border-left: 5px solid #5ec2dd;
				padding: 10px 3em 8px 15px;
				margin-bottom: 10px;
			}
 

		</style>
	</head>
	<body>
		<div class="wrapper">
			<div class="head">
				<div class="media-left">
					<img
						src="/resources/img/elephantIcon.png"
						style="height: 50px; width: 50px; border-radius: 50%; cursor: pointer;"
						onclick="location.href='/group/${name}'"
					/>
				</div>
				<div class="media-body">
					<h4 class="alert-title">${name}</h4>
					<p class="alert-message">${name} 의 게시판 입니다</p>
				</div>
			</div>

			<div class="panel-body">
				<div class="pad-btm form-inline">
					<div class="row">
						<div class="col-sm-6 table-toolbar-left">
              <div class="btn-group">
                
                <button class="btn btn-default"><a href="/group/"><i class="fa fa-home"></i> 메인</a> </button>
                <button class="btn btn-default"><a href="/group/board/${name}/write"><i class="fa fa-plus"></i> 글작성</a></button>
              </div>
            </div>
						<div class="col-sm-6 table-toolbar-right">
							<div class="form-group">
								<input
									id="demo-input-search2"
									type="text"
									placeholder="Search"
									class="form-control"
									autocomplete="off"
									name="keyword"
								/>
							</div>
							<div class="btn-group">
								<button
									data-toggle="dropdown"
									class="btn btn-default dropdown-toggle"
								>
									검색옵션
									<span class="caret"></span>
									<i class="fas fa-search"></i>
								</button>
								<ul role="menu" class="dropdown-menu dropdown-menu-right">
									<li><a class="dropdown-item active" href="T">제목</a></li>
									<li><a href="W">작성자</a></li>
									<li><a href="C">내용</a></li>
									<li><a href="TC">제목 OR 내용</a></li>
									<li><a href="TW">제목 OR 작성자 </a></li>
									<li><a href="CW">내용 OR 작성자 </a></li>
									<li><a href="TCW">제목 OR 내용 OR 작성자 </a></li>
								</ul>
							</div>
						</div>
					</div>

				</div>
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
                <th></th>
								<th>제목</th>
								<th>작성자</th>
								<th> <i class="fa fa-clock-o"></i> 작성일 </th>
							</tr>
						</thead>
						<tbody>
              <c:if test="${notice.size() > 0 || notice ne null}">
                <c:forEach items="${notice}" var="board">
                  <tr class="table-active">
                    <td></td>
                    <td>
                      <i class="fas fa-check"></i>
                      <span class="list" data="${board.bno}">
                        ${board.title}
                      </span>
                      <c:if
                        test="${board.attachList !=null && board.attachList.size()>0 }"
                      >
                        <i class="fas fa-paperclip"></i>
                      </c:if>
                      <i class="far fa-comment-dots"></i> ${board.replyCnt}
                    </td>
                    <td>${board.writer}</td>
                    <td>${board.regdate}</td>
                  </tr>
                </c:forEach>
							</c:if>
							<c:forEach items="${board}" var="board">
								<tr>
                  <td></td>
									<td>
										<span class="list" data="${board.bno}">
											${board.title}
										</span>
										<c:if
											test="${board.attachList !=null && board.attachList.size()>0 }"
										>
											<i class="fas fa-paperclip"></i>
										</c:if>
										<i class="far fa-comment-dots"></i> ${board.replyCnt}
									</td>
									<td>${board.writer}</td>
									<td>${board.regdate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

			<div class="pagination">
				<c:if test="${pageMaker.prev}">
					<a class="pagenate prev" href="${pageMaker.startPage-1}"> prev </a>
				</c:if>
				<c:forEach
					var="num"
					begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}"
				>
					<a
						class="pagenate ${pageMaker.cri.pageNum == num ? 'current': '' }"
						href="${num}"
						>${num}</a
					>
				</c:forEach>
				<c:if test="${pageMaker.next }">
					<a class="pagenate next" href="${pageMaker.endPage+1}"> next </a>
				</c:if>
			</div>
		</div>

		<script>
			$(document).ready(function () {
				let actionForm = $("#actionForm");
				let pageNum = "${cri.pageNum}";
				let amount = "${cri.amount}";

				let loginUser = "${user}";

				$.getJSON("/group/getMemberlistByGroup/${name}", (list) => {
					console.log(list.memberList);
					console.log(loginUser);
					let joinCheck = list.memberList.find(
						(user) => user.user_id == loginUser
					);
					if (!joinCheck) {
						alert("그룹 회원만 접근 가능한 페이지입니다");
						location.href = "/group/";
					}
				});

				$("span.goGroup").click((e) => {
					location.href = `/group/${name}`;
				});

			
				$(".list").click(function (e) {
					bno = $(this).attr("data");
					let type = "${cri.type}";
					let keyword = "${cri.keyword}";

					let url =
						type && keyword
							? `/group/board/${name}/\${bno}/\${pageNum}/\${amount}/\${type}/\${keyword}`
							: `/group/board/${name}/\${bno}/\${pageNum}/\${amount}`;

					location.href = url;
				}); //list.click

				$("a.pagenate").click(function (e) {
					e.preventDefault();
					let type = "${cri.type}";
					let keyword = "${cri.keyword}";

					let pageNum = $(this).attr("href");
					let url =
						type && keyword
							? `/group/board/${name}/\${pageNum}/\${amount}/\${type}/\${keyword}`
							: `/group/board/${name}/\${pageNum}/\${amount}`;

					location.href = url;
				}); // a click

				let searchForm = $("form.searchForm");
				$(".dropdown-menu >li >a").click((e) => {
					e.preventDefault();
					let type = $(e.target).attr("href");
					let keyword = $('input[name="keyword"]').val();
					console.log(type);
					if (!keyword) {
						alert("검색 키워드를 입력하세요 ");
					} else {
						let url = `/group/board/${name}/\${pageNum}/\${amount}/\${type}/\${keyword}`;
						location.href = url;
					}
				});
			}); //docu
		</script>
	</body>
</html>
