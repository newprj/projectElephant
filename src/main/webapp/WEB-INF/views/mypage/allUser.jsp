<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/admin_header.jsp" %>
<style>


 .modal,.letter_modal {
	display:none;
	position: fixed;
	z-index: 9999;
	left: 0;
	top:0;
	width: 100%;
	height:100%;
	overflow:auto;
	background-color:rgb(0,0,0);
	background-color:rgba(0,0,0,0.4);
}

.modal-content{
	background-color:#fefefe;
	margin:15% auto;
	padding: 20px;
	border: 1px solid #888;
    width: 30%;

}
 

</style>
<title>관리자 페이지</title>

</head>
	
      <div class="pageheader">
          <h3><i class="fa fa-home"></i> Users </h3>
          <div class="breadcrumb-wrapper">
              <span class="label">You are here:</span>
              <ol class="breadcrumb">
                  <li> <a href="#"> Home </a> </li>
                  <li class="active"> Users </li>
              </ol>
          </div>
      </div>
     
       <div id="page-content">
           <div class="well">
               <div class="row">
                   <div class="col-sm-9">
                       <input placeholder="Who are you looking for?" class="form-control" type="text">
                   </div>
                   <div class="col-sm-3">
                       <div class="form-group nm">
                           <select class="form-control" id="source">
                               <option value="Name">Full Name</option>
                              <option value="position">Position</option>
                               <option value="company">Company</option>
                           </select>
                       </div>
                   </div>
               </div>
           </div>
           
           <div class="row" >
         		<c:forEach items="${list}" var="i" varStatus="status" >
               <div class="col-md-3"  style="float:left;" >
                   <div class="panel panel-default" >
                       <div class="panel-body np">
                           <img src="/resources/img/user.png" alt="Cover" class="img-responsive" >
                           <div class="text-center pad-btm">
                               <!-- panel body -->
                               <h3 id="userId${status.index}">${i.user_id}</h3>
                           </div>
                           <ul class="menu-items">
                               <li>
                                   <a href="javascript:void(0)" class="clearfix">
                                   <i class="fa fa-bell-o fa-lg"></i> Name
                                   <span  style="float:right;">${i.name}</span>
                                   </a>
                               </li>
                               <li>
                                   <a href="javascript:void(0)" class="clearfix">
                                   <i class="fa fa-user fa-lg"></i> profile
                                   </a>
                               </li>
                               <li>
                                   
                                  <a href="javascript:void(0)" class="susp">
	                                 
									<c:if test="${i.suspension eq 'Y'}">
										 <i class="fa fa-ban fa-lg"></i> status
										<span class="label label-danger label-circle pull-right">정지</span>
									</c:if>
									<c:if test="${i.suspension eq 'N'}">
										 <i class="fa fa-eye fa-lg"></i> status
										<span  class="label label-success label-circle pull-right">활동중</span>
									</c:if>
                                 
                                  </a>
										
                               </li>
                               <li>
                                   <a href="javascript:void(0)" class="letterBtn">
                                   <i class="fa fa-envelope fa-lg"></i> message
                                   </a>
                               </li>
                           </ul>
                       </div>
                   </div>
               </div>
          		</c:forEach>
           </div>
         </div>
       
    
   

	
	
	
	<!-- 유저 정지 모달 -->
	<div class="modal" id="modal" >
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" style='float:right;'>X</button>
					<h4 class="modal-title">유저 정지 </h4>
				</div>
				<div class="modal-body">
					<div class="modal-group">
						<label>ID</label><br/>
						<input name="modelId"/>
					</div>
					<div class="modal-group">
						<label>이유</label><br/>
						<textarea name="modalContent"></textarea>
						
					</div>
					<div class="modal-group">
						<label>날짜</label><br/>
						<input name="modalDate"/>
					</div>
				</div><br/>
				<div class="modal-footer">
					<button type="button" id="register">등록</button>
					<button type="button" class="close">닫기</button>
				</div>
				
		</div>
	</div>
	
	<!-- 쪽지 모달 -->
	<div class="letter_modal" id="letter_modal" >
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" style='float:right;'>X</button>
					<h4 class="modal-title">쪽지 </h4>
				</div>
				<div class="modal-body">
					<div class="modal-group">
						<label>보내는 사람</label><br/>
						<input name="writeId"/>
					</div>
					<div class="modal-group">
						<label>받는 사람</label><br/>
						<input name="recipientId"/>
					</div>
					<div class="modal-group">
						<label>내용</label><br/>
						<textarea name="letterContent"></textarea>
						
					</div>
					<div class="modal-group">
						<label>날짜</label><br/>
						<input name="letterDate"/>
					</div>
				</div><br/>
				<div class="modal-footer">
					<button type="button" id="letterRegister">등록</button>
					<button type="button" class="close">닫기</button>
				</div>
				
		</div>
	</div>

	<%@ include file="../includes/admin_footer.jsp" %> 
</body>
<script type="text/javascript">
	
	$(document).ready(function () {
		
				
		var modal=$(".modal")
		var modalContent=modal.find("textarea[name='modalContent']")
		var modalId=modal.find("input[name='modelId']")
		var modalDate=modal.find("input[name='modalDate']")
		var today=new Date()
		
		/* 회원정지 */
		$(".susp").click(function(e){
			console.log('회원정지 버튼 눌림')
			modalDate.closest('div').hide()
			$(".modal").show()
			
			var idx=$(".susp").index(this)
			var uid=$("#userId"+idx).text()
			modalId.val(uid)
			
			var suspension=''
			console.log($(this).text().trim().substr(-2))
			if($(this).text().trim().substr(-2)== '정지'){
				suspension='N'
				$("#register").text("정지 해제")
			}
			else {
				suspension='Y'
				$("#register").text("정지")
			}
			
			$("#register").off('click').on('click',function(){
				
				var form={
						user_id:modalId.val(),
						suspension:suspension,
						suspContent:modalContent.val(),
						suspDate:today,
				}
				console.log(form)
				
				$.ajax({
					url:"/mypage/susp",
					type:"post",
					data:JSON.stringify(form),
					contentType:"application/json; charset=utf-8",
					dataType:"text",
					success:function(result){
						$("#modal").hide();
						location.reload();
					},
					error:function(){
						alert("실패")
					}
				}) 
			})
		})
		
		
		
		
		/* 쪽지 */
		var letterModal=$(".letter_modal")
		var modalwriteId=letterModal.find("input[name='writeId']")
		var modalrecipientId=letterModal.find("input[name='recipientId']")
		var letterDate=letterModal.find("input[name='letterDate']")
		var letterContent=letterModal.find("textarea[name='letterContent']")
		
		$(".letterBtn").click(function(){
			console.log('쪽지 버튼 눌림')
			
			letterDate.closest('div').hide()
			$(".letter_modal").show()
			var idx=$(".letterBtn").index(this)
			var uid=$("#userId"+idx).text()
			
			modalwriteId.val('${user}')
			modalrecipientId.val(uid)
						
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
		
		
		$(".close").click(function(){
			$(".modal").hide()
			$(".letter_modal").hide()
			
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