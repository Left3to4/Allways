<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Cart</title>

<script type="text/javascript">

function mySubmit(index){
	var form = document.detail;
	if (index == 1) {
		form.action = "customerCartSelectDelete.do";
	}
	if (index == 2) {
		form.action = "customerCakeList.do";
	}
	if (index == 3) {
		form.action = "customerOrderPage.do";
	}
		form.submit();
}

</script>

<%@include file="customerHeader.jsp"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Baloo+Tammudu+2:wght@700&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<style type="text/css">
#page_name{
font-family: 'Baloo Tammudu 2';
font-style: normal;
font-weight: 700;
font-size: 50px;
line-height: 115px;
color: #E75151;
}

#line3{
width: 500px;
height: 0px;
border: 2px solid #FECACA;
}

#line4{
width: 400px;
height: 0px;
border: 2px solid #FECACA;
}

#delete_box{
width: 136.55px;
height: 41.63px;
background: #EF8C8C;
border: 2px solid #EF8C8C;

font-family: 'Baloo Tammudu 2';
font-style: normal;
font-weight: 700;
font-size: 24px;
line-height: 50px;
align-items: center;
text-align: center;
text-transform: capitalize;
color: #FFFDFD;
}

#util_box{
width: 160px;
height: 41.63px;
background: #EF8C8C;
border: 2px solid #EF8C8C;

font-family: 'Baloo Tammudu 2';
font-style: normal;
font-weight: 700;
font-size: 24px;
line-height: 50px;
align-items: center;
text-align: center;
text-transform: capitalize;
color: #FFFDFD;
}
</style>
</head>
<body>
<br>
<div align="center">
	<h2 id="page_name">Cart</h2>
</div>
<div align="center">
<hr id="line3"><br>
</div>

<div align="center">
<form action="" name ="detail" method="get">

	<table>
		<tr align="center">
			<th width="50px">cb</th>
			<th width="350px">An Optional Feature</th>
			<th width="100px">Quantity</th>
			<th width="120px">Price</th>
			<th>Delete</th>
		</tr>
		
	<c:forEach var = "dto" items="${cartList }">
	
		<tr align="center">
			<td><input type="checkbox" name="ordersId" value="${dto.ordersId }"></td>
			<td>${dto.cakeName }</td>
			<td>${dto.ordersQuantity }</td>
			<td>￦ <fmt:formatNumber value="${dto.ordersSalePrice}"/></td>
			<td><a href="/Allways/Customer/customerCartDelete.do?ordersId=${dto.ordersId }">X</a></td>
		</tr>
		
		<c:forEach var = "dto" items="${optionList }">
		
			<tr align="center">
				<td></td>
				<td>
					<label style = "font-style: italic; font-weight: bold;">${dto.cakeoptionCategory } : &nbsp;</label>
					 ${dto.cakeoptionValue }
					<label style = "font-style: italic; font-weight: bold;">Price : &nbsp;</label>￦ <fmt:formatNumber value="${dto.cakeoptionPrice}"/> 
				</td>
			</tr>
			
		</c:forEach>
		
		<c:forEach var = "dto" items="${optionList }" begin="1" end="1">
		
			<tr align="center">
				<td></td>
				<td><label style = "font-style: italic; font-weight: bold;"> Lettering : &nbsp;</label>${dto.detailoptionLettering }</td>
			</tr>
			
		</c:forEach>		
		
	</c:forEach>
	
		<tr align="center">
			<td><button type = "button" id="util_box" onclick = "mySubmit(1)">Delete</button></td>
			<td colspan="3"><button type = "button" id="util_box" onclick = "mySubmit(2)">Go Shopping</button></td>
			<td><button type = "button" id="util_box" onclick = "mySubmit(3)">Buy Now</button></td>
		</tr>
	</table>
</form>
</div><br>

 


 
<!-- <div align="center" style="padding-left: 350px;">
	<table>
 		<tr align="center">
			<td style="width: 150px;">
				Total Quantity
			</td>
			<td style="width: 50px;">
				3
			</td>
		</tr>
		<tr align="center">
			<td style="width: 150px;">
				Total Price
			</td>
			<td style="width: 100px;">
				￦52,000
			</td>
		</tr>
		<tr align="center">
			<td colspan="2"><hr id="line4"></td>

		</tr> 
	</table>
</div> -->
</body>
</html>