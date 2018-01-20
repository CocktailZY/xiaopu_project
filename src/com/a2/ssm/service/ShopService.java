package com.a2.ssm.service;

import java.util.List;

import com.a2.ssm.model.Shop;
import com.a2.ssm.model.ShopType;


/**
 * <p>类名：店铺的service</p>
 * <p>类功能描述：主要是前台的店铺添加和后台的店铺管理</p>
 * @类作者：任光启
 * @创建时间：2016-9-2 下午2:35:46
 * @小组：A2小组
 */
public interface ShopService {

	public List<Shop> list();

	/**
	 * <p>方法功能描述：通过id查询店铺的list</p>
	 * @方法作者：sun
	 * @创建时间：2016-9-5 下午2:03:21
	 * @参数：@param id
	 * @参数：@id   
	 * @返回类型：List<Shop>   
	 * @throws
	 */
	public Shop getById(int id);
	public void update(Shop dto);
	public void delete(int id);
	public void save(Shop dto);
	//2016-9-12
	public List<Shop> getByUid(int id);
	public List<Shop> getBySid(int id);
	
	//--------------------------------------------------------//
	
	//列表显示诚信度低于警戒值的店铺
	public List<Shop> underList();
	//列表显示状态为观察期的店铺
	public List<Shop> seeList();
	//列表显示新的店铺申请
	public List<Shop> applyList();
	//将诚信度低于警戒值的店铺状态修改为观察期
	public void updatetosee(Shop dto);

	
	public void addSell(Shop dto);

	//将观察期的店铺状态修改为正常
	public void updateToNormal(Shop dto);
	//将店铺的状态修改为关闭
	public void updateToClose(String sId);
	//退回店铺的申请信息
	public void deleteApply(Integer sid);
	


}
