package com.a2.ssm.mapper;

import java.util.List;

import com.a2.ssm.model.Question;


/**
 * @author zy
 * QuestionMapper
 */
public interface QuestionMapper {

	public List<Question> list();
	public Question getById(int id);
	public void update(Question dto);
	public void delete(int id);
	public void save(Question dto);
	
}
