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
 * Created by chenjiehao on 2018/6/26
 */
@WebServlet(name = "AddMaterialServlet",urlPatterns = "/addMaterialOut")
public class AddMaterialServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");


        /**
         *  //主码
         *     private int RecordID;
         *     //唯一标识不同单 据
         *     private String deliveryOrder;
         *     //出库物资金 额
         *     private String Money;
         *     //领料数量
         *     private int numberofMaterial;
         *     //领料日期
         *     private String pickingDate;
         *     //领料人姓名
         *     private String pickingPerson;
         *     //领料部门名称
         *     private String pickingDepartment;
         *     //库管员姓名
         *     private String keeper;
         *     //审核人员姓名
         *     private String auditor;
         *     //审核日期
         *     private String AuditDate;
         *     //备注事项
         *     private String MEMO;
         */

        //TODO 对象封装需要优化
        //获得表单数据
        Map<String, String[]> properties = request.getParameterMap();
        MaterialDocument md = new MaterialDocument();

        md = ObjectEncapsulation.convert(md,properties);

        MaterialService ms = new MaterialService();
        int count = ms.GetCountOfMaterialOutkByID(Integer.parseInt(md.getDeliveryOrder()));
        if (count == 0) {

            ms.AddMaterialOut(md);

            md = ms.CheckMaterial( md.getDeliveryOrder());
            if (md.getDeliveryOrder() != null){
                request.getSession().setAttribute("updateMaterialOut", md);
                request.setAttribute("isSuccess", "表单添加成功");
            }
            else {
                request.getSession().setAttribute("updateMaterialOut", md);
                request.setAttribute("isSuccess", "表单添加成功");

            }


            //TODO 为什么要返回到更新界面
            /**
             * 应当在更新页面添加一个div，说明修改成功，看是否有误，需要调整
             * 存在request中
             */
            request.getRequestDispatcher("/jsp/updateMaterial.jsp").forward(request, response);
//            response.sendRedirect("/demo/jsp/updateMaterial.jsp");
        } else {
//            request.setAttribute("ExpAddError", "出库单:'" + md.getDeliveryOrder() + "'已存在，请重新输入！");
            request.setAttribute("updateMaterialOut", md);
            request.getRequestDispatcher("/jsp/AddMaterialOut.jsp").forward(request, response);

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
