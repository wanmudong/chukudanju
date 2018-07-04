package top.wanmudong.dao;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import top.wanmudong.domain.MaterialDocument;
import top.wanmudong.util.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by chenjiehao on 2018/6/28
 */
public class MaterialDao {

    public List<MaterialDocument> findMaterialByPage( int index, int currentCount) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from chukudanju order by recordID desc limit ?,? ";
        List<MaterialDocument> list = runner.query(sql, new BeanListHandler<MaterialDocument>(MaterialDocument.class),index,currentCount);
        return list;
    }
    public int getCount() throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select count(*) from chukudanju";
        Long query = (Long) runner.query(sql, new ScalarHandler());
        return query.intValue();
    }


    //出库单据号是否存在
    public Long checkDeliverOrder(String checkDeliveryOrder) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select count(*) from chukudanju where deliveryOrder=?";
        Long query = (Long) runner.query(sql, new ScalarHandler(), checkDeliveryOrder);
        return query;
    }

    public List<MaterialDocument> findMaterialByPage(String type, String mid,int index, int currentCount) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from chukudanju where "+type+" like CONCAT('%',?,'%') order by recordID desc limit ?,?";
        List<MaterialDocument> list = runner.query(sql, new BeanListHandler<MaterialDocument>(MaterialDocument.class),mid,index,currentCount);
        return list;
    }

    public int getCount(String type, String mid) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select count(*) from chukudanju where "+type+" like CONCAT('%',?,'%') ";
        Long query = (Long) runner.query(sql, new ScalarHandler(),mid);
        return query.intValue();
    }

    public int getCountByDeliveryOrder(String type, String mid) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());

        String sql = "select count(*) from chukudanju where deliveryOrder=?";
        Long query = (Long) runner.query(sql, new ScalarHandler(),mid);
        return query.intValue();
    }

    public List<MaterialDocument> findMaterialByPageAndDeliveryOrder(String type, String mid, int index, int currentCount) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from chukudanju where deliveryOrder=? order by recordID desc limit ?,?";
        List<MaterialDocument> list = runner.query(sql, new BeanListHandler<MaterialDocument>(MaterialDocument.class),mid,index,currentCount);
        return list;
    }
    public int updateMaterialOut(MaterialDocument md) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "update chukudanju set money=?," +
                "numberofMaterial=?," +
                "pickingDate=?," +
                "pickingPerson=?," +
                "keeper=?," +
                "pickingDepartment=?," +
                "auditor=?," +
                "auditDate=?," +
                "memo=?" +
                " where deliveryOrder=?";
          int isSuccess =runner.update(sql,md.getMoney(),
                md.getNumberofMaterial(),
                md.getPickingDate(),
                md.getPickingPerson(),
                  md.getKeeper(),
                md.getPickingDepartment(),
                md.getAuditor(),
                md.getAuditDate(),
                md.getMemo(),
                md.getDeliveryOrder());
        return isSuccess;
    }

    public int DelMaterial(String deliveryOrder) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "delete from chukudanju where deliveryOrder=?";
        int isSuccess = runner.update(sql,deliveryOrder);
        return isSuccess;
    }

    public List<MaterialDocument>  CheckMaterial(String deliveryOrder) throws SQLException {
        QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from chukudanju where deliveryOrder=? ";
        List<MaterialDocument> list = runner.query(sql, new BeanListHandler<MaterialDocument>(MaterialDocument.class),deliveryOrder);
        return list;
    }
}
