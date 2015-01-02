<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/spring.tld" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="common/head.jsp"></jsp:include>

<body> 

<table id="tt1" class="easyui-datagrid" data-options="fit:true,rownumbers:true,pagination:true,pageSize:10,singleSelect:true,fitColumns:true,striped:true,
	url:'${pageContext.request.contextPath }/manage/queryMessageData.do',method:'post',toolbar:'#tb'">
	<thead>
		<tr>
			<th data-options="field:'name',width:200">姓名</th>
			<th data-options="field:'email',width:200">邮箱</th>
			<th data-options="field:'subject',width:200">主题</th>
			<th data-options="field:'message',width:200">消息内容</th>
			<th data-options="field:'is_flag',width:100,formatter:formatteFlag">是否已读</th>
			<th data-options="field:'create_time',width:200">时间</th>
			<th data-options="field:'ip',width:200">IP</th>
		</tr>
	</thead>
</table>

 <div id="tb" style="padding:5px;height:auto">
    <div style="margin-bottom:5px">
        <a href="javascript:look()" class="easyui-linkbutton" iconCls="icon-tip" plain="true">查看详细</a>
        <a href="javascript:isRead()" class="easyui-linkbutton" iconCls="icon-ok" plain="true">标记为已读</a>
    </div>
    <div>
 		真实姓名: <input id="queryName" style="width:100px">
 		是否已读:
 		<select id="queryIsFlag" class="easyui-combobox">
 			<option value="">全部</option>
 			<option value="0">是</option>
 			<option value="1">否</option>
 		</select>
        <a href="javascript:query();" class="easyui-linkbutton" iconCls="icon-search" >查询</a>
    </div>
</div>
</body>

<div id="dlg" style="padding: 5px;" class="easyui-dialog" data-options="buttons: '#dlg-buttons',resizable:true,iconCls:'icon-tip',closed:true,modal:true">
	 <form id="fm" method="post">
	 	<input id="id" type="hidden" name="id"/>
        <table cellpadding="5">
            <tr>
                <td>主题:</td>
                <td>
                	<input name="subject" class="easyui-textbox" data-options="disabled:'true'" >
                </td>
            </tr>
            <tr>
                <td>消息内容:</td>
                <td>
                	<input name="message" class="easyui-textbox" data-options="multiline:true,disabled:'true'" style="width:300px;height:100px">
                </td>
            </tr>
            <tr>
                <td>时间:</td>
                <td>
                	<input name="create_time" class="easyui-textbox" data-options="disabled:'true'">
                </td>
            </tr>
        </table>
    </form>
</div>
<div id="dlg-buttons">  
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cancel'"  onclick="javascript:$('#dlg').dialog('close')">取消</a>  
</div>  

<jsp:include page="common/footer.jsp"></jsp:include>
<script type="text/javascript">
	function query() {
		$("#tt1").datagrid({
			pageNumber:1,
			queryParams:{
				"name" : $("#queryName").val(),
				"isFlag" : $("#queryIsFlag").combobox("getValue")
			}
		})
	}
	function look() {
		var row = $("#tt1").datagrid("getSelected");
		if(row) {
			$('#fm').form('load',{
                subject : row.subject,
                message : row.message,
                create_time : row.create_time
            });
			$("#dlg").dialog({
				title:"查看详细",
				closed:false
			});
		} else {
			$.messager.alert("提示","请选择一行数据!");
		}
	}
	
	function isRead() {
		var row = $("#tt1").datagrid("getSelected");
		if(row) {
			$.messager.confirm("提示","确认要标记为已读吗",function(r){
				if(r) {
				
				}
			});
		} else {
			$.messager.alert("提示","请选择一行数据!");
		}
	}
</script>