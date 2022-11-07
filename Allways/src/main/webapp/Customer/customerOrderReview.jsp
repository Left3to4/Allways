<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
rel="stylesheet"
integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
crossorigin="anonymous">

<style>

#write_button {

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

#search_button {

	box-sizing: border-box;
	width: 73px;
	height: 35px;
	font-family: 'Baloo Tammudu 2';
	font-style: normal;
	font-weight: 600;
	font-size: 14px;
	line-height: 32px;
	align-items: center;
	text-align: center;
	color: #766262;

	width: 60px;
	height: 25px;
	background: #FBEAEA;
	border: 0.7px solid #000000;
	border-radius: 30px;

}

</style>

<script type="text/javascript">

function review() {
	var form = document.radioButton;
	form.method = "post";
	form.action = "customerOrdersReview.do";
}

function writerReview() {
	var form = document.radioButton;
	form.action = "customerWriteReview.jsp";
	form.submit();
}


</script>

</head>
<body>

<%@include file="customerHeader.jsp" %>

	<div align="center">
		<%@include file = "includeButtons.jsp" %>
	</div>
	
	<div style = "margin-left: 250px; margin-top: 100px;">
	
		<form name = "radioButton" method = "post">
		<button style = "margin-left: -160px;" id="write_button" onclick = "writerReview()">Write Review</button>
	
			&nbsp;
			<c:choose>
				<c:when test="${checkRadio eq 'oreviewInitdate'}">
					<div class="form-check form-check-inline" id="select">
						<input class="form-check-input" type="radio" name="radio" id="labelClick1" value = "oreviewInitdate" checked />
						<label class="form-check-label" for="labelClick1">
						Newest
						</label>
					</div>
				</c:when>
			
				<c:otherwise>
					<div class="form-check form-check-inline" id="select">
						<input class="form-check-input" type="radio" name="radio" id="labelClick1" value = "oreviewInitdate" />
						<label class="form-check-label" for="labelClick1">
						Newest
						</label>
					</div>
				</c:otherwise> 
			</c:choose> 
			&nbsp;
			<c:choose>
				<c:when test="${checkRadio eq 'oreviewStarrating'}">
					<div class="form-check form-check-inline" id="select">
						<input class="form-check-input" type="radio" name="radio" id="labelClick2" value = "oreviewStarrating" checked />
						<label class="form-check-label" for="labelClick2">
						Star Rating
						</label>
					</div>
				</c:when>
			
				<c:otherwise>
					<div class="form-check form-check-inline" id="select">
						<input class="form-check-input" type="radio" name="radio" id="labelClick2" value = "oreviewStarrating" />
						<label class="form-check-label" for="labelClick2">
						Star Rating
						</label>
					</div>
				</c:otherwise>
			</c:choose> 
			
			<button id="search_button">Sort</button>
			<select style = "margin-left: 480px;" name = "combo">
				<option value = "or_customerId">작성자</option>
				<option value = "oreviewContent">내용</option>
			</select>
			<input type = "text" name = "searchContent" size = "20"> &nbsp;
			<button id="search_button">Search</button>
			
		</form>
	</div>
				
	<div align="center" class="container text-center">
		<form action = "" name = "list" method = "post">
			<table class="table">
				
				<thead>
					<tr>
						<th>No</th>
						<th>내용</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				
		<c:forEach var = "dto" items="${reviewList }" begin="${(index - 1) * rowcount }" end="${(index) * rowcount - 1}">
			<c:if test="${dto != null }">
				<tbody>
					<tr>
						<td>${dto.oreviewId }</td>
						<td>${dto.oreviewContent }</td>
						<td>${dto.or_customerId }</td>
						<td>${dto.oreviewInitdate }</td>
					</tr>
				</tbody>
			</c:if>
		</c:forEach>
				
			</table>
		</form>
		
		
		<a href="customerOrdersReview.do?index=1&radio=${checkRadio }">처음으로</a>
		
		<c:if test="${index != 1 }">
			<a href="customerOrdersReview.do?index=${index-1 }&radio=${checkRadio }">이전</a>
		</c:if>
		
		<c:forEach var="cnt" begin="${pagecount * pagepage + 1}" end="${pagecount * (pagepage + 1)}">
			<c:if test="${cnt <= Math.ceil(arrsize / rowcount) }">
				<c:if test="${cnt == index }">
					<span style="display:inline">
						<a href="customerOrdersReview.do?index=${cnt }&radio=${checkRadio }" style="font-size:1.3em">${cnt }</a>
					</span>
				</c:if>
				
				<c:if test="${cnt != index }">
					<a href="customerOrdersReview.do?index=${cnt }&radio=${checkRadio }" style="font-size:0.9em">${cnt }</a>
				</c:if>
			</c:if>
		</c:forEach>
	
	<c:if test="${index < Math.ceil(arrsize / rowcount) }">
		<a href="customerOrdersReview.do?index=${index+1 }&radio=${checkRadio }">다음</a>
	</c:if>
	
	<a href="customerOrdersReview.do?index=${Math.ceil(arrsize / rowcount) }&radio=${checkRadio }">끝으로</a>
		
	</div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
crossorigin="anonymous"></script>
</body>
</html>