package com.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

 
 
public class Constant {

	public static String SYS_NAME = "大型连锁超市物品管理系统设计与实现";
	public static String writer="执着";
	public static String contact="Email:lovingroses@163.com";
	public static String projectName="cangkuguanlixitong";
	
	public String getId(){
		 SimpleDateFormat simpledateformat;
	     simpledateformat = new SimpleDateFormat ("yyyyMMdd");
	     Date dt=new Date();
	     String strDate=simpledateformat.format(dt);
	     String id=strDate+new UniqueStringGenerator().getUniqueString();
	   return id;
	}
	
	
	public String getDate(){
		Date now = new Date();
		   DateFormat d1 = DateFormat.getDateInstance(); //默认语言（汉语）下的默认风格（MEDIUM风格，比如：2008-6-16 20:54:53）
		      String str1 = d1.format(now);
		      return str1;
	}
	
	public static void main(String[] args) {
		System.out.println(new Constant().getDate());
		System.out.println(java.sql.Date.valueOf("2014-5-15").after(java.sql.Date.valueOf("2014-05-12")));
		 
		
	}
 

}
