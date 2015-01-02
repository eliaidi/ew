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

<!-- 主内容区start -->
<div id="main">
	<div class="container">
		<section id="portfolio_item">
			<div class="hgroup">
				<ul class="breadcrumb pull-left">
					<li><a
						href="${pageContext.request.contextPath}/home/goHome.do"><spring:message
								code="Common.home" />
					</a> <span class="divider">/</span>
					</li>
					<li><a
						href="${pageContext.request.contextPath}/product/goProduct.do"><spring:message
								code="Common.product" />
					</a> <span class="divider">/</span>
					</li>
					<li class="active"><spring:message code="Common.productDetail" />
					</li>
				</ul>
			</div>
			<div class="row">
				<div class="span8">
					<section id="portfolio_slider_wrapper">
						<div class="flexslider" id="portfolio_slider">
							<ul class="slides">
								<c:forEach var="item" items="${product.imgs }">
									<li class="item" data-thumb="${pageContext.request.contextPath}/${item.img_path}"
										style="background-image: url(${pageContext.request.contextPath}/${item.img_path})">
										<div class="container">
											<a href="${pageContext.request.contextPath}/${item.img_path}" rel="prettyPhoto[gal]"></a>
											<div class="carousel-caption">
												<p class="lead"><spring:message code="Common.webTitle"/></p>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
						<div id="carousel" class="flexslider">
							<ul class="slides">
								<c:forEach var="item" items="${product.imgs }">
									<li><img src="${pageContext.request.contextPath}/${item.img_path}" alt="" /></li>
								</c:forEach>
							</ul>
						</div>
					</section>
				</div>
				<div class="span4">
					<article class="portfolio_details">
						<h3 class="well">
							${product.title }
						</h3>
						<p class="well">
							${product.synopsis}
						</p>
						<div class="well">
							${product.description }
						</div>
						<a href="javascript:void(0)" onclick="buy();" class="btn btn-primary btn-large center-block"> 
							<spring:message	code="Product.button.buy" /> 
						</a>
					</article>
				</div>
			</div>
		</section>
	</div>
	<jsp:include page="common/footer.jsp"></jsp:include>
</div>
<!-- 主内容区end -->

<!-- common bottom -->
<jsp:include page="common/bottom.jsp"></jsp:include>

<script type="text/javascript">
	$(function() {
		$("body").removeClass("collapsing_header");
	})
	
	function buy() {
		window.location.href="${pageContext.request.contextPath}/contact/goContact.do";
	}
</script>