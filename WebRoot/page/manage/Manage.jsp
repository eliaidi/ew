<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/spring.tld" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="common/head.jsp"></jsp:include>

<body class="easyui-layout" style="overflow-y: hidden;" scroll="no">
	<!-- 北部面板  -->
	<div data-options="region:'north'" style="height:50px" class="default_background">
		<div class="logo">
			<a href="${pageContext.request.contextPath}/manage/goManage.do" style="vertical-align:middle;">
		        <img src="${pageContext.request.contextPath}/images/restart_logo.png" /> 
				<spring:message code="Common.webTitle"/>
			</a>
		</div>
		<div class="logo2">
<!-- 			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-man'" onclick="">${user.name}</a> -->
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo'" onclick="exit()">
				<spring:message code="Manage.exit"/>
			</a>
		</div>
	</div>
	<!-- 南部面板 -->
	<div data-options="region:'south'" style="height:30px;" class="default_background">
		<div class="footer" >
			<spring:message code="Common.tld"/>
		</div>
	</div>
	<!-- 左侧面板  -->
	<div data-options="region:'west',title:'菜单栏'" style="width: 200px;" class="default_background">
		<ul class="leftMenu">
			<c:forEach items="${sessionScope.user.role.menus}" var="item">
				<li>
					<a href="${pageContext.request.contextPath}${item.path}" ref="menu_${item.id}" onclick="menuActive(this)" target="frame">
						${item.name }
					</a>
				</li>
			</c:forEach>
		</ul>
	</div>
	<!-- 中部面板 -->
	<div id="centerDiv" data-options="region:'center',title:'欢迎使用, 登陆人:${user.name}',iconCls:'icon-tip',collapsible:false" style="background: #eee; overflow-y: hidden">
		<iframe name="frame" src="${pageContext.request.contextPath }/page/manage/Welcome.jsp" scrolling="auto" frameborder="0" style="width: 100%; height:100%;padding: 0; text-align: center;background: url(${pageContext.request.contextPath}/images/backgrounds/wild_oliva_light.png)"></iframe>
	</div>
</body>

<jsp:include page="common/footer.jsp"></jsp:include>
<script type="text/javascript">
	function menuActive(o) {
		$("ul[class=leftMenu] li").removeClass("active");
		$(o).parent().addClass("active");
	}
	
	function exit() {
		$.messager.confirm("退出","你确定要退出吗?", function(r) {
			if(r) {
				window.location.href = "${pageContext.request.contextPath}/manage/goLogout.do";
			}
		});  
	}
</script>