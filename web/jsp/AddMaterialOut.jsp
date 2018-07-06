<%--
  Created by IntelliJ IDEA.
  User: wanmudong
  Date: 2018/6/26
  Time: 15:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="top.wanmudong.domain.MaterialDocument" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta content="utf-8">
    <title>新增出库单据</title>
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
        .col-center-block {
            float: none;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
        .error{
            color:red
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


                //返回false代表该校验器不通过
                return !flag;
            }

        );
        //自定义校验规则
        $.validator.addMethod(
            //规则的名称
            "number",
            //校验的函数
            function(value,element,params){

                //定义一个标志
                var flag = false;

                //value:输入的内容
                //element:被校验的元素对象
                //params：规则对应的参数值
                //目的：对输入的number进行re校验
                <%--$.ajax({--%>
                    <%--"async":false,--%>
                    <%--"url":"${pageContext.request.contextPath}/checkDeliverOrder",--%>
                    <%--"data":{"checkDeliverOrder":value},--%>
                    <%--"type":"POST",--%>
                    <%--"dataType":"json",--%>
                    <%--"success":function(data){--%>
                        <%--flag = data.isExist;--%>
                    <%--}--%>
                <%--});--%>
                var patt1=new RegExp("^(0|[1-9][0-9]{0,10})\\.[0-9]{2}$");

               flag=patt1.test(value);



                //返回false代表该校验器不通过
                return flag;
            }

        );
        //自定义校验规则
        $.validator.addMethod(
            //规则的名称
            "realdate",
            //校验的函数
            function(value,element,params){

                //定义一个标志
                var flag = false;

                var patt1=new RegExp("^^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)$");

                flag=patt1.test(value);



                //返回false代表该校验器不通过
                return flag;
            }

        );


        $(function(){
            $("#myform").validate({
                rules:{
                    "deliveryOrder":{
                        "required":true,
                        "rangelength":[6,12],
                        "deliveryOrder":true
                    },
                    "money":{
                        "required":true,
                        "max":1000000000.00,
                        "number":true
                    },
                    "numberofMaterial":{
                        "required":true,
                        "max":9999
                    },
                    "pickingDate":{
                        "required":true,
                        //"dateISO":true,
                        "realdate":true
                    },
                    "pickingPerson":{
                        "required":true
                    },
                    "keeper":{
                        "required":true

                    },
                    "pickingDepartment":{
                        "required":true

                    },
                    "auditor":{
                        "required":true

                    },
                    "auditDate":{
                        "required":true,
                        "dateISO":true
                    },
                    "memo":{
                        "required":false,
                        "maxlength":20
                    }

                },
                messages:{
                    "deliveryOrder":{
                        "required":"出库单据号不能为空",
                        "rangelength":"出库单据号长度6-12位",
                        "deliveryOrder":"出库单据号已存在"
                    },
                    "money":{
                        "required":"金额不能为空",
                        "max":"金额不能大于100000000.00",
                        "number":"金额格式不正确！"
                    }, "numberofMaterial":{
                        "required":"领料数量不能为空",
                        "max":"领料数量不能超过9999"
                    }, "pickingDate":{
                        "required":"领料日期不能为空",
                      //  "dateISO":"日期应当符合yyyy-MM-dd格式",
                        "realdate":"日期应当符合yyyy-MM-dd格式"
                    }, "pickingPerson":{
                        "required":"领料人姓名不能为空"

                    }, "keeper":{
                        "required":"库管员姓名不能为空"

                    }, "pickingDepartment":{
                        "required":"领料部门名不能为空"
                    }, "auditor":{
                        "required":"审核人姓名不能为空"
                    }, "auditDate":{
                        "required":"审核日期不能为空",
                        "dateISO":"日期应当符合yyyy-MM-dd格式"
                    }, "memo":{
                        "required":"出库单据号不能为空",
                        "maxlength":"备注字符长度不能超过20"
                    }
                }
            });
        });

    </script>

