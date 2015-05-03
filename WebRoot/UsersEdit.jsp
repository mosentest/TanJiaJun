<%@ page contentType="text/html; charset=utf-8" language="java"
	errorPage=""%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body class="ContentBody">
	<div id="title_bar">
		<span id="title">系统管理&gt;&gt;用户管理&gt;&gt;查看修改用户信息</span>
	</div>
	<div align="center">
		<s:form action="Users_Update" method="post"  target="_top">
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
						<td height="20" colspan="13" align="center" bgcolor="#EEEEEE"
							class="tablestyle_title" style="text-align: center;">查看修改用户信息</td>
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
																							<s:textfield name="user.id"  type="hidden" />
																							<s:textfield name="user.TActer.acterid"  type="hidden" />
																							<s:textfield name="user.remark"  type="hidden" />
																					</td>
																				</tr>
																				<tr>
																					<td><s:textfield name="user.username" label="用户名"  value="%{user.username}"  readonly="true"/>
																					</td>
																				</tr>
																				<tr>
																					<td><s:textfield name="user.name" label="姓名"  value="%{user.name}"/>
																					</td>
																				</tr>
																				<tr>
																					<td><s:textfield name="user.password"  label="密码"  value="%{user.password}" />
																					</td>
																				</tr>
																				<tr>
																					<td><s:textfield name="user.phone" label="手机 "  value="%{user.phone}"/>
																					</td>
																				</tr>
																				<tr>
																					<td><s:textfield name="user.adress" label="地址"  value="%{user.adress}"/>
																					</td>
																				</tr>
																				<tr>
																					<td><s:textfield name="user.qq" label="QQ"  value="%{user.qq}"/>
																					</td>
																				</tr>
																				<tr>
																					<td><s:textfield name="user.email" label=" Email"  value="%{user.email}"/>
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
