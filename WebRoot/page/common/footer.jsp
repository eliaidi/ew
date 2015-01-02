<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/spring.tld" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<footer>
     <section id="twitter_feed_wrapper">
          <div class="container">
               <div class="row">
                    <div class="span1 twitter_feed_icon"><a href="javascript:void(0)"><i class="icon icon-twitter-sign"></i></a></div>
                    <div class="span11">
                         <blockquote>
                         	<spring:message code="Common.slogan"/>
                         </blockquote>
                    </div>
               </div>
          </div>
     </section>
     <section id="footer_teasers_wrapper">
          <div class="container">
               <div class="row">
                    <div class="span4 footer_teaser">
                         <h3>
                         	<spring:message code="Common.contact" />
                         </h3>
                         <spring:message  code = "Contact.address"/>
                    </div>
                    <div class="span4 footer_teaser">
                         <h3><spring:message code="Common.links"/></h3>
                         <ul class="media-list">
                              <li class="media"> 
                              	   <a target="_blank" href="http://www.cssmoban.com" class="media-photo" style="background-image:url(images/link/mubanzhijia.jpg)"></a> 
                              	   <a target="_blank" href="http://www.cssmoban.com" class="media-date"></a>
                                   <h5 class="media-heading">
                                   		<a target="_blank" href="http://www.cssmoban.com">模板之家</a>
                                   </h5>
                                   <p>CSS模板之家为你提供大量精品网页模板,企业网站模板,网站模板下载,DIV+CSS模板...</p>
                              </li>
                              <li class="media"> 
                              	   <a target="_blank" href="http://www.bootcss.com" class="media-photo" style="background-image:url(images/link/bootstrap.jpg)"></a> 
                              	   <a target="_blank" href="http://www.bootcss.com" class="media-date"></a>
                                   <h5 class="media-heading">
                                   		<a target="_blank" href="http://www.bootcss.com">Bootstrap</a>
                                   </h5>
                                   <p>简洁、直观、强悍的前端开发框架，让web开发更迅速、简单...</p>
                              </li>
                         </ul>
                    </div>
                    <div class="span4 footer_teaser" >
                         <h3><spring:message code="Common.links"/></h3>
                         <ul class="media-list">
                              <li class="media"> 
                              	   <a target="_blank" href="http://www.dedecms.com" class="media-photo" style="background-image:url(images/link/zhimeng.jpg)"></a> 
                              	   <a target="_blank" href="http://www.dedecms.com" class="media-date"></a>
                                   <h5 class="media-heading">
                                   		<a target="_blank" href="http://www.dedecms.com">织梦CMS</a>
                                   </h5>
                                   <p>织梦CMS,DedeCMS模板,织梦模板,模块插件,开源,PHP CMS,PHP...</p>
                              </li>
                              <li class="media"> 
                              	   <a target="_blank" href="http://www.jdshlawyer.com" class="media-photo" style="background-image:url(images/link/jingda.jpg)"></a> 
                              	   <a target="_blank" href="http://www.jdshlawyer.com" class="media-date"></a>
                                   <h5 class="media-heading">
                                   		<a target="_blank" href="http://www.jdshlawyer.com">京大律师事务所</a>
                                   </h5>
                                   <p>法律至上,客户至上...</p>
                              </li>
                         </ul>
                         
                    </div>
               </div>
          </div>
     </section>
	<section id="copyright">
		<div class="container">
			<div class="row">
				<div class="span6">
					<spring:message code="Common.tld"/>
				</div>
				<div class="span6 text-right">
					<spring:message code="Common.filingDescription"/>
				</div>
			</div>
		</div>
	</section>
</footer>
