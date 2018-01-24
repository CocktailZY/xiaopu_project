package com.zy.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zy.mapper.GoodMessageMapper;
import com.zy.model.GoodMessage;
import com.zy.service.GoodMessageService;

@Service
@Transactional
public class GoodMessageServiceImpl implements GoodMessageService {
	
	@Resource
	private GoodMessageMapper goodMessageMapper;

	public List<GoodMessage> list(HashMap<String,Object> map) {
		// TODO Auto-generated method stub
		return goodMessageMapper.listAll(map);
	}

	public GoodMessage getById(int id) {
		// TODO Auto-generated method stub
		return goodMessageMapper.getById(id);
	}

	public void update(GoodMessage dto) {
		// TODO Auto-generated method stub
		goodMessageMapper.update(dto);
	}

	public int delete(int id) {
		// TODO Auto-generated method stub
		return goodMessageMapper.delete(id);
	}

	public GoodMessage save(GoodMessage dto) {
		// TODO Auto-generated method stub
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String insertTime = sdf.format(new Date());
		dto.setMark("new");
		dto.setInsertTime(insertTime);
		int msgId = goodMessageMapper.save(dto);
		GoodMessage goodMsg = goodMessageMapper.getById(dto.getMsgId());
		return goodMsg;
	}

}
