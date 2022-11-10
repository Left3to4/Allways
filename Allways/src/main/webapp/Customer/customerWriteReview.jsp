<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰작성 페이지</title>

<style type="text/css">

#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform fieldset legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewContents {
	width: 346px;
	height: 205px;
    border: 3px solid #FBEAEA;
    padding: 10px;
    box-sizing: border-box;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}

#writeButton {

	width: 115px;
	height: 45px;
	
	font-family: 'Baloo Tammudu 2';
	font-style: normal;
	font-weight: 700;
	font-size: 14px;
	line-height: 32px;
	align-items: center;
	text-align: center;
	
	color: #766262;
	width: 145px;
	height: 55px;
	
	background: #FBEAEA;
	border: 0.7px solid #000000;
	border-radius: 70px;

}
div {
    width: 100%;
    height: 300px;
}
div.left {
    width: 50%;
    float: left;
    
}
div.right {
    width: 50%;
    float: right;
    
}
</style>


<link href="/assets/css/star.css" rel="stylesheet"/>

<script type="text/javascript">

function writeReview() {
	var form = document.myform;
	form.method = "post";
	form.action = "customerWriteReview.do";
}

function previewFile() {
	  var preview = document.querySelector('img');
	  var file = document.querySelector('input[type=file]').files[0];
	  var reader = new FileReader();

	  reader.addEventListener(
	    'load',
	    function () {
	      preview.src = reader.result;
	    },
	    false
	  );

	  if (file) {
	    reader.readAsDataURL(file);
	  }
}

</script>
</head>
<body>

	<form class="mb-3" name="myform" id="myform" method="post" enctype="multipart/form-data">
	
		<div>
		
			<div class="left" style = "margin-left:200px; margin-top: 100px;">
				<img src="" height="400" alt="이미지 미리보기..."><br>
				<input type="file" name="cakeviews" onchange="previewFile(event)">
			</div>
			
			<div class="right" style = "margin-top: -300px;">
			
				<input type = "hidden" name = "ordersId" value = "<%=request.getParameter("ordersId")%>">
			
				<fieldset>
					<span class="text-bold">별점을 선택해주세요</span>
					<input type="radio" name="oreviewStarRating" value="5" id="rate1"><label for="rate1">★</label>
					<input type="radio" name="oreviewStarRating" value="4" id="rate2"><label for="rate2">★</label>
					<input type="radio" name="oreviewStarRating" value="3" id="rate3"><label for="rate3">★</label>
					<input type="radio" name="oreviewStarRating" value="2" id="rate4"><label for="rate4">★</label>
					<input type="radio" name="oreviewStarRating" value="1" id="rate5"><label for="rate5">★</label>
				</fieldset>
				
				<textarea class="col-auto form-control" id="reviewContents" name = "oreviewContent"
						  placeholder="리뷰 내용을 작성하세요."></textarea>
			</div>
			
		</div>
		
		<button style = "margin-left:800px; margin-top: 20px;" id="writeButton" onclick = "writeReview()">Writer Review</button>
		
			
	</form>

</body>
</html>