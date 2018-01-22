package com.a2.ssm.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
/**
 * 
 * <p>类名：CompareTime </p>
 * <p>类功能描述：计算时间差</p>
 * @类作者：luchuan
 * @创建时间：2018-9-6 上午12:47:15
 * @小组：A2小组
 */
public class CompareTime {

	/**
	 * 取得两个时间段的时间间隔
	 * @param t1 时间1
	 * @param t2 时间2
	 * @return t2 与t1的间隔天数
	 * @throws ParseException 如果输入的日期格式不是0000-00-00 格式抛出异常
	 */
	public Integer getBetweenDays(String t1,String t2) throws ParseException{
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		int betweenDays = 0;
		Date d1 = format.parse(t1);
		Date d2 = format.parse(t2);
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		c1.setTime(d1);
		c2.setTime(d2);
		// 保证第二个时间一定大于第一个时间
		if(c1.after(c2)){
			c1 = c2;
			c2.setTime(d1);
		}
		int betweenYears = c2.get(Calendar.YEAR)-c1.get(Calendar.YEAR);
		betweenDays = c2.get(Calendar.DAY_OF_YEAR)-c1.get(Calendar.DAY_OF_YEAR);
		for(int i=0;i<betweenYears;i++){
			c1.set(Calendar.YEAR,(c1.get(Calendar.YEAR)+1));
			betweenDays += c1.getMaximum(Calendar.DAY_OF_YEAR);
		}
		return betweenDays;
	} 

}

