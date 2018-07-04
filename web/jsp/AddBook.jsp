<%@ page language="java" import="java.util.*,com.mag.domain.*" pageEncoding="UTF-8"%>
<%@ page import="top.wanmudong.domain.MaterialDocument" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>新增出库单据</title>
      <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
      <script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
      <!-- 引入表单校验jquery插件 -->
      <script src="js/jquery.validate.min.js" type="text/javascript"></script>
      <script src="js/bootstrap.min.js" type="text/javascript"></script>
	    <style type="text/css" media="screen">
                .center{
                       
                       margin:8%;
                       text-align:center; 
                }
     </style>
     <SCRIPT language="javascript" type="text/javascript" src="/demo/js/checkadd.js"></SCRIPT>
    <SCRIPT language="javascript" type="text/javascript">
	function load()
	{
		document.getElementById("bookID").focus();
	}
	</SCRIPT>

      <script type="text/javascript">

          //自定义校验规则
          $.validator.addMethod(
              //规则的名称
              "checkUsername",
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
                      "url":"${pageContext.request.contextPath}/checkUsername",
                      "data":{"username":value},
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


          $(function(){
              $("#myform").validate({
                  rules:{
                      // "username":{
                      //     "required":true,
                      //     "checkUsername":true
                      // },
                      "password":{
                          "required":true,
                          "rangelength":[6,12]
                      },
                      "repassword":{
                          "required":true,
                          "rangelength":[6,12],
                          "equalTo":"#password"
                      },
                      "email":{
                          "required":true,
                          "email":true
                      },
                      "sex":{
                          "required":true
                      }
                  },
                  messages:{
                      "username":{
                          "required":"用户名不能为空",
                          "checkUsername":"用户名已存在"
                      },
                      "password":{
                          "required":"密码不能为空",
                          "rangelength":"密码长度6-12位"
                      },
                      "repassword":{
                          "required":"密码不能为空",
                          "rangelength":"密码长度6-12位",
                          "equalTo":"两次密码不一致"
                      },
                      "email":{
                          "required":"邮箱不能为空",
                          "email":"邮箱格式不正确"
                      }
                  }
              });
          });

      </script>
  </head>
<!--  ?type=ADD-->
  <body onload="load()">
    <div class="center">
    <form id="myform" action="/Book/AddCl" onsubmit="return validate_form(this)" method="post">
<!--    -->
    <table border="0" style="MARGIN-RIGHT: auto; MARGIN-LEFT: auto; width:600px;font-size: 22px;">
    <tr align="center"><td colspan=2><h1>新增出库单据</h1></td></tr>
       <%
   MaterialDocument book=(MaterialDocument)request.getAttribute("updateBook");
   %>
    <tr align="center"><td>出库编号：</td><td><input type="text" name="deliveryOrder" style="width: 400px;height: 30px;font-size: 22px;" value="<%= book==null? "":book.getRecordID() %>" /></td></tr>
    <tr align="center"><td>物料名称：</td><td><input type="text" name="materialName" style="width: 400px;height: 30px;font-size: 22px;" value="<%= book==null? "":book.getBookName() %>" /></td></tr>
    <tr align="center"><td>出库物资金额：</td><td><input type="text" name="Money" style="width: 400px;height: 30px;font-size: 22px;" value="<%= book==null? "":book.getCategory() %>" /></td></tr>
      <tr align="center"><td>领料日期：</td><td><input type="text" name="pickingDate" style="width: 400px;height: 30px;font-size: 22px;" value="<%= book==null? "":book.getDateString() %>" /></td></tr>
      <tr align="center"><td>领料人姓名：</td><td><input type="text" name="pickingPerson" style="width: 400px;height: 30px;font-size: 22px;" value="<%= book==null? "":book.getDateString() %>" /></td></tr>
      <tr align="center"><td>领料部门名称：</td><td><input type="text" name="pickingDepartment" style="width: 400px;height: 30px;font-size: 22px;" value="<%= book==null? "":book.getDateString() %>" /></td></tr>
      <tr align="center"><td>库管员姓名：</td><td><input type="text" name="keeper" style="width: 400px;height: 30px;font-size: 22px;" value="<%= book==null? "":book.getDateString() %>" /></td></tr>
      <tr align="center"><td>审核人员姓名：</td><td><input type="text" name="auditor" style="width: 400px;height: 30px;font-size: 22px;" value="<%= book==null? "":book.getDateString() %>" /></td></tr>
      <tr align="center"><td>审核日期：</td><td><input type="text" name="AuditDate" style="width: 400px;height: 30px;font-size: 22px;" value="<%= book==null? "":book.getDateString() %>" /></td></tr>
     <tr align="center"><td>领料数量：</td><td><input type="text" name="numberofMaterial" style="width: 400px;height: 30px;font-size: 22px;" value="<%= book==null? "":book.getAuthor() %>" /></td></tr>
      <tr align="center"><td>备注事项：</td><td><input type="text" name="MEMO" style="width: 400px;height: 120px;font-size: 22px;" value="<%= book==null? "":book.getDescription() %>" /></td></tr>
      <tr><td><br></td></tr>
       <%
    if(request.getAttribute("ExpAddError")!=null)
    {
     %>
     <tr align="center"><td colspan=2><font color="red"><%=request.getAttribute("ExpAddError") %></font></td></tr>
     <tr><td><br></td></tr>
     <%
     }
      %>
      
    <tr align="center"><td colspan=2><input type="submit" style="width:70px;height:30px ; font-size:20px;" value="新增" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/Book/index.jsp">返回</a></td></tr>
     </table>    
    </form>
    </div>
  </body>
</html>
