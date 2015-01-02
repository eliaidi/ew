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
	<div class="easyui-tabs" data-options="fit:true">
		<div title="简体中文资源文件">
			<table id="tt1" class="easyui-datagrid" data-options="rownumbers:true,singleSelect:true,fitColumns:true,striped:true,
			url:'${pageContext.request.contextPath }/manage/queryI18nData.do?locale=zh_CN',method:'post'" style="width:100%">
				<thead>
					<tr>
						<th data-options="field:'key',width:200">键</th>
						<th data-options="field:'value',width:600">值</th>
						<th data-options="field:'1',width:100" formatter="formatEdit1">修改</th>
					</tr>
				</thead>
			</table>
		</div>
		<div title="英文资源文件">
			<table id="tt2" class="easyui-datagrid" data-options="rownumbers:true,singleSelect:true,fitColumns:true,striped:true,url:'${pageContext.request.contextPath }/manage/queryI18nData.do?locale=en_US',method:'post'">
				<thead>
					<tr>
						<th data-options="field:'key',width:200">键</th>
						<th data-options="field:'value',width:600">值</th>
						<th data-options="field:'2',width:100,formatter:formatEdit2">修改</th>
					</tr>
				</thead>
			</table>
		</div>
		<div title="繁体资源文件">
			<table id="tt3" class="easyui-datagrid" data-options="rownumbers:true,singleSelect:true,fitColumns:true,striped:true,url:'${pageContext.request.contextPath }/manage/queryI18nData.do?locale=zh_TW',method:'post'">
				<thead>
					<tr>
						<th data-options="field:'key',width:200">键</th>
						<th data-options="field:'value',width:600">值</th>
						<th data-options="field:'3',width:120,formatter:formatEdit3">修改</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
</body>

<div id="dlg" class="easyui-dialog" title="资源文件内容修改" data-options="buttons: '#dlg-buttons',resizable:true,iconCls:'icon-edit',closed:true,modal:true" style="width:500px;height:300px;padding:10px">
	<form id="fm" action="${pageContext.request.contextPath }/manage/updateI18n.do" method="post">
		<table>
			<tr>
				<td>
					<input id="key" type="text" name="key" readonly="readonly" value="">
					<input id="fileName" type="hidden" name="fileName" readonly="readonly" value="">
				</td>
			</tr>
			<tr>
				<td><textarea id="content" name="value" rows="10" cols="60"></textarea></td>
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
	function formatEdit1(val, row){
		var html = "<a href=\"javascript:void(0)\" data-options=\"iconCls:'icon-undo'\" onclick=\"edit('"+row.key+"','tt1','zh_CN')\">修改</a>";
//  		return html;
		return "";
	}
	function formatEdit2(val, row){
		var html = "<a href=\"javascript:void(0)\" data-options=\"iconCls:'icon-undo'\" onclick=\"edit('"+row.key+"','tt2','en_US')\">修改</a>";
// 		return html;
		return "";
	}
	function formatEdit3(val, row){
		var html = "<a href=\"javascript:void(0)\" data-options=\"iconCls:'icon-undo'\" onclick=\"edit('"+row.key+"','tt3','zh_TW')\">修改</a>";
// 		return html;
		return "";
	}
	
	function edit(key,id,fileName) {
		$("#dlg").dialog("close");
		var row = $("#"+id).datagrid("getData").rows;
		if(row) {
			for(var i=0; i<row.length; i++) {
				if(row[i].key == key) {
					$("#dlg").dialog("open");
					$("#key").val(key);
					$("#fileName").val(fileName);
					$("#content").val(row[i].value);
					return;
				}
			}
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
			}
		})
	}

</script>