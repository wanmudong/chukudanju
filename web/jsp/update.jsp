<%@ page language="java" import="java.util.*,com.mag.domain.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>更新图书信息</title>
<SCRIPT language="javascript" type="text/javascript" src="/demo/js/checkupdate.js"></SCRIPT>
	<style type="text/css" media="screen">
                .center{
                       
                       margin:8%;
                       text-align:center; 
                }

     </style>

  </head>
  
  <body>
  <div class="center">
    <form action="/Book/BookCl?type=Update&id=${ updateBook.bookID }" onsubmit="return validate_form(this)" method="post">
    <table border="0" style="MARGIN-RIGHT: auto; MARGIN-LEFT: auto; width:600px;font-size: 22px;">
    <tr align="center"><td colspan=2><h1>修改图书信息</h1></td></tr>
    <%
   Books book=new Books();
   book=(Books)request.getSession().getAttribute("updateBook");
   %>
    <tr align="center"><td>图书编号：</td><td>${ updateBook.bookID }</td></tr>
    <tr align="center"><td>图书名称：</td><td><input type="text" name="bookName" style="width: 400px;height: 30px;font-size: 22px;" value="<%=book.getBookName() %>" /></td></tr>
    <tr align="center"><td>图书类别：</td><td><input type="text" name="bCategory" style="width: 400px;height: 30px;font-size: 22px;" value="<%=book.getCategory() %>" /></td></tr>
      <tr align="center"><td>出版时间：</td><td><input type="text" name="bTime" style="width: 400px;height: 30px;font-size: 22px;" value="<%=book.getPublishTime() %>"/></td></tr>
     <tr align="center"><td>作&nbsp;&nbsp;&nbsp;&nbsp;者：</td><td><input type="text" name="bAuthor" style="width: 400px;height: 30px;font-size: 22px;" value="<%=book.getAuthor() %>"/></td></tr>
     <tr align="center"><td>价&nbsp;&nbsp;&nbsp;&nbsp;格：</td><td><input type="text" name="bPrice" style="width: 400px;height: 30px;font-size: 22px;" value="<%=book.getPrice() %>"/></td></tr>
      <tr align="center"><td>促销价格：</td><td><input type="text" name="bPPrice" style="width: 400px;height: 30px;font-size: 22px;" value="<%=book.getPricepromotion() %>"/></td></tr>
      <tr align="center"><td>库&nbsp;&nbsp;&nbsp;&nbsp;存：</td><td><input type="text" name="bStock" style="width: 400px;height: 30px;font-size: 22px;" value="<%=book.getStock() %>"/></td></tr>
      <tr align="center"><td>图书简介：</td><td><input type="text" name="bDescription" style="width: 400px;height: 120px;font-size: 22px;" value="<%=book.getDescription()%>"/></td></tr>
    <tr align="center"><td colspan=2><input type="submit" style="width:90px;height:30px ; font-size:22px;" id="saveInfo" value="提交" />
    &nbsp;&nbsp;&nbsp;&nbsp;<a href="/Book/SearchBook?type=allbook">返回</a></td></tr>
     
     </table>    
    </form>
    </div>
  </body>
</html>
