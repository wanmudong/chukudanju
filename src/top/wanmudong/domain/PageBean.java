package top.wanmudong.domain;

import java.util.List;

/**
 * Created by chenjiehao on 2018/6/28
 */
public class PageBean<T>  {

    private int currentPage;
    private int currentCount;
    private int totalCount;
    private int totalPage;
    private String type;
    private List<T> list;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getCurrentCount() {
        return currentCount;
    }

    public void setCurrentCount(int currentCount) {
        this.currentCount = currentCount;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "currentPage=" + currentPage +
                ", currentCount=" + currentCount +
                ", totalCount=" + totalCount +
                ", totalPage=" + totalPage +
                ", type='" + type + '\'' +
                ", list=" + list +
                '}';
    }
}
