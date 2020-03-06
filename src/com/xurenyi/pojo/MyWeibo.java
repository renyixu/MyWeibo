package com.xurenyi.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @author 骑士逸
 * @version 1.0
 * @date 2020/2/25 0025 23:07
 */
public class MyWeibo implements Serializable {
    private Integer wid;
    private String wcontent;
    private Date wdate;
    private String wdateStr; //时间字符串
    private Integer is_edit;
    private Integer is_top;
    private List<WImg> imgs;

    public Integer getWid() {
        return wid;
    }

    public void setWid(Integer wid) {
        this.wid = wid;
    }

    public String getWcontent() {
        return wcontent;
    }

    public void setWcontent(String wcontent) {
        this.wcontent = wcontent;
    }

    public Date getWdate() {
        return wdate;
    }

    public void setWdate(Date wdate) {
        this.wdate = wdate;
    }

    public String getWdateStr() {
        return wdateStr;
    }

    public void setWdateStr(String wdateStr) {
        this.wdateStr = wdateStr;
    }

    public Integer getIs_edit() {
        return is_edit;
    }

    public void setIs_edit(Integer is_edit) {
        this.is_edit = is_edit;
    }

    public Integer getIs_top() {
        return is_top;
    }

    public void setIs_top(Integer is_top) {
        this.is_top = is_top;
    }

    public List<WImg> getImgs() {
        return imgs;
    }

    public void setImgs(List<WImg> imgs) {
        this.imgs = imgs;
    }

    @Override
    public String toString() {
        return "MyWeibo{" +
                "wid=" + wid +
                ", wcontent='" + wcontent + '\'' +
                ", wdate=" + wdate +
                ", wdateStr='" + wdateStr + '\'' +
                ", is_edit=" + is_edit +
                ", is_top=" + is_top +
                ", imgs=" + imgs +
                '}';
    }
}
