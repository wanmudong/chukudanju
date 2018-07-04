<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>出库单据查询</title>
	  <link rel="stylesheet" href="/demo/css/bootstrap.min.css" type="text/css" />
	  <script src="/demo/js/jquery-1.11.3.min.js" type="text/javascript"></script>
	  <!-- 引入表单校验jquery插件 -->
	  <script src="/demo/js/jquery.validate.min.js" type="text/javascript"></script>
	  <script src="/demo/js/bootstrap.min.js" type="text/javascript"></script>

		<style type="text/css" media="screen">
                .center{
                       
                       margin:8%;
                       text-align:center; 
                }
				.row{
					display: table-cell;
					vertical-align: middle;
				}
				.col-center-block {
					float: none;
					display: block;
					margin-left: auto;
					margin-right: auto;
				}
				h1{
					margin-bottom:60px;
				}
				input{
					margin-bottom:60px;
				}
				.error{
					color:red;
					margin-bottom: 60px;
				}
     </style>
	<SCRIPT language="javascript" type="text/javascript">
	function load()
	{
		document.getElementById("pickingPerson").focus();
	}

    $(function(){
        $("#formid").validate({
            rules:{
                "pickingPerson":{
                    "required":true
                }

            },
            messages:{
               "pickingPerson":{
                    "required":"领料人姓名不能为空"
                }
                }
            });
        });

	</SCRIPT>

  </head>

	<body onload="load()">
	<div class="center col-xs-4 col-md-4 col-center-block row">

		<form  action="/demo/serchMaterial?type=pickingPerson" name="formid" id="formid"  method="post">
			<h1 align="center">
				出库单据查询
			</h1>
			<div class="form-group">
				<label for="pickingPerson" class="col-sm-6 control-label">领料人姓名：</label>
				<div class="col-sm-6">
					<input type="text" id="pickingPerson" name="pickingPerson" class="form-control" placeholder="例如：朱小丹" >
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-5 col-sm-6">
					<button type="submit" class="btn btn-primary">提交</button>
					<a class="btn btn-default" href="/demo/index.jsp" role="button">返回</a>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript" color="0,0,255" opacity='0.7' zIndex="-2" count="99" src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
	</body>
</html>
