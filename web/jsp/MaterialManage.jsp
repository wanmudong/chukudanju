<%--
  Created by IntelliJ IDEA.
  User: wanmudong
  Date: 2018/6/27
  Time: 8:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>出库单据管理</title>
    <link rel="stylesheet" href="/demo/css/bootstrap.min.css" type="text/css" />
    <script src="/demo/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <!-- 引入表单校验jquery插件 -->
    <script src="/demo/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="/demo/js/bootstrap.min.js" type="text/javascript"></script>
    <SCRIPT language="javascript" type="text/javascript" src="/demo/js/checkupdate.js"></SCRIPT>
    <style>
        .center{
            margin:1%;
            text-align:center;
        }
        .table-striped > tbody > tr:nth-child(2n+1) > td,
        .table-striped > tbody > tr:nth-child(2n+1) > th {
            background-color: rgb(217, 237, 247);
        }
        .col-center-block {
            float: none;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
        form{
            margin-top: 100px;
        }

    </style>
    <SCRIPT language="javascript" type="text/javascript" src="/demo/js/SearchBook.js"></SCRIPT>
</head>

<body onload="check()">
<jsp:include page="/jsp/header.jsp"></jsp:include>
<form name="form2" id="form2" action="" method="post" >
    <div class="col-xs-6 col-md-8 col-center-block">
        <div class="column-layout-container">
            <h1  style="font-family: '造字工房悦圆演示版'">出库单据管理<small>Outbound Document Management</small></h1>

        </div>
        <h class="center">
            <table class="table table-striped table-hover" id="mainT" >
                <tr class="info"><th>单据号</th><th>物资金额</th><th>物资数量</th><th>领料日期</th><th>领料人</th><th>库管员</th><th>领料部门</th><th>审核人员</th><th>审核日期</th><th>备注事项</th><th>修改</th><th>删除</th></tr>
                <c:forEach items="${pageBean.list}" var="material">

                    <c:if test="${material.deliveryOrder != null}">
                    <tr >
                        <td >${ material.deliveryOrder}</td>
                        <td>${ material.money }</td>
                        <td>${ material.numberofMaterial }</td>
                        <td>${ material.pickingDate }</td>
                        <td>${ material.pickingPerson }</td>
                        <td>${ material.keeper }</td>
                        <td>${ material.pickingDepartment }</td>
                        <td>${ material.auditor }</td>
                        <td>${ material.auditDate }</td>
                        <td>${ material.memo }</td>
                        <td><a href="/demo/MaterialCl?type=goUpdate&deliveryOrder=${ material.deliveryOrder}">修改</a></td>
                        <%--<td><a href="javascript:if(confirm('确实要删除吗?'))/demo/MaterialCl?type=delete&id=${ material.deliveryOrder}">删除</a></td>--%>

                        <td><a href="/demo/MaterialCl?type=delete&deliveryOrder=${ material.deliveryOrder}">删除</a></td>
                    </tr>
                    </c:if>
                </c:forEach>

            </table>
        <hr>

            <%--TODO：分页应当将中间的按钮隐藏--%>
            <!--分页 -->
            <div style="width: 380px; margin: 0 auto; margin-top: 50px;">
                <ul class="pagination" style="text-align: center; margin-top: 10px;">

                    <!-- 上一页 -->
                    <c:if test="${pageBean.currentPage==1 }">
                        <li class="disabled">
                            <a href="javascript:void(0);" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${pageBean.currentPage!=1 }">
                        <li>
                            <a href="${pageContext.request.contextPath}/serchMaterial?type=${pageBean.type}&currentPage=${pageBean.currentPage-1 }" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>


                    <!-- 显示每一页 -->
                    <c:forEach begin="1" end="${pageBean.totalPage }" var="page">
                        <!-- 判断是否是当前页 -->
                        <c:if test="${page==pageBean.currentPage }">
                            <li class="active"><a href="javascript:void(0);">${page }</a></li>
                        </c:if>
                        <c:if test="${page!=pageBean.currentPage }">
                            <li><a href="${pageContext.request.contextPath}/serchMaterial?type=${pageBean.type}&currentPage=${page }">${page }</a></li>
                        </c:if>
                    </c:forEach>


                    <!-- 下一页 -->
                    <c:if test="${pageBean.currentPage==pageBean.totalPage }">
                        <li class="disabled">
                            <a href="javascript:void(0);" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${pageBean.currentPage!=pageBean.totalPage }">
                        <li>
                            <a href="${pageContext.request.contextPath}/serchMaterial?type=${pageBean.type}&currentPage=${pageBean.currentPage+1 }" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>

                </ul>
            </div>
            <!-- 分页结束 -->
            <button type="button" class="btn btn-default" onclick=who_submit();>返回</button>
            <input type="hidden" id="vhidden" value="${pageBean.type}"/>

        </div>
    </div>
</form>
<script type="text/javascript" color="0,0,255" opacity='0.7' zIndex="-2" count="99" src="//cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
</body>
</html>