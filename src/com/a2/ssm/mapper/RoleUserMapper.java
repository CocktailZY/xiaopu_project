package com.a2.ssm.mapper;

import com.a2.ssm.model.RoleUser;
import java.util.List;

/**
 * <p>类名：RoleUserMapper</p>
 * <p>类功能描述：用户角色关系类</p>：
 * @类作者：zy
 * @创建时间：2016-8-30 下午8:06:55
 * @小组：A2小组
 */
public interface RoleUserMapper {
	public List<RoleUser> list();
	public RoleUser getById(int id);
	public void update(RoleUser dto);
	public void delete(int id);
	public void save(RoleUser dto);
}