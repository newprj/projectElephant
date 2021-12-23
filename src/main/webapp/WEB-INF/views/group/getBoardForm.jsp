<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8" />
                <title>Insert title here</title>
                <script src="//code.jquery.com/jquery-3.6.0.js"></script>
                <script src="/resources/js/fileUpload.js" type="text/javascript"></script>
                <link href="/resources/css/style.css" rel="stylesheet" />
                <link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
                <script src="https://kit.fontawesome.com/eab4c34ae3.js" crossorigin="anonymous"></script>
                <style>
                    body {
                        background-color: #f6f9fc;
                        font-family: "Noto Sans KR", sans-serif, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
                        display: flex;
                        flex-direction: column;
                        align-items: center;
                        padding: 50px 0;
                    }
                    
                    div.wrapper {
                        width: 70%;
                        height: 90%;
                        background-color: white;
                        box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11), 0 1px 3px rgba(0, 0, 0, 0.08);
                        overflow-x: hidden;
                        overflow-y: auto;
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
                    }
                    
                    .modal_content * {
                        padding: 10px
                    }
                    
                    button[type="reset"] {
                        display: none;
                    }
                    
                    div.uploadResult>ul>li>div>img {
                        width: 50px;
                        height: 50px;
                        border-radius: 50%;
                    }
                    
                    div.head {
                        color: #000;
                        border-left: 5px solid #5ec2dd;
                        padding: 10px 3em 8px 15px;
                        margin-bottom: 10px;
                    }
                    
                    div.content {
                        min-height: 150px;
                        max-height: 370px;
                        OVERFLOW-Y: auto;
                    }
                    
                    div.content>p>img {
                        max-width: 80%;
                    }
                    
                    div.title {
                        padding-top: 30px;
                        padding-bottom: 30px;
                        color: inherit;
                        background-color: #eee;
                    }
                    
                    p.reply {
                        display: flex;
                        align-items: center;
                        justify-content: space-between;
                    }
                    
                    .uploadResult {
                        display: block;
                        width: 100%;
                        min-height: 4rem;
                        padding: 6px 12px;
                        font-size: 14px;
                        color: #555;
                        background-color: #fff;
                        background-image: none;
                        border: 1px solid #ccc;
                        border-radius: 4px;
                        -webkit-box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%);
                        box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%);
                        transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
                        margin-bottom: 5px;
                    }
                    
                    .uploadResult>ul {
                        list-style: none;
                        display: flex;
                        flex-direction: column;
                    }
                    
                    .file-container {
                        margin-top: 10px;
                        margin-bottom: 10px;
                    }
                    
                    div.button {
                        display: flex;
                        flex-flow: row nowrap;
                        justify-content: center;
                        align-items: center;
                    }
                    
                    .btn {
                        margin-left: 4px;
                    }
                </style>
            </head>

            <body>
                <div class="wrapper">
                    <div class="head">
                        <div class="media-left">
                            <img src="/resources/img/elephantIcon.png" style="height: 50px; width: 50px; border-radius: 50%" />
                        </div>
                        <div class="media-body">
                            <h1 class="alert-title">${board.group_name}</h1>
                        </div>
                    </div>


                    <div class="panel-body">
                        <div class="title">
                            <h1> ${board.title}</h1>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="content-body">
                            <div class="mail-sender">
                                <div class="media">
                                    <c:choose>
                                        <c:when test="${board.updateDate eq null}">
                                            <span class="media-meta pull-right"> 작성일 
                                        <fmt:formatDate value="${board.regdate}" pattern="yyyy MM dd" />
                                        </span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="media-meta pull-right"> 수정일
                                        <fmt:formatDate value="${board.updateDate}" pattern="yyyy MM dd" />
                                      </span>
                                        </c:otherwise>
                                    </c:choose>
                                    <h3>
                                        ${board.writer}
                                    </h3>

                                </div>
                            </div>
                            <div class="view-mail content">
                                ${board.content}
                            </div>
                        </div>

                        <div class="file-container">
                            <c:if test="${board.attachList != null && board.attachList.size() >0}">
                                <div class="form-group">
                                    <label class="col-md-2 control-label" for="demo-textarea-input">
                                  <i class="fa fa-file"></i> <span class="fileBtn" >파일 </span></label>
                                    <div class="col-md-9">
                                        <div class="uploadResult">
                                            <ul>
                                                <c:forEach items="${board.attachList}" var="file">
                                                    <li> ${file.fileName }
                                                        <li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </div>


                        <div class="reply-content">
                            <div id="demo-lft-tab-1" class="tab-pane fade active in">
                                <c:forEach items="${replies}" var="reply">
                                    <div class="form-group">
                                        <label class="col-md-2 control-label" data-rno="${reply.rno}">${reply.replyer}</label>
                                        <div class="col-md-9">
                                            <p class="form-control-static reply" data-rno="${reply.rno}">
                                                <span> ${reply.reply} </span>
                                                <span>
                                                    <c:choose>
                                                        <c:when test="${reply.updateDate eq null }"> 작성일
                                                            <fmt:formatDate value="${reply.replydate}" pattern="yyyy MM dd" />
                                                        </c:when>
                                                        <c:otherwise>
                                                            수정일
                                                            <fmt:formatDate value="${reply.updateDate}" pattern="yyyy MM dd" />
                                                        </c:otherwise>
                                                    </c:choose>
                                                    </span>
                                            </p>
                                        </div>

                                    </div>
                                </c:forEach>
                            </div>

                        </div>

                    </div>
                    <div class="panel-footer text-right">
                        <div class="button">
                            <c:if test="${user eq board.writer}">
                                <button class="go_modify btn btn-default">글수정</button>
                                <button class="deleteBoard btn btn-default">글삭제</button>
                            </c:if>
                            <button class="reply btn btn-default"> 댓글 등록 </button>
                            <button class="go_board btn btn-default">목록</button>
                        </div>
                    </div>
                </div>


                <div class="modal">
                    <div class="modal_content">
                        <span> X </span>
                        <form>
                            <div>
                                <label for="reply">댓글 내용</label>
                                <input type="text" name="reply" />
                            </div>
                            <div>

                                <input type="hidden" name="replyer" />
                            </div>
                            <input type="hidden" name="rno" />
                            <div>
                                <button class="submit">전송</button>
                                <button class="modify">수정</button>
                                <button class="delete">삭제</button>
                                <button type="reset">리셋</button>
                            </div>

                        </form>

                    </div>
                    <!-- 모달 컨텐드 -->
                </div>
                <!-- 모달  -->


                <script>
                    $(document).ready(function(e) {


                            let loginUser = "${user}"

                            $.getJSON(
                                "/group/getMemberlistByGroup/${cri.group_name}", (list) => {
                                    console.log(list)
                                    console.log(loginUser)
                                    let joinCheck = list.memberList.find(user => user.user_id === loginUser)
                                    if (!joinCheck) {
                                        alert("그룹 회원만 접근 가능한 페이지입니다")
                                        location.href = "/group/"
                                    }
                                })


                            //			 let attachList = [];

                            // 파일 표시 (다운로드 )
                            /*  let bno = "${cri.bno}"
                            $.getJSON("/group/getFileList", {
                                    bno
                                }, (files) => {
                                    let str = ""
                                    files.map(file => {
                                            //						attachList.push(file) // 수정할때 넣음
                                            if (file.fileType) {
                                                let fileCallpath = encodeURIComponent(`\${file.uploadPath}/\${file.uuid}_\${file.fileName}`)
                                                str += `<li><div><a href='/download?fileName=\${fileCallpath}'><span>\${file.fileName}</span></a>`;
                                                str += `<img src='/display?fileName=\${fileCallpath}'></div></li>`
                                            } else {
                                                let fileCallpath = encodeURIComponent(`\${file.uploadPath}/\${file.uuid}_\${file.fileName}`)
                                                str += `<li><div><a href='/download?fileName=\${fileCallpath}'><span>\${file.fileName}</span></a></div></li>`;
                                            }
                                        }) //map
                                    $('.uploadResult ul').html(str)
                                }) //getJSON
 */
                            $('div.modal > div > span').click(function(e) {
                                $('.modal').hide()
                            })

                            // 글삭제
                            $(".deleteBoard").click(function(e) {

                                e.preventDefault();
                                $.ajax({
                                    type: "delete",
                                    url: "/group/board/${cri.bno}",
                                    success: () => {
                                        let url = "/group/board/${cri.group_name}/${cri.pageNum}/${cri.amount}"
                                        url += "${cri.keyword}" ? "/${cri.type}/${cri.keyword}" : ""
                                        location.href = url
                                    },
                                    error: (xhr, status, er) => {
                                        console.log(status);
                                    },
                                }); //ajax
                            }); //delete click

                            // 모달창 띄우기
                            $(".reply").click(function(e) {

                                $('button[type="reset"]').trigger("click");
                                $('input[name="replyer"]').val(loginUser)
                                $('.modal').show()
                            });

                            // 목록 go 
                            $(".go_board").click((e) => {
                                e.preventDefault();

                                let url = "/group/board/${cri.group_name}/${cri.pageNum}/${cri.amount}"
                                url += "${cri.keyword}" ? "/${cri.type}/${cri.keyword}" : ""
                                location.href = url

                            });

                            // 리플폼 데이터 얻기
                            const getReplyData = () => ({
                                rno: $('input[name="rno"]').val(),
                                bno: "${board.bno}",
                                reply: $('input[name="reply"]').val(),
                                replyer: $('input[name="replyer"]').val(),
                            });

                            // 댓글 등록
                            $(".submit").click(function(e) {
                                e.preventDefault();
                                let data = getReplyData();


                                $.ajax({
                                    type: "post",
                                    url: "/group/reply",
                                    data: JSON.stringify(data),
                                    contentType: "application/json; charset=utf-8",
                                    success: () => {
                                        $('button[type="reset"]').trigger("click");
                                        $('.modal').hide();
                                        location.reload()
                                    },
                                    error: (xhr, status, er) => console.log(xhr),
                                });
                            });

                            // 댓글 클릭하면 모달에 채우기...
                            $("p.reply").click(function(e) {

                                console.log(e)
                                console.log($(this))
                                $('button.submit').hide()
                                let rno = $(this).data("rno");

                                $.getJSON("/group/reply/" + rno, (res) => {
                                    console.log(res);
                                    $('input[name="rno"]').val(res.rno);
                                    $('input[name="reply"]').val(res.reply);
                                    $('input[name="replyer"]').val(res.replyer);
                                    if (loginUser !== res.replyer) {
                                        $('button.modify, button.delete').hide()
                                    }
                                }); //getJSON



                            }); //reply click

                            // 글 수정하러가기
                            $(".go_modify").click(function(e) {
                                e.preventDefault();
                                let url = "/group/board/modify/${cri.group_name}/${cri.bno}/${cri.pageNum}/${cri.amount}"
                                url += "${cri.keyword}" ? "/${cri.type}/${cri.keyword}" : ""
                                location.href = url

                            }); //modify

                            // 댓글 수정
                            $(".modify").click(function(e) {
                                e.preventDefault();
                                $('.modal').show()
                                let data = getReplyData();
                                console.log(data);
                                let rno = $('input[name="rno"]').val();
                                $.ajax({
                                    type: "put",
                                    url: "/group/reply/" + rno,
                                    data: JSON.stringify(data),
                                    contentType: "application/json; charset=utf-8",
                                    success: () => {
                                        $('.modal').hide();
                                        $('button[type="reset"]').trigger("click");
                                        /* $('div.reply').load(window.location.href + ' div.reply') */
                                        location.reload()
                                    },
                                    error: (xhr, status, er) => console.log(xhr),
                                });
                            }); //modify

                            // 댓글삭제
                            $(".delete").click(function(e) {
                                e.preventDefault();
                                let rno = $('input[name="rno"]').val();
                                $.ajax({
                                    type: "delete",
                                    url: "/group/reply/" + rno,
                                    success: () => {
                                        $('button[type="reset"]').trigger("click");
                                        $('.modal').hide()
                                            /* $('.reply[data-rno="${rno}"]').remove() */
                                        location.reload()
                                    },
                                    error: (xhr, status, er) => console.log(xhr),
                                });
                            }); //delete
                        }) //docu ready
                </script>
            </body>

            </html>