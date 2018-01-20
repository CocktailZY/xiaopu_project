package com.a2.ssm.mapper;

import java.util.HashMap;
import java.util.List;

import com.a2.ssm.model.Comments;


/**
 * @author zy
 * CommentsMapper
 */
public interface CommentsMapper {

	public List<Comments> list();
	public Comments getById(int id);
	public void update(Comments dto);
	public void delete(int id);
	public void save(Comments dto);
	public List<Comments> getByPIdByParentId(int pid);
	public Comments getByParentId(int id);
	public List<Comments> getBySId(int sid);
	public List<Comments> cxlistgetBySId(HashMap<String, Object> map);
	public List<Comments> cxlistgetBySIdPage(HashMap<String, Object> map);
	public void addhuifu(Comments dto);
	
}
