<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<%@ include file="../includes/admin_header.jsp" %>
<style>



#letter_modal {
	display:none;
	position: fixed;
	z-index: 1;
	left: 0;
	top:0;
	width: 100%;
	height:100%;
	overflow:auto;
	background-color:rgb(0,0,0);
	background-color:rgba(0,0,0,0.4);
}

#modal-content{
	background-color:#fefefe;
	margin:15% auto;
	padding: 20px;
	border: 1px solid #888;
    width: 30%;

}


</style>
<title>관리자 페이지</title>

</head>
	

<div class="boxed">
<div id="content-container">
	<div class="pageheader">
         <h3><i class="fa fa-home"></i> Dashboard </h3>
         <div class="breadcrumb-wrapper">
             <span class="label">You are here:</span>
             <ol class="breadcrumb">
                 <li> <a href="#"> Home </a> </li>
                 <li class="active"> Dashboard </li>
             </ol>
         </div>
     </div>
	
	<div id="page-content">
	     <!--Widget-4 -->
	     <div class="row">
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="panel">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-9 col-sm-9 col-xs-10">
                                <h3 class="mar-no"> <span class="counter">회원가입 수</span></h3>
                                <p class="mar-ver-5"> Traffic this month </p>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-2"> <i class="fa fa-user fa-3x text-success"></i> </div>
                        </div>
                        <div class="progress progress-striped progress-sm">
                            <div style="width: 60%;" aria-valuemax="100" aria-valuemin="0" aria-valuenow="60" role="progressbar" class="progress-bar"> <span class="sr-only">60% Complete</span> </div>
                        </div>
                        <p> 4% higher than last month </p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="panel">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-9 col-sm-9 col-xs-10">
                                <h3 class="mar-no"> <span class="counter">group 생성</span></h3>
                                <p class="mar-ver-5">Server Load</p>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-2"> <i class="fa fa-folder fa-3x text-danger"></i> </div>
                        </div>
                        <div class="progress progress-striped progress-sm">
                            <div style="width: 60%;" aria-valuemax="100" aria-valuemin="0" aria-valuenow="60" role="progressbar" class="progress-bar progress-bar-danger"> <span class="sr-only">60% Complete</span> </div>
                        </div>
                        <p> 4% higher than last month </p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="panel widget">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-9 col-sm-9 col-xs-10">
                                <h3 class="mar-no"> <span class="counter">Q&A </span></h3>
                                <p class="mar-ver-5"> Total Sales </p>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-2"> <i class="fa fa-question fa-3x text-success"></i> </div>
                        </div>
                        <div class="progress progress-striped progress-sm">
                            <div style="width: 60%;" aria-valuemax="100" aria-valuemin="0" aria-valuenow="60" role="progressbar" class="progress-bar progress-bar-success"> <span class="sr-only">60% Complete</span> </div>
                        </div>
                        <p> 4% higher than last month </p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="panel widget">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-9 col-sm-9 col-xs-10">
                                <h3 class="mar-no"> <span class="counter"> ${visit}명</span></h3>
                                <p class="mar-ver-5"> 방문자 수 </p>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-2"> <i class="fa fa-users fa-3x text-info"></i> </div>
                        </div>
                        <div class="progress progress-striped progress-sm">
                            <div style="width: 60%;" aria-valuemax="100" aria-valuemin="0" aria-valuenow="60" role="progressbar" class="progress-bar progress-bar-warning"> <span class="sr-only">60% Complete</span> </div>
                        </div>
                        <p> 4% higher than last month </p>
                    </div>
                </div>
            </div>
        </div>	
     </div>
	
	<h3>방문자 평균 그래프로 보이게</h3>
	
	
	
	<div class='study'>
		<h3 ><a href='/group/'>스터디 승인 리스트</a></h3>
		<h5>스터디장이 승인 요청한 것만 띄우기</h5>
		<table>
			<thead>
				<tr>
				  <th>no.</th>
				  <th>스터디명</th>
	              <th>주제</th>
	              <th>스터디장</th>
	              <th>인원수</th>
	              <th>내용확인</th>
	              <th>승인여부</th>
				</tr>
			</thead>
			<c:forEach items="${group}" var="i" varStatus="status"  begin="0" end='9'>
				<tr>
					<td>${status.count}</td>
					<td>${i.group_name}</td>
					<td>${i.subject}</td>
					<td>${i.leader}</td>
					<td>${i.member_number}명</td>
					<td><a href='/group/gather/${i.group_name}'>확인</a></td>
					<td><c:choose>
							<c:when test="${i.authorized eq 'Y'}">승인</c:when>
							<c:otherwise>비승인</c:otherwise>
						</c:choose>	
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	
	<div class="row">
    	<div class="col-lg-12">
	        <div class="panel">
	            <div class="panel-heading">
	                <h3 class="panel-title">최근 쪽지</h3>
	            </div>
	            <div class="panel-body">
	                <div class="tab-base">
	                    <ul class="nav nav-tabs">
	                        <li class="active"> <a data-toggle="tab" href="#demo-lft-tab-1"> 받은 쪽지 </a> </li>
	                        <li> <a data-toggle="tab" href="#demo-lft-tab-2">보낸 쪽지</a> </li>
	                        <li><a data-toggle="tab" class="letterBtn" >쪽지 보내기</a></li>
	                    </ul>
	                    <!--Tabs Content-->
	                    <div class="tab-content">
	                        <div id="demo-lft-tab-1" class="tab-pane fade active in">
	                        	<table class="table table-hover table-vcenter">
	                            	<thead>
	                                	<tr>
	                                    	<th>no.</th>
											<th>보낸 id</th>
											<th>내용</th>
									         <th>날짜</th>
									         <th></th>
	                                   </tr>
	                                </thead>
	                                <tbody>
	                                	<c:forEach items="${letter}" var="i" varStatus="status"  begin="0" end='5'>
											<tr>
												<td>${status.count}</td>
												<td id='userId${status.index}'>${i.writer}</td>
												<td>${i.content}</td>
												<td><fmt:formatDate value="${i.reg_date}" pattern="yyyy-MM-dd a hh:mm" /></td>
												<td><button class='letterBtn'>답장</button></td>
											</tr>
										</c:forEach>
	                               </tbody>
	                            </table>
	                            <!--===================================================--> 
	                            <!--End Hover Rows--> 
	                        </div>
	                        <div id="demo-lft-tab-2" class="tab-pane fade">
	                        	<table id="demo-foo-filtering" class="table table-bordered table-hover toggle-circle" data-page-size="7">
	                            	<thead>
	                                	<tr>
	                                    	<th>no.</th>
											<th>받는 id</th>
											<th>내용</th>
									         <th>날짜</th>
									         <th></th>
	                                    </tr>
	                                </thead>
	                            	<tbody>
	                                	<c:forEach items="${sendletter}" var="i" varStatus="status"  begin="0" end='9'>
											<tr>
												<td>${status.count}</td>
												<td id="userId${status.index}">${i.recipient}</td>
												<td>${i.content}</td>
												<td><fmt:formatDate value="${i.reg_date}" pattern="yyyy-MM-dd a hh:mm" /></td>
												<td><button data-lno='${i.lno}' class='deleLetter'>삭제</button></td>
											</tr>
										</c:forEach>
	                                </tbody>
	                                <tfoot>
	                                    <tr>
	                                        <td colspan="5">
	                                            <div class="text-right">
	                                                <ul class="pagination"></ul>
	                                            </div>
	                                        </td>
	                                    </tr>
	                                </tfoot>
	                            </table>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
    	</div>
	</div>
	
	<!-- 쪽지 모달 -->
	<div class="col-lg-6 col-sm-12 col-md-6 col-xs-12" id="letter_modal">
      <div class="panel" id="modal-content">
          <div class="panel-heading">
              <h3 class="panel-title"> Message </h3>
          </div>
          <div class="panel-body">
              <!-- Multiple Select Choosen -->
              <!--===================================================-->
              <form class="form-horizontal form-bordered">
                  <div class="form-group nb">
                      <label class="control-label col-md-2">보내는 사람</label>
                     <div class="col-md-10">
                          <input type="text" class="form-control " name="writeId">
                      </div>
                  </div>
                  <div class="form-group nb">
                      <label class="control-label col-md-2">받는사람</label>
                      <div class="col-md-10">
                          <input type="text" class="form-control " name="recipientId">
                      </div>
                  </div>
                  <div class="form-group nb">
                      <label class="control-label col-md-2" >내용</label>
                      <div class="col-md-10">
                          <textarea  class="form-control " name="letterContent"></textarea>
                      </div>
                  </div>
                  <div id="demo-summernote"></div>
                  <div class="pad-top"> 
                      <button class="btn btn-info" id="letterRegister"><i class="fa fa-send"></i> Send </button>
                       <button class="btn btn-default" ><i class="fa fa-remove"></i> Close </button>
				 </div>
                </form>
            </div>
        </div>
    </div>

    
	</div>
