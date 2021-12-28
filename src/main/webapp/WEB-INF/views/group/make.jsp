<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <script src="//code.jquery.com/jquery-3.6.0.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <style>
            body {
                background-color: #f6f9fc;
                font-family: 'Noto Sans KR', sans-serif, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
                display: flex;
                flex-direction: column;
                align-items: center;
                padding: 50px 0;
            }
            
            div.wrapper {
                padding: 30px;
                background-color: white;
                box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11), 0 1px 3px rgba(0, 0, 0, 0.08);
            }
            
            div.profile {
                padding-left: 50px;
            }
            
            .hidden {
                display: none;
            }
            
            .form-container {
                width: 500px;
            }
            
            .row {
                margin-top: 15px;
            }
            
            .row.form-group {
                padding-left: 15px;
                padding-right: 15px;
            }
            
            .btn {
                margin-left: 15px;
                width: 100px;
                margin: auto;
                display: block;
            }
            
            span.profile {
                background-color: #000;
                border-bottom-left-radius: 6px;
                border-bottom-right-radius: 6px;
                bottom: 0;
                color: #fff;
                opacity: 0.8;
                padding: 4px;
                position: absolute;
                text-align: center;
                width: 300px;
                margin-left: 50px;
            }
            
            span.profile:hover {
                cursor: pointer;
            }
            
            img.profile {
                height: 200px;
            }
            
            #editor {
                height: 500px;
                overflow: auto;
            }
        </style>
        <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
        <script src="//code.jquery.com/jquery-3.6.0.js"></script>
        <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet" />
        <script src="/resources/image-resize.min.js"></script>
        <script src="/resources/image-drop.min.js"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
        <script src="/resources/js/fileUpload.js" type="text/javascript"></script>
    </head>

    <body>

        <div class="wrapper">
            <div id="form-container" class="container">
                <form method="post" action="./make">
                    <div class="row">
                        <div class="col-xs-5 imgContainer">
                            <div class="profile">
                                <img class="profile img-rounded" src="/resources/img/elephant.png" />
                            </div>
                            <span class="profile"> 프로필 이미지 바꾸기 </span>
                            <input type="hidden" name="profile" value="/resources/img/elephant.png" />
                        </div>

                        <div class="col-xs-7">
                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label"> 그룹 이름 </label>
                                <div class="col-sm-10">
                                    <input type="text" name="group_name" class="form-control" required />
                                </div>
                                <div>
                                    <span class="duplicated hidden">중복된 이름입니다 </span>
                                    <span class="unduplicated hidden">사용 가능한 이름입니다 </span>
                                </div>
                            </div>

                            <div class="form-group row ">
                                <label class="col-sm-2 col-form-label"> 리더 </label>
                                <div class="col-sm-10">
                                    <input type="text" name="leader" value="${user.user_id}" class="form-control" readonly />
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label"> 주제 </label>
                                <div class="col-sm-10">
                                    <input type="text" name="subject" class="form-control" required />
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-2 col-form-label"> 모집 인원 </label>
                                <div class="col-sm-10">
                                    <input type="number" name="member_number" min="1" required class="form-control" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- class row -->
                    <div class="row">
                        <label for="description"> 상세 설명 </label>
                        <div id="editor"></div>
                        <input name="description" type="hidden" />
                    </div>
                    <div class="row">
                        <button class="btn btn-outline-secondary" type="submit"> 그룹 신청 </button>

                    </div>
                </form>

            </div>
        </div>

    </body>

    <script>
        $(document).ready(function(e) {
            let user = "${user}";
            if (!user) {
                alert("로그인 된 사용자만 그룹을 만들수 있습니다");
                location.href = "/group/";
            }
            let result;
            let myEditor = document.querySelector("#editor");
            $('input[name="group_name"]').on(
                "propertychange change keyup paste input",
                function(e) {
                    let group_name = $('input[name="group_name"]').val();
                    let data = {
                        group_name
                    };
                    $.ajax({
                        type: "post",
                        url: "/group/duplicateCheck",
                        data: data,
                        success: (res) => {
                            result = res;
                            if (res === "duplicated") {
                                $(".unduplicated").addClass("hidden");
                                $(".duplicated").removeClass("hidden");
                                $(".submit > button").attr("disabled", true);
                            } else {
                                $(".duplicated").addClass("hidden");
                                $(".unduplicated").removeClass("hidden");
                                $(".submit > button").attr("disabled", false);
                            }
                        },
                    }); //ajax
                }
            ); //namecheck
            $(".btn").click(function(e) {
                e.preventDefault();
                $('input[name="description"]').val(myEditor.children[0].innerHTML);
                $('input[name="profile"]').val();
                if (
                    $('input[name="group_name"]').val() == "" ||
                    $('input[name="subject"]').val() == "" ||
                    $('input[name="member_number"]').val() == "" ||
                    myEditor.children[0].innerHTML == "<p><br></p>"
                ) {
                    if ($('input[name="group_name"]').val() == "")
                        $('input[name="group_name"]').focus();
                    else if ($('input[name="subject"]').val() == "")
                        $('input[name="subject"]').focus();
                    else if ($('input[name="member_number"]').val() == "")
                        $('input[name="member_number"]').focus();
                    else myEditor.children[0].focus();
                } else {
                    $("form").submit();
                }
            });
            $("span.profile").click((e) => {
                let profileImg = $('<input type="file" accept="image/*">');
                profileImg.click();
                $(profileImg).change(function(e) {
                    let formData = new FormData();
                    let uploadFile = $(profileImg)[0].files[0];
                    formData.append("uploadFile", uploadFile);
                    $.ajax({
                        type: "post",
                        url: "/upload",
                        processData: false,
                        contentType: false,
                        data: formData,
                        dataType: "json",
                        success: (res) => {
                            console.log(" 2 프로필)");
                            console.log(res);
                            const encodeURI = encodeURIComponent(
                                `\${res[0].uploadPath}/\${res[0].uuid}_\${res[0].fileName}`
                            );
                            const IMG_URL = `/display?fileName=\${encodeURI}`;
                            console.log(IMG_URL);
                            $("img.profile").remove();
                            const newProfile = $(`<img class="profile img-rounded" src="\${IMG_URL}">`);
                            $("div.profile").append(newProfile);
                            $('input[name="profile"]').val(IMG_URL);
                        },
                        error: (xhr, status, er) => console.log(xhr),
                    }); // ajax
                }); // change
            }); //click
            const imageHandler = (e) => {
                console.log(e);
                let input = $('<input type="file" accept="image/*">');
                input.click();
                $(input).change(function(e) {
                    let formData = new FormData();
                    let uploadFile = $(input)[0].files[0];
                    formData.append("uploadFile", uploadFile);
                    $.ajax({
                        type: "post",
                        url: "/upload",
                        processData: false,
                        contentType: false,
                        data: formData,
                        dataType: "json",
                        success: (res) => {
                            console.log("2)");
                            console.log(res);
                            const IMG_URL =
                                "/display?fileName=" +
                                encodeURIComponent(
                                    res[0].uploadPath + "/" + res[0].uuid + "_" + res[0].fileName
                                );
                            let range = quill.getSelection();
                            console.log(range);
                            quill.insertEmbed(range, "image", IMG_URL);
                        },
                        error: (xhr, status, er) => console.log(xhr),
                    }); // ajax
                }); // click
            }; //imageHandletr
            const toolbarOptions = [
                [{
                    header: [1, 2, 3, 4, 5, 6, false]
                }],
                [{
                    list: "ordered"
                }, {
                    list: "bullet"
                }],
                ["bold", "italic", "underline", "strike"],
                [{
                    color: []
                }, {
                    background: []
                }],
                [{
                    align: []
                }],
                ["image"],
                ["clean"],
            ];
            let quill = new Quill("#editor", {
                theme: "snow",
                modules: {
                    toolbar: toolbarOptions,
                    imageDrop: true,
                    imageResize: {
                        displaySize: true,
                    },
                },
            });
            let toolbar = quill.getModule("toolbar");
            toolbar.addHandler("image", imageHandler);
        }); //docu ready
    </script>

    </html>