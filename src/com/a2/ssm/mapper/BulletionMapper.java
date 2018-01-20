package com.a2.ssm.mapper;

import java.util.List;

import com.a2.ssm.model.Bulletion;


/**
 * @author zy
 * BulletionMapper
 */
public interface BulletionMapper {

	public List<Bulletion> list(Bulletion dto);
	public Bulletion getById(int id);
	public void update(Bulletion dto);
	public void delete(int id);
	public void save(Bulletion dto);
	
	/**
	 * <p>方法功能描述：查询所有店铺未审核的公告</p>
	 * @方法作者：任光启
	 * @创建时间：2016-9-6 上午10:18:39
	 * @参数：@return    
	 * @返回类型：List<Bulletion>   
	 * @throws
	 */
	public List<Bulletion> shopList();
	
	/**
	 * <p>方法功能描述：查询所有未发布的商城公告</p>
	 * @方法作者：任光启
	 * @创建时间：2016-9-6 上午10:19:19
	 * @参数：@return    
	 * @返回类型：List<Bulletion>   
	 * @throws
	 */
	public List<Bulletion> mallList();
	
	/**
	 * <p>方法功能描述：查询所有已发布的公告</p>
	 * @方法作者：任光启
	 * @创建时间：2016-9-6 上午10:19:48
	 * @参数：@return    
	 * @返回类型：List<Bulletion>   
	 * @throws
	 */
	public List<Bulletion> allList();
	
	/**
	 * <p>方法功能描述：修改公告的状态为已发布</p>
	 * @方法作者：任光启
	 * @创建时间：2016-9-6 上午10:20:28
	 * @参数：@param dto    
	 * @返回类型：void   
	 * @throws
	 */
	public void updateToRelease(Bulletion dto);
	
	/**
	 * <p>方法功能描述：修改公告的状态为删除（逻辑删除）</p>
	 * @方法作者：任光启
	 * @创建时间：2016-9-6 上午11:13:04
	 * @参数：@param dto    
	 * @返回类型：void   
	 * @throws
	 */
	public void updateToDelete(Bulletion dto);
	
	/**
	 * <p>方法功能描述：后台修改商城的公告</p>
	 * @方法作者：任光启
	 * @创建时间：2016-9-6 下午2:55:04
	 * @参数：@param dto    
	 * @返回类型：void   
	 * @throws
	 */
	public void updateMall(Bulletion dto);
	
	/**
	 * <p>方法功能描述：添加商城公告</p>
	 * @方法作者：任光启
	 * @创建时间：2016-9-6 下午4:44:15
	 * @参数：@param dto    
	 * @返回类型：void   
	 * @throws
	 */
	public void addMall(Bulletion dto);
	
	/**
	 * <p>方法功能描述：删除未发布的公告</p>
	 * @方法作者：任光启
	 * @创建时间：2016-9-6 下午5:16:11
	 * @参数：@param buId    
	 * @返回类型：void   
	 * @throws
	 */
	public void deleteBulletion(Integer buId);
	
}
