<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/spring.tld" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="page/common/top.jsp"></jsp:include>
<style type="text/css">  
.loading{  
    width:160px;  
    height:56px;  
    position: absolute;  
    top:45%;  
    left:40%;  
    line-height:56px;  
    color:#fff;  
    padding-left:60px;  
    font-size:15px;  
    background: #000 url(images/loading.gif) no-repeat 10px 50%;  
    opacity: 0.7;  
    z-index:9999;  
    -moz-border-radius:20px;  
    -webkit-border-radius:20px;  
    border-radius:20px;  
    filter:progid:DXImageTransform.Microsoft.Alpha(opacity=70);  
}  
</style>  
<div id="loading" class="loading">Loading pages...</div>  
<script type="text/javascript">
function goAction(url) {
	window.location.href = url;
}
setTimeout("goAction('${pageContext.request.contextPath}/home/goHome.do')", 800);
</script>
<!-- common bottom -->
<jsp:include page="page/common/bottom.jsp"></jsp:include>