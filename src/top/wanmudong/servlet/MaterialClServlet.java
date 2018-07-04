package top.wanmudong.servlet;

import top.wanmudong.domain.MaterialDocument;
import top.wanmudong.service.MaterialService;
import top.wanmudong.util.ObjectEncapsulation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

/**
 * Created by chenjiehao on 2018/6/27
 */
@WebServlet(name = "MaterialClServlet",urlPatterns = "/MaterialCl")
public class MaterialClServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        MaterialService ms = new MaterialService();
        String type = request.getParameter("type");
        String MaterialId;
        if ("goUpdate".equals(type)) {
            MaterialId = request.getParameter("deliveryOrder");
            MaterialDocument md = ms.CheckMaterial(MaterialId);
            request.getSession().setAttribute("updateMaterialOut", md);
            response.sendRedirect("/demo/jsp/updateMaterial.jsp");
        } else if ("Update".equals(type)) {
             Map<String, String[]> properties = request.getParameterMap();
             MaterialDocument md = new MaterialDocument();

            md = ObjectEncapsulation.convert(md,properties);

            if (ms.updateMaterialOut(md) ) {
                    md = ms.CheckMaterial( md.getDeliveryOrder());
                    request.getSession().setAttribute("updateMaterialOut",md);
                    request.setAttribute("isSuccess","数据修改成功,请点击返回！");

//                  response.sendRedirect("/demo/MaterialCl?type=goUpdate&deliveryOrder=" + md.getDeliveryOrder());
                request.getRequestDispatcher("/jsp/updateMaterial.jsp").forward(request, response);
                }else {
                request.getSession().setAttribute("updateMaterialOut",md);
                request.setAttribute("isSuccess","数据修改失败，请重新修改！");
                request.getRequestDispatcher("/jsp/updateMaterial.jsp").forward(request, response);

            }

        } else if ("delete".equals(type)) {
            MaterialId = request.getParameter("deliveryOrder");
            if (ms.DelMaterial(MaterialId)) {
                response.sendRedirect("/demo/serchMaterial?type=allmaterial");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
