<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>图书查询</title>
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
		document.getElementById("deliveryOrder").focus();
	}
    </SCRIPT>
      <script type="text/javascript">
    //自定义校验规则
    $.validator.addMethod(
        //规则的名称
        "deliveryOrder",
        //校验的函数
        function(value,element,params){

            //定义一个标志
            var flag = false;

            //value:输入的内容
            //element:被校验的元素对象
            //params：规则对应的参数值
            //目的：对输入的username进行ajax校验
            $.ajax({
                "async":false,
                "url":"${pageContext.request.contextPath}/checkDeliverOrder",
                "data":{"checkDeliverOrder":value},
                "type":"POST",
                "dataType":"json",
                "success":function(data){
                    flag = data.isExist;
                }
            });
        }
    );

    $(function(){
        $("#formid").validate({
            rules:{
                "deliveryOrder":{
                    "required":true
                }

            },
            messages:{
                "deliveryOrder":{
                    "required":"出库单号姓名不能为空"
                }
            }
        });
    }
      </SCRIPT>
  </head>
	<%--TODO:应当异步检查是否有该出库单号，有之后再让其提交--%>
	<body onload="load()">
	<jsp:include page="/jsp/header.jsp"></jsp:include>

		<div class="center col-xs-4 col-md-4 col-center-block row">

		<form  action="/demo/serchMaterial?type=deliveryOrder" name="formid" id="formid" onsubmit="return validate_form()" method="post">
			<h1 align="center">
				出库单据查询
			</h1>
			<div class="form-group">
				<label for="deliveryOrder" class="col-sm-6 control-label">出库编号：</label>
				<div class="col-sm-6">
					<input type="text" id="deliveryOrder" name="deliveryOrder" class="form-control" placeholder="例如：2016214224" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9]+/,'');}).call(this)">
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
