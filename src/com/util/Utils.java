package com.util;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.UndeclaredThrowableException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
 
 
public class Utils {
	// 本系统默认使用的中文字符集
	private static final String DEFAULT_CHARSET = "GBK";
	// 本系统默认的日期显示格式
	private static final String DEFAULT_DATEFORMAT = "yyyy-MM-dd";
	// 本系统默认的完整时间显示格式
	private static final String DEFAULT_DATEANDTIMEFORMAT = "yyyy-MM-dd hh:mm:ss";
	/**
	 * 过滤HTML字符
	 * @param source 源字符串
	 * @return 过滤后的字符串
	 */
 

	/**
	 * 将经过HTML字符过滤的字符串还原成原来的字符串	 
	 * @param source 要还原的字符串
	 * @return 还原后的字符串
	 */
	 
	/**
	 * 过滤数据库字符串
	 * @param source 源字符串
	 * @return 过滤后的字符串
	 */
 
	/**
	 * 过滤javascript字符串
	 * @param source 要过滤的字符串
	 * @return 过滤后的字符串
	 */
 
	/**
	 * 将经过javascript字符过滤的字符串还原成原来的字符串
	 * @param source 要还原的字符串
	 * @return 还原后的字符串
	 */
	 
	/**
	 * 转换字符集格式为中文字符集(解决汉字乱码问题，注：不能完全解决问题)
	 * @param source 源字符串
	 * @return 转换后的字符串
	 */
	public static String toZn(String source) {
		if (source != null) {
			try {
				return new String(source.getBytes("ISO-8859-1"), 
						DEFAULT_CHARSET);
			} catch (Exception e) {
				return source;
			}
		} else {
			return source;
		}
	}

	/**
	 * 获得当前时间(短时间格式, 如：2007-11-01)
	 * @return 当前时间的短字符串格式
	 */
	public static String getCurDate() {
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat(DEFAULT_DATEFORMAT);
		return dateFormat.format(date);
	}
	
	/**
	 * 获得当前时间(完整时间格式, 如：2007-11-01 13:02:05)
	 * @return 当前时间的短字符串格式
	 */
	public static String getCurDateAndTime() {
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat(DEFAULT_DATEANDTIMEFORMAT);
		return dateFormat.format(date);
	}

	/**
	 * 获得制定格式的当前时间, 如果指定格式错误返回默认格式的字符串
	 * @param formatString 指定时间格式的字符串
	 * @return 指定格式的表示当前时间的字符串
	 */
	public static String getCurDate(String formatString) {
		Date date = new Date();
		String retStr = "";
		try {
			DateFormat dateFormat = new SimpleDateFormat(formatString);
			retStr = dateFormat.format(date);
		} catch (Exception e) {
			retStr = getCurDate();
		}

		return retStr;
	}

	/**
	 * 将符合要求的字符串转换成时间
	 * @param str 代表时间的字符串（yyyy-MM-dd格式)
	 * @return Date对象
	 * @throws Exception
	 */
	public static Date strToDate(String str) throws Exception {
		Date retDate = null;
		try {
			DateFormat dateFormat = new SimpleDateFormat(DEFAULT_DATEFORMAT);
			retDate = dateFormat.parse(str);
		} catch (Exception e) {
			throw e;
		}

		return retDate;
	}
	
	/**
	 * 将符合要求的字符串转换成时间
	 * @param str 代表时间的字符串
	 * @param format 指定的格式(内置, 如DateFormat.MEDIUM)
	 * @return Date对象
	 * @throws Exception
	 */
	public static Date strToDate(String str, int format) throws Exception {
		Date retDate = null;
		try {
			DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.MEDIUM);
			retDate = dateFormat.parse(str);
		} catch (Exception e) {
			throw e;
		}

