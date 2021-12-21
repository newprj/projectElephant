<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <script src="//code.jquery.com/jquery-3.6.0.js"></script>
  </head>
  <body>
  <h1> 스터디 모집 페이지 </h1>
  <div>
  <h3> 스터디 모집글이 들어갈 거에요</h5>

 <p><a href="/group/"> 메인 </a></p>
 <p>
  </div>
	</br>
  	<c:if test="${user.user_id== one.leader}">
  	
  	<a href="/group/gather/${one.group_name}/modify"> <button> 모집글 수정하기 </button></a>
  	</c:if>
  	
	<br/>
		<div class="profile">
		<img class="profile" src="${one.profile}">
		</div>
    ${one.group_name}<br/>
    ${one.leader }<br/>
    ${one.subject }<br/>
    ${one.description }<br/>
    ${one.member_number }<br/>
    
    <c:if test="${user.user_id eq one.leader}">
    <button class="delete"> 그룹 삭제</button>
    </c:if>
    <div>
      <form>
        <div>
         <p>
          <input type="hidden" name="user_id" value="${user.user_id}"/>
          </p>
        </div>
      </form>
    </div>
   
    	<div class="signup">
    	 <c:if test="${user != null && user.user_id != one.leader}">
    	 	<button class="signup">지원하기</button>
    	 </c:if>
    	</div>
   
    <br/>
    <c:if test="${user.user_id == 'admin'}">
    	<button class="auth">승인하기</button>
    </c:if>
    
  </body>
  <script>
  
  	

    const signupGroup = (data) => {
      
    	$.ajax({
        type: 'post',
        url: '/group/',
        data: JSON.stringify(data),
        contentType: 'application/json; charset=utf-8',
        success: (res) => console.log(res),
        error: (xhr, status, er) => {
          console.log(xhr)
        },
      })
    }

    $(document).ready(function (e) {
    	console.log( "${one.leader}")
    	console.log( "${user}")
     	const member_number = Number("${one.member_number}" )
     	
     	let signupform = {}
     	$('button.signup').click(function (e) {
					console.log(" 버튼이 눌림 사인업버튼 ")
					let memberMsg =$('<span> 이미 지원한 모임입니다 </span>')
					$('button.signup').remove()
					$('div.signup').append(memberMsg)
        	
					signupform = {
          	user_id: $('input[name="user_id"]').val(),
         		group_name: '${one.group_name}',
         		leader : "N"
        	}
         
        signupGroup(signupform)
      })// 가입버튼 click
      
      $('.delete').click(function (e) {
        $.ajax({
          type: 'delete',
          url: '/group/' + '${one.group_name}',
          success: () => {
            location.href = '/group/'
          },
          error: (xhr, status, er) => {
            console.log(status)
            
          },
        }) //ajax
      }) //delete button
      
      
      let joinedMember
  		$.getJSON("/group/getMemberlistByGroup/${group_name}", (list) => {
  		// 모집 완료 된 경우 지원 버튼 노출 X
  			let msg = $('<span> 모집이 완료된 그룹입니다 </span>')
  			if(list.memberList.length >= member_number) {
  				$('button.signup').remove()
  				$('div.signup').append(msg)
  				console.log("모집완료")
  			}
  			console.log(list)
  			 ///이미 지원 한 그룹일 경우 버튼 노출 없애기 	
	  		let memberMsg =$('<span> 이미 지원한 모임입니다 </span>')
	  		list.allList.map(console.log)
  			if(list.allList.some(i => i.user_id === "${user.user_id}")){
					$('button.signup').remove()
					$('div.signup').append(memberMsg)
					console.log("야....")
				} 
  		})//getJson
      
     
      
      /* admin이 그룹 승인 */
      $(".auth").click(function(){
    	  var gno='${one.gno}'
    	  var authorized='Y'
    	  var gAuth={
    			gno: gno,
    			authorized:authorized,
    	  }
    	  console.log("승인 버튼 누름"+JSON.stringify(gAuth))
    	  $.ajax({
          type: 'post',
          url:'/mypage/auth',
          data: JSON.stringify(gAuth),
          contentType: 'application/json; charset=utf-8',
          success: () => {
            console.log('승인 완료')
            alert("승인 완료")
            location.href = '/mypage/admin'
          },
          error: (xhr, status, er) => {
            console.log(status)
          },
        }) //ajax
      })
      
    })
  </script>
</html>
