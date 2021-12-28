<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8" />
        <!-- 합쳐지고 최소화된 최신 CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <!-- 부가적인 테마 -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
        <!--Bootstrap Stylesheet [ REQUIRED ]-->
        <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
        <!--Jasmine Stylesheet [ REQUIRED ]-->
        <link href="/resources/css/style.css" rel="stylesheet">
        <!--Font Awesome [ OPTIONAL ]-->
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <title>회원등록</title>
        <style>
            .form_section_content label {
                display: inline-block;
                padding: .5em .75em;
                color: #fff;
                font-size: inherit;
                line-height: normal;
                vertical-align: middle;
                background-color: #11a61d;
                cursor: pointer;
                border-radius: .25em;
                -webkit-transition: background-color 0.2s;
                transition: background-color 0.2s;
            }
            
            .form_section_content label:hover {
                background-color: #1ee62e;
            }
            
            .form_section_content input[type="file"] {
                position: absolute;
                width: 1px;
                height: 1px;
                padding: 0;
                margin: -1px;
                overflow: hidden;
                clip: rect(0, 0, 0, 0);
                border: 0;
            }
            
            .imgDeleteBtn {
                display: inline-block;
                padding: .5em .75em;
                color: #fff;
                font-size: inherit;
                line-height: normal;
                vertical-align: middle;
                background-color: #e91010;
                border: none;
                border-radius: .25em;
            }
            
            .imgDeleteBtn:hover {
                background-color: #382323;
            }
            
            body {
                background-color: #f6f9fc;
                font-family: "Noto Sans KR", sans-serif, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
                display: flex;
                flex-direction: column;
                align-items: center;
                padding: 50px 0;
                font-size: 14px;
            }
            
            div.wrapper {
                width: 70%;
                background-color: white;
                box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11), 0 1px 3px rgba(0, 0, 0, 0.08);
                overflow-x: hidden;
                overflow-y: hidden;
                padding: 20px;
            }
        </style>

    </head>


    <body>



        <div class="wrapper">

            <div class="panel-heading">
                <h3 class="panel-title"> 회원등록 </h3>
            </div>

            <div class="center"> <img alt="" src="img/user.png" class="img-circle" /> </div>

            <form action="/user/register" method="post" class="register panel-body form-horizontal">
                <div class="panel lock-box" style="display: flex; justify-content: center;">
                    <div class="center"> <img alt="" src="/resources/img/user.png" class="img-circle" style="width: 100px; height: 100px;" /> </div>
                </div>
                <div class="form_section">
                    <div class="form_section_title">
                        <label class="col-md-3 control-label" for="demo-email-input"> 프로필 사진  </label>
                    </div>
                    <div class="form_section_content">
                        <label for="fileItem">사진 등록</label>
                        <input type="file" id="fileItem" name='uploadFile' />
                        <div id="uploadResult">
                            <input type="hidden" name="profile" />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label" for="demo-email-input">아이디 </label>
                    <div class="col-md-9">
                        <input type="text" id="demo-email-input" class="form-control" name="user_id" id="user_id">
                        <button class="btn btn-primary" type="button" id="idCheck" style="margin-top: 10px;">아이디 확인</button>
                        <small class="help-block idMsg">  </small>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label" for="demo-email-input">비밀번호 </label>
                    <div class="col-md-9">
                        <input type="password" id="demo-email-input" class="form-control" name="password" id="password">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label" for="demo-email-input"> 비밀번호 확인 </label>
                    <div class="col-md-9">
                        <input type="password" id="demo-email-input" class="form-control" name="password2" id="password2">
                        <button class="btn btn-primary" type="button" id="pwCheck" style="margin-top: 10px;">비밀번호 확인</button>
                        <small class="help-block msg2"> </small>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label" for="demo-email-input">이름 </label>
                    <div class="col-md-9">
                        <input type="text" id="demo-email-input" class="form-control" name="name" id="name">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 control-label" for="demo-email-input"> 이메일 </label>
                    <div class="col-md-9">
                        <input type="email" id="demo-email-input" class="form-control" name="email">
                    </div>
                </div>


                <div class="pad-top text-right">
                    <button class="btn btn-default" id="submit"> <i class="fa fa-send"> </i>가입</button>
                    <button class="btn btn-default" type="button" onclick="location.href='/user/login' "> <i class="fa fa-trash-o"></i>취소</button>

                </div>

            </form>
        </div>
    </body>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#submit").click(function(e) {

                if ($("#user_id").val() == "") {
                    alert("아이디를 입력해주세요.");
                    $("#user_id").focus();
                    return false;
                }
                if ($("#password").val() == "") {
                    alert("비밀번호를 입력해주세요.");
                    $("#password").focus();
                    return false;
                }
                if ($("#name").val() == "") {
                    alert("이름을 입력해주세요.");
                    $("#name").focus();
                    return false;
                }

                let res1 = $('.idMsg')[0].innerText
                let res2 = $('.msg2')[0].innerText
                if (res1 !== '사용 가능' || res2 !== "비밀번호 일치") {

                    alert('아이디와 비밀번호를 확인하세요')
                    return false
                }

            })


            $("#idCheck").click(function() {
                var query = {
                    user_id: $("input[name='user_id']").val()
                };
                console.log(query)
                $.ajax({
                    url: "/user/idCheck",
                    type: "post",
                    data: query,
                    success: function(data) {
                        if ($("#user_id").val() == "") {
                            $(".idMsg").text("아이디를 입력해주세요")
                            $(".idMsg").attr("style", "color:#f00")

                        } else if (data == 1) {
                            $(".idMsg").text("아이디 중복")
                            $(".idMsg").attr("style", "color:#f00")

                        } else {
                            $(".idMsg").text("사용 가능")
                            $(".idMsg").attr("style", "color:#00f")

                        }
                    }
                })
            })
            $("#user_id").keyup(function() {
                $(".idMsg").text("아이디를 확인해주세요")
                $(".idMsg").attr("style", "color:#000")

            })
            $("#pwCheck").click(function() {
                if ($("input[name='password2']").val() != $("input[name='password']").val()) {
                    $(".msg2").text("비밀번호가 일치하지 않습니다")
                    $(".msg2").attr("style", "color:#f00")

                } else {
                    $(".msg2").text("비밀번호 일치")
                    $(".msg2").attr("style", "color:#00f")
                }
            })
            $("#password").keyup(function() {
                $(".msg2").text("비밀번호를 확인해주세요")
                $(".msg2").attr("style", "color:#000")
            })
            $("#password2").keyup(function() {
                $(".msg2").text("비밀번호를 확인해주세요")
                $(".msg2").attr("style", "color:#000")
            })

            /* 이미지 업로드 */
            $("input[type='file']").on("change", function(e) {

                if ($(".imgDeleteBtn").length > 0) {
                    deleteFile();
                }

                let formData = new FormData();
                let fileInput = $('input[name="uploadFile"]');
                let fileList = fileInput[0].files;
                let fileObj = fileList[0];

                formData.append("uploadFile", fileObj);

                $.ajax({
                    url: '/user/upload',
                    processData: false,
                    contentType: false,
                    data: formData,
                    type: 'POST',
                    dataType: 'json',
                    success: function(result) {
                        console.log(result);
                        showUploadImage(result);
                    },
                    error: function(result) {
                        alert("이미지 파일이 아닙니다")
                    }
                });
            });

            let regex = new RegExp("(.*?)\.(jpg|png|PNG)$");
            let maxSize = 1048576; //1MB	

            function fileCheck(fileName, fileSize) {

                if (fileSize >= maxSize) {
                    alert("파일 사이즈 초과");
                    return false;
                }

                if (!regex.test(fileName)) {
                    alert("해당 종류의 파일은 업로드할 수 없습니다.");
                    return false;
                }

                return true;

            }

            function showUploadImage(uploadResultArr) {
                if (!uploadResultArr || uploadResultArr.length == 0) {
                    return
                }

                let uploadResult = $("#uploadResult");
                let obj = uploadResultArr[0];

                let fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
                let profilePath = `/display?fileName=\${fileCallPath}`
                $("body > div > form > div.panel.lock-box > div > img").attr('src', profilePath)

                $('input[name="profile"]').val(profilePath)
            }
            $("#uploadResult").on("click", ".imgDeleteBtn", function(e) {
                deleteFile();
                $("body > div > form > div.panel.lock-box > div > img").attr('src', '/resources/img/user.png')
            });

            function deleteFile() {
                let targetFile = $(".imgDeleteBtn").data("file");
                let targetDiv = $("#result_card");

                $.ajax({
                    url: '/user/deleteFile',
                    data: {
                        fileName: targetFile
                    },
                    dataType: 'text',
                    type: 'POST',
                    success: function(result) {
                        console.log(result);
                        targetDiv.remove();
                        $("input[type='file']").val("");
                    },
                    error: function(result) {
                        console.log(result);
                        alert("파일을 삭제하지 못했습니다")
                    }
                })
            }
        })
    </script>

    </html>