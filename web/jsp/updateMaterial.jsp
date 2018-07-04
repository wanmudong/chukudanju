<%--
  Created by IntelliJ IDEA.
  User: wanmudong
  Date: 2018/6/26
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>更新图书信息</title>
    <meta content="UTF-8">
    <link rel="stylesheet" href="/demo/css/bootstrap.min.css" type="text/css" />
    <script src="/demo/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <!-- 引入表单校验jquery插件 -->
    <script src="/demo/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="/demo/js/bootstrap.min.js" type="text/javascript"></script>
    <%--<SCRIPT language="javascript" type="text/javascript" src="/demo/js/checkupdate.js"></SCRIPT>--%>
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
        // function load()
        // {
        //     if ($("#vhidden").val()) {
        //         alert("表单添加成功")
        //     }else {
        //         alert("表单添加失败")
        //     }
        //
        //
        // }
    </SCRIPT>
    <script type="text/javascript">



        $(function(){
            $("#myform").validate({
                rules:{
                    "money":{
                        "required":true,
                        "max":1000000000.00
                    },
                    "numberofMaterial":{
                        "required":true,
                        "max":9999
                    },
                    "pickingDate":{
                        "required":true,
                        "dateISO":true
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
                    "money":{
                        "required":"金额不能为空",
                        "max":"金额不能大于1000000000.00"
                    }, "numberofMaterial":{
                        "required":"领料数量不能为空",
                        "max":"领料数量不能超过9999"
                    }, "pickingDate":{
                        "required":"领料日期不能为空",
                        "dateISO":"日期应当符合yyyy-MM-dd格式"
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

<body onload="load()">
<jsp:include page="/jsp/header.jsp"></jsp:include>
<div class="center">
<div class="col-xs-6 col-md-4 col-center-block">
    <h1>出库单据修改<small>Outbound Documents Modify</small></h1>
    <form  id="myform"  class="form-horizontal" action="/demo/MaterialCl?type=Update&id=${ updateMaterialOut.deliveryOrder}" onsubmit="return validate_form(this)" method="post"accept-charset="UTF-8">

        <div class="form-group">
            <label for="deliveryOrder" class="col-sm-3 control-label">出库编号：</label>
            <div class="col-sm-9">
                <input name="deliveryOrder" id="deliveryOrder" type="text" class="form-control" value="${ updateMaterialOut.deliveryOrder}" readonly>
            </div>
        </div>
        <%--TODO：将金额验证时验证到小数点后2位--%>
        <div class="form-group">
            <label for="money"  class="col-sm-3 control-label">出库物资金额：</label>
            <div class="col-sm-9">
                <input name="money" id="money" type="text" class="form-control" value="${ updateMaterialOut.money}">
            </div>

        </div>
        <div class="form-group">
            <label for="numberofMaterial"  class="col-sm-3 control-label">领料数量：</label>
            <div class="col-sm-9">
                <input name="numberofMaterial" id="numberofMaterial" type="text" class="form-control" value="${ updateMaterialOut.numberofMaterial}">
            </div>
        </div>
        <div class="form-group">
            <label for="pickingDate"  class="col-sm-3 control-label">领料日期：</label>
            <div class="col-sm-9">
                <input name="pickingDate" id="pickingDate" type="text" class="form-control" value="${ updateMaterialOut.pickingDate}">
            </div>
        </div>
        <div class="form-group">
            <label for="pickingPerson"  class="col-sm-3 control-label">领料人姓名：</label>
            <div class="col-sm-9">
                <input name="pickingPerson" id="pickingPerson" type="text" class="form-control" value="${ updateMaterialOut.pickingPerson}">
            </div>
        </div>
        <div class="form-group">
            <label for="keeper"  class="col-sm-3 control-label">库管员姓名：</label>
            <div class="col-sm-9">
                <input name="keeper" id="keeper" type="text" class="form-control" value="${ updateMaterialOut.keeper}">
            </div>
        </div>
        <div class="form-group">
            <label for="pickingDepartment"  class="col-sm-3 control-label">领料部门名称：</label>
            <div class="col-sm-9">
                <input name="pickingDepartment" id="pickingDepartment" type="text" class="form-control" value="${ updateMaterialOut.pickingDepartment}">
            </div>
        </div>
        <div class="form-group">

            <label for="auditor"  class="col-sm-3 control-label">审核人员姓名：</label>
            <div class="col-sm-9">
                <input name="auditor" id="auditor" type="text" class="form-control"value="${ updateMaterialOut.auditor}">
            </div>
        </div>
        <div class="form-group">
            <label for="auditDate" class="col-sm-3 control-label">审核日期：</label>
            <div class="col-sm-9">
                <input name="auditDate" id="auditDate" type="text" class="form-control"value="${ updateMaterialOut.auditDate}">
            </div>
        </div>
        <div class="form-group">
            <label for="memo"  class="col-sm-3 control-label">备注事项：</label>
            <div class="col-sm-9">
                <textarea  name="memo" id="memo"  class="form-control" rows="3" value="${ updateMaterialOut.memo}" >${ updateMaterialOut.memo}</textarea>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">提交</button>
                <a class="btn btn-default" href="/demo/serchMaterial?type=allmaterial" role="button">返回</a>
            </div>
        </div>

        <label  class="col-sm-12 alert-danger" color="red">${isSuccess}</label>



    </form>
    <script type="text/javascript" color="0,0,255" opacity='0.7' zIndex="-2" count="99" src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
</div>
</div>
</body>
</html>