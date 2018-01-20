package com.a2.ssm.service;

import java.util.List;

import com.a2.ssm.model.Question;


/**
 * @author zy
 * QuestionService
 */
public interface QuestionService {

	public List<Question> list();
	public Question getById(int id);
	public void update(Question dto);
	public void delete(int id);
	public void save(Question dto);
	
}
