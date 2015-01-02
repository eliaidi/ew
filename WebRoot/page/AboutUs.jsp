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
	style="background-image: url(${pageContext.request.contextPath }/images/about_us.jpg);">
	<div class="container">
		<section class="call_to_action">
			<h3 class="animated bounceInDown">
				<spring:message code="AboutUs.silder.title"/>
			</h3>
			<h4 class="animated bounceInUp">
				<spring:message code="AboutUs.silder.subTitle"/>
			</h4>
		</section>
	</div>
</div>
<div id="main">
	<div class="container">
		<section id="about_us">
			<div class="hgroup">
				<h1>
					<spring:message code="Common.aboutUs" />
				</h1>
				<h2>
					<spring:message code="AboutUs.description1" />
				</h2>
				<ul class="breadcrumb pull-right">
					<li><a
						href="${pageContext.request.contextPath }/home/goHome.do"> <spring:message
								code="Common.home" /> </a> <span class="divider">/</span></li>
					<li class="active"><spring:message code="Common.aboutUs" />
					</li>
				</ul>
			</div>

			<article>
				<div class="row">
					<div class="span8">
						<p>
							<spring:message code="AboutUs.description2" />
						</p>
						<p class="columns_2">
							<spring:message code="AboutUs.description3" />
						</p>
					</div>
					<div class="span4">
						<blockquote>
							<p>
								<spring:message code="AboutUs.description4" />
							</p>
							<small><spring:message code="AboutUs.description4b" /> </small>
						</blockquote>
					</div>
				</div>


				<section class="call_to_action">
					<img alt="responsive" src="${pageContext.request.contextPath }/images/star.png" />
					<h3>
						<spring:message code="AboutUs.title"/>
					</h3>
					<h4><spring:message code="AboutUs.subTitle"/></h4>
				</section>


				<!-- 员工展示 start -->
				<h2 class="section_header">
					<spring:message code="AboutUs.team"/>
				</h2>
				<div class="row">
					<c:forEach items="${employees }" var="item">
						<div class="span3 team_member">
							<figure style="background-image: url(${pageContext.request.contextPath}/${item.end_img_path})">
								<img src="${pageContext.request.contextPath}/${item.start_img_path}"/>
							</figure>
							<h5>${item.name }</h5>
							<small>${item.job_description}</small>
							<hr />
							<div class="team_social">
								<a href="javascript:void(0)">
									<i class="icon icon-facebook"></i>
								</a> 
								<a href="javascript:void(0)">
									<i class="icon icon-twitter"></i>
								</a> 
								<a href="javascript:void(0)">
									<i class="icon icon-linkedin"></i>
								</a> 
								<a href="javascript:void(0)">
									<i class="icon icon-google-plus"></i>
								</a>
							</div>
							<p class="short_bio">
								${item.description }
							</p>
						</div>
					</c:forEach>
				</div>
				<!-- 员工展示 end -->
				
			</article>
		</section>
	</div>
	<jsp:include page="common/footer.jsp"></jsp:include>
</div>
<!-- common bottom -->
<jsp:include page="common/bottom.jsp"></jsp:include>

