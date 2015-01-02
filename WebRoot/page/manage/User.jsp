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
	url:'${pageContext.request.contextPath }/manage/queryUserData.do',method:'post',toolbar:'#tb'">
	<thead>
		<tr>
			<th data-options="field:'id',width:100">ID</th>
			<th data-options="field:'name',width:200">真实姓名</th>
			<th data-options="field:'username',width:200">用户名</th>
			<th data-options="field:'password',width:200">密码</th>
			<th data-options="field:'role_name',width:200">角色</th>
			<th data-options="field:'is_flag',width:200,formatter:formatteFlag">是否启用</th>
		</tr>
	</thead>
</table>

 <div id="tb" style="padding:5px;height:auto">
    <div style="margin-bottom:5px">
        <a href="javascript:openAdd()" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>
        <a href="javascript:openEdit()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
        <a href="javascript:openDel()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
    </div>
    <div>
 		真实姓名: <input id="queryName" style="width:100px">
        <a href="javascript:query();" class="easyui-linkbutton" iconCls="icon-search" >查询</a>
    </div>
</div>
</body>

<div id="dlg" style="padding: 5px;" class="easyui-dialog" data-options="buttons: '#dlg-buttons',resizable:true,iconCls:'icon-edit',closed:true,modal:true">
	 <form id="fm" method="post">
	 	<input id="id" type="hidden" name="id"/>
        <table cellpadding="5">
            <tr>
                <td>真实姓名:</td>
                <td><input class="easyui-textbox" type="text" id="name" name="name" data-options="required:true"/></td>
            </tr>
            <tr>
                <td>用户名:</td>
                <td><input class="easyui-textbox" type="text" id="username" name="username" data-options="required:true"/></td>
            </tr>
            <tr>
                <td>密码:</td>
                <td><input class="easyui-textbox" type="password" id="password" name="password" data-options="required:true"/></td>
            </tr>
            <tr>
                <td>角色:</td>
                <td><input class="easyui-combobox"  id="role_id" name="role_id" data-options="url:'${pageContext.request.contextPath }/manage/queryRoleList.do',valueField:'id',textField:'name'"/></td>
            </tr>
            <tr>
                <td>是否启用:</td>
                <td>
                	<input type="radio" name="is_flag" value="0" checked="checked" />是
                	<input type="radio" name="is_flag" value="1"/>否
                </td>
            </tr>
        </table>
    </form>
</div>
<div id="dlg-buttons">  
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-save'"  onclick="save()">保存</a>  
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cancel'"  onclick="javascript:$('#dlg').dialog('close')">取消</a>  
</div>  

<jsp:include page="common/footer.jsp"></jsp:include>
<script type="text/javascript">
	function query() {
		$("#tt1").datagrid({
			pageNumber:1,
			queryParams:{
				"name" : $("#queryName").val()
			}
		})
	}
	
	function openAdd() {
		$("#fm").form("clear");
		$("#fm").attr("action","${pageContext.request.contextPath }/manage/insertUser.do");
		$("#username").textbox({
			disabled : false
		});
		$("#password").textbox({
			disabled : false
		});
		$("#dlg").dialog({
			title:"新增",
			closed:false
		});
	}
	
	function openEdit() {
		var row = $("#tt1").datagrid("getSelected");
		if(row) {
			$("#username").textbox({
				disabled : true
			});
			$("#password").textbox({
				disabled : true
			});
			$("#fm").form("clear");
			$("#fm").attr("action","${pageContext.request.contextPath }/manage/updateUser.do");
			$('#fm').form('load',{
                id : row.id,
                name : row.name,
                username : row.username,
                password : row.password,
                role_id : row.role_id,
                is_flag:row.is_flag
            });
			$("#dlg").dialog({
				title:"修改",
				closed:false
			});
		} else {
			$.messager.alert("提示","请选择一行数据!");
		}
	}
	
	function save() {
		$("#fm").form("submit",{
			url:$("#fm").attr("action"),
			onSubmit:function() {
				return true;
			},
			success:function(res) {
				res = $.parseJSON(res);
				message(res);
				$("#tt1").datagrid("reload");
				$("#dlg").dialog('close');
			}
		});
	}
	
	
	function openDel() {
		var row = $("#tt1").datagrid("getSelected");
		if(row) {
			$.messager.confirm("删除","你确定删除这条数据吗?",function(r) {
				if(r){
					$.post(
						"${pageContext.request.contextPath }/manage/delUser.do",
						{"id":row.id},
						function(res) {
							message(res);
							$("#tt1").datagrid("reload");
							$("#dlg").dialog('close');
						},"json"
					)
				}
			});
		} else {
			$.messager.alert("提示","请选择一行数据!");
		}
	}
</script>