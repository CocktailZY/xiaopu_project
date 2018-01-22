package com.a2.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.a2.ssm.mapper.TypeSpecsMapper;
import com.a2.ssm.model.TypeSpecs;
import com.a2.ssm.service.TypeSpecsService;

/**
 * <p>类名：TypeSpecsServiceImpl</p>
 * <p>类功能描述： 类型规格service层实现类</p>
 * @类作者：zy
 * @创建时间：2018-9-9 下午7:51:07
 * @小组：A2小组
 */
@Service
@Transactional
public class TypeSpecsServiceImpl implements TypeSpecsService {

	@Resource
	private TypeSpecsMapper typeSpecsMapper;
	
	public List<TypeSpecs> list(TypeSpecs dto) {
		List<TypeSpecs> list = typeSpecsMapper.list(dto);
		return list;
	}

	public TypeSpecs getById(int id) {
		return typeSpecsMapper.getById(id);
	}

	public void update(TypeSpecs dto) {
		typeSpecsMapper.update(dto);
	}

	public void delete(int id) {
		typeSpecsMapper.delete(id);
	}

	public void save(TypeSpecs dto) {
		typeSpecsMapper.save(dto);
	}
	public List<TypeSpecs> getByTypeId(int id) {
		return typeSpecsMapper.getByTypeId(id);
	}


}
