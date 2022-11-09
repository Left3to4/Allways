<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="customerHeader.jsp"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Baloo+Tammudu+2:wght@700&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
</head>
<body>

<br>
<div align="center">
	<h2 id="page_name">Order</h2>
</div>
<div align="center">
<hr id="line3"><br>
</div>

<div align="center">
	<table>
		<tr align="center">
			<th width="220px">An Optional Feature</th>
			<th width="100px">Quantity</th>
			<th width="120px">Price</th>
			<th width="120px">Date</th>
		</tr>
		<tr align="center">
			<td>Cherry Fruits Cake</td>
			<td>1</td>
			<td>￦52,000</td>
			<td>2022-11-11</td>
		</tr>
	</table>
</div><br>

<div align="center" style="padding-right: 190px;">
	<table>
		<tr>
			<td>Orderer Name</td>
			<td><input type="text"></td>
		</tr>
		<tr>
			<td>Orderer Phone</td>
			<td><input type="text"></td>
		</tr>
		<tr>
			<td>Orderer Email</td>
			<td><input type="text"></td>
		</tr>
		<tr>
			<td>Orderer Address</td>
			<td><input type="text"></td>
		</tr>
	</table>
</div><br>


<div align="center" style="padding-right: 350px;">
	<table>
		<tr align="center">
			<td colspan="2">Payment Method</td>
		</tr>
		<tr>
			<td><input type="radio" name="payment"></td>
			<td>Credit Card</td>
		</tr>
		<tr>
			<td><input type="radio" name="payment"></td>
			<td>KakaoPay</td>
		</tr>
		<tr>
			<td><input type="radio" name="payment"></td>
			<td>NaverPay</td>
		</tr>
		<tr>
			<td><input type="radio" name="payment"></td>
			<td>PAYCO</td>
		</tr>
		<tr>
			<td><input type="radio" name="payment"></td>
			<td>Deposit</td>
		</tr>

	</table>
</div>

<div align="center" style="padding-left: 180px;">
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
		<tr align="center">
			<td><input type="button" value="Go Shopping" style="width: 150px;"></td>
			<td><input type="button" value="Buy Now" style="width: 150px;"></td>
		</tr>
	</table>
</div>

</body>
</html>