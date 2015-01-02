<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/spring.tld" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="common/top.jsp"></jsp:include>

<!-- head -->
<jsp:include page="common/head.jsp"></jsp:include>
<div class="full_page_photo" style="background-image: url(images/404.jpg);">
     <div class="container">
          <section class="call_to_action">
               <h3 class="animated bounceInDown">OMG! <strong>error 404</strong></h3>
               <h4 class="animated bounceInUp">we are really sorry but the page you requested cannot be found.</h4>
          </section>
     </div>
</div>
<!-- 主内容区start -->
<div id="main">
	<div class="container">
          <div class="hgroup">
               <h1>Page not found</h1>
               <ul class="breadcrumb pull-right">
                    <li class="active">Something went wrong!</li>
               </ul>
          </div>
          <section class="call_to_action"> <i class="icon-ambulance icon-4x"></i>
               <h3>error 404 is nothing to really worry about...</h3>
               <h4>you may have mis-typed the URL, please check your spelling and try again.</h4>
          </section>
     </div>
     <jsp:include page="common/footer.jsp"></jsp:include>
</div>
<!-- 主内容区end -->

<!-- common bottom -->
<jsp:include page="common/bottom.jsp"></jsp:include>
