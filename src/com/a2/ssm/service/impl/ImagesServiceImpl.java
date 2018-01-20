package com.a2.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.a2.ssm.mapper.ImagesMapper;
import com.a2.ssm.model.Images;
import com.a2.ssm.service.ImagesService;

@Service
@Transactional
public class ImagesServiceImpl implements ImagesService {

	@Resource
	private ImagesMapper imagesMapper;
	
	public List<Images> list() {
		// TODO Auto-generated method stub
		return null;
	}

	public Images getById(int id) {
		// TODO Auto-generated method stub
		return imagesMapper.getById(id);
	}

	public void update(Images dto) {
		imagesMapper.update(dto);

	}

	public void delete(int id) {
		// TODO Auto-generated method stub

	}

	public void save(Images dto) {
		imagesMapper.save(dto);

	}

	public List<Images> getByPId(int pid) {
		// TODO Auto-generated method stub
		return imagesMapper.getByPId(pid);
	}

	public List<Images> getByCommId(int commid) {
		// TODO Auto-generated method stub
		return imagesMapper.getByCommId(commid);
	}

}
