<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	//request.getSchema()可以返回当前页面使用的协议，http 或是 https;

	//request.getServerName()可以返回当前页面所在的服务器的名字;

	//request.getServerPort()可以返回当前页面所在的服务器使用的端口,就是80;

	//request.getContextPath()可以返回当前页面所在的应用的名字;
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<!-- 当前页面默认链接 -->
	<base href="<%=basePath%>">

	<title>出库单据管理系统</title>
    <link rel="stylesheet" href="/demo/css/bootstrap.min.css" type="text/css" />
    <script src="/demo/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <!-- 引入表单校验jquery插件 -->
    <script src="/demo/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="/demo/js/bootstrap.min.js" type="text/javascript"></script>
    <SCRIPT language="javascript" type="text/javascript" src="/demo/js/checkupdate.js"></SCRIPT>
	<style type="text/css" media="screen">
		.center{
			float: none;
			display: block;
			margin-left: auto;
			margin-right: auto;
			text-align: center;
		}
		a{
			text-decoration: none;
			color: black;
			float: left;
			text-align: center;
            margin-top: 400px;
		}
		a:hover{
			text-decoration: none;
		}
		img{
			width: 100px;
			height: 100px;
		}
		p{
			font-size: 32px;
		}
		h1{
			margin-top: 150px;
		}
	</style>

	<!--  导入js文件 -->
	<SCRIPT language="javascript" type="text/javascript" src="./js/main.js"></SCRIPT>
	<script language="javascript">
        // 这个脚本是 ie6和ie7 通用的脚本

        //关闭页面函数
        function custom_close(){
            if
            (confirm("您确定要关闭本页吗？")){
                window.opener=null;
                window.open('','_self');
                window.close();
            }
            else{}
        }



	</script>
</head>

<body background="./img/88.jpg" style="background-size: 110%">
<div class="center">
			        <h1 style="font-size: 60px">
						出库单据管理系统<small>Outbound document management system</small>
					</h1>

                <%--<a class="btn btn-default" href="/demo/serchMaterial?type=allmaterial" role="button">显示所有出库单据</a>--%>
                <%--<a class="btn btn-default" href="/demo/jsp/SearchByID.jsp" role="button">单据号查询</a>--%>
                <%--&lt;%&ndash;<a class="btn btn-default" href="/demo/jsp/SearchByName.jsp" role="button">领料人查询</a>&ndash;%&gt;--%>
                <%--<a class="btn btn-default" href="/demo/jsp/SearchByInformation.jsp" role="button">相关信息查询</a>--%>
                <%--<a class="btn btn-default" href="/demo/jsp/AddMaterialOut.jsp" role="button">增加出库单据</a>--%>
                <%--<a class="btn btn-default" onClick="custom_close()" role="button">退出</a>--%>
		<%--<img src="./img/03.png">--%>
		<a href="/demo/serchMaterial?type=allmaterial" class="col-sm-2 col-sm-offset-1">
			<img src="./img/apple.png">
			<p>显示全部内容</p>
		</a>
		<a href="/demo/jsp/SearchByID.jsp"class="col-sm-2">
			<img src="./img/banana.png">
			<p>查询</p>
		</a>
		<a href="/demo/jsp/SearchByInformation.jsp"class="col-sm-2">
			<img src="./img/Orange.png">
			<p>相关信息查询</p>
		</a>
		<a href="/demo/jsp/AddMaterialOut.jsp""class="col-sm-2">
			<img src="./img/Peach.png">
			<p>增加</p>
		</a>
		<%--<a href=""class="col-sm-2">--%>
		<%--<img src="./img/Peach.png">--%>
		<%--<p>增加</p>--%>
		<%--</a>--%>
		<a href="" onClick="custom_close()" role="button" class="col-sm-2">
			<img src="./img/Pear.png">
			<p>退出</p>
		</a>

		<!-- 下方图片 -->
		<!-- 再idea中web是默认访问的地址，也就是localhost:8080/demo/会访问web下的各项 -->
		<%--<img src="./img/03.png">--%>


	<script type="text/javascript" color="0,0,255" opacity='0.7' zIndex="-2" count="99" src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
</div>
</body>
</html>
