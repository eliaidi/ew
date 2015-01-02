<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/spring.tld" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="common/head.jsp"></jsp:include>

<body> 
<div class="easyui-panel" title="公告" style="padding:10px;" data-options="iconCls:'icon-sum'">
	<ul>
       <li>1.沙听海语建站系统V1.0正式上线使用 -2014/08/18</li>
   </ul>
</div>
<div class="easyui-panel" title="使用帮助" style="padding:10px;" data-options="iconCls:'icon-help'">
   <p style="font-size:20px">沙听海语后台管理系统帮助您轻松构建自己的网站.</p>
   <br>
   <ul>
       <li>1.资讯管理：主要用于对网站的【新闻资讯】内容进行管理.</li>
       <li>2.员工信息管理：主要用于对【关于我们】模块下方员工展示区域的信息进行管理.</li>
       <li>3.产品管理：主要对【产品展示】中的产品信息进行管理.</li>
       <li>4.服务管理：对【我们的服务】模块中下方展示区域的服务价格等信息进行管理.</li>
       <li>5.国际化管理：目前只支持查看国际化文件的内容,暂不支持在线修改.</li>
       <li>6.客户消息管理：对客户在【联系我们】界面提交的消息和需求进行管理.</li>
       <li>7.菜单管理：管理【后台系统】的左侧菜单信息.</li>
       <li>8.角色管理：管理【后台系统】的角色信息、权限信息.</li>
       <li>9.用户管理：管理【后台系统】的管理用户信息、赋予用户角色权限.</li>
   </ul>
</div>
</body>

<jsp:include page="common/footer.jsp"></jsp:include>
