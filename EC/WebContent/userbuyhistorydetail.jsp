<%@	page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="beans.BuyDataBeans" %>
<%@ page import="beans.BuyDetailDataBeans" %>
<%@ page import="beans.ItemDataBeans" %>
<%@ page import="dao.ItemDAO"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購入履歴詳細</title>
<jsp:include page="/baselayout/head.html" />
</head>
<body>
	<jsp:include page="/baselayout/header.jsp" />
	<br>
	<br>
	<div class="container">
		<div class="row center">
			<h4 class=" col s12 light">購入詳細</h4>
		</div>
		<!--  購入 -->
		<div class="row">
			<div class="col s10 offset-s1">
				<div class="card grey lighten-5">
					<div class="card-content">
						<table>
							<thead>
								<tr>
									<th class="center" style="width: 20%;">購入日時</th>
									<th class="center">配送方法</th>
									<th class="center" style="width: 20%">合計金額</th>
								</tr>
							</thead>
							<tbody>

								<%
								BuyDataBeans bdb = (BuyDataBeans)request.getAttribute("bdb");
								%>
								<tr>
									<td class="center"><%=bdb.getFormatDate() %></td>
									<td class="center"><%=bdb.getDeliveryMethodName() %></td>
									<td class="center"><%=bdb.getTotalPrice() %>円</td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- 詳細 -->
		<div class="row">
			<div class="col s10 offset-s1">
				<div class="card grey lighten-5">
					<div class="card-content">
						<table class="bordered">
							<thead>
								<tr>
									<th class="center">商品名</th>
									<th class="center" style="width: 20%">単価</th>
								</tr>
							</thead>
							<tbody>

								<%
								ArrayList<BuyDetailDataBeans> buyDetailList = (ArrayList<BuyDetailDataBeans>)request.getAttribute("buyDetailList");
								for(int i = 0;i < buyDetailList.size();i++){
								ItemDataBeans idb = ItemDAO.getItemByItemID(buyDetailList.get(i).getItemId());
								%>
								<tr>
									<td class="center"><%=idb.getName()%></td>
									<td class="center"><%=idb.getPrice()%>円</td>
								</tr>
								<%
								}
								%>

								<tr>
									<td class="center"><%=bdb.getDeliveryMethodName()%></td>
									<td class="center"><%=bdb.getDeliveryMethodPrice()%>円</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/baselayout/footer.jsp" />
</body>
</html>