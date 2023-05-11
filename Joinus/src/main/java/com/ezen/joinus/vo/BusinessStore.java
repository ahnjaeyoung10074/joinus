package com.ezen.joinus.vo;

import lombok.*;

//@AllArgsConstructor
//@NoArgsConstructor
@ToString
//@Getter
//@Setter
public class BusinessStore {//store_table

    private Long sno;
    private  String  storename ;
    private  String  storeaddress ;
    private  String  storeinst ;
    private  String  storeurl ;
    private  String  storeimages ;
    private  String  storenumber;
    private Long bno;

    public Long getSno() {
        return sno;
    }

    public void setSno(Long sno) {
        this.sno = sno;
    }

    public String getStorename() {
        return storename;
    }

    public void setStorename(String storename) {
        this.storename = storename;
    }

    public String getStoreaddress() {
        return storeaddress;
    }

    public void setStoreaddress(String storeaddress) {
        this.storeaddress = storeaddress;
    }

    public String getStoreinst() {
        return storeinst;
    }

    public void setStoreinst(String storeinst) {
        this.storeinst = storeinst;
    }

    public String getStoreurl() {
        return storeurl;
    }

    public void setStoreurl(String storeurl) {
        this.storeurl = storeurl;
    }

    public String getStoreimages() {
        return storeimages;
    }

    public void setStoreimages(String storeimages) {
        this.storeimages = storeimages;
    }

    public String getStorenumber() {
        return storenumber;
    }

    public void setStorenumber(String storenumber) {
        this.storenumber = storenumber;
    }

    public Long getBno() {
        return bno;
    }

    public void setBno(Long bno) {
        this.bno = bno;
    }
}
