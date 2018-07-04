package top.wanmudong.service;

import top.wanmudong.dao.MaterialDao;
import top.wanmudong.domain.MaterialDocument;
import top.wanmudong.domain.PageBean;
import top.wanmudong.util.SqlHelper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by chenjiehao on 2018/6/26
 */
public class MaterialService {
    public MaterialService() {
    }

    public MaterialDocument CheckMaterial(String deliveryOrder) {
        MaterialDao dao = new MaterialDao();

        List<MaterialDocument> list = new ArrayList<MaterialDocument>();
        try {
            list = dao.CheckMaterial(deliveryOrder);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list.get(0);
    }


    public int GetCountOfMaterialOutkByID(int bookID) {
        int count = 0;
        String sql = "select COUNT(*) from chukudanju where deliveryOrder=?";
        String[] parameters = new String[]{String.valueOf(bookID)};
        ResultSet rs = SqlHelper.executeQuery(sql, parameters);

        try {
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException var10) {
            var10.printStackTrace();
        } finally {
            SqlHelper.close(SqlHelper.getCt(), SqlHelper.getPs(), SqlHelper.getRs());
        }

        return count;
    }



    public boolean DelMaterial(String deliveryOrder) {
        MaterialDao dao = new MaterialDao();
        int isSuccess=0;
        try {
             isSuccess=dao.DelMaterial(deliveryOrder);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isSuccess>0?true:false;

    }

    public boolean AddMaterialOut(MaterialDocument materialDocument) {
        boolean b = true;
        String sql = "insert into chukudanju(recordID,deliveryOrder,money,numberofMaterial,pickingDate,pickingPerson,keeper,pickingDepartment,auditor,auditDate,MEMO) values(?,?,?,?,?,?,?,?,?,?,?)";
        Object[] parameters = new Object[]{
                materialDocument.getRecordID(),
                materialDocument.getDeliveryOrder(),
                materialDocument.getMoney(),
                materialDocument.getNumberofMaterial(),
                materialDocument.getPickingDate(),
                materialDocument.getPickingPerson(),
                materialDocument.getKeeper(),
                materialDocument.getPickingDepartment(),
                materialDocument.getAuditor(),
                materialDocument.getAuditDate(),
                materialDocument.getMemo()};


        try {
            SqlHelper.executeUpdate(sql, parameters);
        } catch (Exception var6) {
            var6.printStackTrace();
            b = false;
        }

        return b;
    }
    public PageBean findMaterialListByPage(int currentPage, int currentCount) {

        MaterialDao dao = new MaterialDao();

        //封装一个PageBean 返回web层
        PageBean<MaterialDocument> pageBean = new PageBean<MaterialDocument>();

        //1、封装当前页
        pageBean.setCurrentPage(currentPage);
        //2、封装每页显示的条数
        pageBean.setCurrentCount(currentCount);
        //3、封装总条数
        int totalCount = 0;
        try {
            totalCount = dao.getCount();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        pageBean.setTotalCount(totalCount);
        //4、封装总页数
        int totalPage = (int) Math.ceil(1.0*totalCount/currentCount);
        pageBean.setTotalPage(totalPage);

        //5、当前页显示的数据
        // select * from product  limit ?,?
        // 当前页与起始索引index的关系
        int index = (currentPage-1)*currentCount;
        List<MaterialDocument> list = null;
        try {
            list = dao.findMaterialByPage(index,currentCount);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        pageBean.setList(list);


        return pageBean;
    }


    public boolean checkDeliverOrder(String checkDeliverOrder) {
        MaterialDao dao = new MaterialDao();
        Long isExist = 0L;
        try {
            isExist = dao.checkDeliverOrder(checkDeliverOrder);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isExist>0?true:false;
    }

    public PageBean findMaterialListByPage(String type,String mid, int currentPage, int currentCount) {

        MaterialDao dao = new MaterialDao();

        //封装一个PageBean 返回web层
        PageBean<MaterialDocument> pageBean = new PageBean<MaterialDocument>();

        //1、封装当前页
        pageBean.setCurrentPage(currentPage);
        //2、封装每页显示的条数
        pageBean.setCurrentCount(currentCount);
        //3、封装总条数
        int totalCount = 0;
        if("deliveryOrder".equals(type))
        {
            try {
                totalCount = dao.getCountByDeliveryOrder(type,mid);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else {
            try {
                totalCount = dao.getCount(type,mid);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        pageBean.setTotalCount(totalCount);
        //4、封装总页数
        int totalPage = (int) Math.ceil(1.0*totalCount/currentCount);
        pageBean.setTotalPage(totalPage);

        //5、当前页显示的数据
        // select * from product where ?=?  limit ?,?
        // 当前页与起始索引index的关系

        int index = (currentPage-1)*currentCount;
        List<MaterialDocument> list = null;
        if("deliveryOrder".equals(type)){
            try {
                list = dao.findMaterialByPageAndDeliveryOrder(type,mid,index,currentCount);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else {
            try {
                list = dao.findMaterialByPage(type,mid,index,currentCount);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        pageBean.setList(list);


        return pageBean;

    }

    public boolean updateMaterialOut(MaterialDocument materialDocument) {
        MaterialDao dao = new MaterialDao();
        int isSucesss= 0;
        try {
             isSucesss= dao.updateMaterialOut(materialDocument);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  isSucesss>0?true:false;
    }
}


