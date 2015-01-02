<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/spring.tld" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<jsp:include page="common/top.jsp"></jsp:include>

<!-- head -->
<jsp:include page="common/head.jsp"></jsp:include>
<div id="main">
	<div class="container">
		<div class="hgroup">
			<h1>
				<spring:message code="Product.title"/>
			</h1>
			<h2>
				<spring:message code="Product.description"/>
			</h2>
			<ul class="breadcrumb pull-right">
				<li>
					<a href="${pageContext.request.contextPath}/home/goHome.do">
						<spring:message	code="Common.home" /> 
					</a> 
					<span class="divider">/</span>
				</li>
				<li class="active">
					<spring:message code="Common.product" />
				</li>
			</ul>
		</div>
		<ul id="portfolio_filters">
			<li>
				<a href="#" data-filter="*">show all</a>
			</li>
			<c:forEach items="${categorys }" var="item">
			<li>
				<a href="#" data-filter=".${item.id}">${item.name}</a>
			</li>
			</c:forEach>
		</ul>
		<div id="portfolio_container" class="portfolio_strict row">
		<c:forEach items="${products}" var="item">
				<div class="portfolio_item span4 ${item.category_id }">
					<div class="portfolio_photo" style="background-image:url(${pageContext.request.contextPath}/${item.img_path })">
						<a href="${pageContext.request.contextPath}/product/goProductDetail.do?id=${item.id}"> 
							<i class="icon-2x icon-external-link"></i>
							<p>
								${item.synopsis}
							</p> 
						</a>
					</div>
					<div class="portfolio_description">
						<h3>
							<a href="${pageContext.request.contextPath}/product/goProductDetail.do?id=${item.id}">
								${item.title}
							</a>
						</h3>
						<p>
							${item.category_name}
						</p>
					</div>
				</div>
		</c:forEach>
		</div>
	</div>
	<jsp:include page="common/footer.jsp"></jsp:include>
</div>
<!-- common bottom -->
<jsp:include page="common/bottom.jsp"></jsp:include>
<script type="text/javascript">
	$(function() {
		$("body").removeClass("collapsing_header");
	})
</script>