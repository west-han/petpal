<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style type="text/css">
    .body-container {
        max-width: 1300px;
        margin-left: 80px;
    }
    .table-form .thumbnail-viewer {
        cursor: pointer;
        border: 1px solid #c2c2c2;
        width: 100px;
        height: 100px;
        border-radius: 10px;
        background-image: url("${pageContext.request.contextPath}/resources/images/photo.png");
        position: relative;
        z-index: 9999;
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center;
    }
    .table-form .thumbnail-viewer img {
        width: 32px;
        height: 32px;
    }
    .table-form .img-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, 54px);
        grid-gap: 2px;
    }
    .table-form .img-grid .item {
        object-fit: cover;
        width: 50px;
        height: 50px;
        border-radius: 10px;
        border: 1px solid #c2c2c2;
        cursor: pointer;
    }
</style>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/eventwritemanage.css">

<script type="text/javascript">
    function isValidDateFormat(data){
        if(data.length !== 8 && data.length !== 10) return false;

        let p = /(\.)|(\-)|(\/)/g;
        data = data.replace(p, "");
        if(data.length !== 8) return false;

        let format = /^[12][0-9]{7}$/;
        if(!format.test(data)) return false;

        let y = parseInt(data.substr(0, 4));
        let m = parseInt(data.substr(4, 2));
        let d = parseInt(data.substr(6));

        if(m < 1 || m > 12) return false;
        let lastDay = (new Date(y, m, 0)).getDate();
        if(d < 1 || d > lastDay) return false;

        return true;
    }

    function check() {
        const f = document.eventForm;
        let mode = "${mode}";

        let str = f.subject.value;
        if(!str) {
            alert("제목을 입력하세요.");
            f.subject.focus();
            return false;
        }

        if(!isValidDateFormat(f.sday.value)) {
            alert("날짜를 입력하세요.");
            f.sday.focus();
            return false;
        }

        if(!/^[0-2][0-9]:[0-5][0-9]$/.test(f.stime.value)) {
            alert("시간을 입력하세요.");
            f.stime.focus();
            return false;
        }

        if(!isValidDateFormat(f.eday.value)) {
            alert("날짜를 입력하세요.");
            f.eday.focus();
            return false;
        }

        if(!/^[0-2][0-9]:[0-5][0-9]$/.test(f.etime.value)) {
            alert("시간을 입력하세요.");
            f.etime.focus();
            return false;
        }

        let sd = new Date(f.sday.value + " " + f.stime.value);
        let ed = new Date(f.eday.value + " " + f.etime.value);

        if(sd.getTime() >= ed.getTime()) {
            alert("시작날짜는 종료날짜보다 크거나 같을 수 없습니다.");
            f.sday.focus();
            return false;
        }

        if(mode === "write" && new Date().getTime() > ed.getTime()) {
            alert("종료날짜는 현재 시간보다 작을 수 없습니다.");
            f.eday.focus();
            return false;
        }

        str = f.content.value;
        if(!str || str === "<p><br></p>") {
            alert("내용을 입력하세요.");
            f.content.focus();
            return false;
        }

        if(mode === "write" && !f.selectEventFile.value) {
            alert("이미지 파일을 추가 하세요.");
            f.selectEventFile.focus();
            return false;
        }

        f.action = "${pageContext.request.contextPath}/admin/event/" + mode;
        f.submit();

        return true;
    }
