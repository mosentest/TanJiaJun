<%@ page contentType="text/html; charset=utf-8" language="java"  errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.util.ShoppingCartUtil" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.TAllorderdetail" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/main.css"/>

<title>无标题文档</title>
<script language="javascript">
	function selChange(){
	    var opt = document.getElementById("ordertype").selectedIndex;
	    document.getElementById("reason").style.display = opt==="2"?'none':'';
	}
</script>
<%
List<TAllorderdetail> allorderdetails = ShoppingCartUtil.getCartInfo(session);
int countOrder = ShoppingCartUtil.getCountCartInfo(session);
//显示购物车信息
request.setAttribute("allorderdetails", allorderdetails);
request.setAttribute("countOrder", countOrder);
%>
</head>

<body>
<s:debug></s:debug>
<div id="title_bar">
	<span id="title" >系统管理&gt;&gt;入库管理&gt;&gt;添加入库单</span>
</div>
<div align="center">
	<s:form action="Allorder_Add" method="post">
			<tr>
				<td bgcolor="#A0A0A0"></td>
			</tr>
			<tr>
				<td height="40" class="font42">
					<table width="600px" border="0" align="center" cellpadding="4"
						cellspacing="1" bgcolor="#DDD" class="newfont03" id="tblist" /></td>
			</tr>
			<tr>
				<td height="20" colspan="13" align="center" bgcolor="#EEEEEE"
					class="tablestyle_title" style="text-align: center;"><b>添加入库单信息</b></td>
			</tr>
			<tr>
				<td>
					<table width="95%" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td height="40" class="font42">
								<table width="100%" border="0" align="center" cellpadding="4"
									cellspacing="1" bgcolor="#DDD" class="newfont03" id="tblist">
									<tr>
										<td><s:textfield name="allorder.ordercode" label="单号" /></td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td><s:textfield name="allorder.paytype" label="结算方式" /></td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
					                    <td align="center">
					                    <s:select name="allorder.ordertype" label="单据类型"   headerKey="1"
					    	 			list="#{1:'采购单',2:'退货单'}" listKey="key"  listValue="value" headerValue="-- 请选择 --"
					    	 			onchange="selChange()"  id="ordertype">
					    				</s:select></td>
					    				<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td><s:textarea name="allorder.orderreason" label="入库原因"  id="reason"/></td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td><a href="Allorderdetailadd"target="_self"/>添加药品</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td><b>本单总价:&nbsp;<span style="color: red;">${countOrder}</span>&nbsp;元</b></td>
									</tr>
									<table id="list_table">
											<tr>
											<th>药品</th>
											<th>供应商</th>
											<th>单价</th>
											<th>数量</th>
											<th>总价</th>
											<th>操作</th>
										 	</tr>
										<s:iterator value="#request.allorderdetails">
											<tr>
											<td ><s:property value="TMedicine.name" /></td>
											<td ><s:property value="TProducter.name" /></td>
											<td ><s:property value="price" /></td>
											<td ><s:property value="num" /></td>
											<td ><s:property value="sum" /></td>
											<td ><a href="Allorder_remove.action?sessionName=<%=ShoppingCartUtil.getCurrentUserName(session)+","%><s:property value="TMedicine.id"/><%=","%><s:property value="TProducter.id"/>">删除</a></td>
											</tr>
										</s:iterator>
									</table>
									<tr>
										<s:submit align="center" value="添加" />
										<s:reset align="center" value="重置" />
									</tr>
								</table></td>
						</tr>
					</table></td>
			</tr>
		</s:form>
</div>
</body>
</html>
