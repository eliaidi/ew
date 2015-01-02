<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/spring.tld" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<header>
     <div class="container">
          <div class="navbar">
               <div class="navbar-inner"> 
               		<a class="brand" href="${pageContext.request.contextPath}/home/goHome.do"> 
	               		<img src="${pageContext.request.contextPath}/images/restart_logo.png" width="90" height="90" alt="optional logo" /> 
	               		<span class="logo_title"><spring:message code="Common.title"/></span> 
	               		<span class="logo_subtitle"><spring:message code="Common.subTitle"/></span> 
               		</a> 
               		<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
               			<span class="nb_left pull-left"> 
               				<span class="icon-bar"></span> 
               				<span class="icon-bar"></span> 
               				<span class="icon-bar"></span>
               			</span> 
               			<span class="nb_right pull-right">menu</span> 
               		</a>
                    <!-- 右侧菜单栏开始 -->
                    <div class="nav-collapse collapse">
                         <ul class="nav pull-right">
                              <li <c:if test="${sessionScope.param.navBar == 'home' }">class="active"</c:if> ><a href="${pageContext.request.contextPath}/home/goHome.do"><spring:message code="Common.home"/></a></li>
                              <li <c:if test="${sessionScope.param.navBar == 'aboutUs' }">class="active"</c:if>><a href="${pageContext.request.contextPath }/aboutUs/goAboutUs.do"><spring:message code="Common.aboutUs"/></a></li>
                              <li <c:if test="${sessionScope.param.navBar == 'services' }">class="active"</c:if>><a href="${pageContext.request.contextPath }/services/goServices.do"><spring:message code="Common.services"/></a></li>
                              <li <c:if test="${sessionScope.param.navBar == 'product' }">class="active"</c:if>><a href="${pageContext.request.contextPath }/product/goProduct.do"><spring:message code="Common.product"/></a></li>
                              <li <c:if test="${sessionScope.param.navBar == 'contact' }">class="active"</c:if>><a href="${pageContext.request.contextPath }/contact/goContact.do"><spring:message code="Common.contact"/></a></li>
                         </ul>
                    </div>
                    <!-- 右侧菜单栏结束 -->
               </div>
          </div>
		<div id="social_media_wrapper">
			<a href="javascript:changeLocal('cn')" title="简体中文">
				简
<!-- 				<i class="icon icon-facebook"></i> -->
			</a> 
			<a href="javascript:changeLocal('tw')" title="繁体中文"> 
				繁
<!-- 				<i class="icon icon-twitter"></i> -->
			</a> 
			<a href="javascript:changeLocal('en')" title="English">
				En
<!-- 				<i class="icon icon-google-plus"></i> -->
			</a>
		</div>
		<div id="sign">
			<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=181601869&site=qq&menu=yes">
				<img src="${pageContext.request.contextPath}/images/q_3.gif" border="0" alt="点击咨询" title="点击咨询">
			</a>
		</div>
     </div>
</header>

<script type="text/javascript">
	function changeLocal(local) {
		$.post(
			"${pageContext.request.contextPath}/local/changeLocal.do",
			{"local" : local},
			function(res) {
				if(res.code == true) {
					location.reload();
				} else {
					alert(res.message);
				}
			},"JSON"
		);
	}
</script>
