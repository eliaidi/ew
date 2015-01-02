<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/spring.tld" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="common/head.jsp"></jsp:include>

<body class="b body_bg">
	<div class="lg">
		<form id="fm" action="${pageContext.request.contextPath}/manage/login.do" method="post">
			<div class="lg_top"></div>
			<div class="lg_main">
				<div class="lg_m_1">
					<input name="username" value="admin" class="ur" /> 
					<input name="password" type="password" value="123456" class="pw" />
				</div>
			</div>
			<div class="lg_foot">
				<input type="button" onclick="login();" value="Login In" class="bn" />
			</div>
		</form>
	</div>
</body>
<jsp:include page="common/footer.jsp"></jsp:include>
<script type="text/javascript">
	function login() {
		$("#fm").ajaxSubmit({
			 type: $("#fm").attr("method"),
		     url: $("#fm").attr("action"),
		     dataType: "json",
		     success: function(res){
		     	if(res.code == true) {
		     		window.location.href = "${pageContext.request.contextPath}/manage/goManage.do";
		     	} else {
			     	alert("<spring:message code="Manage.alert.login"/>");
		     	}
		     }
		});
	}
</script>