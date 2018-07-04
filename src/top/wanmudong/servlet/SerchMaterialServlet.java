package top.wanmudong.servlet;

import top.wanmudong.domain.PageBean;
import top.wanmudong.service.MaterialService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by chenjiehao on 2018/6/26
 */
@WebServlet(name = "SerchMaterialServlet",urlPatterns = "/serchMaterial")
public class SerchMaterialServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        MaterialService ms = new MaterialService();
        String type = request.getParameter("type");
        String mid = request.getParameter(type);
        String select = request.getParameter("select");
        String information = request.getParameter("information");

        String currentPageStr = request.getParameter("currentPage");
        if(currentPageStr==null) currentPageStr="1";
        int currentPage = Integer.parseInt(currentPageStr);
        //每页显示10条
        int currentCount = 10;

        if("allmaterial".equals(type))
        {
            MaterialService service = new MaterialService();
            PageBean pageBean = service.findMaterialListByPage(currentPage,currentCount);
            pageBean.setType(type);
            request.getSession().setAttribute("pageBean", pageBean);
            response.sendRedirect("/demo/jsp/MaterialManage.jsp");
        }else if ("deliveryOrder".equals(type)){
            MaterialService service = new MaterialService();
            PageBean pageBean = service.findMaterialListByPage(type,mid,currentPage,currentCount);
            pageBean.setType(type);
            request.getSession().setAttribute("pageBean", pageBean);
            response.sendRedirect("/demo/jsp/MaterialManage.jsp");
        }

        else {
//            MaterialService service = new MaterialService();
//            PageBean pageBean = service.findMaterialListByPage(type,mid,currentPage,currentCount);
//            pageBean.setType(type);
//            request.getSession().setAttribute("pageBean", pageBean);
//            response.sendRedirect("/demo/jsp/MaterialManage.jsp");
            MaterialService service = new MaterialService();
            PageBean pageBean = service.findMaterialListByPage(select,information,currentPage,currentCount);
            pageBean.setType("information");
            request.getSession().setAttribute("pageBean", pageBean);
            response.sendRedirect("/demo/jsp/MaterialManage.jsp");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