</script>
<body>
<div class="body-container">
    <div class="body-title">
        <h2><i class="fa-regular fa-calendar"></i> 이벤트 등록 </h2>
    </div>

    <div class="body-main">
        <div id="tab-content" style="padding: 15px 10px 5px; clear: both;">
            <form name="eventForm" method="post" enctype="multipart/form-data">
                <table class="table table-border border-top2 table-form">
                    <tr>
                        <td>제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
                        <td>
                            <input type="text" name="subject" maxlength="100" class="form-control" value="${dto.subject}">
                        </td>
                    </tr>

                    <tr>
                        <td>시작일자</td>
                        <td>
                            <input type="date" name="sday" class="form-control" value="${dto.sday}">
                            <input type="time" name="stime" class="form-control" value="${dto.stime}">
                        </td>
                    </tr>

                    <tr>
                        <td>종료일자</td>
                        <td>
                            <input type="date" name="eday" class="form-control" value="${dto.eday}">
                            <input type="time" name="etime" class="form-control" value="${dto.etime}">
                        </td>
                    </tr>

                    <tr>
                        <td valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
                        <td valign="top">
                            <textarea name="content" id="ir1" class="form-control">${dto.content}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">썸네일</td>
                        <td>
                            <div class="thumbnail-viewer"></div>
                            <input type="file" name="thumbnailFile" accept="image/*" class="form-control" style="display: none;">
                        </td>
                    </tr>
                    <tr>
                        <td>첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
                        <td>
                            <input type="file" name="selectEventFile" class="form-control" multiple>
                        </td>
                    </tr>
                    <c:if test="${mode=='update'}">
                        <c:forEach var="vo" items="${listFile}">
                            <tr>
                                <td>첨부된파일</td>
                                <td>
                                    <span class="delete-file" data-fileNum="${vo.fileNum}"><i class="fa-solid fa-trash-can"></i></span>
                                    ${vo.originalFilename}
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>
                </table>

                <table class="table">
                    <tr>
                        <td align="center">
                            <button type="button" class="btn btn-dark" onclick="submitContents(this.form);">${mode=='update'?'수정완료':'등록하기'}</button>
                            <button type="reset" class="btn">다시입력</button>
                            <button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/admin/event/list';">${mode=='update'?'수정취소':'등록취소'}</button>
                            <c:if test="${mode=='update'}">
                                <input type="hidden" name="num" value="${dto.num}">
                                <input type="hidden" name="page" value="${page}">
                            </c:if>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>

<c:if test="${mode=='update'}">
    <script type="text/javascript">
        $('.delete-file').click(function(){
            if(!confirm('선택한 파일을 삭제 하시겠습니까?')) {
                return false;
            }

            let $tr = $(this).closest('tr');
            let fileNum = $(this).attr('data-fileNum');
            let url = '${pageContext.request.contextPath}/admin/eventManage/deleteFile';

            $.ajaxSetup({ beforeSend: function(e) { e.setRequestHeader('AJAX', true); } });
            $.post(url, {fileNum:fileNum}, function(data){
                $($tr).remove();
            }, 'json').fail(function(){
                alert('error');
            });
        });
    </script>
</c:if>
</body>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/vendor/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "ir1",
    sSkinURI: "${pageContext.request.contextPath}/resources/vendor/se2/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
});

function submitContents(elClickedObj) {
    oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
    try {
        if(!check()) {
            return;
        }

        elClickedObj.submit();

    } catch(e) {
    }
}
</script>

<script type="text/javascript">
// 대표(썸네일) 이미지
$(function(){
    var img = "${dto.thumbnail}";
    if(img) {
        img = "${pageContext.request.contextPath}/uploads/product/" + img;
        $(".table-form .thumbnail-viewer").empty();
        $(".table-form .thumbnail-viewer").css("background-image", "url(" + img + ")");
    }

    $(".table-form .thumbnail-viewer").click(function(){
        $("input[name=thumbnailFile]").trigger("click");
    });

    $("input[name=thumbnailFile]").change(function(){
        let file = this.files[0];

        if(!file) {
            $(".table-form .thumbnail-viewer").empty();

            if(img) {
                img = "${pageContext.request.contextPath}/uploads/product/" + img;
            } else {
                img = "${pageContext.request.contextPath}/resources/images/photo.png";
            }
            $(".table-form .thumbnail-viewer").css("background-image", "url(" + img + ")");

            return false;
        }

        if(!file.type.match("image.*")) {
            this.focus();
            return false;
        }

        var reader = new FileReader();
        reader.onload = function(e) {
            $(".table-form .thumbnail-viewer").empty();
            $(".table-form .thumbnail-viewer").css("background-image", "url(" + e.target.result + ")");
        };
        reader.readAsDataURL(file);
    });
});
</script>
