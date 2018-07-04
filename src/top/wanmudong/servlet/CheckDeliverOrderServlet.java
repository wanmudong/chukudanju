package top.wanmudong.servlet;

import top.wanmudong.service.MaterialService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by chenjiehao on 2018/6/28
 */
@WebServlet(name = "CheckDeliverOrderServlet",urlPatterns = "/checkDeliverOrder")
public class CheckDeliverOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获得用户名
        String checkDeliverOrder = request.getParameter("checkDeliverOrder");

        MaterialService service = new MaterialService();
        boolean isExist = service.checkDeliverOrder(checkDeliverOrder);

        String json = "{\"isExist\":"+isExist+"}";

        response.getWriter().write(json);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
