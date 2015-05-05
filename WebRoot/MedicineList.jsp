<%@ page contentType="text/html; charset=utf-8" language="java"  errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<script language="javascript">
   function deleteMedicine(paraproid)
     {
	var msg = "您确认要删除该药品吗?";
    var r =window.confirm(msg);
    if (r==true)
        {
         location.href="<%=request.getContextPath()%>/Medicine_Del?medicine.id="+paraproid;
        }
      }
   function getMedicine(paraproid)
     {
         location.href="<%=request.getContextPath()%>/MedicinetoUpdate?medicine.id="+paraproid;
      }
   function getMedicineB(paraproid)
     {
         location.href="<%=request.getContextPath()%>/MedicinetoEditB?medicine.id="+paraproid;
      }	
  function SearchMedicine()
    {
     	 var hpvalue =document.getElementById('searchtype').value;
         location.href="<%=request.getContextPath()%>/Medicine_Search?hpvalue="+hpvalue;
     }   
	/*全选*/
	function checkAll(checkboxName){
		var objs = document.getElementsByName(checkboxName);
		for(i=0;i<objs.length;i++){
			 if(objs[i].type.toLowerCase() == "checkbox" ){
			 	objs[i].checked = true;
			 }
		}
	}
	
	/*取消选择*/
	function cancelCheck(checkboxName){
		var objs = document.getElementsByName(checkboxName);
		for(i=0;i<objs.length;i++){
			 if(objs[i].type.toLowerCase() == "checkbox" ){
			 	objs[i].checked = false;
			 }
		}
	}
	
	/*反选*/
	function reverseCheck(checkboxName){
		var objs = document.getElementsByName(checkboxName);
		for(i=0;i<objs.length;i++){
			 if(objs[i].type.toLowerCase() == "checkbox" ){
			 	if(objs[i].checked){
					objs[i].checked= false;
				}else{
					objs[i].checked = true;	
				}
			 }
		}
	}
	
	/*删除所选项*/
	function deleteChecked(checkboxName){
		var objs = document.getElementsByName(checkboxName);
		
		var param = '';
		for(i=0;i<objs.length;i++){
			 if(objs[i].type.toLowerCase() == "checkbox" ){
			 	if(objs[i].checked){
					param += (objs[i].value+',');
				}
			 }
		}
		
		if(param.length >0){
			var bool = window.confirm('您确定删除所选的项吗？');
			if(bool){
				//这里提交到删除的地方
				window.location.href="${pageContext.request.contextPath}/Medicine_DelMore?ID="+param;
			}
		}
		
	}
  </script>
<link rel="stylesheet" type="text/css" href="css/main.css"/>
</head>

<body>
<div id="title_bar">
	<span id="title" > 系统管理&gt;&gt;药品管理</span>
    <ul id="operation">
    	<li><a href="#" class="like_btn" onclick="checkAll('id')">全选</a></li>
        <li><a href="#" class="like_btn" onclick="cancelCheck('id')"> 取消选择</a></li>
        <li><a href="#" class="like_btn" onclick="reverseCheck('id')">反选</a></li>
        <li><a href="#" class="like_btn" onclick="deleteChecked('id')"> &nbsp;删除&nbsp; </a></li>
        <li><img src="images/add.gif" width="10" height="10"  /><a href="${pageContext.request.contextPath }/MedicinetoAdd"> 添加</a></li>
    </ul>
</div>


<table id="list_table" >
      <tr>
        <th width="4%"   >选择</th>
        <th width="10%"   >批准文号</th>
        <th width="12%" >药品名称</th>
        <th width="10%"   >种类</th>
        <th width="8%"   >规格</th>
        <th width="8%"   >单位</th>
        <th width="12%"   >药品别名</th>
        <th width="14%"  >更新时间</th>
        <th width="16%" >基本操作</th>
      </tr>
      <s:iterator value="MedicineList">
      <tr>
     	<td><input type="checkbox" name="id" value="<s:property value="id"/>" /></td>
     	<td ><s:property value="number" /></td>
        <td ><s:property value="name" /></td>
        <td ><s:property value="TMedicinetype.protypename" /></td>
        <td ><s:property value="guige" /></td>
        <td ><s:property value="danwei" /></td>
        <td ><s:property value="othername" /></td>
        <td ><s:property value="time" /></td>
        <td><a href="javascript:getMedicine('<s:property value="id" />')">修改</a>|
          <a href="javascript:getMedicineB('<s:property value="id" />')">修改别名</a>|
          <a href="javascript:deleteMedicine('<s:property value="id" />')">删除</a></td> 
      </tr>
      </s:iterator>
    </table>
    
<div id="page_bar">
	
		<div id="page">
			共 <s:property value="pageBean.allRow" /> 条记录  共
					<s:property value="pageBean.totalPage" /> 页 当前第 <s:property
						value="pageBean.currentPage" /> 页 
			</div>
			<div id="tool">
					 <s:if
						test="%{pageBean.currentPage == 1}">第一页 上一页</s:if> 
					<s:else>
						<a href="${pageContext.request.contextPath}/MedicineList?page=1">第一页</a>
						<a href="${pageContext.request.contextPath}/MedicineList?page=<s:property value="%{pageBean.currentPage-1}"/>">上一页</a>
					</s:else>
					<s:if test="%{pageBean.currentPage != pageBean.totalPage}">
						<a
							href="${pageContext.request.contextPath}/MedicineList?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
						<a
							href="${pageContext.request.contextPath}/MedicineList?page=<s:property value="pageBean.totalPage"/>">最后一页</a>
					</s:if>
					 <s:else>下一页 最后一页
              		</s:else>
  		</div>
</div>
<div>
  <p>&nbsp;</p>
</div>
<table align="center">
<tr><td><input id="searchtype" /></td>
<td><a href="javascript:SearchMedicine()"/>搜索</td></tr>
</table>
</body>
</html>
