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
<div class="full_page_photo"
	style="background-image: url(${pageContext.request.contextPath}/images/services.jpg);">
	<div class="container">
		<section class="call_to_action">
<!-- 			<h3 class="animated bounceInDown"> -->
<!-- 				we design <strong>value</strong> into profit -->
<!-- 			</h3> -->
<!-- 			<br /> -->
			<h4 class="animated bounceInUp">
				<spring:message code="Services.silder.subTitle"/>
			</h4>
		</section>
	</div>
</div>
<div id="main">
	<div class="container">
		<section id="services">
			<div class="hgroup">
				<h1>
					<spring:message code="Services.title"/>
				</h1>
				<h2>
					<spring:message code="Services.description"/>
				</h2>
				<ul class="breadcrumb pull-right">
					<li>
						<a href="${pageContext.request.contextPath}/home/goHome.do"><spring:message code="Common.home"/></a> <span class="divider">/</span>
					</li>
					<li class="active"><spring:message code="Common.services"/></li>
				</ul>
			</div>
			<div class="row-fluid service_teaser">
				<div class="span4 teaser_photo">
					<img src="images/der1.jpg" alt="a" class="img-rounded" />
				</div>
				<div class="span8">
					<h3>
						<spring:message code="Services.title1"/>
					</h3>
					<p>
						<spring:message code="Services.description1"/>
					</p>
					<p>&nbsp;</p>
					<hr />
					<div class="row-fluid">
						<div class="span6 service">
							<figure class="span4">
								<i class="icon-bullhorn blue"></i>
							</figure>
							<div class="desc span8">
								<h4><spring:message code="Services.title2"/></h4>
								<p><spring:message code="Services.description2"/></p>
							</div>
						</div>
						<div class="span6 service">
							<figure class="span4">
								<i class="icon-user-md blue"></i>
							</figure>
							<div class="desc span8">
								<h4><spring:message code="Services.title3"/></h4>
								<p><spring:message code="Services.description3"/></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<div class="row pricing_wrapper">
			<c:forEach items="${servicess }" var="item">
			<div class="span4">
				<div class="pricing_plan <c:if test="${item.is_flag == '0' }">special</c:if>">
					<h3>
						<strong>
							${item.title }
						</strong> 
						<small>
							${item.sub_title }
						</small>
					</h3>
					<div class="the_price">
						<span><spring:message code="Common.fuhao"/></span>
						${item.price }
						<small><spring:message code="Common.qi"/></small>
					</div>
					<div class="the_offerings">
						${item.description }
					</div>
					<a href="${pageContext.request.contextPath}/contact/goContact.do" class="btn btn-primary btn-large">
						<spring:message code="Common.diy"/>
					</a>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>

	<jsp:include page="common/footer.jsp"></jsp:include>
</div>
<!-- common bottom -->
<jsp:include page="common/bottom.jsp"></jsp:include>
