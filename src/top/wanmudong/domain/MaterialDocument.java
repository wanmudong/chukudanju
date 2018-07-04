package top.wanmudong.domain;

import java.util.Date;

/**
 * Created by chenjiehao on 2018/6/26
 */
public class MaterialDocument {
    //主码
    private int recordID;
    //唯一标识不同单 据
    private String deliveryOrder;
    //出库物资金 额
    private String money;
    //领料数量
    private int numberofMaterial;
    //领料日期
    private Date pickingDate;
    //领料人姓名
    private String pickingPerson;
    //领料部门名称
    private String pickingDepartment;
    //库管员姓名
    private String keeper;
    //审核人员姓名
    private String auditor;
    //审核日期
    private Date auditDate;
    //备注事项
    private String memo;

    public int getRecordID() {
        return recordID;
    }

    public void setRecordID(int recordID) {
        this.recordID = recordID;
    }

    public String getDeliveryOrder() {
        return deliveryOrder;
    }

    public void setDeliveryOrder(String deliveryOrder) {
        this.deliveryOrder = deliveryOrder;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public int getNumberofMaterial() {
        return numberofMaterial;
    }

    public void setNumberofMaterial(int numberofMaterial) {
        this.numberofMaterial = numberofMaterial;
    }

//    public String getPickingDate() {
//        return pickingDate;
//    }
//
//    public void setPickingDate(String pickingDate) {
//        this.pickingDate = pickingDate;
//    }

    public String getPickingPerson() {
        return pickingPerson;
    }

    public void setPickingPerson(String pickingPerson) {
        this.pickingPerson = pickingPerson;
    }

    public String getPickingDepartment() {
        return pickingDepartment;
    }

    public void setPickingDepartment(String pickingDepartment) {
        this.pickingDepartment = pickingDepartment;
    }

    public String getKeeper() {
        return keeper;
    }

    public void setKeeper(String keeper) {
        this.keeper = keeper;
    }

    public String getAuditor() {
        return auditor;
    }

    public void setAuditor(String auditor) {
        this.auditor = auditor;
    }

//    public String getAuditDate() {
//        return auditDate;
//    }
//
//    public void setAuditDate(String auditDate) {
//        this.auditDate = auditDate;
//    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public Date getPickingDate() {
        return pickingDate;
    }

    public void setPickingDate(Date pickingDate) {
        this.pickingDate = pickingDate;
    }

    public Date getAuditDate() {
        return auditDate;
    }

    public void setAuditDate(Date auditDate) {
        this.auditDate = auditDate;
    }

    @Override
    public String toString() {
        return "MaterialDocument{" +
                "recordID=" + recordID +
                ", deliveryOrder='" + deliveryOrder + '\'' +
                ", money='" + money + '\'' +
                ", numberofMaterial=" + numberofMaterial +
                ", pickingDate='" + pickingDate + '\'' +
                ", pickingPerson='" + pickingPerson + '\'' +
                ", pickingDepartment='" + pickingDepartment + '\'' +
                ", keeper='" + keeper + '\'' +
                ", auditor='" + auditor + '\'' +
                ", auditDate='" + auditDate + '\'' +
                ", MEMO='" + memo + '\'' +
                '}';
    }
}
