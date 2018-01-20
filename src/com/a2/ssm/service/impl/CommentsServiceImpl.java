package com.a2.ssm.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.a2.ssm.mapper.CommentsMapper;
import com.a2.ssm.model.Comments;
import com.a2.ssm.service.CommentsService;

@Service
@Transactional
public class CommentsServiceImpl implements CommentsService {

	@Resource
	private CommentsMapper commentsMapper;
	
	public List<Comments> list() {
		// TODO Auto-generated method stub
		return null;
	}

	public Comments getById(int id) {
		// TODO Auto-generated method stub
		return commentsMapper.getById(id);
	}

	public void update(Comments dto) {
		// TODO Auto-generated method stub

	}

	public void delete(int id) {
		// TODO Auto-generated method stub

	}

	public void save(Comments dto) {
		// TODO Auto-generated method stub

	}
	public List<Comments> getByPIdByParentId(int pid) {
		// TODO Auto-generated method stub
		return commentsMapper.getByPIdByParentId(pid);
	}

	public Comments getByParentId(int id) {
		// TODO Auto-generated method stub
		return commentsMapper.getByParentId(id);
	}

	public List<Comments> getBySId(int sid) {
		// TODO Auto-generated method stub
		return commentsMapper.getBySId(sid);
	}

	public List<Comments> cxlistgetBySId(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return commentsMapper.cxlistgetBySId(map);
	}

	public List<Comments> cxlistgetBySIdPage(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return commentsMapper.cxlistgetBySIdPage(map);
	}

	public void addhuifu(Comments dto) {
		commentsMapper.addhuifu(dto);
		
	}

}
