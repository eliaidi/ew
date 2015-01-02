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
          <section id="contact">
               <div class="hgroup">
                    <h1>
                    	<spring:message code="Contact.title"/>
                    </h1>
                    <h2>
                    	<spring:message code="Contact.description"/>
                    </h2>
                    <ul class="breadcrumb pull-left">
						<li>
							<a href="${pageContext.request.contextPath}/home/goHome.do">
								<spring:message	code="Common.home" /> 
							</a>
							<span class="divider">/</span>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/product/goProduct.do">
								<spring:message	code="Common.product" />
							</a> 
							<span class="divider">/</span>
						</li>
						<li class="active">
							<spring:message code="Common.contact" />
						</li>
					</ul>
               </div>
               <div class="row">
                    <div class="span4 office_address">
                       <spring:message  code = "Contact.address"/>
                    </div>
                    <div class="span8 contact_form">
                         <form id="fm" action="${pageContext.request.contextPath}/contact/insertMessage.do" method="post">
                              <div class="row">
                                   <div class="span4">
                                        <label>
                                        	<spring:message code="Contact.name"></spring:message>
                                        </label>
                                        <input type="text" name="name" maxlength="64" class="span4" />
                                   </div>
                                   <div class="span4">
                                        <label>
                                        	<spring:message code="Contact.email"></spring:message>
                                        </label>
                                        <input type="text" name="email" maxlength="256" class="span4" />
                                   </div>
                                   <div class="span8">
                                        <label>
                                        	<spring:message code="Contact.subject"></spring:message>
                                        </label>
                                        <input type="text" name="subject" maxlength="128" class="span8" />
                                   </div>
                                   <div class="span8">
                                        <label>
                                        	<spring:message code="Contact.message"></spring:message>
                                        </label>
                                        <textarea rows="8" name="message" maxlength="256" class="span8"></textarea>
                                   </div>
                                   <div class="span8"> 
                                   		<a class="btn btn-large btn-success" onclick="submitMessage()">
                                   			<span>
                                   				<spring:message code="Contact.submit"/>
                                   			</span>
                                   		</a> 
                                   </div>
                              </div>
                         </form>
                    </div>
               </div>
          </section>
          <!--END Contact-->
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
	
	function submitMessage() {
		$("#fm").ajaxSubmit({
			 type: $("#fm").attr("method"),
		     url: $("#fm").attr("action"),
		     dataType: "json",
		     success: function(res){
		     	alert(res.message)
		     }
		});
	}
</script>