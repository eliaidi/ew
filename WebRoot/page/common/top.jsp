<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/spring.tld" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js" lang="en"> 
<!--<![endif]-->
<head>
	<base href="<%=basePath%>">
	<title><spring:message code="Common.webTitle"/></title>
	<meta charset="utf-8" />
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link href="<%=basePath%>less/animate.less-master/animate.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="<%=basePath%>js/woothemes-FlexSlider-06b12f8/flexslider.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="<%=basePath%>js/prettyPhoto_3.1.5/prettyPhoto.css" type="text/css" media="screen" />
	<link href="<%=basePath%>style.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="<%=basePath%>fonts/font-awesome/css/font-awesome.min.css" media="screen" />
	<!--[if IE 7]>
	    <link rel="stylesheet" href="<%=basePath%>fonts/font-awsome/css/font-awesome-ie7.min.css">
	    <![endif]-->
	<script type="text/javascript" src="<%=basePath%>js/modernizr.custom.48287.js"></script>
	<!-- Fav and touch icons -->
	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="<%=basePath%>img/apple-touch-icon-114x114-precomposed.png" />
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="<%=basePath%>img/apple-touch-icon-72x72-precomposed.png" />
	<link rel="apple-touch-icon-precomposed" href="<%=basePath%>img/apple-touch-icon-57x57-precomposed.png" />
	<link rel="shortcut icon" href="favicon.png" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body class="collapsing_header">