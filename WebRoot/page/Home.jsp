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
<!-- 滚动 start -->
<section id="slider_wrapper">
     <div id="main_flexslider" class="flexslider">
          <ul class="slides">
               <li class="item" style="background-image: url(images/sl1.jpg)">
                    <div class="container">
                         <div class="carousel-caption">
                              <h1>
                              	<spring:message code="Home.silder1.title" />
                              </h1>
                              <p class="lead inverse">
                              	<spring:message code="Home.silder1.description" />
                              </p>
<!--                               <span class="round_badge"><strong>NEW</strong>version<strong>1.1</strong></span>  -->
                         </div>
                    </div>
               </li>
               <li class="item" style="background-image: url(images/sl2.jpg)">
                    <div class="container">
                         <div class="carousel-caption">
	                    	 <h1>
	                         	<spring:message code="Home.silder2.title" />
	                         </h1>
	                         <p class="lead inverse">
	                         	<spring:message code="Home.silder2.description" />
	                         </p>
                         </div>
                    </div>
               </li>
               <li class="item" style="background-image: url(images/sl3.jpg)">
                    <div class="container">
                         <div class="carousel-caption">
          		             <h1>
	                         	<spring:message code="Home.silder3.title" />
	                         </h1>
	                         <p class="lead inverse">
	                         	<spring:message code="Home.silder3.description" />
	                         </p>
                         </div>
                    </div>
               </li>
          </ul>
     </div>
</section>
<!-- 滚动 end -->

<!-- 主内容区start -->
<div id="main">
     <div class="container">
          <section class="call_to_action">
               <h3>
               	 <spring:message code="Home.title"/>
               </h3>
               <h4>
                 <spring:message code="Home.subTitle"/>
               </h4>
               <a class="btn btn-primary btn-large" href="javascript:void(0)" onclick="buy()">
               	 <spring:message code="Home.button.buy"/>
               </a> 
          </section>
          <section id="features_teasers_wrapper">
               <div class="row">
                    <div class="span4 feature_teaser"> 
                    	<img alt="responsive" src="images/responsive.png" />
                        <h3>
                        	<spring:message code="Home.tab1.title"/>
                        </h3>
                        <p>
                         	<spring:message code="Home.tab1.description"/>
                        </p>
                    </div>
                    <div class="span4 feature_teaser"> <img alt="responsive" src="images/git.png" />
                        <h3>
                        	<spring:message code="Home.tab2.title"/>
                        </h3>
                        <p>
							<spring:message code="Home.tab2.description"/>
						</p>
                    </div>
                    <div class="span4 feature_teaser"> <img alt="responsive" src="images/less.png" />
                         <h3>
                         	<spring:message code="Home.tab3.title"/>
                         </h3>
                         <p>
                         	<spring:message code="Home.tab3.description"/>
                         </p>
                    </div>
               </div>
          </section>
          <!-- 作品展示 start -->
          <section id="portfolio_teasers_wrapper">
               <h2 class="section_header">
               		<spring:message code="Home.portfolid"/>
               </h2>
               <div class="portfolio_strict row">
               		<c:forEach items="${portsfolios}" var="item">
            		<div class="portfolio_item span3">
                         <div class="portfolio_photo" style="background-image:url(${pageContext.request.contextPath}/${item.img_path})"> 
                         	<a href="${pageContext.request.contextPath}/product/goProductDetail.do?id=${item.id}"> 
                         		<i class="icon-2x icon-external-link"></i>
                              	<p>${item.synopsis}</p>
                            </a> 
                         </div>
                         <div class="portfolio_description">
                            <h3><a href="${pageContext.request.contextPath}/product/goProductDetail.do?id=${item.id}">${item.title }</a></h3>
                            <p>${item.sub_title }</p>
                         </div>
                    </div>
               		</c:forEach>
               </div>
          </section>
          <!-- 作品展示 end -->
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