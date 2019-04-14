package com.data;
import java.io.Serializable;

public class Food {
private String fid,fname,ftype,fpic;
private int fprice,qty;

public Food() {
	
}

public String getFid() {
	return fid;
}
public void setFid(String fid) {
	this.fid = fid;
}
public String getFname() {
	return fname;
}
public int getQty() {
	return qty;
}
public void setQty(int qty) {
	this.qty = qty;
}
public void setFname(String fname) {
	this.fname = fname;
}
public String getFtype() {
	return ftype;
}
public void setFtype(String ftype) {
	this.ftype = ftype;
}
public String getFpic() {
	return fpic;
}
public void setFpic(String fpic) {
	this.fpic = fpic;
}
public int getFprice() {
	return fprice;
}
public void setFprice(int fprice) {
	this.fprice = fprice;
}

}
