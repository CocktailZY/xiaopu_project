package com.a2.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.a2.ssm.mapper.ComplaintMapper;
import com.a2.ssm.model.Complaint;
import com.a2.ssm.service.ComplaintService;

/**
 * <p>类名：ComplaintServiceImpl</p>
 * <p>类功能描述：投诉 Service层</p>：
 * @类作者：zy
 * @创建时间：2016-9-5 下午8:50:56
 * @小组：A2小组
 */
@Service
@Transactional
public class ComplaintServiceImpl implements ComplaintService {

	@Resource
	private ComplaintMapper complainMapper;
	
	/**
	 * <p>方法功能描述：显示所有投诉</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-5 下午8:51:21
	 * @参数：@return      
	 * @throws
	 */
	public List<Complaint> list(Complaint dto) {
		List<Complaint> list = complainMapper.list(dto);
		return list;
	}

	/**
	 * <p>方法功能描述：通过id查询投诉</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-5 下午9:21:13
	 * @参数：@param id 投诉id
	 * @参数：@return      
	 * @throws
	 */
	public Complaint getById(int id) {
		Complaint complaint = complainMapper.getById(id);
		return complaint;
	}

	/**
	 * <p>方法功能描述：更新投诉状态</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-5 下午9:21:34
	 * @参数：@param dto 投诉实体对象     
	 * @throws
	 */
	public void update(Complaint dto) {
		complainMapper.update(dto);
	}

	/**
	 * <p>方法功能描述：逻辑删除</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-5 下午9:22:14
	 * @参数：@param id 投诉id     
	 * @throws
	 */
	public void delete(int id) {
		complainMapper.delete(id);
	}

	/**
	 * <p>方法功能描述：新增投诉</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-5 下午9:23:20
	 * @参数：@param dto 投诉实体对象     
	 * @throws
	 */
	public void save(Complaint dto) {
		complainMapper.save(dto);
	}

}
