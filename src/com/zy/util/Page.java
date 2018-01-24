package com.zy.util;

import java.io.Serializable;

/**
 * 
 * <p>类名：</p>
 * <p>类功能描述：分页</p>
 * @类作者：Administrator
 * @创建时间：2016-9-5 下午5:39:42
 * @小组：A2小组
 */
public class Page implements Serializable{
	private static final long serialVersionUID = 1L;
	// 当前的页码数
	private Integer pageNum;
	// 每页显示的记录数
	private Integer pageSize;
	// 数据库总记录数
	private Integer rowCount;
	// 总页数
	private Integer pageCount;
	// 本次查询开始的行数
	private Integer rowStart;
	
	public Page(Integer rowCount, Integer pageNum, Integer pageSize) {
		this.rowCount = rowCount;
		this.pageSize = pageSize;
		
		this.pageCount = rowCount / pageSize + ((rowCount % pageSize) > 0 ? 1 : 0);
		if(pageNum > pageCount){
			this.pageNum = pageCount;
		}else if(pageNum < 1){
			this.pageNum = 1;
		}else{
			this.pageNum = pageNum;
		}
		
		this.rowStart = (this.pageNum - 1) * this.pageSize;
		
	}

	public Integer getPageNum() {
		return pageNum;
	}

	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getRowCount() {
		return rowCount;
	}

	public void setRowCount(Integer rowCount) {
		this.rowCount = rowCount;
	}

	public Integer getPageCount() {
		return pageCount;
	}

	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}

	public Integer getRowStart() {
		return rowStart;
	}

	public void setRowStart(Integer rowStart) {
		this.rowStart = rowStart;
	}

}
