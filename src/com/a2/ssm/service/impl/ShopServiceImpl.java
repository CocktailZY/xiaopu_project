package com.a2.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.a2.ssm.mapper.ShopMapper;
import com.a2.ssm.model.Shop;
import com.a2.ssm.model.ShopType;
import com.a2.ssm.model.User;
import com.a2.ssm.service.ShopService;

@Service
@Transactional
public class ShopServiceImpl implements ShopService {

	@Resource
	private ShopMapper shopMapper;
	
	
	public List<Shop> list() {
		return null;
	}

	public Shop getById(int id) {
		return shopMapper.getById(id);
	}

	public void update(Shop dto) {
		// TODO Auto-generated method stub
	}

	public void delete(int id) {
		// TODO Auto-generated method stub
	}

	public void save(Shop dto) {
		// TODO Auto-generated method stub
	}

//--------------------------------------------------------------------//	
	
	//列表显示诚信度低于警戒值的店铺
	public List<Shop> underList() {
		List<Shop> underlist = shopMapper.underList();
		return underlist;
	}

	//列表显示状态为观察期的店铺
	public List<Shop> seeList() {
		List<Shop> seelist = shopMapper.seeList();
		return seelist;
	}

	//列表显示新的店铺申请
	public List<Shop> applyList() {
		List<Shop> applylist = shopMapper.applyList();
		return applylist;
	}
	
	//将诚信度低于警戒值的店铺状态修改为观察期
	public void updatetosee(Shop dto) {
		shopMapper.updateToSee(dto);
	}
	
	//将观察期的店铺状态修改为正常
	public void updateToNormal(Shop dto) {
		shopMapper.updateToNormal(dto);
	}
	
	//将店铺的状态修改为关闭
	public void updateToClose(String sId) {
		shopMapper.updateToClose(sId);
	}
	
	//退回店铺的申请信息
	public void deleteApply(Integer sid) {
		shopMapper.deleteApply(sid);
	}
	
	//2018-9-12
	public List<Shop> getByUid(int id) {
		return shopMapper.selectShop(id);
	}

	//2018-9-12
	public List<Shop> getBySid(int id) {
		return shopMapper.getBySid(id);
	}



	public void addSell(Shop dto){
		shopMapper.addSell(dto);
	}
	

}