</div>
	<%@ include file="../includes/admin_footer.jsp" %> 

<script type="text/javascript">
	
	$(document).ready(function () {
		
		var today=new Date()
		
		/* 쪽지 */
		var letterModal=$("#letter_modal")
		var modalwriteId=letterModal.find("input[name='writeId']")
		var modalrecipientId=letterModal.find("input[name='recipientId']")
		var letterDate=letterModal.find("input[name='letterDate']")
		var letterContent=letterModal.find("textarea[name='letterContent']")
		
		$(".letterBtn").click(function(){
			console.log('쪽지 버튼 눌림')
			
			letterDate.closest('div').hide()
			$("#letter_modal").show()
			var idx=$(".letterBtn").index(this)
			var uid=$("#userId"+idx).text()

			modalwriteId.val('${user}')
			/* modalrecipientId.val(uid) */
						
			$("#letterRegister").off('click').on('click',function(){
				
				var form={
						writer:modalwriteId.val(),
						recipient:modalrecipientId.val(),
						content:letterContent.val(),
						reg_date:today,
				}
				console.log(form)
				$.ajax({
					url:"/mypage/letterRegister",
					type:"post",
					data:JSON.stringify(form),
					contentType:"application/json; charset=utf-8",
					dataType:"text",
					success:function(result){
						$(".letter_modal").hide();
						location.reload();
					},
					error:function(){
						alert("실패")
					}
				}) 
			})
		})
		

		$('ul.tabs li').click(function(){
			var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#"+tab_id).addClass('current');
		})
		
		$(".deleLetter").click(function(){
			console.log("삭제버튼 눌림")
			var lno=$(this).data('lno')
			var data={
					lno:lno,
					writer:'${user}'
			}
			console.log(data)
			$.ajax({
				url:"/mypage/deleLetter",
				type:"post",
				data:JSON.stringify(data),
				contentType:"application/json; charset=utf-8",
				success:function(){
					location.reload();
				},
				error:function(){
					alert("실패")
				}
			}) 
		})
		
		
	})

</script>
</html>