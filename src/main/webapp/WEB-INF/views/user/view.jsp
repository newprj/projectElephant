<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
    <!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title>유저 조회</title>


</head>
<body>

<form action="/user/modify" method="post">
<table>

<h4><span class="label label-primary">번호</span>
${view.uno}<br/></h4>
<div class="form_section">
	<div class="form_section_title">
		<h4><span class="label label-primary">프로필 사진</span></h4>
	</div>
	<img src="${view.profile}" style="max-width: 30%; height: auto;">

</div>
<h4><span class="label label-danger">아이디</span>
${view.user_id}<br/></h4>
<h4><span class="label label-danger">이름</span>
${view.name}<br/></h4>
<h4><span class="label label-success">이메일</span>
${view.email}<br/></h4>
<h4><span class="label label-success">가입일</span>
${view.regDate}<br/></h4>

<div>
	<button class="btn btn-warning" type="button" onclick="location.href='/user/modify2?uno=${view.uno}' ">회원정보 수정</button>
</div>
</table>
</form>
</body>
</html>