</head>
<!--  ?type=ADD-->
<body onload="load()">
<script type="text/javascript" color="0,0,255" opacity='0.7' zIndex="-2" count="99" src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
<jsp:include page="/jsp/header.jsp"></jsp:include>
<div class="center">
    <div class="col-xs-6 col-md-4 col-center-block">
        <h1  style="font-family: '造字工房悦圆演示版'">出库单据增加<small>Outbound Documents Increase</small></h1>
    <form  id="myform"  class="form-horizontal" action="/demo/addMaterialOut" onsubmit="return validate_form(this)" method="post"accept-charset="UTF-8">

        <div class="form-group">
            <label for="deliveryOrder" class="col-sm-3 control-label"  style="font-family: '造字工房悦圆演示版'">出库编号：</label>
            <div class="col-sm-9">
                <input name="deliveryOrder" id="deliveryOrder" type="text" class="form-control" placeholder="例如：2016214224">
            </div>
        </div>
        <div class="form-group">
            <label for="money"  class="col-sm-3 control-label"  style="font-family: '造字工房悦圆演示版'">出库物资金额：</label>
            <div class="col-sm-9">
                <input name="money" id="money" type="text" class="form-control" placeholder="金额不应当超过1亿">
            </div>

        </div>
        <div class="form-group">
            <label for="numberofMaterial"  class="col-sm-3 control-label"  style="font-family: '造字工房悦圆演示版'">领料数量：</label>
            <div class="col-sm-9">
            <input name="numberofMaterial" id="numberofMaterial" type="text" class="form-control" placeholder="数量不应当超过9999">
            </div>
        </div>
        <div class="form-group">
            <label for="pickingDate"  class="col-sm-3 control-label"  style="font-family: '造字工房悦圆演示版'">领料日期：</label>
            <div class="col-sm-9">
            <input name="pickingDate" id="pickingDate" type="text" class="form-control" placeholder="例如：2016-02-12">
            </div>
        </div>
        <div class="form-group">
            <label for="pickingPerson"  class="col-sm-3 control-label"  style="font-family: '造字工房悦圆演示版'">领料人姓名：</label>
            <div class="col-sm-9">
            <input name="pickingPerson" id="pickingPerson" type="text" class="form-control" placeholder="例如：许佳琪">
            </div>
        </div>
        <div class="form-group">
            <label for="keeper"  class="col-sm-3 control-label"  style="font-family: '造字工房悦圆演示版'">库管员姓名：</label>
            <div class="col-sm-9">
            <input name="keeper" id="keeper" type="text" class="form-control" placeholder="例如：鞠婧祎">
            </div>
        </div>
        <div class="form-group">
            <label for="pickingDepartment"  class="col-sm-3 control-label"  style="font-family: '造字工房悦圆演示版'">领料部门名称：</label>
            <div class="col-sm-9">
            <input name="pickingDepartment" id="pickingDepartment" type="text" class="form-control" placeholder="例如：产品部">
            </div>
        </div>
        <div class="form-group">

            <label for="auditor"  class="col-sm-3 control-label"  style="font-family: '造字工房悦圆演示版'">审核人员姓名：</label>
            <div class="col-sm-9">
            <input name="auditor" id="auditor" type="text" class="form-control" placeholder="例如：朱小丹">
            </div>
        </div>
        <div class="form-group">
            <label for="auditDate" class="col-sm-3 control-label"  style="font-family: '造字工房悦圆演示版'">审核日期：</label>
            <div class="col-sm-9">
            <input name="auditDate" id="auditDate" type="text" class="form-control" placeholder="例如：2016-02-12">
            </div>
        </div>
        <div class="form-group">
            <label for="memo"  class="col-sm-3 control-label"  style="font-family: '造字工房悦圆演示版'">备注事项：</label>
            <div class="col-sm-9">
                <textarea  name="memo" id="memo"  class="form-control" rows="3" placeholder="不应当超过20字"></textarea>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">提交</button>
                <a class="btn btn-default" href="/demo/index.jsp" role="button">返回</a>
            </div>
        </div>
    </form>
    </div>
</div>
</body>
</html>
