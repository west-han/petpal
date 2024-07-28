<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>

* { padding: 0; margin: 0; }

*, *::after, *::before { box-sizing: border-box; }

.body-container2 {
	max-width: 1300px;
	padding: 50px 50px;
	font-size: 15px;
	color: #434347;
}

form td {
	padding-left: 30px !important;
	padding-right: 30px !important;
}

.title {
	font-size: 23px;
	padding-bottom: 30px;
	border-bottom: 3px solid #BDBDBD;
}

.img-grid img {
	width: 50px;
	height: 50px;
}

.con-title {
	padding-top: 15px !important;
}

.form-select {
	width: 200px;
}

.form-control-plaintext {
	padding-left: 10px;
}

.img-add:hover {
	cursor: pointer;
}

.cancel-btn {
	background: #BDBDBD;
	color: white;
}

.send-btn {
	background: #E4B075;
	color: white;
}

</style>

<script type="text/javascript">
function sendOk() {
    const f = document.myForm;
	let str;
	
    str = f.subject.value.trim();
    if(!str) {
        alert("제목을 입력하세요. ");
        f.subject.focus();
        return;
    }

    str = f.content.value.trim();
    if(!str) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return;
    }

    f.action = "${pageContext.request.contextPath}/onetoone/${mode}";
    f.submit();
}
</script>

<script type="text/javascript">
$(function(){
	var sel_files = [];
	
	$(".write-form").on("click", ".img-add", function(event){
		$("form[name=myForm] input[name=selectFile]").trigger("click"); 
	});
	
	$("form[name=myForm] input[name=selectFile]").change(function(){
		if(! this.files) {
			let dt = new DataTransfer();
			for(let f of sel_files) {
				dt.items.add(f);
			}
			document.myForm.selectFile.files = dt.files;
			
	    	return false;
	    }
	    
        for(let file of this.files) {
        	sel_files.push(file);
        	
            const reader = new FileReader();
			const $img = $("<img>", {class:"item img-item"});
			$img.attr("data-filename", file.name);
            reader.onload = e => {
            	$img.attr("src", e.target.result);
            };
			reader.readAsDataURL(file);
            
            $(".img-grid").append($img);
        }
		
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		document.myForm.selectFile.files = dt.files;		
	    
	});
	
	$(".write-form").on("click", ".img-item", function(event) {
		if(! confirm("선택한 파일을 삭제 하시겠습니까 ?")) {
			return false;
		}
		
		let filename = $(this).attr("data-filename");
		
	    for(let i = 0; i < sel_files.length; i++) {
	    	if(filename === sel_files[i].name){
	    		sel_files.splice(i, 1);
	    		break;
			}
	    }
	
		let dt = new DataTransfer();
		for(let f of sel_files) {
			dt.items.add(f);
		}
		document.myForm.selectFile.files = dt.files;
		
		$(this).remove();
	});
});

</script>

<div>
	<div class="container">	
		<div class="body-container2">
			<div class="title">1:1 문의</div>
			
			<form name="myForm" method="post" enctype="multipart/form-data">
				<table class="table write-form">
					<tr>
						<td class="col-sm-2 con-title" scope="row">문의유형</td>
						<td>
							<select name="classNum" class="form-select">
								<option value="1" >회원정보 문의</option>
								<option value="2" >주문/결제 문의</option>
								<option value="3" >상품 문의</option>
								<option value="4" >배송 문의</option>
								<option value="5" >교환/반품 문의</option>
								<option value="6" >이벤트/혜택 문의</option>
								<option value="7" >서비스 개선 문의</option>
								<option value="8" >기타 문의</option>
							</select>
						</td>
					</tr>
				
					<tr>
						<td class="col-sm-2 con-title" scope="row">제 목</td>
						<td>
							<input type="text" name="subject" class="form-control" value="">
						</td>
					</tr>
        
					<tr>
						<td class="col-sm-2 con-title" scope="row">작성자명</td>
 						<td>
							<p class="form-control-plaintext">${sessionScope.member.userName}</p>
						</td>
					</tr>

					<tr>
						<td class="col-sm-2 con-title" scope="row">내 용</td>
						<td>
							<textarea name="content" class="form-control" rows="10"></textarea>
						</td>
					</tr>
					<tr>
						<td class="col-sm-2 con-title" scope="row">첨부파일</td>
						<td>
							<div class="img-grid"><img class="item img-add rounded" src="${pageContext.request.contextPath}/resources/images/add_photo.png"></div>
							<input type="file" name="selectFile" accept="image/*" multiple style="display: none;" class="form-control">
						</td>
					</tr>
				</table>
				
				<table class="table table-borderless">
 					<tr>
						<td class="text-center">
							<button type="button" class="btn send-btn" onclick="sendOk();">등록하기</button>
							<button type="button" class="btn cancel-btn" onclick="location.href='${pageContext.request.contextPath}/onetoone/list';">등록취소</button>
							<!-- 
							<c:if test="${mode=='update'}">
								<input type="hidden" name="num" value="${dto.num}">
								<input type="hidden" name="page" value="${page}">
							</c:if>
							 -->
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>	
</div>		