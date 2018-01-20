package com.a2.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.a2.ssm.mapper.QuestionMapper;
import com.a2.ssm.model.Question;
import com.a2.ssm.service.QuestionService;

@Service
@Transactional
public class QuestionServiceImpl implements QuestionService {

	@Resource
	private QuestionMapper questionMapper;
	
	public List<Question> list() {
		// TODO Auto-generated method stub
		return null;
	}

	public Question getById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public void update(Question dto) {
		// TODO Auto-generated method stub

	}

	public void delete(int id) {
		// TODO Auto-generated method stub

	}

	public void save(Question dto) {
		// TODO Auto-generated method stub

	}

}
