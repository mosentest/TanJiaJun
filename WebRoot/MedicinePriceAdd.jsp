<%@ page contentType="text/html; charset=utf-8" language="java"  errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="laydate/laydate.js"></script>
<link rel="stylesheet" type="text/css" href="css/main.css"/>

<title>无标题文档</title>
</head>

<body>
<div id="title_bar">
		<s:if test='type=="price"'>
		<span id="title">系统管理&gt;&gt;药品价格管理&gt;&gt;添加药品价格</span>
		</s:if>
		 <s:elseif test='type=="date"'>
		<span id="title">系统管理&gt;&gt;药品有效期管理&gt;&gt;添加药品有效期</span>
		</s:elseif>
</div>
<div align="center">
	<s:form action="MedicinePrice_Add" method="post">
			<tr>
				<td bgcolor="#A0A0A0"></td>
			</tr>
			<tr>
				<td height="40" class="font42">
					<table width="600px" border="0" align="center" cellpadding="4"
						cellspacing="1" bgcolor="#DDD" class="newfont03" id="tblist" /></td>
			</tr>
			<tr>
						<s:if test='type=="price"'>
						<td height="20" colspan="13" align="center" bgcolor="#EEEEEE"
							class="tablestyle_title" style="text-align: center;"><b>添加药品价格</b></td>
						</s:if>
						<s:elseif test='type=="date"'>
						<td height="20" colspan="13" align="center" bgcolor="#EEEEEE"
							class="tablestyle_title" style="text-align: center;"><b>添加药品有效期</b></td>
						</s:elseif>
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
										<td colspan="5">以下带*为必填项：</td>
									</tr>
								   <tr>
					                    <td align="center">
					                    <s:select name="medicineprice.TMedicine.id" label="*药品名"   headerKey="1"
					    	 			list="medicines"  listKey="id"  listValue="name" headerValue="-- 请选择 --">
					    				</s:select></td>
					    				<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
                                   </tr>
                                    <tr>
					                    <td align="center">
					                    <s:select name="medicineprice.TProducter.id" label="*供应商"   headerKey="1"
					    	 			list="producters"  listKey="id"  listValue="name" headerValue="-- 请选择 --">
					    				</s:select></td>
					    				<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
                                   </tr>
                                   <s:if test='type=="price"'>
									<tr>
										<td><s:textfield name="medicineprice.price" label="*价格" /></td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
									</s:if>
									<s:elseif test='type=="date"'>
									<tr>
										<td><s:textfield name="medicineprice.prodate"  label="*生产日期"   onclick="laydate()" /></td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td><s:textfield name="medicineprice.value" label="*有效时间（/月）" /></td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
									</s:elseif>
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
