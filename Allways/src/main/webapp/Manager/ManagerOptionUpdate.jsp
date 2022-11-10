<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" 
rel="stylesheet" 
integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" 
crossorigin="anonymous">
</head>
<body>
<%@include file="managerHeader.jsp"%>
<script type="text/javascript">
function Return(){
		var upd = document.upd;
		upd.action="return.do";
		upd.submit();
		}
function Update(){
		var upd = document.upd;
		var Cek = upd.ko.value;
		console.log(Cek);
		if(Cek == 1){
			upd.action="Update.do";
			upd.method = "post";
			alert("수정이 완료되었습니다");
			upd.submit();
			return;
		}else if(Cek == 2){
			alert("사용 불가능한 아이디 입니다.");
			return;
		}else{
			alert("중복체크해주세요");
			return;
		}
}
function Delete(){
		var upd = document.upd;
		upd.action="MO_Delete.do";
		alert("삭제가 완료되었습니다");
		upd.submit();
		}
function CHECKOPTION(){
		var upd = document.upd;
		upd.action="OUpdateCheck.do";
		upd.submit();

}
function previewFile() {
	  var preview = document.querySelector('img#preview');
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


<h1 align="center">옵션 관리</h1>

	<form method="post"  enctype="multipart/form-data" name ="upd">
	<div align="center">
	<table border="0">
	<tr>
	<td>
카테고리 :
	<select name="option" >
	<c:if test="${check == null }">
		<option value="${cake_option.cakeoptionCategory}">${cake_option.cakeoptionCategory}</option>
	</c:if>
	<c:if test="${check == true }">
		<option value="${option}">${option}</option>
	</c:if>
	<c:if test="${check == false }">
		<option value="${option}">${option}</option>
	</c:if>
		<option value="size">size</option>
		<option value="IcingColor">IcingColor</option>
		<option value="BorderColor">BorderColor</option>
		<option value="Flavor">Flavor</option>
		<option value="MassageColor">MassageColor</option>
		<option value="Box">Box</option>
	</select></td>
	<tr>
		<td>CAKE ID :
		<input type="hidden" name="optionId" value="${cake_option.cakeoptionId}" readonly/>
		<c:if test="${check == null }">
		<input type="text" name="optionId" value="${cake_option.cakeoptionId}" readonly/></c:if>
		<c:if test="${check == true }">
		<input type="text" name="optionId" value="${optionId}" readonly/></c:if>
		<c:if test="${check == false }">
		<input type="text" name="optionId" value="${optionId}" readonly/></c:if>
		</td>
	</tr>
	
	<tr>
		<td>옵션 이름 :
			<input type="hidden" name="optionName" value="${cake_option.cakeoptionValue}" >
		<c:if test="${check == null }">
			<input type="hidden" name="ko" value="0"/>
			<input type="text" name="optionName" value="${cake_option.cakeoptionValue}" ></c:if>
		<c:if test="${check == true }">
			<input type="hidden" name="ko" value="2"/>
			<input type="text" name="optionName" value="${optionName}" >
				<br>
				<span style = " font-size:1.0em;  color: red;"> 사용 불가능한 이름 입니다</span></c:if>
		<c:if test="${check == false }">
			<input type="hidden" name="ko" value="1"/>
			<input type="text" name="optionName" value="${optionName}" >
		 		<br>
		 		<span style = " font-size:1.0em;  color: blue;"> 사용 가능한 이름 입니다</span></c:if>
		</td>
	</tr>
	<tr>
		<td>가격 이름 :
		<input type="hidden" name="optionPrice" value="${cake_option.cakeoptionPrice}" >
		<c:if test="${check == null }">
		<input type="text" name="optionPrice" value="${cake_option.cakeoptionPrice}" ></c:if>
		<c:if test="${check == true }"> 
		<input type="text" name="optionPrice" value="${optionPrice}" ></c:if>
		<c:if test="${check == false }"> 
		<input type="text" name="optionPrice" value="${optionPrice}" ></c:if>
		</td>
	</tr>
	<tr>
		<td>
			<input type="button" value="돌아가기" onclick="Return()">
			<input type="button" value="중복체크" onclick="CHECKOPTION()">
			<input type="button" value="수정" onclick="Update()">
			<input type="button" value="삭제" onclick="Delete()">
		</td>
	</tr>
	</table>
	</div>
	<div align="left" style="width:74%;display:inline-block">
				<input type="file" name="cakeoptionImage" onchange="previewFile(event)">
		</div>
		<div style="display:inline-block;width:30%;height:50%" align="center">
		<div>
			사진 미리보기
		</div>
		<div>
		<c:if test="${check == null }"> 
		<img src="/Allways/${cake_option.cakeoptionImage}" id="preview" height="200" width="200" style="display:block;margin:20px;border-radius:10px;">
			<input type="hidden" name="cakeoptionImage" value="${cake_option.cakeoptionImage}">
		</c:if>
		<c:if test="${check == true }"> 
		<img src="/Allways/${cakeoptionImage}" id="preview" height="200" width="200" style="display:block;margin:20px;border-radius:10px;">
			<input type="hidden" name="cakeoptionImage" value="${cakeoptionImage}">
		</c:if>
		<c:if test="${check == false }"> 
		<img src="/Allways/${cakeoptionImage}" id="preview" height="200" width="200" style="display:block;margin:20px;border-radius:10px;">
			<input type="hidden" name="cakeoptionImage" value="${cakeoptionImage}">	
		</c:if>
		</div>
	</div>
		
	</form>
		
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" 
crossorigin="anonymous">
</script>
</body>
</html>