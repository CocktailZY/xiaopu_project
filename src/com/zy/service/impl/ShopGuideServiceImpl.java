package com.zy.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zy.mapper.GoodMapper;
import com.zy.mapper.ShopGuideMapper;
import com.zy.model.GuideExpand;
import com.zy.model.ShopGuide;
import com.zy.service.ShopGuideService;

@Service
@Transactional
public class ShopGuideServiceImpl implements ShopGuideService {

	@Resource
	private ShopGuideMapper shopGuideMapper;
	@Resource
	private GoodMapper goodMapper;
	
	public List<ShopGuide> list() {
		// TODO Auto-generated method stub
		return shopGuideMapper.listAll();
	}

	public ShopGuide getById(int id) {
		// TODO Auto-generated method stub
		return shopGuideMapper.getById(id);
	}

	public ShopGuide update(ShopGuide dto) {
		// TODO Auto-generated method stub
		int mark = shopGuideMapper.update(dto);
		if(mark == 1){
			return dto;
		}else{
			return null;
		}
	}

	public int delete(int id) {
		// TODO Auto-generated method stub
		return shopGuideMapper.delete(id);
	}

	public ShopGuide save(ShopGuide dto) {
		// TODO Auto-generated method stub
		int mark = shopGuideMapper.save(dto);
		if(mark == 1){
			return dto;
		}else{
			return null;
		}
	}
	
	//-------------------Extend-------------------------------------
	public List<GuideExpand> pageListAll(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<ShopGuide> guideList = shopGuideMapper.pageListAll(map);
		List<GuideExpand> list = new ArrayList<GuideExpand>();
		
		for(int i = 0 ; i < guideList.size() ; i++){
			GuideExpand gx = new GuideExpand();
			gx.setGuideObj(guideList.get(i));
			gx.setGoodObj(goodMapper.getById(guideList.get(i).getGoodId()));
			
			list.add(gx);
		}
		
		return list;
	}

	public int allReadGuide(ShopGuide dto) {
		// TODO Auto-generated method stub
		return shopGuideMapper.allReadGuide(dto);
	}

}