		return retDate;
	}

	/**
	 * 按格式将字符串转换成时间
	 * @param str 代表时间的字符串
	 * @param formatStr 指定的格式
	 * @return Date对象
	 * @throws Exception
	 */
	public static Date strToDate(String str, String formatStr) throws Exception {
		Date retDate = null;
		try {
			DateFormat dateFormat = new SimpleDateFormat(formatStr);
			retDate = dateFormat.parse(str);
		} catch (Exception e) {
			throw e;
		}
		return retDate;
	}

	/**
	 * 将日期转换为字符串
	 * @param date 原始日期
	 * @return 转换后的字符串(返回格式 yyyy-MM-dd)
	 * @throws Exception
	 */
	public static String dateToStr(Date date) throws Exception {
		String str = null;
		try {
			DateFormat dateFormat = new SimpleDateFormat(DEFAULT_DATEFORMAT);
			str = dateFormat.format(date);
		} catch (Exception e) {
			throw e;
		}

		return str;
	}
	
	/**
	 * 将日期转换为字符串
	 * @param date 原始日期
	 * @return 转换后的字符串(返回格式 "yyyy-MM-dd HH:mm:ss")
	 * @throws Exception
	 */
	public static String dateToStrAsFull(Date date) throws Exception {
		String str = null;
		try {
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			str = dateFormat.format(date);
		} catch (Exception e) {
			throw e;
		}

		return str;
	}

	/**
	 * 将日期按指定的格式转换为字符串
	 * @param date 原始日期
	 * @param formatStr 指定日期格式
	 * @return 转换后的字符串
	 * @throws Exception
	 */
	public static String dateToStr(Date date, String formatStr)
			throws Exception {
		String str = null;
		try {
			DateFormat dateFormat = new SimpleDateFormat(formatStr);
			str = dateFormat.format(date);
		} catch (Exception e) {
			throw e;
		}

		return str;
	}

	/**
	 * 获得当前年
	 * @return 当前年
	 */
	public static int getCurYear() {
		Calendar rightNow = Calendar.getInstance();
		return rightNow.get(Calendar.YEAR);
	}

	/**
	 * 获得当前月
	 * @return 当前月
	 */
	public static int getCurMonth() {
		Calendar rightNow = Calendar.getInstance();
		return (rightNow.get(Calendar.MONTH) + 1);
	}

	/**
	 * 获得当前日（以月为单位）
	 * @return 当前日（以月为单位）
	 */
	public static int getCurDay() {
		Calendar rightNow = Calendar.getInstance();
		return rightNow.get(Calendar.DAY_OF_MONTH);
	}

	/**
	 * 计算两个日期相差的天数
	 * @param date1 开始日期
	 * @param date2 结束日期
	 * @return 两个日期相差的天数
	 */
	public static long getDayDiff(Date date1, Date date2) {
		long diff = 0;
		long fullDiff = date2.getTime() - date1.getTime();
		diff = fullDiff / 1000 / 60 / 60 / 24;

		return diff;
	}
	
	/**
	 * 获得符合具体数据库要求的对时间查询的字符串（目前只对oracle进行了测试）
	 * @param dbName 数据库名称
	 * @param datetimeStr 输入的时间字符串
	 * @return 符合具体数据库要求的对时间查询的字符串
	 */
	public static String getDBDateStr(String dbName, String datetimeStr) {
		if (dbName.trim().equalsIgnoreCase("oracle")) {
			return "TO_DATE('" + datetimeStr.trim() + "', 'YYYY-MM-DD HH24:MI:SS')";
		} else {
			return "'" + datetimeStr + "'";
		}
	}
	
	/**
	 * 获得符合具体数据库要求的获得数据库时间sql函数
	 * @param dbName 数据库名称
	 * @return 符合具体数据库要求的获得数据库时间sql
	 * 注: 目前只实现了oracle
	 */
	public static String getDBServerTimeStr(String dbName) {
		if (dbName.trim().equalsIgnoreCase("oracle")) {
			return "SYSDATE";
		} else if (dbName.trim().equalsIgnoreCase("Adaptive Server Enterprise")) {
			return "getdate()";
		} else if (dbName.trim().equalsIgnoreCase("sybase")) {
			return "getdate()";
		} else {
			return "'date()'";
		}
	}	
		
	/**
	 * 获得根本异常
	 * @param t 异常
	 * @return 最根本异常
	 */
	public static Throwable getRealThrowable(Throwable t) {
		Throwable realT = t;
		
		if (t instanceof InvocationTargetException) {
			Throwable targetException = ((InvocationTargetException)t).getTargetException();
			realT = getRealThrowable(targetException);
		} else if (t instanceof UndeclaredThrowableException) {
			UndeclaredThrowableException unException = (UndeclaredThrowableException) t;
			realT = getRealThrowable(unException.getUndeclaredThrowable());
		} else if (t instanceof RuntimeException) {
			RuntimeException re = (RuntimeException) t;
			realT = getRealThrowable(re.getCause());
		}
		
		return realT;
	}
	 
}
