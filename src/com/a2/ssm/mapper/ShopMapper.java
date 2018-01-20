package com.a2.ssm.mapper;

import java.util.List;

import com.a2.ssm.model.Shop;
import com.a2.ssm.model.ShopType;

/**
 * <p>类名：ShopMapper</p>
 * <p>类功能描述：店铺的mapper</p>
 * @类作者：任光启
 * @创建时间：2016-9-5 上午9:38:42
 * @小组：A2小组
 */
public interface ShopMapper {

	/**
	 * <p>方法功能描述：查询所有的店铺</p>
	 * @方法作者：任光启
	 * @创建时间：2016-9-1 上午11:11:11
	 * @参数：@return    
	 * @返回类型：List<Shop>   
	 * @throws
	 */
	public List<Shop> list();
	public Shop getById(int id);
	public void update(Shop dto);
	public void delete(int id);
	public void save(Shop dto);
	
	
	/**
	 * <p>方法功能描述：列表显示诚信度低于警戒值且状态不是观察期的店铺</p>
	 * @方法作者：任光启
	 * @创建时间：2016-9-2 下午3:07:28
	 * @参数：@return    
	 * @返回类型：List<Shop>   
	 * @throws
	 */
	public List<Shop> underList();
	
	/**
	 * <p>方法功能描述：列表显示状态为观察期的店铺</p>
	 * @方法作者：任光启
	 * @创建时间：2016-9-2 下午3:07:08
	 * @参数：@return    
	 * @返回类型：List<Shop>   
	 * @throws
	 */
	public List<Shop> seeList();
	
	/**
	 * <p>方法功能描述：列表显示新的店铺申请</p>
	 * @方法作者：任光启
	 * @创建时间：2016-9-2 下午3:06:52
	 * @参数：@return    
	 * @返回类型：List<Shop>   
	 * @throws
	 */
	public List<Shop> applyList();
	
	/**
	 * <p>方法功能描述：修改店铺的状态为观察期</p>
	 * @方法作者：任光启
	 * @创建时间：2016-9-2 上午10:24:32
	 * @参数：@param getsId    
	 * @返回类型：void   
	 * @throws
	 */
	public void updateToSee(Shop dto);

	/**
	 * <p>方法功能描述：</p>
	 * @方法作者：刘家昕
	 * @创建时间：2016-9-2 上午10:24:32
	 * @参数：@param getsId    
	 * @返回类型：void   
	 * @throws
	 */
	int addSell(Shop dto);

	
	/**
	 * <p>方法功能描述：修改店铺的状态为正常（其中包括通过店铺申请）</p>
	 * @方法作者：任光启
	 * @创建时间：2016-9-2 下午2:41:33
	 * @参数：@param dto    
	 * @返回类型：void   
	 * @throws
	 */
	public void updateToNormal(Shop dto);

	/**
	 * <p>方法功能描述：将店铺的状态修改为关闭</p>
	 * @方法作者：任光启
	 * @创建时间：2016-9-2 下午3:34:56
	 * @参数：@param dto    
	 * @返回类型：void   
	 * @throws
	 */
	public void updateToClose(String sId);
	

	/**
	 * <p>方法功能描述：退回店铺的申请信息</p>
	 * @方法作者：任光启
	 * @创建时间：2016-9-2 下午3:51:24
	 * @参数：@param sid    
	 * @返回类型：void   
	 * @throws
	 */
	public void deleteApply(Integer sid);
	
	//2016-9-12
	public List<Shop> selectShop(Integer uid);
	//2016-9-12
	public List<Shop> getBySid(int id);

}
