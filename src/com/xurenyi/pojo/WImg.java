package com.xurenyi.pojo;

/**
 * @author 骑士逸
 * @version 1.0
 * @date 2020/2/27 0027 19:53
 */
public class WImg {
    private Integer wimgid;
    private String wimgpath;
    private Integer wid;

    public Integer getWimgid() {
        return wimgid;
    }

    public void setWimgid(Integer wimgid) {
        this.wimgid = wimgid;
    }

    public String getWimgpath() {
        return wimgpath;
    }

    public void setWimgpath(String wimgpath) {
        this.wimgpath = wimgpath;
    }

    public Integer getWid() {
        return wid;
    }

    public void setWid(Integer wid) {
        this.wid = wid;
    }

    @Override
    public String toString() {
        return "WImg{" +
                "wimgid=" + wimgid +
                ", wimgpath='" + wimgpath + '\'' +
                ", wid=" + wid +
                '}';
    }
}
