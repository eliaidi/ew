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
	url:'${pageContext.request.contextPath }/manage/queryMenuData.do',method:'post',toolbar:'#tb'">
	<thead>
		<tr>
			<th data-options="field:'id',width:100">ID</th>
			<th data-options="field:'name',width:200">菜单名</th>
			<th data-options="field:'path',width:600">请求路径</th>
			<th data-options="field:'orderNum',width:600">排序</th>
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
 		菜单名: <input id="queryName" style="width:100px">
        <a href="javascript:query();" class="easyui-linkbutton" iconCls="icon-search" >查询</a>
    </div>
</div>
</body>

<div id="dlg" style="padding: 5px;" class="easyui-dialog" data-options="buttons: '#dlg-buttons',resizable:true,iconCls:'icon-edit',closed:true,modal:true">
	 <form id="fm" method="post">
	 	<input id="id" type="hidden" name="id"/>
        <table cellpadding="5">
            <tr>
                <td>菜单名:</td>
                <td><input class="easyui-textbox" type="text" id="name" name="name" data-options="required:true"/></td>
            </tr>
            <tr>
                <td>请求路径:</td>
                <td><input class="easyui-textbox" type="text" id="path" name="path"/></td>
            </tr>
            <tr>
                <td>排序序号:</td>
                <td><input class="easyui-textbox" type="text" id="orderNum" name="orderNum"/></td>
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
		$("#fm").attr("action","${pageContext.request.contextPath }/manage/insertMenu.do");
		$("#dlg").dialog({
			title:"新增",
			closed:false
		});
	}
	
	function openEdit() {
		var row = $("#tt1").datagrid("getSelected");
		if(row) {
			$("#fm").form("clear");
			$("#fm").attr("action","${pageContext.request.contextPath }/manage/updateMenu.do");
			$('#fm').form('load',{
                id:row.id,
                name:row.name,
                path:row.path,
                orderNum:row.orderNum
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
						"${pageContext.request.contextPath }/manage/delMenu.do",
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