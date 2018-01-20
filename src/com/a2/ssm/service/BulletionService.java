package com.a2.ssm.service;

import java.util.List;

import com.a2.ssm.model.Bulletion;
import com.a2.ssm.model.Shop;

/**
 * <p>类名：BulletionService</p>
 * <p>类功能描述：公告的service接口</p>
 * @类作者：任光启
 * @创建时间：2016-9-6 上午9:55:03
 * @小组：A2小组
 */
public interface BulletionService {

	public List<Bulletion> list(Bulletion dto);
	public Bulletion getById(int id);
	public void update(Bulletion dto);
	public void delete(int id);
	public void save(Bulletion dto);
	
//---------------------------------------------------------------//	

	//查询店铺所有未审核的公告
	public List<Bulletion> shopList();
	//查询商城所有未发布的公告
	public List<Bulletion> mallList();
	//查询所有已发布的公告
	public List<Bulletion> allList();
	//修改公告的状态为已发布
	public void updateToRelease(Bulletion dto);
	//修改公告的状态为删除
	public void updateToDelete(Bulletion dto);
	//后台修改商城公告信息
	public void updateMall(Bulletion dto);
	//添加商城公告
	public void addMall(Bulletion dto);
	//删除未发布的公告
	public void deleteBulletion(Integer buId);
	
}
