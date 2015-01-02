<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" src="<%=basePath%>js/jquery-latest.min.js"></script>
<script>window.jQuery || document.write('<script src="<%=basePath%>js/jquery-1.9.0.min.js"><\/script>')</script>
<script src="<%=basePath%>twitter-bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>js/modernizr.custom.48287.js"></script>
<script src="<%=basePath%>js/woothemes-FlexSlider-06b12f8/jquery.flexslider-min.js"></script>
<script src="<%=basePath%>js/prettyPhoto_3.1.5/jquery.prettyPhoto.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>js/isotope/jquery.isotope.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.ui.totop.js"></script>
<script type="text/javascript" src="<%=basePath%>js/easing.js"></script>
<script type="text/javascript" src="<%=basePath%>js/restart_theme.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.form.js"></script>

</body>
</html>

