<%@ page contentType="text/html; charset=utf-8" language="java"
	errorPage=""%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<script src="laydate/laydate.js"></script>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body class="ContentBody">
	<div id="title_bar">
		 <s:if test='type=="price"'>
		<span id="title">系统管理&gt;&gt;药品价格管理&gt;&gt;修改药品价格</span>
		</s:if>
		 <s:elseif test='type=="date"'>
		<span id="title">系统管理&gt;&gt;药品有效期管理&gt;&gt;修改药品有效期</span>
		</s:elseif>
	</div>
	<div align="center">
		<s:form action="MedicinePrice_Update" method="post">
			<div class="MainDiv">
				<table width="99%" border="0" cellpadding="0" cellspacing="0"
					class="CContent">
					<tr>
						<td bgcolor="#A0A0A0"></td>
					</tr>
					<tr>
						<td height="40" class="font42">
							<table width="600px" border="0" align="center" cellpadding="4"
								cellspacing="1" bgcolor="#DDD" class="newfont03" id="tblist" />
						</td>
					</tr>
					<tr>
						 <s:if test='type=="price"'>
						<td height="20" colspan="13" align="center" bgcolor="#EEEEEE"
							class="tablestyle_title" style="text-align: center;">修改药品价格</td>
						</s:if>
						<s:elseif test='type=="date"'>
						<td height="20" colspan="13" align="center" bgcolor="#EEEEEE"
							class="tablestyle_title" style="text-align: center;">修改药品有效期</td>
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
												<td class="CPanel">
													<table border="0" cellpadding="0" cellspacing="0"
														style="width:100%">
														<tr>
															<td class="CPanel">

																<table border="0" cellpadding="0" cellspacing="0"
																	style="width:100%">

																	<tr align="center">
																		<td width="100%">

																			<table border="0" cellpadding="2" cellspacing="1"
																				style="width:100%">
																				<tr>
																				    <td>
																				    	<s:select  name="medicineprice.TMedicine.id"  label="药品名称" 
																				    	 list="medicines"  listKey="id"  listValue="name"  value="%{medicineprice.TMedicine.id}"  disabled="true">
																				    	</s:select>
																				    </td>
																				</tr>
																				<tr>
																				    <td>
																				    	<s:select  name="medicineprice.TProducter.id"  label="供应商" 
																				    	 list="producters"  listKey="id"  listValue="name"  value="%{medicineprice.TProducter.id}"  disabled="true">
																				    	</s:select>
																				    </td>
																				</tr>
																				<s:if test='type=="price"'>
																				<tr>
																					<td><s:textfield name="medicineprice.price" label="价格"  value="%{medicineprice.price}" />
																					</td>
																				</tr>
																				</s:if>
																				<s:elseif test='type=="date"'>
																				<tr>
																				<td><s:textfield  name="medicineprice.prodate"  label="生产日期"   onclick="laydate()" value="%{medicineprice.prodate}"  />
																				</td>
																				</tr>
																				<tr>
																					<td><s:textfield name="medicineprice.value" label="有效时间（/月）"  value="%{medicineprice.value}" />
																					</td>
																				</tr>
																				</s:elseif>
																				<tr>
																					<td>
																						<s:textfield name="medicineprice.id" type="hidden" />
																						<s:if test='type=="price"'>
																						<s:hidden name="medicineprice.prodate" value="%{medicineprice.prodate}"/>
																						<s:hidden name="medicineprice.value" value="%{medicineprice.value}"/>
																						</s:if>
																						<s:elseif test='type=="date"'>
																						<s:hidden name="medicineprice.price" value="%{medicineprice.price}"/>
																						</s:elseif>
																						<s:hidden name="medicineprice.TMedicine.id"  value="%{medicineprice.TMedicine.id}" />
																						<s:hidden name="medicineprice.TProducter.id"  value="%{medicineprice.TProducter.id}" />
																					</td>
																				</tr>
																			</table> <br />
																		</td>
																	</tr>

																</table>
															</td>
														</tr>	
													</table>
												</td>
											</tr>
										</table>
									</td>
								</tr>		
							</table>
							<s:submit align="center" value="修改" />
							<s:reset align="center" value="重置" />
						</td>
					</tr>
				</table>
			</div>
		</s:form>
	</div>
</body>
</html>
